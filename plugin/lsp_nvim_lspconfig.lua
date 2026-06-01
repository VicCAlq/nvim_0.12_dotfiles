local utils = require("core.utils")
local gh = utils.gh

vim.pack.add({
  { src = gh("neovim/nvim-lspconfig") },
  { src = gh("j-hui/fidget.nvim") },
})

vim.lsp.config('sqlls', {
  cmd = { 'sql-language-server', 'up', '--method', 'stdio' },
  filetypes = { 'sql', 'mysql' },
  root_markers = { '.sqllsrc.json' },
  settings = {
    connections = {
      name = "*",
      adapter = "sqlite3",
    }
  }
})

vim.lsp.enable({
  'lua_ls',
  'jq-lsp',
  'json-lsp',
  'denols',
  'rust_analyzer',
  'typescript-language-server',
  'gopls',
  'html',
  'cssls',
  'bashls',
  'awk_ls',
  'fish_lsp',
  'csharp_ls',
  'nginx_language_server',
  'pyright',
  'yaml-language-server',
  'sqlls',
  'postgres_lsp',
})
