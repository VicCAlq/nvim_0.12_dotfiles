local utils = require("core.utils")
local gh = utils.gh
local icons = require("resources.icons")
local map = vim.keymap.set

vim.pack.add({
  { src = gh("nvimtools/none-ls.nvim") },
  { src = gh("nvim-lua/plenary.nvim") },
  { src = gh("nvimtools/none-ls-extras.nvim") },
  { src = gh("jay-babu/mason-null-ls.nvim") },
})

local config  = {}

require("null-ls").setup( config )
require("mason-null-ls").setup({
  handlers = {},
})
