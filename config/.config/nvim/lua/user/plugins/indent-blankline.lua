-- vim.opt.list = true

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    vim.opt.list = true
    require("ibl").setup({
      scope = {
        enabled = false
      },
      whitespace = {
        remove_blankline_trail = false
      },
      -- show_trailing_blankline_indent = false,
      -- space_char_blankline = " ",
    })
  end,
}
