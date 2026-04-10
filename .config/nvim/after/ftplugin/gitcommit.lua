-- ~/.config/nvim/after/ftplugin/gitcommit.lua
-- Hard-wrap at 72 columns and turn on spell-checking
vim.opt_local.textwidth = 72
vim.opt_local.spell = true

-- Optional visual guide one past 72
vim.opt_local.colorcolumn = { 73 }

-- Jump to the first non-comment line and start Insert mode
vim.api.nvim_create_autocmd("BufReadPost", {
  buffer = 0,   -- current buffer only
  callback = function()
    vim.cmd([[normal! gg/^[^#]/+1<CR>gi]])
  end,
})

