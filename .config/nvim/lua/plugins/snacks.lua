return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    picker = {
      layout = {
        width = 0.97,
        height = 0.8,
      },
    },
  },
  keys = {
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>*", function() Snacks.picker.grep_word() end, desc = "Word Grep", mode = { "n", "x" } },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
  },
}
