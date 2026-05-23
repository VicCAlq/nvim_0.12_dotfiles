local utils = require("core.utils")
local gh = utils.gh

vim.pack.add({
  { src = gh("windwp/nvim-autopairs") },
})

local config  = {}

require("nvim-autopairs").setup( config )
