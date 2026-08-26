local lazy = require "lazy"
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
        timeout = 4000
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
      },
      current_line_blame_formatter = '🤨 <author>, <author_time:%R> - <summary>',
    }
  },
  -- {
  --   'echasnovski/mini.animate',
  --   lazy = false,
  --   version = '*',
  -- },
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
    lazy = false,
    opts = {},
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = false,
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more custom stuff here
            })
          }
        }
      })
      -- Load the extension after setting it up
      require("telescope").load_extension("ui-select")
    end,
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    lazy = false,
    build = 'make',
    config = function()
      require("telescope").setup({
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          }
        }
      })
      -- Load the extension after setting it up
      require("telescope").load_extension("fzf")
    end,
  },
  {
    "sphamba/smear-cursor.nvim",
    lazy = false,
    opts = {
      stiffness = 0.8,                      -- 0.6      [0, 1]
      trailing_stiffness = 0.5,             -- 0.45     [0, 1]
      stiffness_insert_mode = 0.7,          -- 0.5      [0, 1]
      trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
      damping = 0.95,                       -- 0.85     [0, 1]
      damping_insert_mode = 0.95,           -- 0.9      [0, 1]
      distance_stop_animating = 0.5,        -- 0.1      > 0
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      enable = true,
      max_lines = 3,
      min_window_height = 20,
      multiline_threshold = 5,
      trim_scope = "outer",
      mode = "cursor",
    },
  },
}
