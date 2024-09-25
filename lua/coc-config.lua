vim.g.coc_global_extensions = {
    'coc-list',
    'coc-go',
    'coc-json',
    'coc-pyright',
    'coc-tsserver',
    'coc-clangd',
    'coc-rust-analyzer',
    'coc-toml',
    'coc-protobuf',
    'coc-vimlsp',
    'coc-snippets',
    'coc-pairs',
    'coc-highlight',
    'coc-lua',
    'coc-git',
    'coc-deno',
    'coc-snippets',
}

vim.api.nvim_set_keymap("n", "<leader>.", "<Plug>(coc-codeaction)", {})
vim.api.nvim_set_keymap("n", "<leader>l", ":CocCommand eslint.executeAutofix<CR>", {})
vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", {silent = true})
vim.api.nvim_set_keymap("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
vim.api.nvim_set_keymap("n", "gi", "<Plug>(coc-implementation)", {silent = true})
vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)", {silent = true})
vim.api.nvim_set_keymap("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
vim.api.nvim_set_keymap("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})
vim.api.nvim_set_keymap("n", "K", ":call CocActionAsync('doHover')<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>rn", "<Plug>(coc-rename)", {})
vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>CocNext<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>CocPrev<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>f", ":CocCommand prettier.formatFile<CR>", {noremap = true})
vim.api.nvim_set_keymap("i", "<C-Space>", "coc#refresh()", { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<TAB>", "coc#pum#visible() ? coc#pum#next(1) : '<TAB>'", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<S-TAB>", "coc#pum#visible() ? coc#pum#prev(1) : '<C-h>'", {noremap = true, expr = true})
-- :help i_CTRL-G_u
vim.api.nvim_set_keymap("i", "<CR>", "coc#pum#visible() ? coc#pum#confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'", {silent = true, expr = true, noremap = true})
vim.api.nvim_set_keymap("i", "<C-x><C-z>", 'coc#pum#visible() ? coc#pum#stop() : "<C-x><C-z>"', {silent = true, expr = true, noremap = true})

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<space><space>', '<cmd>CocList<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>c', '<cmd>CocList commands<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>a', '<cmd>CocList diagnostics<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>o', '<cmd>CocList outline<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>s', '<cmd>CocList symbols<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>g', '<cmd>CocList gchunks<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>b', '<cmd>CocList branches<CR>', opts)
vim.api.nvim_set_keymap("n", "<space>j", "<cmd>CocNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>k", "<cmd>CocPrev<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>p", "<cmd>CocListResume<CR>", opts)
-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server
vim.api.nvim_set_keymap('x', 'if', '<Plug>(coc-funcobj-i)', opts)
vim.api.nvim_set_keymap('o', 'if', '<Plug>(coc-funcobj-i)', opts)
vim.api.nvim_set_keymap('x', 'af', '<Plug>(coc-funcobj-a)', opts)
vim.api.nvim_set_keymap('o', 'af', '<Plug>(coc-funcobj-a)', opts)
vim.api.nvim_set_keymap('x', 'ic', '<Plug>(coc-classobj-i)', opts)
vim.api.nvim_set_keymap('o', 'ic', '<Plug>(coc-classobj-i)', opts)
vim.api.nvim_set_keymap('x', 'ac', '<Plug>(coc-classobj-a)', opts)
vim.api.nvim_set_keymap('o', 'ac', '<Plug>(coc-classobj-a)', opts)
-- Apply codeAction to the selected region
-- Example: `<leader>aap` for current paragraph
vim.api.nvim_set_keymap('x', '<leader>a', '<Plug>(coc-codeaction-selected)', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>a', '<Plug>(coc-codeaction-selected)', { noremap = true })
-- Apply the most preferred quickfix action on the current line.
vim.api.nvim_set_keymap('n', '<leader>qf', '<Plug>(coc-fix-current)', opts)

vim.o.hidden = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300

vim.g.coc_current_word_highlight_delay = 600

-- Configure rootPatterns for specified filetype: https://github.com/neoclide/coc.nvim/wiki/Using-workspaceFolders#persist-workspace-folders
vim.cmd[[
  autocmd FileType go,gomod let b:coc_root_patterns = [ "config-ci.json", "go.mod", ".git", ".hg", ".vim", ".projections.json" ]
  autocmd FileType tf let b:coc_root_patterns = [ "service.tf", ".git", ".hg", ".vim", ".projections.json" ]
]]