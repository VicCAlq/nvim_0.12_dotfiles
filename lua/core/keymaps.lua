-- Setting leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Center items on "n" navigtion
map("n", "n", "nzzzv", { silent = true })
map("n", "N", "Nzzzv", { silent = true })

-- Hover with borders
map("n", "K", function() vim.lsp.buf.hover({ border = "rounded"}) end, { desc = "Hover documentation" })

-- Movement remaps
map("n", "j", "gj", { desc = "Move cursor down" })
map("n", "<Down>", "gj", { desc = "Move cursor down" })
map("v", "j", "gj", { desc = "Move cursor down" })
map("v", "<Down>", "gj", { desc = "Move cursor down" })
map("i", "<Down>", "<c-o>gj", { desc = "Move cursor down (insert mode)" })
map("n", "k", "gk", { desc = "Move cursor up" })
map("n", "<Up>", "gk", { desc = "Move cursor up" })
map("v", "k", "gk", { desc = "Move cursor up" })
map("v", "<Up>", "gk", { desc = "Move cursor up" })
map("i", "<Up>", "<c-o>gk", { desc = "Move cursor up (insert mode)" })
map("n", "H", "^", { desc = "Move to start of line" })
map("n", "L", "$", { desc = "Move to end of line" })

-- Code operations
map("n", "gD", function() vim.lsp.buf.definition() end, {
  noremap = true, silent = true, desc = "[g]et [D]efinitions (native)"
})

-- Indent in selection mode
map("v", "<Tab>", ">gv", { desc = "Indent line" })
map("v", "<S-Tab>", "<gv", { desc = "Dedent line" })

-- Alternate commenting line
map("n", "<leader>/", "gcc", { desc = "(un)Comment line", remap = true })
map("v", "<leader>/", "gc", { desc = "(un)Comment line", remap = true })

-- Terminal navigation
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Terminal left window navigation" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Terminal down window navigation" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Terminal up window navigation" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Terminal right window navigation" })

-- Splits manipulation
map("n", "<leader>Sv", "<cmd>vsplit<cr>", { desc = "Split vertically" })
map("n", "<leader>Sh", "<cmd>split<cr>", { desc = "Split horizontally" })
map("n", "<c-j>", "<c-w><c-j>", { desc = "Switch to split below" })
map("n", "<c-k>", "<c-w><c-k>", { desc = "Switch to split above" })
map("n", "<c-l>", "<c-w><c-l>", { desc = "Switch to right split" })
map("n", "<c-h>", "<c-w><c-h>", { desc = "Switch to left split" })
map("n", "<C-up>", "<cmd>resize -2<cr>", { desc = "Resize split up" })
map("n", "<C-down>", "<cmd>resize +2<cr>", { desc = "Resize split down" })
map("n", "<C-left>", "<cmd>vertical resize -2<cr>", { desc = "Resize split left" })
map("n", "<C-right>", "<cmd>vertical resize +2<cr>", { desc = "Resize split right" })
map("n", "<leader>sr", "<C-w>=", { desc = "Resize splits equally" })

-- Buffer navigation
--  NOTE: buffer cycling handled by BufferLine now
-- map("n", "[b", "<cmd>bprevious<cr>", { desc = "Go to previous buffer" })
-- map("n", "]b", "<cmd>bnext<cr>", { desc = "Go to next buffer" })
map("n", "<leader>bs", ":split<CR>", { desc = "Split horizontally", remap = true, silent = true })
map("n", "<leader>bv", ":vs<CR>", { desc = "Split vertically", remap = true, silent = true })
map("n", "<leader>be", "<C-w>=", { desc = "Equalize buffer sizes", remap = true, silent = true })
map("n", "<leader>c", ":bp | sp | bn | bd<CR>", { desc = "Close current buffer", remap = true, silent = true })
map("n", "<leader>bC", ":bd!<CR>", { desc = "Close current buffer without saving", remap = true, silent = true })
map("n", "<leader>n", "<cmd>enew<cr>", { desc = "New file" })

