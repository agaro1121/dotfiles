return {
  'scalameta/nvim-metals',
  ft = { 'scala', 'sbt', 'java' },
  opts = function()
    local metals_config = require('metals').bare_config()
    metals_config.settings = {
      inlayHints = {
        -- When this option is enabled, each method that can have inferred types has them displayed either as additional decorations if they are supported by the editor or shown in the hover.
        inferredTypes = { enable = true },
        -- When this option is enabled, each method has an added parameter name next to its arguments displayed either as additional decorations if they are supported by the editor or shown in the hover.
        namedParameters = { enable = true },
        -- When this option is enabled, each method that has by-name parameters has them displayed either as additional '=>' decorations if they are supported by the editor or shown in the hover.
        byNameParameters = { enable = false },
        implicitArguments = { enable = true },
        implicitConversions = { enable = false },
        -- When this option is enabled, each place when a type parameter is applied has it displayed either as additional decorations if they are supported by the editor or shown in the hover.
        typeParameters = { enable = true },
        -- When this option is enabled, each place when a type is inferred in a pattern match has it displayed either as additional decorations if they are supported by the editor or shown in the hover.
        hintsInPatternMatch = { enable = true },
        -- When this option is enabled, each method/attribute call in a multi-line chain will get its own type annotation.
        hintsXRayMode = { enable = true },
        -- When this option is enabled, each method/class/object definition that uses braces syntax, will get a closing label hint next to the closing brace with the name of the definition.
        closingLabels = { enable = true }
      }
    }
    metals_config.init_options.statusBarProvider = 'off'
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
    metals_config.on_attach = function(client, bufnr)
      require('metals').setup_dap()
    end

    return metals_config
  end,
  config = function(self, metals_config)
    local nvim_metals_group = vim.api.nvim_create_augroup('nvim-metals', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = self.ft,
      callback = function()
        require('metals').initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })

    vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
      pattern = { '*.worksheet.sc' },
      callback = function()
        vim.lsp.inlay_hint.enable(true)
      end,
      group = nvim_metals_group,
    })

    vim.keymap.set('n', '<leader>mc', require('metals').commands, { desc = 'metals: menu' })
  end
}
