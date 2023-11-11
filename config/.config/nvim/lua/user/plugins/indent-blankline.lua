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
    })
  end,
}
