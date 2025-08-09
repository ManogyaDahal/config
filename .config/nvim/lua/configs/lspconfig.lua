require("nvchad.configs.lspconfig").defaults()

-- setting local borders
local border = "single"

local orig_util = vim.lsp.util
local _open_floating_preview = orig_util.open_floating_preview

orig_util.open_floating_preview = function(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return _open_floating_preview(contents, syntax, opts, ...)
end
-- Optional: Diagnostics floating window border
vim.diagnostic.config({
  float = { border = border },
})

local servers = {
  "rust_analyzer",
  "html",
  "cssls",
  "pylsp",
  "ts_ls",
  "lua_ls",
  "clangd",
  "bashls",
  "phpactor",
  "texlab",
  "gopls",
  "jdtls",
  "yamlls",
  "tailwindcss",
  "asm_lsp",
  "tinymist"
}

vim.lsp.enable(servers)
