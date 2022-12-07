local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

-- https://github.com/prettier-solidity/prettier-plugin-solidity
local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
    -- vim.notify("formatting done")
end

-- -- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
                -- vim.lsp.buf.format()
            end,
        })
    else
        vim.notify('lsp have not formater.')
    end
end


null_ls.setup({
    debug = true,
    sources = {
        -- formatting.prettierd,
        formatting.prettier.with({
            -- env = { PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/.prettierrc") },
            --     extra_filetypes = { "toml" },
            -- extra_args = {
            -- "--no-semi",
            --     "--single-quote",
            --     "--jsx-single-quote",
            --     "--arrow-parens=avoid",
            --     "--vue-indent-script-and-style",
            -- },
            extra_args = { "--config", vim.fn.expand("~/.config/.prettierrc") },
        }),
        formatting.stylua,
        formatting.black,
    },
    on_attach = on_attach,
})
vim.keymap.set("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", { silent = true })
