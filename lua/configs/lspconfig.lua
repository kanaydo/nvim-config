-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- local lspconfig = vim.lsp.config

-- EXAMPLE
local servers = {
  "html",
  "cssls",
  "ts_ls",
  "ruby_lsp",
  -- "solargraph",
  "tailwindcss",
  "gopls",
  -- "eslint"
}
vim.lsp.enable(servers)

-- local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
-- for _, lsp in ipairs(servers) do
--   lspconfig(lsp, {
--     on_attach = nvlsp.on_attach,
--     on_init = nvlsp.on_init,
--     capabilities = nvlsp.capabilities,
--   })
--   vim.lsp.enable(lsp)
-- end

-- lspconfig('ruby_lsp', {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
--   init_options = {
--     enabledFeatures = {
--       codeActions = true,
--       codeLens = true,
--       completion = true,
--       definition = true,
--       diagnostics = true,
--       documentHighlights = true,
--       documentLink = true,
--       documentSymbols = true,
--       foldingRanges = true,
--       formatting = true,
--       hover = true,
--       inlayHint = true,
--       onTypeFormatting = true,
--       selectionRanges = true,
--       semanticHighlighting = true,
--       signatureHelp = true,
--       typeHierarchy = true,
--       workspaceSymbol = true
--     },
--     featuresConfiguration = {
--       inlayHint = {
--         enableAll = false,
--         implicitHashValue = false,
--         implicitRescue = false
--       }
--     },
--     formatter = 'rubocop',
--     experimentalFeaturesEnabled = false
--   }
-- })
-- vim.lsp.enable('ruby_lsp')
--
-- -- configuring single server, example: typescript
-- lspconfig('ts_ls', {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
--   settings = {
--     javascript = {
--       inlayHints = {
--         includeInlayEnumMemberValueHints = false,
--         includeInlayFunctionLikeReturnTypeHints = true,
--         includeInlayFunctionParameterTypeHints = true,
--         includeInlayParameterNameHints = "literals", -- 'none' | 'literals' | 'all';
--         includeInlayParameterNameHintsWhenArgumentMatchesName = true,
--         includeInlayPropertyDeclarationTypeHints = false,
--         includeInlayVariableTypeHints = false,
--       },
--     },
--
--     typescript = {
--       inlayHints = {
--         includeInlayEnumMemberValueHints = false,
--         includeInlayFunctionLikeReturnTypeHints = true,
--         includeInlayFunctionParameterTypeHints = true,
--         includeInlayParameterNameHints = "literals", -- 'none' | 'literals' | 'all';
--         includeInlayParameterNameHintsWhenArgumentMatchesName = true,
--         includeInlayPropertyDeclarationTypeHints = false,
--         includeInlayVariableTypeHints = false,
--       },
--     },
--   }
-- })
-- vim.lsp.enable('ts_ls')
