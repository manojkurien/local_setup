return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      "nvim-treesitter/nvim-treesitter",
    },
    event = "BufRead",
    config = function()
      -- Configure fold columns
      vim.o.foldcolumn = '1'
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Using ufo provider need remap `zR` and `zM`
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = "Open all folds" })
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = "Close all folds" })

      -- Optional: Preview fold when hovering
      vim.keymap.set('n', 'K', function()
        local winid = require('ufo').peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end, { desc = "Peek fold or LSP hover" })

      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          -- Use treesitter as main, indent as fallback (max 2 providers allowed)
          return {'treesitter', 'indent'}
        end
      })
    end,
  },
}
