return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      { "williamboman/mason.nvim", build = ":MasonUpdate" }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
      require 'lspconfig'.pylsp.setup {}
      require('lspconfig').terraformls.setup {}
      require('lspconfig').jsonls.setup {}
      require('lspconfig').yamlls.setup {}
      require 'lspconfig'.eslint.setup {}
      require 'lspconfig'.marksman.setup {}
      require 'lspconfig'.smithy_ls.setup {}
      require("lspconfig").lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { 'vim' },
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
      })
    end,
  },

}

