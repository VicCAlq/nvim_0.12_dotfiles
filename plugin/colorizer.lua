local utils = require("core.utils")
local gh = utils.gh

vim.pack.add({
  { src = gh("norcalli/nvim-colorizer.lua") },
})

require("colorizer").setup()
