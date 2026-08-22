-- all icons for config in one place

return {
    bufferline = {
        close = "",
        diagnostics = "  ",
    },
    dashboard = {
        arrow = "󰄾",
        plugins = "󰂖",
        os_win = "",
        os_nix = "",
        calendar = "",
        m_tree = "󰙅",
        m_find_files = "󰈞",
        m_find_text = "",
        m_lazy = "",
        m_mason = "",
        m_quit = "󰈆",
    },
    diagnostic_signs = {
        error = " ",
        warn = " ",
        info = " ",
        hint = " ",
    },
    fillchars = {
        vert = "│",
        fold = "⠀",
        eob = " ",
        diff = "⣿",
        msgsep = "‾",
        foldopen = "▾",
        foldsep = "│",
        foldclose = "▸",
    },
    gitsigns = {
        add = "┃",
        change = "┃",
        delete = "",
        topdelete = "",
        changedelete = "~",
        untracked = "┆",
    },
    indent = {
        blankline = "┊",
        virtline = "│",
    },
    mason = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
    },
    statusbar = {
        component_separators = {
            left = "│",
            right = "│",
        },
        section_separators = {
            left = "│",
            right = "│",
        },
        git = {
            added = " ",
            modified = " ",
            removed = " ",
        },
        diagnostics = {
            error = "✘ ",
            warn = "⚠ ",
            info = "ℹ ",
        },
        lsp_progress = { "◜", "◠", "◝", "◞", "◡", "◟" },
    },
    telescope = {
        prompt_prefix = " ",
        selection_caret = " ",
        entry_prefix = "  ",
    },
    tree = {
        folder_closed = "󰉋",
        folder_open = "",
        folder_empty = "",
        git_added = "",
        git_modified = "",
        git_deleted = "✖",
        git_renamed = "󰁕",
        git_untracked = "",
        git_ignored = "",
        git_unstaged = "󰄱",
        git_staged = "",
        git_conflict = "",
    },
}
