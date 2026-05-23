local utils = require("core.utils")
local gh = utils.gh
local map = vim.keymap.set

vim.pack.add({
  { src = gh("folke/trouble.nvim") },
})

local config  = {}

require("trouble").setup( config )

map("n", "<leader>çt", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>çB", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map( "n", "<leader>çs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
map( "n", "<leader>çl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions / references / ... (Trouble)" })
map( "n", "<leader>çL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map( "n", "<leader>çq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
