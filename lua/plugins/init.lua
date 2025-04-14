return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua", "html", "css", "tsx", "typescript", "ruby"
      },
    },
  },
  {
    "folke/which-key.nvim",
    lazy = false
  },
  {
    "folke/ts-comments.nvim",
    opts = {},
    -- lazy = false,
    event = "VeryLazy",
    enabled = true,
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      view = {
        width = 50,
      },
      git = {
        ignore = false,
      },
      renderer = {
        icons = {
          git_placement = "after"
        }
      }
    }
  },
  {
    "rmagatti/goto-preview",
    dependencies = { "rmagatti/logger.nvim" },
    event = "BufEnter",
    config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
  },
  {
    'nvim-pack/nvim-spectre',
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  -- {
  --   'windwp/nvim-autopairs',
  --   event = "InsertEnter",
  --   config = true,
  --   lazy = true
  -- },
  {
    'windwp/nvim-ts-autotag',
    lazy = false,
    opts = {}
  },
  -- {
  --   "github/copilot.vim",
  --   lazy = false
  -- }
}
