vim.g.mapleader = ";"
vim.o.number  =true
vim.o.relativenumber = false
vim.o.wrap = true
vim.o.expandtab = false
vim.o.incsearch = true
vim.o.tabstop = 2
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.hlsearch = true
vim.o.gdefault = true
vim.o.swapfile = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 3
vim.o.errorbells = false
vim.o.shiftwidth = 2
vim.o.numberwidth = 4
vim.o.termguicolors = true
-- vim.o.colorcolumn = '80'
vim.o.showmode = false
-- vim.o.showtabline = 2
vim.o.signcolumn = 'yes'
vim.o.mouse = 'a'

vim.o.spell = false -- disable builtin spell check
vim.o.spellfile = vim.fn.stdpath('data') .. '/spell/en.utf-8.add'

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
--vim.api.nvim_set_keymap('n', '<C-N>', ":Lexplore<CR> :vertical resize 30<CR>", { noremap = true })
--vim.api.nvim_set_keymap("n", "<leader>t", ":sp<CR> :term<CR> :resize 20N<CR> i", {noremap = true, silent = true})
--vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>t", ":TestNearest<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>T", ":TestFile<CR>", {noremap = true, silent = true})
-- Git
vim.api.nvim_set_keymap('n', '<leader>gf', ':20G<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', {noremap = true, silent = false})

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

vim.cmd [[
    autocmd TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}

    filetype indent off

    autocmd BufNewFile,BufRead coc-settings.json setlocal filetype=jsonc

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

vim.cmd('source ' .. vim.fn.stdpath('config') .. '/lua/config.vim')
local local_config = vim.fn.stdpath('config') .. '/lua/config.vim.local'
if vim.fn.filereadable(local_config) == 1 then
  vim.cmd('source ' .. local_config)
end
