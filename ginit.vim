VimRSetFontAndSize "FiraCode Nerd Font Mono", 13

" disable coc highlight
CocCurrentWordToggle

" turn on Rooter
RooterToggle

" Command-D is Paste
"  vnoremap <D-d>  "+gp
"  nnoremap <D-d>  a<C-R>+<Esc>
"  cnoremap <D-d>  <C-R>+
"  inoremap <D-d>  <C-R>+
"  tnoremap <D-d>  <C-\><C-n>"+gpa

" Fix builtin
inoremap <D-z> <cmd>undo<CR>
nnoremap <D-z> <cmd>undo<CR>
vnoremap <D-z> <cmd>undo<CR>
inoremap <S-D-z> <cmd>redo<CR>
nnoremap <S-D-z> <cmd>redo<CR>
vnoremap <S-D-z> <cmd>redo<CR>
" 2. from document (https://neovim.io/doc/user/visual.html#Select): From Visual mode, press CTRL-G.
snoremap <D-c> <C-g>"+y<C-g>gv<C-g>
inoremap <D-c> <nop>
vnoremap <D-c> "+ygv
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

" fzf
inoremap <D-p> <Esc><cmd>lua require('fzf-lua').files()<CR>
nnoremap <D-p> <cmd>lua require('fzf-lua').files()<CR>
vnoremap <D-p> <cmd>lua require('fzf-lua').files()<CR>
tnoremap <D-p> <F2>

inoremap <D-e> <Esc><cmd>lua require('fzf-lua').buffers()<CR>
nnoremap <D-e> <cmd>lua require('fzf-lua').buffers()<CR>
vnoremap <D-e> <cmd>lua require('fzf-lua').buffers()<CR>
tnoremap <D-e> <F2>

inoremap <S-D-p> <Esc><cmd>lua require('fzf-lua').builtin()<CR>
nnoremap <S-D-p> <cmd>lua require('fzf-lua').builtin()<CR>
vnoremap <S-D-p> <cmd>lua require('fzf-lua').builtin()<CR>

nunmap <C-P>
nunmap <C-F>

inoremap <S-D-f> <Esc><cmd>lua require('fzf-lua').live_grep()<CR>
nnoremap <S-D-f> <cmd>lua require('fzf-lua').live_grep()<CR>
vnoremap <S-D-f> <cmd>lua require('fzf-lua').grep_visual()<CR>
tnoremap <S-D-f> <F2>

inoremap <D-f> <Esc><cmd>lua require('fzf-lua').blines()<CR>
nnoremap <D-f> <cmd>lua require('fzf-lua').blines()<CR>
vnoremap <D-f> <cmd>lua require('fzf-lua').blines()<CR>
tnoremap <D-f> <F2>

inoremap <D-b> <cmd>VimRToggleTools<CR>
nnoremap <D-b> <cmd>VimRToggleTools<CR> 
vnoremap <D-b> <cmd>VimRToggleTools<CR> 
tnoremap <D-b> <cmd>VimRToggleTools<CR> 

inoremap <D-k> <cmd>tabprev<CR>
nnoremap <D-k> <cmd>tabprev<CR>
vnoremap <D-k> <cmd>tabprev<CR>
tnoremap <D-k> <cmd>tabprev<CR>

inoremap <D-j> <cmd>tabnext<CR>
nnoremap <D-j> <cmd>tabnext<CR>
vnoremap <D-j> <cmd>tabnext<CR>
tnoremap <D-j> <cmd>tabnext<CR>

" switch between command and insert mode
inoremap <S-D-:> <Esc>:
cnoremap <S-D-:> <Esc>a

" close window
inoremap <D-y> <cmd>q<CR>
nnoremap <D-y> <cmd>q<CR>
vnoremap <D-y> <cmd>q<CR>

" lazygit
inoremap <D-g> <Esc><cmd>LazyGit<CR>
nnoremap <D-g> <cmd>LazyGit<CR>
vnoremap <D-g> <cmd>LazyGit<CR>
tnoremap <D-g> q

" work like Windows GUI
set selectmode=mouse
startinsert
