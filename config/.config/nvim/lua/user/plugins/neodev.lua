return {
  "folke/neodev.nvim",
  ft = { "lua", "vim" },
  opts = {},
  config = function()
    require("neodev").setup({
      library = { plugins = { "nvim-dap-ui" }, types = true },
    })
  end
}
