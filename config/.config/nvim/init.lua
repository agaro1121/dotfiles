-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("user.options")
require("user.keybinds")
require("user.lsp-keybinds")

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "user.plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true, notify = false },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    -- get a notification when changes are found
    notify = false,
  }
})


-- colorschme and fixing highlights
local function swap_fg_with_bg_and_set_white(group)
  -- Resolve links and get the effective highlight
  local hl = vim.api.nvim_get_hl(0, { name = group, link = false })

  if not hl or not hl.bg then
    vim.notify(
      ("Highlight group '%s' has no guibg"):format(group),
      vim.log.levels.WARN
    )
    return
  end

  vim.api.nvim_set_hl(0, "VirtualTextError", {
    fg = 0xFF0000 -- explicit white (more reliable than "White")
  })

  vim.api.nvim_set_hl(0, group, {
    fg = hl.bg,     -- numeric color is OK
    bg = 0xFFFFFF, -- explicit white (more reliable than "White")
  })
end

-- must be called in this order
vim.cmd.colorscheme('catppuccin')
swap_fg_with_bg_and_set_white("Visual")
