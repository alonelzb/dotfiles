local lspconfig = require("lspconfig")

local utils = require("lsp.utils")
utils.ui()

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {
	"html",
	"cssls",
	"bashls",
	"yamlls",
	"jsonls",
}
-- html
-- npm i -g vscode-langservers-extracted
-- include
-- vscode-html-language-server
-- vscode-css-language-server
-- vscode-json-language-server
-- vscode-eslint-language-server
for _, server in pairs(servers) do
	lspconfig[server].setup({
		capabilities = capabilities,
		on_attach = utils.on_attach,
	})
end

-- lua
lspconfig.sumneko_lua.setup({
	settings = require("lsp.servers.sumneko_lua"),
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
