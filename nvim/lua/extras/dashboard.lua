-- dashboard extras

local M = {}
local icons = require("extras.icons")
local utils = require("extras.utils")
local fonts = require("extras.fonts")
local dashboard = require("alpha.themes.dashboard")

math.randomseed(os.time() + vim.uv.os_getpid())

local buttons = {
    {
        key = "e",
        icon = icons.dashboard.m_tree,
        title = "Open tree",
        command = ":Neotree float<CR>",
    },
    {
        key = "f",
        icon = icons.dashboard.m_find_files,
        title = "Find files",
        command = ":Telescope find_files<CR>",
    },
    {
        key = "w",
        icon = icons.dashboard.m_find_text,
        title = "Find text",
        command = ":Telescope live_grep<CR>",
    },
    {
        key = "l",
        icon = icons.dashboard.m_lazy,
        title = "Lazy",
        command = ":Lazy<CR>",
    },
    {
        key = "g",
        icon = icons.dashboard.m_git,
        title = "Git",
        command = ":LazyGit<CR>",
    },
    {
        key = "q",
        icon = icons.dashboard.m_quit,
        title = "Quit",
        command = ":q<CR>",
    },
}

local function name_glyphs(font, name)
    return utils.map(vim.fn.split(name, "\\zs"), function(char)
        return font.glyphs[char] or font.glyphs[" "]
    end)
end

local function split_rows(glyphs, max_width)
    local rows = {}
    local current = {}
    local width = 0

    for _, glyph in ipairs(glyphs) do
        local glyph_width = vim.fn.strdisplaywidth(glyph[1])

        if #current > 0 and width + glyph_width > max_width then
            rows[#rows + 1] = current
            current = {}
            width = 0
        end

        current[#current + 1] = glyph
        width = width + glyph_width
    end

    if #current > 0 then
        rows[#rows + 1] = current
    end

    return rows
end

function M.header()
    local name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t"):lower()

    if name == "" then
        name = "nvim"
    end

    local font = fonts[math.random(#fonts)]
    local rows = split_rows(name_glyphs(font, name), math.max(vim.o.columns - 8, 1))
    local lines = { "", "", "", "" }

    for index, row in ipairs(rows) do
        if index > 1 then
            lines[#lines + 1] = ""
        end

        for line = 1, font.height do
            lines[#lines + 1] = table.concat(utils.map(row, function(glyph)
                return glyph[line]
            end))
        end
    end

    for _ = 1, 4 do
        lines[#lines + 1] = ""
    end

    return lines
end

function M.buttons()
    return utils.map(buttons, function(b)
        return dashboard.button(b.key, b.icon .. "  " .. icons.dashboard.arrow .. " " .. b.title, b.command)
    end)
end

function M.footer()
    local status = "%s %d  %s %d.%d.%d  %s %s"
    local plugins = #vim.tbl_keys(require("lazy").plugins())
    local v = vim.version()
    local platform = vim.fn.has("win32") == 1 and icons.dashboard.os_win or icons.dashboard.os_nix

    local info = string.format(
        status,
        icons.dashboard.plugins,
        plugins,
        platform,
        v.major,
        v.minor,
        v.patch,
        icons.dashboard.calendar,
        os.date("%d.%m.%Y")
    )

    return { info }
end

return M
