local utils = require("core.utils")
local gh = utils.gh
local icons = require("resources.icons")
local map = vim.keymap.set

vim.pack.add({
  { src = gh("clpi/cyu.lua") },
  { src = gh("vague2k/vague.nvim") },
  { src = gh("rebelot/kanagawa.nvim") },
  -- { src = gh("2nthony/vitesse.nvim") },
  { src = gh("atelierbram/Base4Tone-nvim") },
  { src = gh("folke/tokyonight.nvim") },
  { src = gh("rose-pine/neovim") },
  { src = gh("Shatur/neovim-ayu") },
  { src = gh("neanias/everforest-nvim") },
  { src = gh("numToStr/Sakura.nvim") },
  { src = gh("Everblush/nvim") },
  { src = gh("vimcolorschemes/olive-crt.nvim") },
  { src = gh("MiladGGG/neonwave.nvim") },
  { src = gh("sontungexpt/witch") },
  { src = gh("ptdewey/darkearth-nvim") },
  { src = gh("sderev/alabaster.vim") },
  { src = gh("cdaddr/gentooish.vim") },
  { src = gh("mirlord/up.vim") },
  { src = gh("vim-scripts/strange") },
  { src = gh("toupeira/vim-desertink") },
  { src = gh("jeffreyiacono/vim-colors-wombat") },
  { src = gh("gregsexton/atom") },
  { src = gh("brafales/vim-desert256") },
  -- { src = gh("travisjeffrey/vim-colors") },
  { src = gh("whistler/vim-colors") },
})

-- local config = {
--   cyu = {},
--   vague = {
--     -- optional configuration here
--     transparent = true,
--     style = { -- Set things to bold or italic. "none" is the default
--       -- builtin_functions = "none", -- "bold "italic"
--     },
--     colors = { -- Override colors here
--       -- bg = #111,
--     },
--   },
-- }

-- require("vague").setup( config.vague )

vim.cmd.colorscheme("base4tone_classic_i_dark")
-- vim.cmd.colorscheme("cayu")
-- vim.cmd.colorscheme("kanagawa")
-- vim.cmd.colorscheme("vague")
-- vim.cmd.colorscheme("vitesse")
-- vim.cmd.colorscheme("tokyonight-night")
-- vim.cmd.colorscheme("rose-pine")
-- vim.cmd.colorscheme("ayu")
-- vim.cmd.colorscheme("everforest")
-- vim.cmd.colorscheme("sakura")
-- vim.cmd.colorscheme("everblush")
utils.set_new_hl()
