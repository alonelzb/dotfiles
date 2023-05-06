local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local colors = {
	gray = "#44475a",
	lightgray = "#5f6a8e",
	orange = "#ffb86c",
	purple = "#bd93f9",
	red = "#ff5555",
	yellow = "#f1fa8c",
	green = "#50fa7b",
	white = "#f8f8f2",
	green2 = "#98be65",
	black = "#282a36",
	cyan = "#008080",
	magenta = "#c678dd",
	blue = "#51afef",
	violet = "#a9a1e1",
}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "hint" },
	symbols = { error = " ", warn = " " },
	colored = true,
	always_visible = false,
	separator = { right = "" },
	color = { bg = colors.gray },
}

local filename = {
	"filename",
	file_status = true, -- Displays file status (readonly status, modified status)
	newfile_status = false, -- Display new file status (new file means no write after created)
	path = 0, -- 0: Just the filename
	-- 1: Relative path
	-- 2: Absolute path
	-- 3: Absolute path, with tilde as the home directory

	shorting_target = 40, -- Shortens path to leave 40 spaces in the window
	-- for other components. (terrible name, any suggestions?)
	symbols = {
		modified = "[+]", -- Text to show when the file is modified.
		readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
		unnamed = "[No Name]", -- Text to show for unnamed buffers.
		newfile = "[New]", -- Text to show for new created file before first writting
	},
	separator = { left = "", right = "" },
	color = { bg = colors.lightgray },
	-- right_padding = 2,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
	separator = "",
}

local filetype = {
	"filetype",
	icons_enabled = true,
	separator = { left = "", right = " " },
	color = { bg = colors.green2, fg = colors.gray },
}

local spaces = function()
	return "spaces:" .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		globalstatus = true,
		icons_enabled = true,
		-- theme = "dracula",
		-- theme = "material",
		theme = "onedark",
		-- theme = "molokai",
		-- theme = "gruvbox",
		-- theme = "gruvbox-material",
		-- theme = "nord",
		-- theme = "material",
		-- theme = "auto",
		-- component_separators = { left = "|", right = "|" },
		-- component_separators = "",
		-- components_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		-- component_separators = { left = '', right = '' },
		-- section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "nvim-tree", "NvimTree_1", "NvimTree" },
		-- always_divide_middle = true,
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { right = "" } }, --, right_padding = 2 },
		},
		lualine_b = { "branch" },
		lualine_c = {
			diagnostics,
			filename,
		},

		lualine_x = {
			{
				"searchcount",
				separator = { left = "" },
				color = { bg = colors.purple, fg = colors.gray },
			},
			diff,
			{
				"fileformat",
				separator = { left = "" },
				color = { bg = colors.lightgray },
			},
			{ "encoding", separator = { left = "" }, color = { bg = "#ff8533", fg = colors.gray } },
			filetype,
		},

		lualine_y = {},
		lualine_z = {
			{
				spaces,
				separator = { left = "" },
				color = { bg = colors.green2 },
			},
			{
				"%l:%c %p%%/%L",
				separator = { left = "" },
				color = { bg = colors.purple },
			},
		},
	},

	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
})
