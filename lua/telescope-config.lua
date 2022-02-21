vim.api.nvim_set_keymap('n', '<C-P>', "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<C-F>', "<cmd>lua require('fzf-lua').live_grep()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<C-E>', "<cmd>lua require('fzf-lua').buffers()<CR>", { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>/', "<cmd>lua require('fzf-lua').grep_visual()<CR>", { noremap = true, silent = true })
-- Searches for the string under your cursor in your current working directory
vim.api.nvim_set_keymap('n', '<leader>/', "<cmd>lua require('fzf-lua').grep_cword()<CR>", { noremap = true, silent = true })

