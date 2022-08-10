local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "sumneko_lua", "hls" }

for _, lsp in ipairs(servers) do
  local opts = {}
  if lsp == "sumneko_lua" then
    opts = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim", "use" },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = { enable = false },
        },
      },
    }
  end
  -- require("lspconfig").vimls.setup{
  -- }

  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = opts,
  }
end
