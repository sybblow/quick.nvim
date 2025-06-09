if vim.g.vscode then return {} end -- determine if Neovim is running in VSCode

local ensure_lazy = function()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git", "clone", "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git", "--branch=stable",
            lazypath
        })
    end

    vim.opt.rtp:prepend(lazypath)
end

local lazy_bootstrap = ensure_lazy()

-- install plugins
require('lazy').setup({
	-- Code IntelliSense
    { 'neoclide/coc.nvim', branch = 'release' },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },
    },
	-- Search
    {
        'ibhagwan/fzf-lua',
        dependencies = { 'kyazdani42/nvim-web-devicons' }
    },
    -- Spell check
    { 'kamykn/spelunker.vim' },
    -- GUI like
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { { 'kyazdani42/nvim-web-devicons', lazy = true } }
    },
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = { 'kyazdani42/nvim-web-devicons' }
    },
    { 'mhinz/vim-startify' },
    -- Fix vim built-in capabilities
    { 'rbgrouleff/bclose.vim' },
    { 'wincent/terminus' },
    { 'ojroques/vim-oscyank' },

    -- Theme
    'Mofiqul/vscode.nvim', 'monsonjeremy/onedark.nvim', 'ellisonleao/gruvbox.nvim', 'folke/tokyonight.nvim',
    -- Move & Search & replace
    'karb94/neoscroll.nvim', 'nelstrom/vim-visual-star-search',
    'kevinhwang91/nvim-hlslens',
    {
        'kana/vim-textobj-entire',
        dependencies = { 'kana/vim-textobj-user' }
    },
    'IngoMeyer441/coc_current_word',
    { 'tpope/vim-commentary' },
    { 'JoosepAlviste/nvim-ts-context-commentstring' },
    { 'tpope/vim-surround' },
    -- Git
    'tpope/vim-fugitive', 'shumphrey/fugitive-gitlab.vim',
    'kdheepak/lazygit.nvim', 'airblade/vim-rooter',
	'ThePrimeagen/git-worktree.nvim',
    -- Tool
    'vim-test/vim-test', 'bogado/file-line', 'honza/vim-snippets'
})

require('basics')

require('colors')
require('fzf-config')
require('coc-config')
if vim.fn.has('gui_vimr') == 0 then require('nvimtree-config') end
require('lualine').setup {
    -- options = {theme = 'iceberg_dark'}
    options = {theme = 'onedark'},
    sections = {lualine_c = {'coc#status'}},
    tabline = {
        lualine_a = {'%.30{getcwd()}'},
        lualine_b = {
            {
                'filename',
                file_status = true, -- Displays file status (readonly status, modified status)
                path = 1 -- 0: Just the filename
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
if vim.fn.filereadable(local_config) == 1 then vim.cmd('source ' .. local_config) end
