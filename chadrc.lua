-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "tomorrow_night",
}

local pluginConfs = require "custom.plugins.configs"

M.plugins = {
  user = require "custom.plugins",

  override = {
    ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,

    ["nvim-treesitter/nvim-treesitter"] = {
      ensure_installed = {
        "haskell",
        "typescript",
      },
    },

    ["nvim-telescope/telescope.nvim"] = {
      extensions_list = { "projects", "themes", "hoogle" },
    },
  },

  remove = {
    "natecraddock/workspaces.nvim",
    "stevearc/aerial.nvim",
    "folke/trouble.nvim",
  },
}

M.mappings = {
  telescope = {
    n = {
      ["<leader>fs"] = { "<cmd> :Telescope lsp_dynamic_workspace_symbols <CR>", "  find dynamic symbol" },
      ["<leader>fr"] = { "<cmd> :Telescope lsp_references <CR>", " referenses" },
      ["<leader>fd"] = { "<cmd> :Telescope diagnostics <CR>", "  diagnostics" },
      ["<leader>ld"] = { "<cmd> lua vim.lsp.diagnostics.show_position_diagnostics() <CR>", "  diagnostics" },
      ["<leader>tt"] = { "<cmd> :Telescope <CR>", "  diagnostics" },
      ["<leader>sy"] = { "<cmd> :SymbolsOutlineOpen <CR>", "  diagnostics" },
      ["]]]"] = { "<cmd> :Bdelete <CR>", "窱 delete buffer (BDelete)" },
    },
  },
}

return M
