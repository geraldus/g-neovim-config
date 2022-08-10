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
  },
}

function Duck(f)
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))
  local current_line = vim.api.nvim_get_current_line()
  local loc, x, y, lnum, w, z, term, a, b = string.find(current_line, "(.+):(%d+): (.+)")
  print("Found: ", term, " in ", loc, " at ", lnum, "line")
  -- if term then
  --   print('Found: ', term, ' in ', loc, ' at ', lnum, 'line')
  -- else
  --   print('o_O', current_line)
  -- end
  -- print("! " .. r .. ", " .. c)
  local content = vim.api.nvim_buf_get_text(0, 0, 0, 0, 5, {})
  for _, l in ipairs(content) do
    print(">>" .. vim.inspect(l))
  end
  require("telescope.builtin").find_files { search_file = content[0] }
end

M.mappings = {
  telescope = {
    n = {
      ["<leader>xx"] = { "<cmd> lua Duck() <CR>", "  find dynamic symbol" },
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
