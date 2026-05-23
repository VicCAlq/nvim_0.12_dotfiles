local utils = require("core.utils")
local gh = utils.gh

vim.pack.add({
  { src = gh("dstein64/nvim-scrollview") },
})

require("scrollview").setup({})
