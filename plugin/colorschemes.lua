local utils = require("core.utils")
local gh = utils.gh

vim.pack.add({
  { src = gh("clpi/cyu.lua") },
  { src = gh("vague2k/vague.nvim") },
  { src = gh("rebelot/kanagawa.nvim") },
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
  { src = gh("whistler/vim-colors") },
  { src = 'https://github.com/nvim-mini/mini.colors', version = 'stable' },
})

require("mini.colors").setup({})
vim.cmd.colorscheme("base4tone_classic_i_dark")
utils.set_new_hl()
