local M = {}

M.nvimtree = {
  open_on_setup = true,
  open_on_setup_file = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    debounce_delay = 50,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },

  renderer = {
    group_empty = true,
    highlight_git = true,
  },

  view = {
    adaptive_size = false,
    width = 27,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
}

return M
