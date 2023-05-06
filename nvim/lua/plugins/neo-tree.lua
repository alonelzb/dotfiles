return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		window = {
			width = 30,
			mappings = {
				["l"] = "open",
				["h"] = "close_node",
				["a"] = { "add", config = { show_path = "relative" } },
			},
		},
	},
}
