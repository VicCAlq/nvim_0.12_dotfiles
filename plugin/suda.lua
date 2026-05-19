local utils = require("core.utils")
local gh = utils.gh
local icons = require("resources.icons")
local map = vim.keymap.set

vim.pack.add({
  { src = gh("lambdalisue/suda.vim") },
})

-- local config  = {}

-- require("suda").setup()
