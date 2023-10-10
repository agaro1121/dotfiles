function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      { "williamboman/mason.nvim", build = ":MasonUpdate" },
      "loctvl842/breadcrumb.nvim", -- lua line
      "kevinhwang91/nvim-ufo", -- code folding
    }
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      require("mason").setup()
      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        automatic_installation = true,
      })

      -------------------------------------- KEYBINDS
      -- telescope.builtin
      map("n", "gD", [[<cmd>lua require"telescope.builtin".lsp_definitions()<CR>]])
      map("n", "gt", [[<cmd>lua require"telescope.builtin".lsp_type_definitions()<CR>]])
      map("n", "gi", [[<cmd>lua require"telescope.builtin".lsp_implementations()<CR>]])
      map("n", "gr", [[<cmd>lua require"telescope.builtin".lsp_references()<CR>]])
      map("n", "gds", [[<cmd>lua require"telescope.builtin".lsp_document_symbols()<CR>]])
      map("n", "gws", [[<cmd>lua require"telescope.builtin".lsp_dynamic_workspace_symbols()<CR>]])
      map("n", "<leader>aa", [[<cmd>lua require"telescope.builtin".diagnostics()<CR>]])                 -- all workspace diagnostics
      map("n", "<leader>ae", [[<cmd>lua require"telescope.builtin".diagnostics({severity = "E"})<CR>]]) -- all workspace errors
      map("n", "<leader>aw", [[<cmd>lua require"telescope.builtin".diagnostics({severity = "W"})<CR>]]) -- all workspace errors

      -- map("n", "gD", "<cmd>lua vim.lsp.buf.definition()<cr>")
      -- map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
      -- map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
      -- map("n", "gds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
      -- map("n", "gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
      -- map("n", "<leader>aa", [[<cmd>lua vim.diagnostic.setqflist()<CR>]]) -- all workspace diagnostics
      -- map("n", "<leader>ae", [[<cmd>lua vim.diagnostic.setqflist({severity = "E"})<CR>]]) -- all workspace errors
      -- map("n", "<leader>aw", [[<cmd>lua vim.diagnostic.setqflist({severity = "W"})<CR>]]) -- all workspace warnings

      map("n", "<leader>d", [[<cmd>lua vim.diagnostic.setloclist()<CR>]]) -- buffer diagnostics only
      map("n", "[d", [[<cmd>lua vim.diagnostic.goto_prev { wrap = false }<CR>]])
      map("n", "]d", [[<cmd>lua vim.diagnostic.goto_next { wrap = false }<CR>]])
      map("n", "K", [[<cmd>lua vim.lsp.buf.hover()<CR>]])

      map("n", "<leader>cl", [[<cmd>lua vim.lsp.codelens.run()<CR>]])
      map("n", "<leader>sh", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]])
      map("n", "<leader>rn", [[<cmd>lua vim.lsp.buf.rename()<CR>]])
      map("n", "<leader>f", [[<cmd>lua vim.lsp.buf.format{ async = true }<CR>]])

      -- map({"n", "v"}, "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
      map({ "n", "v" }, "<leader>ca", [[<cmd> lua require"actions-preview".code_actions()<CR>]])
      -------------------------------------- KEYBINDS

      local lspconfig = require("lspconfig")

      lspconfig.terraformls.setup {}
      lspconfig.jsonls.setup {}
      lspconfig.yamlls.setup {}
      lspconfig.eslint.setup {}
      lspconfig.marksman.setup {}
      lspconfig.smithy_ls.setup {}

      lspconfig.pylsp.setup {
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

      lspconfig.pyright.setup {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              diagnosticSeverityOverrides = {
                reportConstantRedefinition = "warning",
                reportDuplicateImport = "warning",
                reportMissingSuperCall = "warning",
                reportUnnecessaryCast = "warning",
                reportUnnecessaryComparison = "warning",
                reportUnnecessaryContains = "warning",
                reportCallInDefaultInitializer = "info",
                reportFunctionMemberAccess = "info",
                reportImportCycles = "info",
                reportMatchNotExhaustive = "info",
                reportShadowedImports = "info",
                reportUninitializedInstanceVariable = "info",
                reportUnnecessaryIsInstance = "info",
                reportUnusedClass = "info",
                reportUnusedFunction = "info",
                reportUnusedImport = "info",
                reportUnusedVariable = "info",
              },
            },
          },
        }
      }

      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
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
        }
      })

      -- breadcrumbs in lualine
      local breadcrumb = require("breadcrumb")
      local on_attach = function(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          breadcrumb.attach(client, bufnr)
        end
      end
      -- breadcrumbs in lualine

      -- enable completion on all lsp instances
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      -- enable code folding
      capabilities.textDocument.foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true
      }

      local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      local handlers = {
        -- default handler
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = on_attach,
            capabilities = cmp_capabilities,
          })
        end,
      }
      mason_lspconfig.setup_handlers(handlers)
      -- enable completion on all lsp instances
    end,
  },

}
