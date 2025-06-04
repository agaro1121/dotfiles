return {
  "nvim-neotest/neotest",
  -- dir = "~/git/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    { "agaro1121/neotest-scala"--[[ , dir = "~/git/neotest-scala" ]] },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-scala")({
          -- Runner to use. Will use bloop by default.
          -- Can be a function to return dynamic value.
          -- For backwards compatibility, it also tries to read the vim-test scala config.
          -- Possibly values bloop|sbt.
          runner = "bloop",
          -- Test framework to use. Will use utest by default.
          -- Can be a function to return dynamic value.
          -- Possibly values utest|munit|scalatest.
          framework = "munit",
        }),
        status = {
          enabled = false
        }
      }
    })
    map("n", "<leader>us", require("neotest").summary.toggle, { desc = "neotest.summary" })
    map("n", "<leader>uo", require("neotest").output_panel.toggle, { desc = "neotest.output_panel" })
    map("n", "<leader>ud", function() require("neotest").run.run({ strategy = "dap" }) end, { desc = "neotest.debug test" })
    map("n", "<leader>ur", require("neotest").run.run, { desc = "neotest.run test" })
  end
}
