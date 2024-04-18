return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup({
          ignore = "^$"
        })
        local ft = require("Comment.ft")
        ft.sbt = {"//%s", "/*%s*/"}
        ft.smithy = {"//%s", "/*%s*/"}
        ft.tf = {"#%s", "/*%s*/"}
    end
}