-- Search navigation
local mark_search_keys = {
  ["/"] = "Search forward",
  ["?"] = "Search backward",
  ["*"] = "Search current word forward",
  ["#"] = "Search current word backward",
  ["̉£"] = "Search current word backward",
  ["g*"] = "Search current partial word forward",
  ["g#"] = "Search current partial word backward",
  ["g£"] = "Search current partial word backward",
}
for key, desc in pairs(mark_search_keys) do
  map("n", key, "ms" .. key, { desc = desc })
end

-- Code running
map("n", "<leader>xx", ":.lua<CR>", { desc = "Execute the current line" })
map("v", "<leader>xx", ":lua<CR>", { desc = "Execute the current selection" })
map("n", "<leader>xf", "<cmd>source %<CR>", { desc = "Source/Run the current file" })

-- Diagnostics navigation
map("n", "]d", vim.diagnostic.get_next, { desc = "Go to next diagnostic item" })
map("n", "[d", vim.diagnostic.get_prev, { desc = "Go to previous diagnostic item" })
map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Open diagnostic list" })
map("n", "<leader>lq", vim.diagnostic.setloclist, { desc = "Set diagnostic list" })

-- Standard  operations
map("n", "<leader>w", "<cmd>noautocmd w<cr>", { desc = "Save with no autoformatting" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "[Q]uickfix list" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights on <Esc>" })
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = "[R]eplace word under cursor for whole buffer" })
map("n", "<C-c>r", "ciw", { desc = "[C]hange word under cursor" })
map("n", "<leader>'", "ciw\"<ESC>pa\"<ESC>", { desc = "Place current word inside quotes" })

-- VimTabs
map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "Create a new Vim tab" })
map("n", "<leader>tc", "<cmd>tabclose!<cr>", { desc = "Close this vim Tab" })
map("n", "<leader>t]", "<cmd>tabn<cr>", { desc = "Go to next Vim tab" })
map("n", "<leader>t[", "<cmd>tabp<cr>", { desc = "Go to previous Vim Tab" })

-- Terminal
-- Easily hit escape in terminal mode.
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Escape terminal mode" })
-- Open a terminal at the bottom of the screen with a fixed height.
local job_id = 0
map("n", "<leader>ts", function()
  vim.cmd.new()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)
  vim.wo.winfixheight = true
  vim.cmd.terminal()

  job_id = vim.bo.channel
end, { desc = "Open a standard terminal at screen bottom" })

map("n", "<leader>trr", function()
  print(vim.bo.path)
  vim.fn.chansend(job_id, string.format("pdflatex -output-directory=$(pwd)/CVs %s \r\n", vim.api.nvim_buf_get_name(0)))
end, { desc = "[R]un command in [T]erminal" })

-- if package.loaded["neo-tree"] then
map("n", "\\\\", "<cmd>Neotree reveal<cr>", { desc = "Neotree Reveal" })
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Neotree Toggle" })
map("n", "<leader>o", function()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd.wincmd("p")
  else
    vim.cmd.Neotree("focus")
  end
end, { desc = "Neotree Focus" })
-- end
-- NetRW mappings (in case NeoTree is disabled for some reason)
-- if package.loaded["neo-tree"] then
-- else
--   map("n", "<leader>e", "<cmd>Vex<cr><cmd>cd %:h<cr>", { desc = "Opens NetRW on current buffer's location" })
--   map("n", "<leader>o", "<cmd>Lex<cr><cmd>cd %:h<cr>", { desc = "Opens NetRW on current buffer's location" })
-- end

-- Plugin maps

-- DAP
map("n", "<leader>çç", ":lua require('dap') <CR>", { desc = "Loads DAP" })

-- CSView
map("n", "<leader>Xe", ":CsvViewEnable display_mode=border header_lnum=1 <CR>", { desc = "Enables CSView" })
map("n", "<leader>Xd", ":CsvViewDisable <CR>", { desc = "Disables CSView" })
map("n", "<leader>Xt", ":CsvViewToggle display_mode=border header_lnum=1 <CR>", { desc = "Toggles CSView" })

-- External commands

-- live-server
map("n", "<leader>xl", ":term live-server<CR>", { desc = "Starts live-server from current working directory" })
