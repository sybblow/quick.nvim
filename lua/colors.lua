vim.g.vscode_style = "dark"
vim.cmd[[
  augroup ResetHighlight
    autocmd!
    " Force to use underline for spell check results
    autocmd ColorScheme *
      \ highlight SpellBad
      \   cterm=Underline
      \   ctermfg=NONE
      \   ctermbg=NONE
      \   term=Reverse
      \   gui=Undercurl
      \   guisp=Red
    autocmd ColorScheme *
      \ highlight SpellCap
      \   cterm=Underline
      \   ctermfg=NONE
      \   ctermbg=NONE
      \   term=Reverse
      \   gui=Undercurl
      \   guisp=Red
    autocmd ColorScheme *
      \ highlight SpellLocal
      \   cterm=Underline
      \   ctermfg=NONE
      \   ctermbg=NONE
      \   term=Reverse
      \   gui=Undercurl
      \   guisp=Red
    autocmd ColorScheme *
      \ highlight SpellRare
      \   cterm=Underline
      \   ctermfg=NONE
      \   ctermbg=NONE
      \   term=Reverse
      \   gui=Undercurl
      \   guisp=Red
    " clear EndOfBuffer as well
    "autocmd ColorScheme * highlight clear NonText
    "autocmd ColorScheme * highlight clear EndOfBuffer
    " make symbol highlight have a clear color.
    " wiki and tool: https://github.com/neoclide/coc-highlight
    autocmd ColorScheme * highlight CocHighlightText ctermbg=60 guibg=#334a52
  augroup END

  colorscheme vscode
]]
