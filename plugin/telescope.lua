local utils = require("core.utils")
local gh = utils.gh
local icons = require("resources.icons")
local map = vim.keymap.set

vim.pack.add({
  { src = gh("nvim-telescope/telescope.nvim") },
  { src = gh("nvim-lua/plenary.nvim") },
  { src = gh("nvim-telescope/telescope-ui-select.nvim") },
})

local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local config_telescope  = {
  -- You can put your default mappings / updates / etc. in here
  --  All the info you're looking for is in `:help telescope.setup()`
  defaults = {
    find_command = {
      "rg",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        width = 0.9,
        height = 0.9,
        prompt_position = "top",
        preview_cutoff = 120,
        preview_width = 75,
        horizontal = { mirror = false },
        vertical = { mirror = false },
      },
    },
    prompt_prefix = "  ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = {},
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-l>"] = actions.select_default, -- open file
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default + actions.center,
      },
      n = {
        ["<C-k>"] = actions.move_selection_next,
        ["<C-j>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      },
    },
  },
  pickers = {
    find_files = {
      file_ignore_patterns = { "node_modules", ".git", ".venv" },
      hidden = true,
    },
  },
  live_grep = {
    file_ignore_patterns = { "node_modules", ".git", ".venv" },
    additional_args = function(_)
      return { "--hidden" }
    end,
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown(),
    },
  },
}
telescope.setup( config_telescope )

-- Enable Telescope extensions if they are installed
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

map("n", "<leader>ft", function()
  builtin.colorscheme({ enable_preview = true })
end, { desc = "[F]ind [T]hemes" })
map("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp files" })
map("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
map("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
map("n", "<leader>fs", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
map("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind [W]ord" })
map("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
map("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
map("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
map("n", "<leader>f.", builtin.oldfiles, { desc = "[F]ind Recent Files ('.' for repeat)" })
map("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

-- Slightly advanced example of overriding default behavior and theme
map("n", "<leader>f/", function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = "[/] Fuzzily search in current buffer" })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
map("n", "<leader>f/", function()
  builtin.live_grep({
    grep_open_files = true,
    prompt_title = "Live Grep in Open Files",
  })
end, { desc = "[F]ind [/] in Open Files" })
