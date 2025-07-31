return {
  'mcauley-penney/visual-whitespace.nvim',
  keys = {
    {
      mode = { "n", "v" },
      "<leader>tw",
        function()
          require("visual-whitespace").toggle()
        end,
        desc = "visual-whitespace.toggle"
    },
    config = true,
    event = "ModeChanged *:[vV\22]", -- optionally, lazy load on entering visual mode
    opts = {
      enabled = false
    }
  }
}
