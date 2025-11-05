require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
map("n", "<leader>pc", "<cmd> !pnpm tsc --noEmit <cr>", { desc = "Typescript Check" })
map("n", "<leader>rz", "<cmd> !rails zeitwerk:check <cr>", { desc = "Check Rails Zeitwerk" })
map("n", "<leader>rr", "<cmd> !bundle exec annotate --models --exclude tests,fixtures,factories,serializers <cr>",
  { desc = "Generate Model Schema" })

map("n", "gp", "<cmd> lua require('goto-preview').goto_preview_definition() <cr>", { desc = "Typescript Check" })
map("n", "fr", "<cmd> lua require('spectre').toggle() <cr>", { desc = "Typescript Check" })
map("n", "fc", "<cmd> lua require('spectre').open_visual({select_word=true}) <cr>", { desc = "Find Current Word" })
map("n", "ca", "<cmd> lua vim.lsp.buf.code_action() <cr>", { desc = "Code Action" })
map("n", "<leader>lr", "<cmd> LspRestart <cr>", { desc = "Restart LSP" })
map("n", "<leader>cr", "<cmd> Cppath <cr>", { desc = "Copy File Relative Path" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
local nomap = vim.keymap.del

-- nomap("i", "jk")
