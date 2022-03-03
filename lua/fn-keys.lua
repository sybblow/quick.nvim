-- Find buffer
vim.api.nvim_set_keymap('i', '<F2>', "<C-c><cmd>lua require('fzf-lua').buffers()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<F2>', "<cmd>lua require('fzf-lua').buffers()<CR>", { noremap = true })
vim.api.nvim_set_keymap('v', '<F2>', "<cmd>lua require('fzf-lua').buffers()<CR>", { noremap = true })
-- Find file
vim.api.nvim_set_keymap('i', '<F3>', "<C-c><cmd>lua require('fzf-lua').files()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<F3>', "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true })
vim.api.nvim_set_keymap('v', '<F3>', "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true })
-- Close
vim.api.nvim_set_keymap('i', '<F4>', "<cmd>close<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<F4>', "<cmd>close<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap('v', '<F4>', "<cmd>close<CR>", { noremap = true, silent = false })
-- Search file
vim.api.nvim_set_keymap('i', '<F5>', "<C-c><cmd>lua require('fzf-lua').live_grep()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<F5>', "<cmd>lua require('fzf-lua').live_grep()<CR>", { noremap = true })
vim.api.nvim_set_keymap('v', '<F5>', "<cmd>lua require('fzf-lua').grep_visual()<CR>", { noremap = true })
-- Save All
vim.api.nvim_set_keymap('i', '<F6>', "<cmd>wa<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<F6>', "<cmd>wa<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap('v', '<F6>', "<cmd>wa<CR>", { noremap = true, silent = false })
-- Show Tree
vim.api.nvim_set_keymap('i', '<F7>', '<cmd>lua require("nvim-tree").toggle(true, true)<CR>', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<F7>', ':NvimTreeFindFileToggle<CR>', { noremap = false, silent = true })
vim.api.nvim_set_keymap('v', '<F7>', '<C-c>:NvimTreeFindFileToggle<CR>', { noremap = false, silent = true })
-- Quit
vim.api.nvim_set_keymap('i', '<F8>', '<cmd>qa<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F8>', '<cmd>qa<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<F8>', '<cmd>qa<CR>', { noremap = true, silent = true })

-- Command Key Copy/Paste
-- use command + c
vim.api.nvim_set_keymap('v', '<F12>', ":OSCYank<CR>", { noremap = true, silent = false })
