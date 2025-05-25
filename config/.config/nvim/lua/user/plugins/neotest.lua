return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "stevanmilic/neotest-scala"
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-scala")
      },
      status = {
        enabled = false
      }
    })
    map("n", "<leader>us", require("neotest").summary.toggle, { desc = "neotest.summary" })
    map("n", "<leader>uo", require("neotest").output_panel.toggle, { desc = "neotest.summary" })
    map("n", "<leader>ud", function() require("neotest").run.run({ strategy = "dap" }) end, { desc = "neotest.debug" })
    map("n", "<leader>ur", require("neotest").run.run, { desc = "neotest.run" })
  end
}
