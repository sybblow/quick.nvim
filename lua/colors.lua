-- Lua
require('onedark').setup{
    functionStyle = "italic",
    sidebars = {"qf", "vista_kind", "terminal", "packer"},

    -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    colors = {hint = "orange", error = "#ff0000"}
}
vim.cmd[[
  augroup ResetHighlight
    autocmd!
    " clear EndOfBuffer as well
    "autocmd ColorScheme * highlight clear NonText
    "autocmd ColorScheme * highlight clear EndOfBuffer
    " make symbol highlight have a clear color.
    " wiki and tool: https://github.com/neoclide/coc-highlight
    autocmd ColorScheme * highlight CocHighlightText ctermbg=249 guibg=#475f65
  augroup END

  " it must be added before any colorscheme is sourced.
  " https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
  colorscheme onedark
]]
