require("Comment").setup({
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
	---LHS of toggle mappings in NORMAL mode

	ignore = "^$",

	toggler = {
		line = "<leader>cc",
		block = "<leader>bc",
	},
	opleader = {
		line = "<leader>c",
		block = "<leader>b",
	},
})

vim.keymap.set("n", "<C-_>", require("Comment.api").toggle.linewise.current)

vim.notify("loaded comment")
