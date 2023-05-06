return {
	-- gruvbox
	{ "ellisonleao/gruvbox.nvim", lazy = true },

	-- catppuccin
	{ "catppuccin/nvim", lazy = true, name = "catppuccin" },

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

	-- onedarkpro
	{
		"olimorris/onedarkpro.nvim",
		lazy = true,
		config = function()
			require("onedarkpro").setup({
				options = {
					transparency = true, -- Use a transparent background?
				},
			})
		end,
	},

	-- monokai
	{
		"tanvirtin/monokai.nvim",
		lazy = true,
		-- config = function()
		-- require('monokai').setup {}
		-- require("monokai").setup({ palette = require("monokai").pro })
		-- require("monokai").setup({ palette = require("monokai").soda })
		-- require("monokai").setup({ palette = require("monokai").ristretto })
		-- end,
	},
	{
		"hardhackerlabs/theme-vim",
		lazy = true,
		name = "hardhacker",
	},

	-- Configure LazyVim to load gruvbox
	{
		"LazyVim/LazyVim",
		opts = {
			-- gruvbox catppuccin dracula kanagawa zephyr onedarkpro monokai
			colorscheme = "dracula",
		},
	},
}
