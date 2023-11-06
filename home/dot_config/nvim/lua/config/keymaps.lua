-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- map("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy" })

local del = vim.keymap.del
local set = vim.keymap.set

del("n", "H")
del("n", "L")
-- del("n", "<leader>l")

set("i", "jk", "<ESC>")
set("n", "cw", "ciw")
set("n", "dw", "diw")
set("n", "<leader>wq", "<cmd>wq<cr>")
set("n", "<leader>oo", "o<esc>")
set("n", ";q", ":qa<cr>")

-- like emacs
set("i", "<C-b>", "<Left>")
set("i", "<C-f>", "<Right>")
set("i", "<C-a>", "<Home>")
set("i", "<C-e>", "<End>")
set("c", "<C-a>", "<Home>")

set("c", "<C-e>", "<End>")
set("c", "<C-f>", "<Right>")
set("c", "<C-b>", "<Left>")
