-- startify-faq-10: skip Startify at start
if vim.fn.has('gui_vimr') == 1 then
	vim.g.startify_disable_at_vimenter = 1
end

-- install plugins
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'folke/tokyonight.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'tpope/vim-commentary'
  use 'ojroques/vim-oscyank'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'ThePrimeagen/git-worktree.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use { 'ibhagwan/fzf-lua',
  -- optional for icon support
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use 'tpope/vim-surround'

  -- Spell check
  use 'kamykn/spelunker.vim'

  -- Explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    }
  }
  use 'rbgrouleff/bclose.vim'
  use 'wincent/terminus'
  use 'mhinz/vim-startify'

  -- Theme
  use 'Mofiqul/vscode.nvim'
  use 'monsonjeremy/onedark.nvim'
  use 'ellisonleao/gruvbox.nvim'

  -- Move & Search & replace
  use 'karb94/neoscroll.nvim'
  use 'nelstrom/vim-visual-star-search'
  use 'kevinhwang91/nvim-hlslens'
  use 'kana/vim-textobj-user'
  use 'kana/vim-textobj-entire'
  use 'IngoMeyer441/coc_current_word'

  -- Git
  use 'tpope/vim-fugitive'
  use 'shumphrey/fugitive-gitlab.vim'
  use 'kdheepak/lazygit.nvim'

  -- Tool
  use 'vim-test/vim-test'
  use 'bogado/file-line'
end)


require('basics')

require('colors')
require('fzf-config')
require('coc-config')
if vim.fn.has('gui_vimr') == 0 then
	require('nvimtree-config')
end
require('lualine').setup{
  -- options = {theme = 'iceberg_dark'}
  options = { theme = 'onedark' },
  sections = {
    lualine_c = {'coc#status'},
  },
  tabline = {
    lualine_a = {'%.30{getcwd()}'},
    lualine_b = {
      {
        'filename',
        file_status = true, -- Displays file status (readonly status, modified status)
        path = 1, -- 0: Just the filename
                  -- 1: Relative path
                  -- 2: Absolute path
      }
    },
    lualine_c = {'b:coc_git_blame'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'tabs'}
  }
}
-- require('neoscroll').setup {
--   easing_function = "quadratic" -- Default easing function
-- }
require('treesitter-config')

require('hlslens-config')

-- map function keys to be used as command key shortcuts
require('fn-keys')


-- tree-sitter-go-template
local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
parser_config.gotmpl = {
  install_info = {
    url = "https://github.com/ngalaiko/tree-sitter-go-template",
    files = {"src/parser.c"}
  },
  filetype = "gotmpl",
  used_by = {"gohtmltmpl", "gotexttmpl", "gotmpl", "yaml"}
}

-- load local configuration in the end
local local_config = vim.fn.stdpath('config') .. '/lua/config.vim.local'
if vim.fn.filereadable(local_config) == 1 then
  vim.cmd('source ' .. local_config)
end
