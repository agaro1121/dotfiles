return {
    "Eutrius/Otree.nvim",
    lazy = false,
    dependencies = {
        "stevearc/oil.nvim",
        -- { "echasnovski/mini.icons", opts = {} },
        -- "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("Otree").setup({
          win_size = 40
        })
        map("n","<leader>e", ":Otree<cr>", {desc = "nvimtree.Toggele"})
    end
}
