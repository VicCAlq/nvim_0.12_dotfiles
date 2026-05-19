local utils = require("core.utils")
local gh = utils.gh
local icons = require("resources.icons")
local map = vim.keymap.set

vim.pack.add({
  { src = gh("f-person/git-blame.nvim") },
})

local config  = {
  enabled = true,
  message_template = " <author> • <committer> • <date> • <<sha>> • <summary> ", -- template for the blame message, check the Message template section for more options
  date_format = "%d-%m-%Y %H:%M:%S", -- template for the date, check Date format section for more options
  virtual_text_column = 1,  -- virtual text start column, check Start virtual text at column section for more options
}

require("gitblame").setup( config )
