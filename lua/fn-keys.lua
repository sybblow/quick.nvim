-- Find buffer
vim.api.nvim_set_keymap('i', '<F2>', "<Esc><cmd>lua require('fzf-lua').buffers()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<F2>', "<cmd>lua require('fzf-lua').buffers()<CR>", { noremap = true })
vim.api.nvim_set_keymap('v', '<F2>', "<cmd>lua require('fzf-lua').buffers()<CR>", { noremap = true })
-- Find file
vim.api.nvim_set_keymap('i', '<F3>', "<Esc><cmd>lua require('fzf-lua').files()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<F3>', "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true })
vim.api.nvim_set_keymap('v', '<F3>', "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true })
-- Close
vim.api.nvim_set_keymap('i', '<F4>', "<cmd>close<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F4>', "<cmd>close<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<F4>', "<cmd>close<CR>", { noremap = true, silent = true })
-- Search file
vim.api.nvim_set_keymap('i', '<F5>', "<Esc><cmd>lua require('fzf-lua').live_grep()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<F5>', "<cmd>lua require('fzf-lua').live_grep()<CR>", { noremap = true })
vim.api.nvim_set_keymap('v', '<F5>', "<cmd>lua require('fzf-lua').grep_visual()<CR>", { noremap = true })
-- Save All
vim.api.nvim_set_keymap('i', '<F6>', "<Esc><cmd>wa<CR>a", { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<F6>', "<cmd>wa<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap('v', '<F6>', "<cmd>wa<CR>", { noremap = true, silent = false })
-- Show Tree
vim.api.nvim_set_keymap('i', '<F7>', '<cmd>lua require("nvim-tree").toggle(true, true)<CR>', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<F7>', ':NvimTreeFindFileToggle<CR>', { noremap = false, silent = true })
vim.api.nvim_set_keymap('v', '<F7>', '<Esc>:NvimTreeFindFileToggle<CR>', { noremap = false, silent = true })

-- Command Key Copy/Paste
-- Command-D is enhanced Paste
vim.api.nvim_set_keymap('i', '<F11>', "<C-R>+", { noremap = true, silent = false })
vim.api.nvim_set_keymap('c', '<F11>', "<C-R>+", { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<F11>', "a<C-R>+<Esc>", { noremap = true, silent = false })
vim.api.nvim_set_keymap('v', '<F11>', '"+gp', { noremap = true, silent = false })
vim.api.nvim_set_keymap('t', '<F11>', '<C-\\><C-n>"+gpa', { noremap = true, silent = false })

-- use command + c
vim.api.nvim_set_keymap('v', '<F12>', ":OSCYankVisual<CR>", { noremap = true, silent = false })
