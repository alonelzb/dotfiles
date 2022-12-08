-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

vim.g.mapleader = ";"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<ESC>", "<cmd>nohlsearch<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
-- keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
keymap("n", "<C-p>", ":Telescope find_files find_command=fd,-t,f,-H,-I<CR>", opts)
-- keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fr", ":Telescope oldfiles<CR>", opts)

keymap("n", "cw", "ciw", opts)
keymap("n", "dw", "diw", opts)
-- Buffers options
keymap("n", "<Leader>x", "<cmd>Bdelete<CR>", opts)
keymap("n", "<Leader>j", ":bn<CR>", opts)
keymap("n", "<Leader>k", ":bp<CR>", opts)
keymap("n", "<Leader>bf", ":bf<CR>", opts)
keymap("n", "<Leader>bl", ":bl<CR>", opts)

keymap("n", "<C-s>", "<cmd>w<CR>", opts)
keymap("i", "<C-s>", "<cmd>w<CR>", opts)
keymap("n", "<Leader>q", "<cmd>q<CR>", opts)
keymap("n", "<C-q>", "<cmd>wq<CR>", opts)
-- like emacs
keymap("i", "<C-b>", "<Left>", opts)
keymap("i", "<C-f>", "<Right>", opts)
keymap("i", "<C-a>", "<Home>", opts)
keymap("i", "<C-e>", "<End>", opts)
keymap("c", "<C-a>", "<Home>", opts)
keymap("c", "<C-e>", "<End>", opts)
keymap("c", "<C-f>", "<Right>", opts)
keymap("c", "<C-b>", "<Left>", opts)

-- Hop.Nvim
keymap("n", "f", ":HopChar1<CR>", opts)
keymap("n", "t", ":HopChar2<CR>", opts)
keymap("n", "F", ":HopChar1CurrentLine<CR>", opts)

-- format
-- keymap("n", "<Leader>fm", ":lua vim.lsp.buf.format()<CR>", opts)
-- vim.keymap.set("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", { silent = true })
-- vim.cmd([[
--     snoremap <silent> <C-j> <cmd>lua require('luasnip').jump(1)<Cr>
--     snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<Cr>
-- ]])
