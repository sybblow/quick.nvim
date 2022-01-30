" My Config
let g:coc_global_extensions = ['coc-go', 'coc-json', 'coc-pyright', 'coc-tsserver', 'coc-clangd', 'coc-rust-analyzer', 'coc-protobuf', 'coc-vimlsp', 'coc-snippets', 'coc-pairs', 'coc-highlight', 'coc-git', 'coc-lua']

" behavior
set nowrap
set ts=4
set sw=4

" Operations such as yy, D, and P work with the system clipboard.
"set clipboard=unnamed

" Avoiding the "Hit ENTER to continue" prompts, no need to manually refresh the screen once you return to Vim
" https://vim.fandom.com/wiki/Avoiding_the_%22Hit_ENTER_to_continue%22_prompts
command! -nargs=1 Silent
\   execute 'silent !' . <q-args>
\ | execute 'redraw!'

" Find buffer
nnoremap <silent> <F2> <cmd>lua require('telescope.builtin').buffers()<CR>
vnoremap <silent> <F2> <cmd>lua require('telescope.builtin').buffers()<CR>
inoremap <silent> <F2> <cmd>lua require('telescope.builtin').buffers()<CR>
" Find file
nnoremap <silent> <F3> <cmd>lua require('telescope.builtin').find_files()<CR>
vnoremap <silent> <F3> <cmd>lua require('telescope.builtin').find_files()<CR>
inoremap <silent> <F3> <cmd>lua require('telescope.builtin').find_files()<CR>
" Searches for the string under your cursor in your current working directory
nnoremap <silent> <leader>/ <cmd>lua require('telescope.builtin').grep_string()<CR>

" Command Key Copy/Paste
" use command + c
nmap <F12> <Plug>OSCYank
vnoremap <F12> :OSCYank<CR>
nmap <leader>y <Plug>OSCYank
vnoremap <leader>y :OSCYank<CR>

" Yank file name / path of current buffer in Vim
nnoremap <F11> <cmd>let @+=expand("%")<CR>
" Git push to upstream automatically: https://github.com/tpope/vim-fugitive/issues/1272
nnoremap <silent> <Leader>gp <cmd>Git -c push.default=current push<CR>

" Add `:B` command to switch to recent buffer
nnoremap <silent> <leader><TAB> <cmd>e #<CR>

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP

" Simulate nv-ide:
" Close All Buffers But This One
nnoremap <silent> <leader>bad :bufdo Bclose<CR>

" Small completion window
set pumheight=4


" Auto commands:
" Add missing imports on save
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
" TF format is slow, use vim builtin formatting on save
autocmd BufWritePre *.tf call CocAction('format')
" Use Tab to input space for vim script/config
autocmd FileType vim setlocal expandtab
" Reduce tab stop width for golang
autocmd FileType go setlocal ts=4
autocmd FileType go setlocal sw=4
" Configure rootPatterns for specified filetype: https://github.com/neoclide/coc.nvim/wiki/Using-workspaceFolders#persist-workspace-folders
"autocmd FileType go,gomod,json let b:coc_root_patterns = [ "config-ci.json", "go.mod", ".git", ".hg", ".vim", ".projections.json" ]
" Enable spell check for git commit message
autocmd FileType gitcommit,conf setlocal spell spelllang=en_us
autocmd FileType gitcommit,conf setlocal nonumber norelativenumber


" coc.vim
nnoremap <silent> <space><space> <cmd>CocList<CR>
nnoremap <silent> <space>c       <cmd>CocList commands<CR>

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Start multiple cursors session (replace text)
nmap <silent> <C-d> <Plug>(coc-cursors-word)
xmap <silent> <C-d> <Plug>(coc-cursors-range)
" use normal command like `<leader>xi(`
nmap <leader>x  <Plug>(coc-cursors-operator)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add `:NoDiagnostic` command to disable diagnostics
command! -nargs=0 NoDiagnostic :call coc#config('diagnostic.displayByAle', v:true)
