require("nvim-treesitter-textobjects").setup {
  select = {
    lookahead = true,
  },
}

local select = require "nvim-treesitter-textobjects.select"

local map = vim.keymap.set

map({ "x", "o" }, "ab", function()
  select.select_textobject("@block.outer", "textobjects")
end, { desc = "Select around block" })

map({ "x", "o" }, "ib", function()
  select.select_textobject("@block.inner", "textobjects")
end, { desc = "Select inside block" })

map({ "x", "o" }, "af", function()
  select.select_textobject("@function.outer", "textobjects")
end, { desc = "Select around function" })

map({ "x", "o" }, "if", function()
  select.select_textobject("@function.inner", "textobjects")
end, { desc = "Select inside function" })

map({ "x", "o" }, "ac", function()
  select.select_textobject("@class.outer", "textobjects")
end, { desc = "Select around class" })

map({ "x", "o" }, "ic", function()
  select.select_textobject("@class.inner", "textobjects")
end, { desc = "Select inside class" })
