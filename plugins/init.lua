return {
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["famiu/bufdelete.nvim"] = {},

  ["goolord/alpha-nvim"] = {
    disable = false,
  },

  -- ["natecraddock/workspaces.nvim"] = {},

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

  ["folke/trouble.nvim"] = {
    config = function()
      require("trouble").setup {}
    end,
  },

  ["simrat39/symbols-outline.nvim"] = {},
}
