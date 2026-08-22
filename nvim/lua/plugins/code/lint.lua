-- linting via project-local tools only (vendor/bin, node_modules/.bin)
-- if a tool isn't installed in the current project, it's simply not run

return {
    "mfussenegger/nvim-lint",
    event = { "BufWritePost", "BufReadPost" },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {}

        local function project_has(path)
            return vim.uv.fs_stat(path) ~= nil
        end

        local function php_linters()
            local linters = {}
            if project_has("vendor/bin/phpcs") then
                table.insert(linters, "phpcs")
            end
            if project_has("vendor/bin/phpstan") then
                table.insert(linters, "phpstan")
            end
            if project_has("vendor/bin/psalm") or project_has("vendor/bin/psalm.phar") then
                table.insert(linters, "psalm")
            end
            return linters
        end

        local function eslint_linters()
            if project_has("node_modules/.bin/eslint") then
                return { "eslint" }
            end
            return {}
        end

        local function stylelint_linters()
            if project_has("node_modules/.bin/stylelint") then
                return { "stylelint" }
            end
            return {}
        end

        local by_ft = {
            php = php_linters,
            javascript = eslint_linters,
            javascriptreact = eslint_linters,
            typescript = eslint_linters,
            typescriptreact = eslint_linters,
            vue = eslint_linters,
            css = stylelint_linters,
            scss = stylelint_linters,
        }

        vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
            callback = function()
                local get_linters = by_ft[vim.bo.filetype]
                if not get_linters then
                    return
                end
                local linters = get_linters()
                if #linters > 0 then
                    lint.try_lint(linters)
                end
            end,
        })
    end,
}
