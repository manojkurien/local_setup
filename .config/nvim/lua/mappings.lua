require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Override NvChad's Telescope mappings with Snacks
map("n", "<leader>ff", function() require("snacks").picker.files() end, { desc = "Find Files" })
map("n", "<leader>fa", function() require("snacks").picker.files({ hidden = true }) end, { desc = "Find All Files" })
map("n", "<leader>fw", function() require("snacks").picker.grep() end, { desc = "Live Grep" })
map("n", "<leader>fb", function() require("snacks").picker.buffers() end, { desc = "Find Buffers" })
map("n", "<leader>fh", function() require("snacks").picker.help() end, { desc = "Help Tags" })
map("n", "<leader>fo", function() require("snacks").picker.recent() end, { desc = "Recent Files" })
map("n", "<leader>fz", function() require("snacks").picker.grep_buffers() end, { desc = "Find in Current Buffer" })
map({ "n", "x" }, "<leader>*", function() require("snacks").picker.grep_word() end, { desc = "Word Grep" })

-- Toggle line numbers for easier copying
map("n", "<leader>n", function()
  vim.opt.number = not vim.opt.number:get()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle line numbers" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Open personal cheatsheet
map("n", "<leader>?", function()
  local path = vim.fn.stdpath("config") .. "/cheatsheet.md"
  vim.cmd("vsplit " .. path)
  vim.cmd("setlocal readonly nomodifiable")
end, { desc = "Open cheatsheet" })
