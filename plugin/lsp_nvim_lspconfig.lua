local utils = require("core.utils")
local gh = utils.gh
-- local icons = require("resources.icons")
-- local map = vim.keymap.set

vim.pack.add({
  { src = gh("neovim/nvim-lspconfig") },
  { src = gh("j-hui/fidget.nvim") },
})

-- local config  = {}

-- require("lspsaga").setup( config )
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
