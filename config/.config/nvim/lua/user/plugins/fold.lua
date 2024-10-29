return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require("statuscol.builtin")
          require("statuscol").setup({
            relculright = true,
            segments = {
              { text = { builtin.foldfunc } },
              { text = { "%s" } },
              { text = { builtin.lnumfunc, " " } },
            },
          })
        end,
      },
    },
    config = function()
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.o.foldcolumn = 'auto:1' -- '0' is not bad
      vim.o.foldlevel = 99        -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      local ufo = require("ufo")

      -- local handler = function(virtText, lnum, endLnum, width, truncate)
      --   local newVirtText = {}
      --   local suffix = (' 󰁂 %d '):format(endLnum - lnum)
      --   local sufWidth = vim.fn.strdisplaywidth(suffix)
      --   local targetWidth = width - sufWidth
      --   local curWidth = 0
      --   for _, chunk in ipairs(virtText) do
      --     local chunkText = chunk[1]
      --     local chunkWidth = vim.fn.strdisplaywidth(chunkText)
      --     if targetWidth > curWidth + chunkWidth then
      --       table.insert(newVirtText, chunk)
      --     else
      --       chunkText = truncate(chunkText, targetWidth - curWidth)
      --       local hlGroup = chunk[2]
      --       table.insert(newVirtText, { chunkText, hlGroup })
      --       chunkWidth = vim.fn.strdisplaywidth(chunkText)
      --       -- str width returned from truncate() may less than 2nd argument, need padding
      --       if curWidth + chunkWidth < targetWidth then
      --         suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
      --       end
      --       break
      --     end
      --     curWidth = curWidth + chunkWidth
      --   end
      --   table.insert(newVirtText, { suffix, 'MoreMsg' })
      --   return newVirtText
      -- end

      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local totalLines = vim.api.nvim_buf_line_count(0)
        local foldedLines = endLnum - lnum
        local suffix = ("   %d %d%%"):format(foldedLines, foldedLines / totalLines * 100)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        local rAlignAppndx =
            math.max(math.min(vim.opt.textwidth["_value"], width - 1) - curWidth - sufWidth, 0)
        suffix = (" "):rep(rAlignAppndx) .. suffix
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end


      ufo.setup({
        fold_virt_text_handler = handler
      })

      map("n", "zO", ufo.openAllFolds, { desc = "ufo.open all folds" })
      map("n", "zC", ufo.closeAllFolds, { desc = "ufo.close all folds" })
      map("n", "zh", ufo.peekFoldedLinesUnderCursor, { desc = "ufo.peak folded line" })
      map("n", "zn", require("ufo.action").goNextClosedFold, { desc = "ufo.go to next closed fold" })
      map("n", "zp", require("ufo.action").goPreviousClosedFold, { desc = "ufo.go to previous closed fold" })
      --
    end,
  },
  -- Folding preview, by default h and l keys are used.
  -- On first press of h key, when cursor is on a closed fold, the preview will be shown.
  -- On second press the preview will be closed and fold will be opened.
  -- When preview is opened, the l key will close it and open fold. In all other cases these keys will work as usual.
  -- https://github.com/kevinhwang91/nvim-ufo/issues/4#issuecomment-1512772530
  -- { "anuvyklack/fold-preview.nvim", dependencies = "anuvyklack/keymap-amend.nvim", config = true },
}
