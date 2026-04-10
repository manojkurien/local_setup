require "nvchad.options"

-- add yours here!

local o = vim.o
o.mouse = "" -- disable mouse reporting to allow iTerm2 text selection

-- Folding options (fallback when nvim-ufo isn't available)
o.foldmethod = "indent"
o.foldlevel = 99

-- o.cursorlineopt ='both' -- to enable cursorline!
