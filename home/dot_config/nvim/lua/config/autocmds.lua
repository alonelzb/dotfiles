-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("jsonp"),
	pattern = { "json", "markdown" },
	callback = function()
		vim.opt_local.conceallevel = 0
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("js_indent"),
	pattern = { "javascript", "js", "typescript", "ts", "md" },
	callback = function()
		vim.opt_local.shiftwidth = 2
	end,
})
