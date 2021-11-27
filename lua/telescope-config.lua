local telescope = require("telescope")
local actions = require('telescope.actions')

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<F2>"] = actions.close,
        ["<F3>"] = actions.close,
      },
      n = {
        ["<F2>"] = actions.close,
        ["<F3>"] = actions.close,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "ivy",
    }
  }
}

telescope.load_extension("git_worktree")

vim.api.nvim_set_keymap('n', '<C-P>', "<cmd>lua require('telescope.builtin').find_files()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<C-F>', "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<C-E>', "<cmd>lua require('telescope.builtin').buffers()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<C-T>', "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", { noremap = true })

vim.api.nvim_set_keymap('v', '<leader>/', ':lua search_selection()<CR>', { noremap = true, silent = true })
function search_selection()
  local a_save = vim.fn.getreg('a')
  vim.cmd('normal! gv"ay')
  local selection = vim.fn.getreg('a')

  vim.fn.setreg('a', a_save)
  require('telescope.builtin').grep_string { search = selection }
end
