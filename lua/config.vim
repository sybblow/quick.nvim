" My Config
let g:coc_global_extensions = ['coc-go', 'coc-json', 'coc-pyright', 'coc-tsserver', 'coc-clangd', 'coc-rust-analyzer', 'coc-toml', 'coc-protobuf', 'coc-vimlsp', 'coc-snippets', 'coc-pairs', 'coc-highlight', 'coc-lua', 'coc-git', 'coc-deno', 'coc-snippets']

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

" Command Key Copy/Paste
" use command + c
nmap <leader>y <Plug>OSCYank
vnoremap <leader>y :OSCYankVisual<CR>

" Add `:B` command to switch to recent buffer
nnoremap <silent> <leader><TAB> <cmd>e #<CR>

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_c<C-r>"<Esc>

" Simulate nv-ide:
" Close All Buffers But This One
nnoremap <leader>bad :bufdo Bclose<CR>
nnoremap <leader>bD :Bclose!<CR>

" Small completion window
set pumheight=4


" Auto commands:
" Add missing imports on save
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
" Use Tab to input space for vim script/config
autocmd FileType vim setlocal expandtab
" Reduce tab stop width for golang
autocmd FileType go setlocal ts=4
autocmd FileType go setlocal sw=4
" Configure rootPatterns for specified filetype: https://github.com/neoclide/coc.nvim/wiki/Using-workspaceFolders#persist-workspace-folders
autocmd FileType go,gomod let b:coc_root_patterns = [ "config-ci.json", "go.mod", ".git", ".hg", ".vim", ".projections.json" ]
autocmd FileType tf let b:coc_root_patterns = [ "service.tf", ".git", ".hg", ".vim", ".projections.json" ]
autocmd FileType gitcommit,conf setlocal nonumber norelativenumber
autocmd FileType gitcommit,conf setlocal textwidth=0


" coc.vim
nnoremap <silent> <space><space> <cmd>CocList<CR>
nnoremap <silent> <space>c       <cmd>CocList commands<CR>
nnoremap <silent> <space>g       <cmd>CocList gstatus<CR>
nnoremap <silent> <space>b       <cmd>CocList branches<CR>

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add `:NoDiagnostic` command to disable diagnostics
command! -nargs=0 NoDiagnostic :call coc#config('diagnostic.displayByAle', v:true)
