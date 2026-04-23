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
--     "%s %s",
--     diagnostic_signs[diagnostic.severity],
--     diagnostic.message
--   )
-- end
vim.opt.title = true
vim.opt.titlestring = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
vim.opt.relativenumber = true

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false
  -- virtual_lines = {
  --   format = diagnostic_format,
  -- },
  -- underline = true
})

vim.lsp.inlay_hint.enable(false)

-- local animate = require('mini.animate')
-- animate.setup(
--   {
--     scroll = {
--       enable = false,
--     },
--     cursor = {
--       enable = true,
--       timing = animate.gen_timing.exponential({ duration = 200, unit = 'total' }),
--       path = animate.gen_path.angle(),
--     },
--     resize = {
--       enable = false,
--     },
--     open = {
--       enable = false,
--     },
--     close = {
--       enable = false,
--     }
--   }
-- )

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

vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/snippets"

-- require("nvim-treesitter.configs").setup {
--   ensure_installed = { "ruby" },
--
--   highlight = {
--     enable = true,
--   },
--
--   textobjects = {
--     select = {
--       enable = true,
--       lookahead = true,
--
--       keymaps = {
--         ["ib"] = "@block.inner",
--         ["ab"] = "@block.outer",
--
--         ["if"] = "@function.inner",
--         ["af"] = "@function.outer",
--       },
--     },
--   },
-- }

vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {
  desc = "Show LSP Info",
})

vim.api.nvim_create_user_command("LspLog", function(_)
  local state_path = vim.fn.stdpath("state")
  local log_path = vim.fs.joinpath(state_path, "lsp.log")

  vim.cmd(string.format("edit %s", log_path))
end, {
  desc = "Show LSP log",
})

vim.api.nvim_create_user_command("LspRestart", "lsp restart", {
  desc = "Restart LSP",
})

vim.api.nvim_set_hl(0, "GitsignsCurrentLineBlame", { italic = true })
