local utils = require("core.utils")
local gh = utils.gh
local icons = require("resources.icons")
local map = vim.keymap.set

vim.pack.add({
  { src = gh("windwp/nvim-autopairs") },
})

local config  = {}

require("nvim-autopairs").setup( config )
