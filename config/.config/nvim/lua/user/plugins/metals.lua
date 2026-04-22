vim.pack.add({
  'https://github.com/j-hui/fidget.nvim',
  'https://github.com/scalameta/nvim-metals'
})
require("fidget").setup()

local metals = require("metals")
local metals_config = metals.bare_config()
metals_config.settings = {
  testUserInterface = "Test Explorer",
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
  metals.setup_dap()
end

local nvim_metals_group = vim.api.nvim_create_augroup('nvim-metals', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    metals.initialize_or_attach(metals_config)
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

vim.keymap.set('n', '<leader>mc', metals.commands, { desc = 'metals: menu' })
vim.keymap.set('n', '<leader>mtc', metals.select_test_case, { desc = 'metals: select test case' })
vim.keymap.set('n', '<leader>mts', metals.select_test_case, { desc = 'metals: select test suite' })
