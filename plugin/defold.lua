local utils = require("core.utils")
local gh = utils.gh
local icons = require("resources.icons")
local map = vim.keymap.set

vim.pack.add({
  { src = gh("monkoose/DoNe") },
})

-- require("done").setup({})

map("n", "<F5>", "<Cmd>DoNe build<CR>")
