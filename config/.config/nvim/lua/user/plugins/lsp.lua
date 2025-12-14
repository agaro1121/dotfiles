-- return {
--   "mason-org/mason.nvim",
--   "mason-org/mason-lspconfig.nvim",
--   "neovim/nvim-lspconfig",
-- }
return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", build = ":MasonUpdate" },
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local mason = require("mason")
      local mason_options = {
        ensure_installed = { "debugpy" }, -- not an option from mason.nvim
        max_concurrent_installers = 10,
      }
      mason.setup(mason_options)

      vim.api.nvim_create_user_command("MasonInstallAll", function()
        vim.cmd("MasonInstall " .. table.concat(mason_options.ensure_installed, " "))
      end, {})

      -- call the above command on neovim startup - runs every time even if a package is already installed. And brings up the Mason UI
      -- vim.api.nvim_create_autocmd("VimEnter", {
      --   callback = function()
      --     vim.cmd("MasonInstallAll")
      --   end
      -- })

      -- Runs on startup but does not notify you
      local registry = require("mason-registry")

      local packages = {
        "debugpy",
      }

      registry.refresh(function()
        for _, pkg_name in ipairs(packages) do
          local pkg = registry.get_package(pkg_name)
          if not pkg:is_installed() then
            pkg:install()
          end
        end
      end)

      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        automatic_installation = true,
      })

      -------------------------------------- KEYBINDS --------------------------------------
      map("n", "gD", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "lsp.definitions" })

      map("n", "gV", ":vsplit | lua vim.lsp.buf.definition()<CR>", { desc = "lsp.open defnition in vertical split" })
      map("n", "gH", ":split | lua vim.lsp.buf.definition()<CR>", { desc = "lsp.open definition in horizontal split" })
      map("n", "gt", require("fzf-lua").lsp_typedefs, { desc = "lsp.tpye defintions" })
      map("n", "gi", require("fzf-lua").lsp_implementations, { desc = "lsp.implementations" })
      -- map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
      map("n", "gic", vim.lsp.buf.incoming_calls, { desc = "lsp.upstream calls. who calls this symbol?" })
      map("n", "goc", vim.lsp.buf.outgoing_calls, { desc = "lsp.downstream calls. What does this symbol call?" })
      map("n", "gr", require("fzf-lua").lsp_references, { desc = "lsp.references" })
      -- map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
      map("n", "gds", require("fzf-lua").lsp_document_symbols, { desc = "lsp.document symbls" })
      -- map("n", "gds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
      map("n", "gws", require("fzf-lua").lsp_live_workspace_symbols, { desc = "lsp.dynamic workspace symbols" })
      -- map("n", "gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
      local winoptsConfig = {
        preview = {
          layout = "vertical"
        }
      }
      map("n", "<leader>wa",function()  require("fzf-lua").diagnostics_workspace({winopts = winoptsConfig}) end, { desc = "lsp.workspace diagnostics" })
      -- map("n", "<leader>aa", [[<cmd>lua vim.diagnostic.setqflist()<CR>]]) -- all workspace diagnostics
      map("n", "<leader>we", function() require("fzf-lua").diagnostics_workspace({ severity_only = "E", winopts = winoptsConfig }) end, { desc = "lsp.workspace error diagnostics" })
      -- map("n", "<leader>ae", [[<cmd>lua vim.diagnostic.setqflist({severity = "E"})<CR>]]) -- all workspace errors
      map("n", "<leader>ww", function() require("fzf-lua").diagnostics_workspace({ severity_only = "W", winopts = winoptsConfig }) end, { desc = "lsp.workspace warning diagnostics" })
      -- map("n", "<leader>aw", [[<cmd>lua vim.diagnostic.setqflist({severity = "W"})<CR>]]) -- all workspace warnings
      map("n", "<leader>ba", function() require("fzf-lua").diagnostics_document({winopts = winoptsConfig}) end, { desc = "lsp.buffer diagnostics" })
      -- map("n", "<leader>d", vim.diagnostic.setloclist) -- buffer diagnostics only
      map("n", "<leader>be", function() require("fzf-lua").diagnostics_document({severity_only = "E", winopts = winoptsConfig }) end, { desc = "lsp.buffer error diagnostics" })
      map("n", "<leader>bw", function() require("fzf-lua").diagnostics_document({severity_only = "W", winopts = winoptsConfig }) end, { desc = "lsp.buffer warning diagnostics" })


      map("n", "[d", function() vim.diagnostic.goto_prev { wrap = false } end, { desc = "lsp.previous error" })
      map("n", "]d", function() vim.diagnostic.goto_next { wrap = false } end, { desc = "lsp.next error" })
      map("n", "K", vim.lsp.buf.hover)

      map("n", "<leader>cl", vim.lsp.codelens.run, { desc = "lsp.code lens" })
      map("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "lsp.signature help" })
      map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "lsp.rename" })
      map("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, { desc = "format" })
      map("n", "<leader>H", vim.lsp.buf.document_highlight, { desc = "lsp.Highlights the current symbol in the entire buffer" })
      map("n", "<leader>nH", vim.lsp.buf.clear_references, { desc = "lsp.Clear symbol highlights" })

      -- map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "lsp.code action" })
      map({ "n", "v" }, "<leader>ca", require("fzf-lua").lsp_code_actions, { desc = "lsp.code action" })
      map("n", "<leader>in", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, { desc = "lsp.inlay hints toggle"})
      -------------------------------------- KEYBINDS --------------------------------------

      vim.lsp.enable({ "terraformls", "jsonls", "yamlls", "eslint", "marksman", "smithy_ls", "ts_ls", "html", "cssls",
        "lua_ls", "pylsp", "pyright" })


      vim.lsp.config["pylsp"] = {
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

      vim.lsp.config["pyright"] = {
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

      vim.lsp.config['lua_ls'] = {
        -- Command and arguments to start the server.
        cmd = { 'lua-language-server' },
        -- Filetypes to automatically attach to.
        filetypes = { 'lua' },
        -- Specific settings to send to the server. The schema for this is
        -- defined by the server. For example the schema for lua-language-server
        -- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace"
            },
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
      }
    end,
  },

}
