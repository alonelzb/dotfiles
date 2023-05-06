return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
        "p00f/nvim-ts-rainbow",
        "windwp/nvim-ts-autotag",
        "yioneko/nvim-yati",
        "nvim-treesitter/nvim-treesitter-context",
        "nvim-treesitter/playground",
    },

    config = function() 
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
		"lua",
		"markdown",
		"markdown_inline",
		"bash",
		"python",
		"html",
		"css",
		"javascript",

		"typescript",
		"vue",
		"regex",

		"vim",
	}, -- put the language you want in this array
	ignore_install = { "" }, -- List of parsers to ignore installing
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

	highlight = {
		enable = true, -- false will disable the whole extension
		disable = {}, -- list of language that will be disabled
		additional_vim_regex_highlighting = false,
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python" } },

	-- 上下文注释
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},

	-- 彩虹括号
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		colors = {
			"#ff79c6",
			"#ee6985",
			"#D6A760",
			"#7794f4",
			"#b38bf5",
			"#7cc7fe",
		}, -- table of hex strings
		termcolors = {}, -- table of colour name strings
	},

	-- 文本对象
	textobjects = {
		select = {
			enable = true,
			-- Automatically jump forward to textobjects, similar to targets.vim
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				-- you can optionally set descriptions to the mappings (used in the desc parameter of nvim_buf_set_keymap
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
			},
			-- You can choose the select mode (default is charwise 'v')
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise

				["@class.outer"] = "<c-v>", -- blockwise
			},
			-- If you set this to `true` (default is `false`) then any textobject is

			-- extended to include preceding or succeeding whitespace. Succeeding
			-- whitespace has priority in order to act similarly to eg the built-in
			-- `ap`.
			include_surrounding_whitespace = false,
		},

		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
	},
        })
    end

}
