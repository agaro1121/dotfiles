return {
  'lukas-reineke/indent-blankline.nvim',
  event = 'VeryLazy',
  main = 'ibl',
  config = function()
    vim.opt.list = true -- shows <TAB> and <EOL> characters
    require('ibl').setup({
      enabled = false,
      scope = {
        enabled = false
      },
      whitespace = {
        remove_blankline_trail = false
      }
    })
    -- Commands
    -- https://github.com/lukas-reineke/indent-blankline.nvim/blob/005b56001b2cb30bfa61b7986bc50657816ba4ba/after/plugin/commands.lua
    -- use `IBLToggle` to enable/disable plugin
  end
}
