require("bufferline").setup({
	options = {
		mode = "buffers", -- set to "tabs" to only show tabpages instead
		numbers = "none",
		close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		offsets = {
			{
				filetype = "NvimTree",
				text = function()
					return vim.fn.getcwd()
				end,
				highlight = "Directory",
				text_align = "left",
				-- offset_separator = "|",
				padding = 1,
			},
		},
		color_icons = true, -- | false, -- whether or not to add the filetype icon highlights
		separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
		show_close_icon = false,
		-- buffer_close_icon = "",

		modified_icon = "●",
		show_buffer_close_icons = false,
		left_trunc_marker = "",
		right_trunc_marker = "",
		--[[ indicator = {
			icon = ">", -- this should be omitted if indicator style is not 'icon'
			style = "icon",
		}, ]]
		max_name_length = 30,
	},
})

vim.cmd([[
  nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
  nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
  nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
  nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
  nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
  nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
  nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
  nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
  nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
  nnoremap <silent><leader>$ <Cmd>BufferLineGoToBuffer -1<CR>
]])
