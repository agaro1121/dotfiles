return {
  "nvim-treesitter/nvim-treesitter",
  enabled = true,
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup()

    -- auto install
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local filetype = args.match
        local lang = vim.treesitter.language.get_lang(filetype)
        if vim.tbl_contains(require("nvim-treesitter.config").get_available(), lang) then
          require("nvim-treesitter").install(lang):await(function()
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            vim.treesitter.start()
          end)
        end
      end
    })

  end
}
