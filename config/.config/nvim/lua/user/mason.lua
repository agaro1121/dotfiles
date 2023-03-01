require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "marksman", "lua_ls", "jsonls"}
})
