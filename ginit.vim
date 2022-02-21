VimRSetFontAndSize "FiraCode Nerd Font Mono", 13

nnoremap <D-p> <cmd>lua require('fzf-lua').files()<CR>
nnoremap <D-f> <cmd>lua require('fzf-lua').live_grep()<CR>
nnoremap <D-e> <cmd>lua require('fzf-lua').buffers()<CR>

vnoremap <D-p> <cmd>lua require('fzf-lua').files()<CR>
vnoremap <D-f> <cmd>lua require('fzf-lua').grep_visual()<CR>
vnoremap <D-e> <cmd>lua require('fzf-lua').buffers()<CR>

:cd $HOME/workplace/drafts/
