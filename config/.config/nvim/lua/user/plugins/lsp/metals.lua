return {
  "scalameta/nvim-metals",
  dependencies = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap", "SmiteshP/nvim-navic" },
  config = function()
    vim.opt_global.shortmess:remove("F") --	don't give the file info when editing a file
    vim.opt_global.shortmess:append("c") --	don't give |ins-completion-menu| messages; for		*shm-c*

    local api = vim.api
    local metals = require("metals")

    local metals_config = metals.bare_config()

    metals_config.settings = {
      showImplicitArguments = true,
      showInferredType = true,
      superMethodLensesEnabled = true,
      showImplicitConversionsAndClasses = true,
    }

    -- *READ THIS*
    -- I *highly* recommend setting statusBarProvider to true, however if you do,
    -- you *have* to have a setting to display this in your statusline or else
    -- you'll not see any messages from metals. There is more info in the help
    -- docs about this
    metals_config.init_options.statusBarProvider = "on"

    local lsp_utils = require("lsp_utils")
    metals_config.capabilities = lsp_utils.capabilities(require("cmp_nvim_lsp"))

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

    metals_config.on_attach = lsp_utils.on_attach(
      require("nvim-navic"),
      require("telescope.builtin"),
      metals.setup_dap)

    -- Autocmd that will actually be in charging of starting the whole thing
    local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })

    api.nvim_create_autocmd("FileType", {
      -- NOTE: You may or may not want java included here. You will need it if you
      -- want basic Java support but it may also conflict if you are using
      -- something like nvim-jdtls which also works on a java filetype autocmd.
      pattern = { "scala", "sbt", "java" },
      callback = function()
        metals.initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })

    map("n", "<leader>mc", require("telescope").extensions.metals.commands)
    map("n", "<leader>ws", require("metals").hover_worksheet)
  end,
}
