return {
    "Eutrius/Otree.nvim",
    lazy = false,
    dependencies = {
        "stevearc/oil.nvim",
        -- { "echasnovski/mini.icons", opts = {} },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("Otree").setup({
          win_size = 40,
          use_default_keymaps = false,
          keymaps = {
            ["<CR>"] = "actions.select",
            ["l"] = "actions.select",
            ["h"] = "actions.close_dir",
            ["q"] = "actions.close_win",
            ["<M-h>"] = "actions.goto_home_dir",
            ["cd"] = "actions.change_home_dir",
            ["L"] = "actions.open_dirs",
            ["H"] = "actions.close_dirs",
            ["o"] = "actions.oil_dir",
            ["O"] = "actions.oil_into_dir",
            ["t"] = "actions.open_tab",
            ["v"] = "actions.open_vsplit",
            ["s"] = "actions.open_split",
            ["."] = "actions.toggle_hidden",
            ["i"] = "actions.toggle_ignore",
            ["r"] = "actions.refresh",
            ["f"] = "actions.focus_file",
            ["?"] = "actions.open_help",
          },
        })
        map("n","<leader>e", ":Otree<cr>", {desc = "nvimtree.Toggele"})
    end
}
