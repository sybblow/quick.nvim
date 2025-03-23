if vim.g.vscode then return {} end -- determine if Neovim is running in VSCode

-- startify-faq-10: skip Startify at start
if vim.fn.has('gui_vimr') == 1 then vim.g.startify_disable_at_vimenter = 1 end

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
    { 'neoclide/coc.nvim', branch = 'release' },
    { 'folke/tokyonight.nvim' },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },
    },
    { 'tpope/vim-commentary' },
    { 'ojroques/vim-oscyank' },
    { 'JoosepAlviste/nvim-ts-context-commentstring' },
    { 'ThePrimeagen/git-worktree.nvim' },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { { 'kyazdani42/nvim-web-devicons', lazy = true } }
    },
    {
        'ibhagwan/fzf-lua',
        dependencies = { 'kyazdani42/nvim-web-devicons' }
    },
    { 'tpope/vim-surround' },
    -- Spell check
    { 'kamykn/spelunker.vim' },
    -- Explorer
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = { 'kyazdani42/nvim-web-devicons' }
    },
    { 'rbgrouleff/bclose.vim' },
    { 'wincent/terminus' },
    { 'mhinz/vim-startify' },

    -- Theme
    'Mofiqul/vscode.nvim', 'monsonjeremy/onedark.nvim', 'ellisonleao/gruvbox.nvim',
    -- Move & Search & replace
    'karb94/neoscroll.nvim', 'nelstrom/vim-visual-star-search',
    'kevinhwang91/nvim-hlslens', 'kana/vim-textobj-user',
    'kana/vim-textobj-entire', 'IngoMeyer441/coc_current_word',
    -- Git
    'tpope/vim-fugitive', 'shumphrey/fugitive-gitlab.vim',
    'kdheepak/lazygit.nvim', 'airblade/vim-rooter',
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
