local function setup()
    require("neo-tree").setup({
        filesystem = {
            follow_current_file = true,
        },
        window = {
            width = 30,
            mappings = {
                ["l"] = "open",
                ["h"] = "close_node",
                --["l"] = "focus_preview"
                ["a"] = { "add", config = { show_path = "relative" } },
            },
        },
    })
end

return {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
        { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        setup()
    end,
}
