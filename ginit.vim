VimRSetFontAndSize "FiraCode Nerd Font Mono", 13

inoremap <D-p> <ESC><cmd>lua require('fzf-lua').files()<CR>
nnoremap <D-p> <cmd>lua require('fzf-lua').files()<CR>
vnoremap <D-p> <cmd>lua require('fzf-lua').files()<CR>
tmap <D-p> <F2>

inoremap <D-e> <ESC><cmd>lua require('fzf-lua').buffers()<CR>
nnoremap <D-e> <cmd>lua require('fzf-lua').buffers()<CR>
vnoremap <D-e> <cmd>lua require('fzf-lua').buffers()<CR>
tmap <D-e> <F2>

inoremap <D-f> <ESC><cmd>lua require('fzf-lua').live_grep()<CR>
nnoremap <D-f> <cmd>lua require('fzf-lua').live_grep()<CR>
vnoremap <D-f> <cmd>lua require('fzf-lua').grep_visual()<CR>
tmap <D-f> <F2>

inoremap <D-b> <cmd>lua require("nvim-tree").toggle(true, true)<CR>
nnoremap <D-b> :NvimTreeFindFileToggle<CR>
vnoremap <D-b> <ESC>:NvimTreeFindFileToggle<CR>

inoremap <D-k> <cmd>tabprev<CR>
nnoremap <D-k> <cmd>tabprev<CR>
vnoremap <D-k> <cmd>tabprev<CR>

inoremap <D-j> <cmd>tabnext<CR>
nnoremap <D-j> <cmd>tabnext<CR>
vnoremap <D-j> <cmd>tabnext<CR>
