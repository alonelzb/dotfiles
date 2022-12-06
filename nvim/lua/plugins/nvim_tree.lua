require("nvim-tree").setup({
    hijack_cursor = true,
    view = {
        -- 自适应

        adaptive_size = true,

        -- width = 30,
        mappings = {
            list = {
                { key = { "l", "<CR>", "o" }, action = "edit", mode = "n" },
                { key = "h", action = "close_node" },
                { key = "[d", action = "pre_diag_item" },
                { key = "]d", action = "next_diag_item" },
                { key = "v", action = "vsplit" },
            },
        },
    },

    update_focused_file = {
        enable = true,
        update_cwd = true,
    },

    filters = {
        dotfiles = false,
    },
    git = {
        ignore = false,
    },
    renderer = {
        root_folder_modifier = ":t",
        indent_width = 2,
        indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
            },
        },
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "U",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
})
