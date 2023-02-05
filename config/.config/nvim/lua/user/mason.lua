require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "marksman", "sumneko_lua", "jsonls"}
})
