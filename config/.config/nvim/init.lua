local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("user.options")
require("user.keybinds")
require("lazy").setup("user.plugins")
require("user.colorscheme")

vim.cmd('source ~/.config/nvim/vimrc.vim')

function dump(t, indent, done)
    done = done or {}
    indent = indent or 0

    done[t] = true

    for key, value in pairs(t) do
        print(string.rep("\t", indent))

        if type(value) == "table" and not done[value] then
            done[value] = true
            print(key, ":\n")

            dump(value, indent + 2, done)
            done[value] = nil
        else
            print(key, "\t=\t", value, "\n")
        end
    end
end
