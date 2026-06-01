local utils = require("core.utils")
local gh = utils.gh

vim.pack.add({
  { src = gh("akinsho/toggleterm.nvim") },
})

local config  = {
  highlights = {
    Normal = { link = "Normal" },
    NormalNC = { link = "NormalNC" },
    NormalFloat = { link = "NormalFloat" },
    FloatBorder = { link = "FloatBorder" },
    StatusLine = { link = "StatusLine" },
    StatusLineNC = { link = "StatusLineNC" },
    WinBar = { link = "WinBar" },
    WinBarNC = { link = "WinBarNC" },
  },
  size = 10,
  on_create = function()
    vim.opt.foldcolumn = "0"
    vim.opt.signcolumn = "no"
  end,
  open_mapping = { [[<F7>]], [[<leader>tt]] },
  shading_factor = 2,
  direction = "float",
  float_opts = { border = "rounded" },
}

require("toggleterm").setup( config )
