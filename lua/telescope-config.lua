local telescope = require("telescope")
local actions = require('telescope.actions')
local previewers = require("telescope.previewers")

local max_size = 10000
local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then return end
    if stat.size > max_size then
      return
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end

telescope.setup {
  defaults = {
    buffer_previewer_maker = new_maker,
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
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}

telescope.load_extension("git_worktree", "fzf")

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
  require('telescope.builtin').grep_string { search = selection, use_regex = false }
end
