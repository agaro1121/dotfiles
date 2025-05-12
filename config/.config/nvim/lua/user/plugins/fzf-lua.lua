return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>ff",  [[ <cmd>lua require("fzf-lua").files()<CR> ]],      desc = "fzf-lua.find files" },
    { "<leader>fg",  [[ <cmd>lua require("fzf-lua").git_files()<CR> ]],     desc = "fzf-lua.git files" },
    { "<leader>lg",  [[ <cmd>lua require("fzf-lua").grep_project()<CR> ]],     desc = "fzf-lua.live grep" },
    { "<leader>lgs", [[ <cmd>lua require("fzf-lua").grep_cword()<CR> ]],    desc = "fzf-lua.grep string" },
    { "<leader>bs",  [[ <cmd>lua require("fzf-lua").buffers()<CR> ]],       desc = "fzf-lua.buffers" },
    { "<leader>sp",  [[ <cmd>lua require("fzf-lua").spell_suggest()<CR> ]], desc = "fzf-lua.spell suggest" },
    { "<leader>fb",  [[ <cmd>lua require("fzf-lua").lgrep_curbuf()<CR> ]],  desc = "fzf-lua.fuzzy find in current buffer" },
    { "<leader>tk",  [[ <cmd>lua require("fzf-lua").keymaps()<CR> ]],       desc = "fzf-lua.show keymaps" },
  },
  opts = {
    keymap = {
      fzf = {
        ["ctrl-q"] = "select-all+accept",
      },
    },
  }
}
