local utils = require("utils")
utils.ui()
local servers = {
    "html",
    "cssls",
    "bashls",
    "yamlls",
    "jsonls",
    "pyright",
    -- "gopls",
    -- "denols"
    -- "tsserver"
}

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },

    config = function()
        local lspconfig = require("lspconfig")
        -- Add additional capabilities supported by nvim-cmp
        local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
        -- capabilities.textDocument.completion.completionItem.snippetSupport = true
        for _, server in pairs(servers) do
            lspconfig[server].setup({
                capabilities = capabilities,
                on_attach = utils.on_attach,
            })
        end

        -- lua
        lspconfig.lua_ls.setup({
            settings = require("lsp.servers.lua_ls"),
            capabilities = capabilities,
            on_attach = utils.on_attach,
        })

        -- volar
        -- To enable Take Over Mode, override the default filetypes in setup{} as follows
        lspconfig.volar.setup({
            filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
            capabilities = capabilities,
            on_attach = utils.on_attach,
        })

        -- emmet-ls
        lspconfig.emmet_ls.setup({
            capabilities = capabilities,
            on_attach = utils.on_attach,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "vue" },
        })
    end,
}
