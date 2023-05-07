-- vim.opt.list = true

return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    vim.opt.list = true
    require("indent_blankline").setup({
      show_trailing_blankline_indent = false,
      space_char_blankline = " ",
    })
  end,
}
