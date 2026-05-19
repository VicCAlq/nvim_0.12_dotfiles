local utils = require("core.utils")
local gh = utils.gh
local icons = require("resources.icons")
local map = vim.keymap.set

vim.pack.add({
  { src = gh("nvzone/minty") },
  { src = gh("nvchad/volt") },
})

require("minty").setup({})

map({ "n", "v" }, "<leader>Cc", function()
  require("minty.huefy").open({ border = true })
end, { desc = "Open hue selector" })
map({ "n", "v" }, "<leader>Cs", function()
  require("minty.shades").open({ border = true })
end, { desc = "Open shade selector" })
