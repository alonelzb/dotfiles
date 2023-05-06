return {
	-- gruvbox
	{ "ellisonleao/gruvbox.nvim", lazy = true },

	-- catppuccin
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
	},

	-- dracula
	{
		"Mofiqul/dracula.nvim",
		lazy = true,
		config = function()
			require("dracula").setup({
				transparent_bg = true, -- default false
				italic_comment = true, -- default false
			})
		end,
	},

	-- kanagawa
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				transparent = true,
			})
		end,
	},

	-- zephyr
	{
		"glepnir/zephyr-nvim",
		lazy = true,
	},
	-- Configure LazyVim to load gruvbox
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "zephyr",
		},
	},
}
