local dracula = require("dracula")

dracula.setup({
    -- customize dracula color palette
    -- colors = {
    --   bg = "#282A36",
    --   fg = "#F8F8F2",
    --   selection = "#44475A",
    --   comment = "#6272A4",
    --   red = "#FF5555",
    --   orange = "#FFB86C",
    --   yellow = "#F1FA8C",
    --   green = "#50fa7b",
    --   purple = "#BD93F9",
    --   cyan = "#8BE9FD",

    --   pink = "#FF79C6",
    --   bright_red = "#FF6E6E",
    --   bright_green = "#69FF94",
    --   bright_yellow = "#FFFFA5",
    --   bright_blue = "#D6ACFF",
    --   bright_magenta = "#FF92DF",
    --   bright_cyan = "#A4FFFF",
    --   bright_white = "#FFFFFF",
    --   menu = "#21222C",
    --   visual = "#3E4452",
    --   gutter_fg = "#4B5263",
    --   nontext = "#3B4048",
    -- },

    -- show the '~' characters after the end of buffers
    show_end_of_buffer = true, -- default false
    -- use transparent background
    transparent_bg = true, -- default false
    -- set custom lualine background color
    lualine_bg_color = "#44475a", -- default nil
    -- set italic comment
    italic_comment = true, -- default false
    -- overrides the default highlights see `:h synIDattr`
    -- overrides = {
    -- Examples
    -- NonText = { fg = dracula.colors().white }, -- set NonText fg to white
    -- NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
    -- Nothing = {} -- clear highlight of Nothing
    -- },
})
vim.cmd("colorscheme dracula")

vim.cmd([[
  hi Normal guibg=None
  hi LineNr guifg=#73797e
  hi CursorLineNr guifg=#944dff


  hi BgCustom guibg=#483d8b

  hi SignColumn guibg=None 
 
  hi NvimTreeNormal guibg=None
  hi NeoTreeCursorLine guibg=#483D8B
  " hi NvimTreeCursorLine guibg=#483D8B
  hi Pmenu guibg=None
  hi PmenuSel guibg=#483D8B
  hi PmenuThumb guibg=#483D8B

  hi TelescopePreviewNormal guibg=None 
  hi TelescopePromptCounter guifg=#483D8B
  hi TelescopeNormal guifg=#483d8b
  hi TelescopeResultsNormal guifg=#944dff

  hi NoicePopup guifg=#afafaf guibg=None
  hi NoicePopupBorder guifg=#875fff

  hi rainbowcol1 guifg=#ff79c6
 " Bufferline
  hi BufferLineBufferSelected guifg=#66ff99
  hi BufferLineModified  guifg=#ff5050
  hi BufferLineModifiedSelected  guifg=#ff5050


]])
-- hi BufferLineBufferSelected guibg=#483d8b gui=bold
-- hi BufferLineDevIconHtmlSelected guibg=#483d8b
-- hi BufferLineDevIconTsSelected guibg=#483d8b
-- hi BufferLineDevIconJsSelected guibg=#483d8b
--  hi BufferLineDevIconJsonSelected guibg=#483d8b
--  hi BufferLineDevIconLuaSelected guibg=#483d8b
