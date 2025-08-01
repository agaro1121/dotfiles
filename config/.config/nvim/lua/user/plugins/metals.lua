return {
  "scalameta/nvim-metals",
  ft = {"scala", "sbt", "java"},
  dependencies = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap", "SmiteshP/nvim-navic", "saghen/blink.cmp",
    {
      "j-hui/fidget.nvim",
      opts = {},
    }
  },
  config = function()
    vim.opt_global.shortmess:remove("F") --	don't give the file info when editing a file
    vim.opt_global.shortmess:append("c") --	don't give |ins-completion-menu| messages; for		*shm-c*

    local api = vim.api

    local metals_config = require("metals").bare_config()

    metals_config.settings = {
      showImplicitArguments = true,
      showInferredType = true,
      superMethodLensesEnabled = true,
      showImplicitConversionsAndClasses = true,
      -- testUserInterface = "Test Explorer",
    }

    -- *READ THIS*
    -- I *highly* recommend setting statusBarProvider to true, however if you do,
    -- you *have* to have a setting to display this in your statusline or else
    -- you'll not see any messages from metals. There is more info in the help
    -- docs about this
    metals_config.init_options.statusBarProvider = "off"

    -- code completion

    local capabilities = {
      textDocument = {
        foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true
        },
      }
    }

    local cmp_capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
    cmp_capabilities.textDocument.completion.completionItem.snippetSupport = true

    metals_config.capabilities = cmp_capabilities

    -- Debug settings if you're using nvim-dap
    local dap = require("dap")

    dap.configurations.scala = {
      {
        type = "scala",
        request = "launch",
        name = "RunOrTest",
        metals = {
          runType = "runOrTestFile",
          --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
        },
      },
      {
        type = "scala",
        request = "launch",
        name = "Test Target",
        metals = {
          runType = "testTarget",
        },
      },
    }
    -- automatically open repl when running test. Using dap-ui instead for now
    -- dap.listeners.after.event_terminated["nvim-metals"] = function()
    --   dap.repl.open()
    -- end

    local on_attach = function(client, bufnr)
      -- breadcrumbs in lualine
      if client.server_capabilities.documentSymbolProvider then
        local navic = require("nvim-navic")
        navic.attach(client, bufnr)
      end

      require("metals").setup_dap()
    end

    metals_config.on_attach = on_attach

    -- Autocmd that will actually be in charging of starting the whole thing
    local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })

    api.nvim_create_autocmd("FileType", {
      -- NOTE: You may or may not want java included here. You will need it if you
      -- want basic Java support but it may also conflict if you are using
      -- something like nvim-jdtls which also works on a java filetype autocmd.
      pattern = { "scala", "sbt", "java" },
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })

    map("n", "<leader>mc", require("metals").commands, { desc = "metals.menu" })
    map("n", "<leader>ws", require("metals").hover_worksheet, { desc = "metals.hover worksheet" })
    map("n", "gsh", require("metals").super_method_hierarchy, { desc = "metals.super method heierarchy" })
    map("n", "gsm", require("metals").goto_super_method, { desc = "metals.go to super method" })
  end,
}
