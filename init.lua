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
  use {
    "blackCauldron7/surround.nvim",
    config = function()
      require"surround".setup {mappings_style = "surround"}
    end
  }

  -- Spell check
  use 'kamykn/spelunker.vim'

  -- Explorer
  use 'kyazdani42/nvim-tree.lua'
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

  -- Git
  use 'tpope/vim-fugitive'
  use 'shumphrey/fugitive-gitlab.vim'
  use 'kdheepak/lazygit.nvim'

  -- Tool
  use 'vim-test/vim-test'
end)


require('basics')

require('colors')
require('fzf-config')
require('coc-config')
require('nvimtree-config')
require('lualine').setup{
  -- options = {theme = 'iceberg_dark'}
  options = { theme = 'onedark' },
  sections = {
    lualine_c = { 'coc#status', 'b:coc_git_blame' },
  },
  tabline = {
    lualine_a = {'%.30{getcwd()}'},
    lualine_b = {'%f'},
    lualine_c = {},
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
