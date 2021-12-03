require('basics')

-- setup plugins, need to comment out first if you haven't installed these plugins by packer
require('colors')
require('telescope-config')
require('coc-config')
require('nvimtree-config')
require('lualine').setup{
  -- options = {theme = 'iceberg_dark'}
  options = { theme = 'onedark' },
  sections = {
    lualine_c = { 'filename', 'coc#status' },
  }
}
-- require('neoscroll').setup {
--   easing_function = "quadratic" -- Default easing function
-- }

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}
require('treesitter-config')

-- install plugins
return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'folke/tokyonight.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'tpope/vim-commentary'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'ThePrimeagen/git-worktree.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    "blackCauldron7/surround.nvim",
    config = function()
      require"surround".setup {mappings_style = "surround"}
    end
  }

  -- Explorer
  use 'kyazdani42/nvim-tree.lua'
  
  -- Theme
  use 'Mofiqul/vscode.nvim'
  use 'monsonjeremy/onedark.nvim'

  -- Move & Search & replace
  use 'karb94/neoscroll.nvim'
end)
