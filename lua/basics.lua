vim.o.messagesopt = "wait:0,history:500"

vim.g.mapleader = ";"
vim.o.number  =true
vim.o.relativenumber = false
vim.o.wrap = false
vim.o.expandtab = false
vim.o.incsearch = true
vim.o.tabstop = 4
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.hlsearch = true
vim.o.gdefault = true
vim.o.swapfile = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 3
vim.o.errorbells = false
vim.o.shiftwidth = 4
vim.o.numberwidth = 4
vim.o.termguicolors = true
-- vim.o.colorcolumn = '80'
vim.o.showmode = false
-- vim.o.showtabline = 2
vim.o.signcolumn = 'yes'
vim.o.mouse = 'a'

-- small completion window
vim.o.pumheight = 4

vim.o.spell = false -- disable builtin spell check
vim.o.spellfile = vim.fn.stdpath('data') .. '/spell/en.utf-8.add'

vim.opt.guifont = "FiraCode Nerd Font Mono:13"

vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 1
vim.opt.foldnestmax = 10
vim.opt.foldenable = false

--vim.api.nvim_set_keymap('n', 'vs', ':vs<CR>', { noremap = true })
--vim.api.nvim_set_keymap('n', 'sp', ':sp<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tn', ':tabnew<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tk', ':tabprev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tj', ':tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'to', ':tabo<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-S>', ':%s/', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-S>', ':%s/', { noremap = true })
--vim.api.nvim_set_keymap('n', '<C-N>', ":Lexplore<CR> :vertical resize 30<CR>", { noremap = true })
--vim.api.nvim_set_keymap("n", "<leader>t", ":sp<CR> :term<CR> :resize 20N<CR> i", {noremap = true, silent = true})
--vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>t", ":TestNearest<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>T", ":TestFile<CR>", {noremap = true, silent = true})
-- Git
-- vim.api.nvim_set_keymap('n', '<leader>gf', ':20G<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>gp', ':Git pull --ff-only<CR>', {noremap = true, silent = false})
-- Git push to upstream automatically: https://github.com/tpope/vim-fugitive/issues/1272
vim.api.nvim_set_keymap('n', '<leader>gP', ':Git -c push.default=current push<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>gc', ':Git checkout master<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>gC', ':Git checkout master | Git pull --ff-only<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>go', ':lua gbrowse_register()<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<C-L>', ':lua gbrowse_register()<CR>', {noremap = true, silent = false})

-- Plugins
vim.g["netrw_banner"] = 0
vim.g["netrw_liststyle"] = 3
vim.g["netrw_winsize"] = 25

vim.g["test#strategy"] = "neovim"
vim.g.startify_change_to_dir = 0
vim.g.startify_lists = {
  { type = 'dir',       header = {'   MRU '.. vim.fn.getcwd()}},
  { type = 'sessions',  header = {'   Sessions'}              },
  { type = 'bookmarks', header = {'   Bookmarks'}             },
  { type = 'commands',  header = {'   Commands'}              },
}
vim.g.startify_bookmarks = {
  { n = 'zshrc', p = '~/.zshrc' },
}

vim.g.enable_spelunker_vim = 0

vim.g.rooter_manual_only = 1

-- tweaks
vim.cmd [[
    autocmd TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}

    filetype indent off

    autocmd BufNewFile,BufRead config.vim.local setlocal filetype=vim

    autocmd FileType fzf let b:enable_spelunker_vim = 0
]]

vim.cmd[[autocmd BufReadPost * lua goto_last_pos()]]
function goto_last_pos()
  local last_pos = vim.fn.line("'\"")
  if last_pos > 0 and last_pos <= vim.fn.line("$") then
    vim.api.nvim_win_set_cursor(0, {last_pos, 0})
  end
end

vim.cmd [[
  autocmd FileType json setlocal expandtab
  autocmd FileType json setlocal shiftwidth=2
  autocmd FileType json setlocal tabstop=2
]]

--only available in Neovim 0.7.0+
--vim.api.nvim_add_user_command('OpenInIDEA', 'lua open_with_external_tool()', {})
vim.cmd[[command! OpenInIDEA lua open_with_external_tool()]]
function open_with_external_tool()
	local linenr = vim.api.nvim_win_get_cursor(0)[1]
	vim.cmd('silent! !goland --line ' .. tostring(linenr) .. ' "%"')
end

function gbrowse_register()
	local cliptext = vim.fn.getreg('"')
	vim.cmd('GBrowse ' .. cliptext)
end

-- Settings per fileType
vim.cmd[[
  autocmd FileType go setlocal ts=4 sw=4
  autocmd FileType vim setlocal expandtab
  autocmd FileType gitcommit,conf setlocal nonumber norelativenumber
  autocmd FileType gitcommit,conf setlocal textwidth=0
]]

-- keymaps
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- switch to recent buffer
map('n', '<leader><tab>', '<cmd>e #<CR>', opts)
-- OSC yank to system clipboard
map('n', '<leader>y', '<Plug>OSCYank', opts)
map('v', '<leader>y', ':OSCYankVisual<CR>', opts)
-- delete without yanking
map('n', '<leader>d', '"_d', opts)
map('v', '<leader>d', '"_d', opts)
-- replace currently selected text with default register without yanking it
map('v', '<leader>p', '"_c<C-r>"<Esc>', opts)
-- close all buffers
map('n', '<leader>bad', ':bufdo Bclose<CR>', opts)
map('n', '<leader>bd', ':bdelete<CR>', opts)
map('n', '<leader>bD', ':Bclose!<CR>', opts)

vim.cmd('source ' .. vim.fn.stdpath('config') .. '/lua/config.vim')
