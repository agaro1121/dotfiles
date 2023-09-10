return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      { "williamboman/mason.nvim", build = ":MasonUpdate" }
    }
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
      require('lspconfig').terraformls.setup {}
      require('lspconfig').jsonls.setup {}
      require('lspconfig').yamlls.setup {}
      require 'lspconfig'.eslint.setup {}
      require 'lspconfig'.marksman.setup {}
      require 'lspconfig'.smithy_ls.setup {}
      require 'lspconfig'.pylsp.setup {
        settings = {
          pylsp = {
            plugins = {
              flake8 = {
                enabled = true,
                -- pyright overlap
                ignore = { 'F811', 'F401', 'F821', 'F841', 'E501', 'W503' },
              },
              pycodestyle = {
                enabled = true,
              },
              autopep8 = {
                enabled = false,
              },
              yapf = {
                enabled = true,
              },
            },
          },
        },
      }

      require 'lspconfig'.pyright.setup {
        venvPath = ".",
        venv = ".venv",
        -- on_attach = on_attach,
        settings = {
          venvPath = ".",
          venv = ".venv",
            python = {
              analysis = {
                typeCheckingMode = 'basic',
                diagnosticSeverityOverrides = {
                  reportConstantRedefinition = 'warning',
                  reportDuplicateImport = 'warning',
                  reportMissingSuperCall = 'warning',
                  reportUnnecessaryCast = 'warning',
                  reportUnnecessaryComparison = 'warning',
                  reportUnnecessaryContains = 'warning',
                  reportCallInDefaultInitializer = 'info',
                  reportFunctionMemberAccess = 'info',
                  reportImportCycles = 'info',
                  reportMatchNotExhaustive = 'info',
                  reportShadowedImports = 'info',
                  reportUninitializedInstanceVariable = 'info',
                  reportUnnecessaryIsInstance = 'info',
                  reportUnusedClass = 'info',
                  reportUnusedFunction = 'info',
                  reportUnusedImport = 'info',
                  reportUnusedVariable = 'info',
                },
              },
            },
        }
      }

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
