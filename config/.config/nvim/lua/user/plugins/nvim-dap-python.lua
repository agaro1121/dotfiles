return {
  "mfussenegger/nvim-dap-python",
  lazy = true,
  dependencies = { "mfussenegger/nvim-dap" },
  config = function()
    local dapPython = require("dap-python")

    dapPython.setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
    dapPython.test_runner = "pytest"
    map("n", "<leader>dm", function()
      require('dap-python').test_method({ config = { justMyCode = false } })
    end, {desc = "dap.python run test"})

    -- NONE OF THIS WORKS!

    -- local dap = require("dap")

    -- table.insert(dap.configurations.python, {
    --   type = 'python',
    --   request = 'test',
    --   justMyCode = false,
    --   name = 'My custom launch configuration',
    --   program = '${file}',
    -- })

    -- local configurations = dap.configurations.python
    -- for _, configuration in pairs(configurations) do
    --   configuration.justMyCode = false
    -- end

    -- dap.configurations.python = {
    --   {
    --     name = "Debug Unit Test",
    --     type = "python",
    --     request = "test",
    --     justMyCode = false,
    --   },
    --   {
    --     name = "RunProgram",
    --     type = "python",
    --     request = "launch",
    --     program = "${file}",
    --     justMyCode = false,
    --   },
    -- }

    -- NONE OF THIS WORKS!

  end
}
