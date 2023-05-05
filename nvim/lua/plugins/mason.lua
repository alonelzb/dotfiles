return {

    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup({

            })
            require("mason-lspconfig").setup({
                ensure_installed = {},
                automatic_installation = false,
                })
        end

    }
}
