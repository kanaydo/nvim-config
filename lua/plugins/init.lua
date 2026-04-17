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
      filters = {
        custom = { ".next" },
      },
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
  {
    'windwp/nvim-ts-autotag',
    lazy = false,
    opts = {}
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 0,
        ignore_whitespace = true
      }
    }
  },
  {
    'echasnovski/mini.animate',
    lazy = false,
    version = '*',
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    lazy = false,
    -- init = function()
    --   -- Disable entire built-in ftplugin mappings to avoid conflicts.
    --   -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
    --   vim.g.no_plugin_maps = true
    --
    --   -- Or, disable per filetype (add as you like)
    --   -- vim.g.no_python_maps = true
    --   -- vim.g.no_ruby_maps = true
    --   -- vim.g.no_rust_maps = true
    --   -- vim.g.no_go_maps = true
    -- end,
    -- config = function()
    --   -- put your config here
    -- end,
  },
  {
    'stevearc/overseer.nvim',
    ---@module 'overseer'
    ---@type overseer.SetupOpts
    lazy = false,
    opts = {
      form = {
        border = "rounded",
      },
    },
    config = function(_, opts)
      require("overseer").setup(opts)
    end
  }
  -- {
  --   'MeanderingProgrammer/render-markdown.nvim',
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --     'nvim-tree/nvim-web-devicons'
  --   }, -- if you prefer nvim-web-devicons
  --   lazy = false,
  --   ---@module 'render-markdown'
  --   ---@diagnostic disable-next-line: undefined-doc-name
  --   ---@type render.md.UserConfig
  --   opts = {},
  -- },
  -- {
  --   'github/copilot.vim',
  --   lazy = false,
  --   -- opts = {
  --   --   setup = {
  --   --     keymap = {
  --   --       accept = "<C-e>",
  --   --       -- next = "<C-]>",
  --   --       -- prev = "<C-[>",
  --   --     },
  --   --
  --   --   }
  --   -- }
  -- }
}
