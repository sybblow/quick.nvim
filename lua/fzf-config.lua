require('fzf-lua').setup {
	files = {
		cmd = "fd --color=never --type f --hidden --follow --exclude .git"
	},

    keymap = {
        -- These override the default tables completely
        -- no need to set to `false` to disable a bind
        -- delete or modify is sufficient
        builtin = {
            -- neovim `:tmap` mappings for the fzf win
            ["<F1>"] = "toggle-help",
            ["S-f"] = "toggle-fullscreen",
            -- Only valid with the 'builtin' previewer
            ["<M-p>"] = "toggle-preview-wrap",
            -- ["<F4>"] = "toggle-preview",
            -- Rotate preview clockwise/counter-clockwise
            -- ["<F5>"] = "toggle-preview-ccw",
            -- ["<F6>"] = "toggle-preview-cw",
            ["<S-down>"] = "preview-page-down",
            ["<S-up>"] = "preview-page-up",
            ["<S-left>"] = "preview-page-reset",
        },
        fzf = {
            -- fzf '--bind=' options
            ["f2"] = "abort",
            ["f3"] = "abort",
            ["f4"] = "abort",
            ["f5"] = "abort",
            ["ctrl-u"] = "unix-line-discard",
            ["ctrl-f"] = "half-page-down",
            ["ctrl-b"] = "half-page-up",
            ["ctrl-a"] = "beginning-of-line",
            ["ctrl-e"] = "end-of-line",
            ["alt-a"] = "toggle-all",
            -- Only valid with fzf previewers (bat/cat/git/etc)
            ["alt-p"] = "toggle-preview-wrap",
            -- ["f4"] = "toggle-preview",
            ["shift-down"] = "preview-page-down",
            ["shift-up"] = "preview-page-up",
        },
    },
}

vim.api.nvim_set_keymap('n', '<C-P>', "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<C-F>', "<cmd>lua require('fzf-lua').live_grep()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<C-E>', "<cmd>lua require('fzf-lua').buffers()<CR>", { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>/', "<cmd>lua require('fzf-lua').grep_visual()<CR>", { noremap = true, silent = true })
-- Searches for the string under your cursor in your current working directory
vim.api.nvim_set_keymap('n', '<leader>/', "<cmd>lua require('fzf-lua').grep_cword()<CR>", { noremap = true, silent = true })

