require('lspconfig').terraformls.setup{}
-- vim.api.nvim_create_autocmd({"BufWritePre"}, {
  -- pattern = {"*.tf", "*.tfvars"},
  -- callback = vim.lsp.buf.formatting_sync,
-- })

require('lspconfig').jsonls.setup{}

require('lspconfig').yamlls.setup{}

require'lspconfig'.eslint.setup{}

require'lspconfig'.marksman.setup{}

require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- requires java 17
-- require'lspconfig'.jdtls.setup{}
