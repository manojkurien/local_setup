return {
  "tpope/vim-fugitive",
  lazy = true,
  dependencies={ "tpope/vim-rhubarb", lazy = true, event = "VeryLazy" },
  keys = {
    -- Normal-mode → open current line
    { "gb", ":.GBrowse<CR>",      mode = "n", desc = "GitHub ↗ this line" },

    -- Visual-mode → open selected lines
    { "gb", ":'<,'>GBrowse<CR>",  mode = "v", desc = "GitHub ↗ selection" },
  },
  cmd = { "Git", "G", "GBrowse" },
}
