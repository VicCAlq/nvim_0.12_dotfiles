local utils = require("core.utils")
local gh = utils.gh
local icons = require("resources.icons")
local map = vim.keymap.set

vim.pack.add({
  { src = gh("dstein64/nvim-scrollview") },
})

require("scrollview").setup({})
