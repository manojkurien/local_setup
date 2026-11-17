local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  -- format_on_save deliberately omitted: it rewrote files on every :w/:wq,
  -- including filetypes with no configured formatter (via lsp_fallback).
  -- Format manually with <leader>fm instead.
}

return options
