return {
  {
    "williamboman/mason-lspconfig.nvim",
    version = "1.32.0",
    dependencies = {
      { "williamboman/mason.nvim", build = ":MasonUpdate" },
      "SmiteshP/nvim-navic",   -- lua line
      "kevinhwang91/nvim-ufo", -- code folding
    }
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "folke/neodev.nvim",
    },
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
      -- map("n", "gD",         require("telescope.builtin").lsp_definitions, { desc = "lsp.definitions"}) -- NOTE: inconsistent
      map("n", "gV",         ":vsplit | lua vim.lsp.buf.definition()<CR>", { desc = "lsp.open defnition in vertical split" } )
      map("n", "gH",         ":split | lua vim.lsp.buf.definition()<CR>", { desc = "lsp.open definition in horizontal split" })
      map("n", "gt",         require("telescope.builtin").lsp_type_definitions, {desc = "lsp.tpye defintions"})
      map("n", "gi",         require("telescope.builtin").lsp_implementations, {desc = "lsp.implementations"})
      map("n", "gic",        vim.lsp.buf.incoming_calls, {desc = "lsp.upstream calls. who calls this symbol?"})
      map("n", "goc",        vim.lsp.buf.outgoing_calls, {desc = "lsp.downstream calls. What does this symbol call?"})
      map("n", "gr",         require("telescope.builtin").lsp_references, {desc = "lsp.references"})
      map("n", "gds",        require("telescope.builtin").lsp_document_symbols, {desc = "lsp.document symbls"})
      map("n", "gwds",       require("telescope.builtin").lsp_dynamic_workspace_symbols, {desc = "lsp.dynamic workspace symbols"})
      map("n", "<leader>wa", require("telescope.builtin").diagnostics, {desc = "lsp.workspace diagnostics"})                                  -- workspace diagnostics
      map("n", "<leader>we", function() require("telescope.builtin").diagnostics({severity = "E"}) end, {desc="lsp.woskspace error diagnostics"}) -- workspace errors
      map("n", "<leader>ww", function() require("telescope.builtin").diagnostics({severity = "W"}) end, {desc="lsp.workspace warning diagnostics"}) -- workspace errors

      map("n", "<leader>ba",  function() require("telescope.builtin").diagnostics({bufnr=0}) end, {desc = "lsp.buffer diagnostics"})                   -- buffer diagnostics
      map("n", "<leader>be",  function() require("telescope.builtin").diagnostics({bufnr=0, severity = "E"}) end, {desc = "lsp.buffer error diagnostics"})   -- buffer errors
      map("n", "<leader>bw",  function() require("telescope.builtin").diagnostics({bufnr=0, severity = "W"}) end, {desc = "lsp.buffer warning diagnostics"})   -- buffer warnings

      map("n", "gws", function()
        vim.ui.input({ prompt = "Workspace symbols: " }, function(query)
          require("telescope.builtin").lsp_workspace_symbols({ query = query })
        end)
      end, {desc = "lsp.workspace symbols"})

      map("n", "gD", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "lsp.definitions"})
      -- map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
      -- map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
      -- map("n", "gds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
      -- map("n", "gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
      -- map("n", "<leader>aa", [[<cmd>lua vim.diagnostic.setqflist()<CR>]]) -- all workspace diagnostics
      -- map("n", "<leader>ae", [[<cmd>lua vim.diagnostic.setqflist({severity = "E"})<CR>]]) -- all workspace errors
      -- map("n", "<leader>aw", [[<cmd>lua vim.diagnostic.setqflist({severity = "W"})<CR>]]) -- all workspace warnings

      -- map("n", "<leader>d", vim.diagnostic.setloclist) -- buffer diagnostics only
      map("n", "[d",        function() vim.diagnostic.goto_prev { wrap = false } end, {desc = "lsp.previous error"})
      map("n", "]d",        function() vim.diagnostic.goto_next { wrap = false } end, {desc = "lsp.next error"})
      map("n", "K",         vim.lsp.buf.hover)

      map("n", "<leader>cl", vim.lsp.codelens.run, {desc = "lsp.code lens"})
      map("n", "<leader>sh", vim.lsp.buf.signature_help, {desc = "lsp.signature help"})
      map("n", "<leader>rn", vim.lsp.buf.rename, {desc = "lsp.rename"})
      map("n", "<leader>f",  function() vim.lsp.buf.format{ async = true } end, {desc = "format"})
      map("n", "<leader>H",  vim.lsp.buf.document_highlight, {desc = "lsp.Highlights the current symbol in the entire buffer"})
      map("n", "<leader>nH", vim.lsp.buf.clear_references,   {desc = "lsp.Clear symbol highlights"})

      map({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, {desc = "lsp.code action"})
      -------------------------------------- KEYBINDS --------------------------------------

      -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
      require("neodev").setup({
        library = {
          plugins = true
          -- {
          --   "nvim-dap-ui"
          -- },
        },
      })

      local lspconfig = require("lspconfig")

      lspconfig.terraformls.setup {}
      lspconfig.jsonls.setup {}
      lspconfig.yamlls.setup {}
      lspconfig.eslint.setup {}
      lspconfig.marksman.setup {}
      lspconfig.smithy_ls.setup {}
      lspconfig.ts_ls.setup{}
      lspconfig.html.setup{} -- npm i -g vscode-langservers-extracted
      lspconfig.cssls.setup{} -- npm i -g vscode-langservers-extracted


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
      })
      -- breadcrumbs in lualine
      local navic = require("nvim-navic")
      local on_attach = function(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
        end
      end

      -- enable completion on all lsp instances
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      local cmp_lsp = require("cmp_nvim_lsp")
      local cmp_capabilities = cmp_lsp.default_capabilities(capabilities)

      -- enable code folding
      -- needs to be on cmp_capabilities or it will get overwritten
      cmp_capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }

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
