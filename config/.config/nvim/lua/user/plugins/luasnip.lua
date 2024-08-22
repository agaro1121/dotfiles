return {
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  dependencies = { "saadparwaiz1/cmp_luasnip" },
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  config = function()
    local ls = require("luasnip")

    map("i",       "<C-K>", function() ls.expand() end, {desc = "luasnip.expand"})
    map({"i","s"}, "<C-L>", function() ls.jump(1)  end, {desc = "luasnip.next"})
    map({"i","s"}, "<C-H>", function() ls.jump(-1) end, {desc = "luasnip.previous"})

    map({"i","s"}, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, {desc = "luasnip.change choice"})
  end
}

