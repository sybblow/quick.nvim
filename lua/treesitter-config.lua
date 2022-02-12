require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  -- List of parsers to ignore installing
  ignore_install = { "norg" },
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

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 1
vim.opt.foldnestmax = 10
vim.opt.foldenable = false
