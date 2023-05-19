return {
  {
    "m4xshen/autoclose.nvim",
    config = function()
      require("autoclose").setup({
        keys = {
          ["'"] = { escape = true, close = false, pair = "''"}
        }
      })
    end,
  }
}
