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
      ["<leader>fx"] = {
        "<cmd> :lua require('telescope.builtin').find_files { no_ignore = true } <CR>",
        "  find files (no ignore)",
      },
      ["<leader>fs"] = { "<cmd> :Telescope lsp_dynamic_workspace_symbols <CR>", "  find dynamic symbol" },
      ["<leader>fr"] = { "<cmd> :Telescope lsp_references <CR>", " referenses" },
      ["<leader>fd"] = { "<cmd> :Telescope diagnostics <CR>", "  diagnostics" },
      ["<leader>ld"] = { "<cmd> lua vim.lsp.diagnostics.show_position_diagnostics() <CR>", "  diagnostics" },
      ["<leader>tt"] = { "<cmd> :Telescope <CR>", "  diagnostics" },
      ["<leader>tt"] = { "<cmd> :Telescope <CR>", "  Telescope" },
      ["<leader>sy"] = { "<cmd> :SymbolsOutlineOpen <CR>", "  diagnostics" },
      ["<leader>x"] = { "<cmd> :Bdelete <CR>", "窱 delete buffer (BDelete)" },
      ["<leader>w"] = { "<cmd> :lua require('nvim-window').pick()<CR>", " switch window" },
      ["<leader>ca"] = { "<cmd> :Lspsaga code_action<CR>", " switch window" },
    },
  },
}

return M
