return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig"
    },
    config = function()
        require("mason-lspconfig").setup {
            automatic_enable = {
                "lua_ls", "smithy_ls"
            }
        }
    end
}
