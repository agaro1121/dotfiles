return {
  "agaro1121/cheatsheet.nvim",
  keys = {
    { "<leader>?", [[:Cheatsheet<CR>]], desc = "cheatsheet" }
  },
  config = function()
    local cs = require("cheatsheet")
    cs.setup({
      telescope_mappings = nil
    })
  end
}

