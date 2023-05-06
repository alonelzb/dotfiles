return {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
        { "nvim-treesitter/nvim-treesitter" },
    },
    config = function()
        require("lspsaga").setup({
            border_style = "rounded",
            saga_winblend = 20,
            diagnostic_header = { " ", " ", " ", "ﴞ " },
        })
    end,
}
