-- local colorscheme = "tokyonight-night"
-- local colorscheme = "dracula"
-- local colorscheme = "gruvbox"
-- local colorscheme = "onedarkpro"
-- local colorscheme = "gruvbox"
-- local colorscheme = "monokai"

-- require("base.colors.dracula-nvim")
-- require("base.colors.gruvbox")
-- require("base.colors.kanagawa")
-- require("base.colors.material")
-- require("base.colors.catppuccin")
require("base.colors.zephyr")

vim.cmd([[
  hi Normal guibg=None
  hi LineNr guifg=#73797e
  hi CursorLineNr guifg=#944dff


  hi BgCustom guibg=#483d8b

  hi SignColumn guibg=None 
 
  hi NvimTreeNormal guibg=None
  hi NvimTreeCursorLine guibg=#483D8B
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
