local utils = require("core.utils")
local gh = utils.gh
local icons = require("resources.icons")
local map = vim.keymap.set

vim.pack.add({
  { src = gh("lewis6991/gitsigns.nvim") },
})

local config  = {
  signs = {
    add = { text = icons.GitFrameAdd },
    change = { text = icons.GitFrameChange },
    delete = { text = icons.GitFrameDelete },
    topdelete = { text = icons.Trash },
    changedelete = { text = icons.Replace },
  },
  signs_staged = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  },
}

require("gitblame").setup( config )
