return {
    -- catppuccin
    {

        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                background = { -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
                transparent_background = true,
                term_colors = false,
                dim_inactive = {
                    enabled = false,
                    shade = "dark",
                    percentage = 0.15,
                },
                styles = {
                    comments = { "italic" },
                    conditionals = { "italic" },
                    loops = {},

                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                },
                color_overrides = {},
                custom_highlights = {},
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    telescope = true,
                    treesitter = true,
                    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
                },
            })
        end,
    },
    {
        "Mofiqul/dracula.nvim",
        event = "VeryLazy",
        -- VeryLazy
        config = function()
            require("dracula").setup({
                -- customize dracula color palette
                -- colors = {
                --   bg = "#282A36",
                --   fg = "#F8F8F2",
                --   selection = "#44475A",
                --   comment = "#6272A4",
                --   red = "#FF5555",
                --   orange = "#FFB86C",
                --   yellow = "#F1FA8C",
                --   green = "#50fa7b",
                --   purple = "#BD93F9",
                --   cyan = "#8BE9FD",

                --   pink = "#FF79C6",
                --   bright_red = "#FF6E6E",
                --   bright_green = "#69FF94",
                --   bright_yellow = "#FFFFA5",
                --   bright_blue = "#D6ACFF",
                --   bright_magenta = "#FF92DF",
                --   bright_cyan = "#A4FFFF",
                --   bright_white = "#FFFFFF",
                --   menu = "#21222C",
                --   visual = "#3E4452",
                --   gutter_fg = "#4B5263",
                --   nontext = "#3B4048",
                -- },

                -- show the '~' characters after the end of buffers
                show_end_of_buffer = true, -- default false
                -- use transparent background
                transparent_bg = true, -- default false
                -- set custom lualine background color
                lualine_bg_color = "#44475a", -- default nil
                -- set italic comment
                italic_comment = true, -- default false
                -- overrides the default highlights see `:h synIDattr`
                -- overrides = {
                -- Examples
                -- NonText = { fg = dracula.colors().white }, -- set NonText fg to white
                -- NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
                -- Nothing = {} -- clear highlight of Nothing
                -- },
            })
        end,
    },

    {
        "ellisonleao/gruvbox.nvim",
        event = "VeryLazy",
        config = function()
            require("gruvbox").setup({
                undercurl = true,
                underline = true,
                bold = true,
                -- italic = true,

                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,

                transparent_mode = true,
            })
        end,
    },
}
