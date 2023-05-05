local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    -- keymap("n", "<C-p>", ":Telescope find_files find_command=fd,-t,f,-H,-I<CR>", opts)
    keys = {
        { "<C-p>", "<cmd>Telescope find_files find_command=fd,-t,f,-H,-I<CR>" },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>" },
        { "<leader>fg", ":Telescope live_grep<CR>" },
        { "<leader>fp", ":Telescope projects<CR>" },
        { "<leader>fb", ":Telescope buffers<CR>" },
        { "<leader>fr", ":Telescope oldfiles<CR>" },
    },
    config = function()
        local actions = require("telescope.actions")
        local action_layout = require("telescope.actions.layout")
        require("telescope").setup({
            defaults = {
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--trim", -- add this value
                    "--hidden",
                },

                prompt_prefix = " ",
                selection_caret = " ",
                path_display = { "absolute" },
                -- path_display = { "smart" },
                file_ignore_patterns = { ".git/", "node_modules" },
                dynamic_preview_title = true,
                wrap_results = true,

                layout_config = {
                    horizontal = {
                        height = 0.9,
                        preview_cutoff = 120,
                        prompt_position = "bottom",
                        width = 0.8,
                        preview_width = 0.6,
                    },
                },

                mappings = {
                    i = {
                        ["<Down>"] = actions.cycle_history_next,
                        ["<Up>"] = actions.cycle_history_prev,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<M-p>"] = action_layout.toggle_preview,
                        ["<C-u>"] = false,
                    },
                    n = {
                        ["<M-p>"] = action_layout.toggle_preview,
                    },
                },
            },
        })

        -- Telescope
        -- keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
    end,
}
