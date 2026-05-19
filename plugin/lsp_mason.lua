local utils = require("core.utils")
local gh = utils.gh
local icons = require("resources.icons")
local map = vim.keymap.set

vim.pack.add({
  { src = gh("mason-org/mason.nvim") },
  { src = gh("mason-org/mason-lspconfig.nvim") },
  { src = gh("WhoIsSethDaniel/mason-tool-installer.nvim") },
})

local config_mason  = {}
local config_mason_lspconfig  = {}
local config_mason_tool_installer  = {}

require("mason").setup( config_mason )
require("mason-lspconfig").setup( config_mason_lspconfig )
require("mason-tool-installer").setup( config_mason_tool_installer )
