return {
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["folke/which-key.nvim"] = {
    disable = false,
  },

  ["famiu/bufdelete.nvim"] = {},

  ["goolord/alpha-nvim"] = {
    disable = false,
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ["kylechui/nvim-surround"] = {
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  -- ["xiyaowong/virtcolumn.nvim"] = {},
  ["lukas-reineke/virt-column.nvim"] = {
    config = function()
      require("virt-column").setup {
        -- virtcolumn = "79",
      }
    end,
  },

  ["ahmedkhalf/project.nvim"] = {
    config = function()
      require("project_nvim").setup {
        show_hidden = true,
        patterns = {
          ".git",
          "_darcs",
          ".hg",
          ".bzr",
          ".svn",
          "Makefile",
          "package.json",
          ".cabal",
          "package.yaml",
          "stack.yaml",
        },
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },

  ["rmagatti/auto-session"] = {
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Lab", "~/Downloads", "/" },
      }
    end,
  },

  ["luc-tielen/telescope_hoogle"] = {},

  ["simrat39/symbols-outline.nvim"] = {},

  ["TimUntersberger/neogit"] = {
    requires = "nvim-lua/plenary.nvim",
  },

  ["glepnir/lspsaga.nvim"] = {
    branch = "main",
    config = function()
      local saga = require "lspsaga"

      saga.init_lsp_saga {
        -- your configuration
      }
    end,
  },

  ["tzachar/cmp-tabnine"] = {
    after = "nvim-cmp",
    run = "./install.sh",
  },

}
