return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>ff",  function() require("fzf-lua").files() end,         desc = "fzf-lua.find files" },
    { "<leader>fg",  function() require("fzf-lua").git_files() end,     desc = "fzf-lua.git files" },
    { "<leader>lg",  function() require("fzf-lua").grep_project() end,  desc = "fzf-lua.live grep" },
    { "<leader>lgs", function() require("fzf-lua").grep_cword() end,    desc = "fzf-lua.grep string" },
    { "<leader>lgv", function() require("fzf-lua").grep_visual() end,   desc = "fzf-lua.grep string",                 mode = "v" },
    { "<leader>lgb",  function() require("fzf-lua").lgrep_curbuf() end,  desc = "fzf-lua.fuzzy find in current buffer" },
    { "<leader>bs",  function() require("fzf-lua").buffers() end,       desc = "fzf-lua.buffers" },
    { "<leader>sp",  function() require("fzf-lua").spell_suggest() end, desc = "fzf-lua.spell suggest" },
    { "<leader>tk",  function() require("fzf-lua").keymaps() end,       desc = "fzf-lua.show keymaps" },
  },
  config = function()
    local fzf = require("fzf-lua")
    fzf.register_ui_select() -- use fzf-lua as neovim's `vim.ui.select`
    fzf.setup {
      keymap = {
        fzf = {
          ["ctrl-q"] = "select-all+accept",
        },
      },
    }
  end
}
