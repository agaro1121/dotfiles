return {
  "mistricky/codesnap.nvim",
  event = "VeryLazy",
  build = "make",
  config = function()
    require("codesnap").setup {
      bg_theme = "default",
      watermark = "",
      save_path = "."
    }
  end
}
