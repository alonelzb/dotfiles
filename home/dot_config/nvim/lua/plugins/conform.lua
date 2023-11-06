return {
	"stevearc/conform.nvim",
	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format()
			end,
			mode = { "n", "v" },
			desc = "Custom format",
		},
	},
	opts = {
		formatters_by_ft = {
			python = { "isort", "black" },
			javascript = { { "prettierd", "prettier" } },
			typescript = { { "prettierd", "prettier" } },
			lua = { "stylua" },
			fish = { "fish_indent" },
			sh = { "shfmt" },
		},
		formatters = {
			prettierd = {
				env = { PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/.prettierrc") },
			},
		},
	},
}
