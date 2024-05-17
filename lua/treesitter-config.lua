require'nvim-treesitter.configs'.setup {
  -- List of parsers to ignore installing
  ignore_install = { "norg" },
  ensure_installed = "all",
  highlight = { enable = true },
  indent = { enable = true },
  autotag = { enable = true, enable_close_on_slash = false },
}

vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
