return {
  {
    "williamboman/mason-lspconfig.nvim",
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

      -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
      require("neodev").setup({
        library = {
          plugins = {
            "nvim-dap-ui"
          },
        },
      })

      local lspconfig = require("lspconfig")

      lspconfig.terraformls.setup {}
      lspconfig.jsonls.setup {}
      lspconfig.yamlls.setup {}
      lspconfig.eslint.setup {}
      lspconfig.marksman.setup {}
      lspconfig.smithy_ls.setup {}
      lspconfig.tsserver.setup{}


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

      local lsp_utils = require("lsp_utils")

      local handlers = {
        -- default handler
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = lsp_utils.on_attach(require("nvim-navic"), require("telescope.builtin")),
            capabilities = lsp_utils.cmp_capabilities(require("cmp-nvim-lsp")),
          })
        end,
      }

      mason_lspconfig.setup_handlers(handlers)
      -- enable completion on all lsp instances
    end,
  },

}
