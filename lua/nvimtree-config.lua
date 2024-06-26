vim.g.nvim_tree_auto_ignore_ft = 'startify'

-- following options are the default
require'nvim-tree'.setup {
  -- disables git
  git = {
    enable = false,
    timeout = 200 -- (in ms)
  },
  -- disables netrw completely
  disable_netrw       = false,
  -- hijack netrw window on startup
  hijack_netrw        = true,
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab         = false,
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = false,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd          = true,
  -- show lsp diagnostics in the signcolumn
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable      = true,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd  = nil,
    -- the command arguments as a list
    args = {}
  },

  -- log = {
  --   enable = true,
  --   truncate = false,
  --   types = {
  --     all = true,
  --   },
  -- },

  -- on_attach = on_attach,

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
    width = 40,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
  }
}
-- Show Tree
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', {noremap = false, silent = true})
