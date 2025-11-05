require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- local diagnostic_signs = {
--   [vim.diagnostic.severity.ERROR] = "",
--   [vim.diagnostic.severity.WARN] = "",
--   [vim.diagnostic.severity.INFO] = "",
--   [vim.diagnostic.severity.HINT] = "󰌵",
-- }
--
-- local function diagnostic_format(diagnostic)
--   return string.format(
--     "%s %s (%s): %s",
--     diagnostic_signs[diagnostic.severity],
--     diagnostic.source,
--     diagnostic.code,
--     diagnostic.message
--   )
-- end

vim.opt.relativenumber = true

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
})

vim.lsp.inlay_hint.enable(true)

require('mini.animate').setup(
  {
    scroll = {
      enable = false,
    },
    -- cursor = {
    --   enable = false,
    -- },
    resize = {
      enable = false,
    },
    open = {
      enable = false,
    },
    close = {
      enable = false,
    }
  }
)

vim.api.nvim_create_user_command("Cppath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

-- FOLDING
-- vim.o.foldenable = true
-- vim.o.foldlevel = 99
-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.o.foldtext = ""
-- vim.opt.foldcolumn = "0"
-- vim.opt.fillchars:append({ fold = " " })
