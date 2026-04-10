require("nvchad.configs.lspconfig").defaults()

-- Add folding capabilities for nvim-ufo
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

-- Enable LSP semantic tokens (works alongside treesitter)
capabilities = vim.tbl_deep_extend("force", capabilities, {
  textDocument = {
    semanticTokens = {
      multilineTokenSupport = true,
    }
  }
})

local lspconfig = require("lspconfig")
local servers = { "html", "cssls", "ts_ls", "pyright" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    capabilities = capabilities,
  })
end
