local utils = require("core.utils")
local gh = utils.gh
local icons = require("resources.icons")
local map = vim.keymap.set

vim.pack.add({
  { src = gh("rcarriga/nvim-notify") },
})

local config  = {
  minimum_width = 50,
  render = "compact",
  background_colour = "#1d2021",
  stages = "fade_in_slide_out",
  timeout = 250,
  fps = 30,
  top_down = false,
}

require("notify").setup( config )
