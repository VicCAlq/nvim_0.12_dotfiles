local utils = require("core.utils")
local gh = utils.gh
local icons = require("resources.icons")
local map = vim.keymap.set

vim.pack.add({
  { src = gh("folke/todo-comments.nvim") },
})

local config  = {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
  signs = true, -- show icons in the signs column
  sign_priority = 8, -- sign priority
  -- keywords recognized as todo comments
  keywords = {
    FIX = {
      icon = " ", -- icon used for the sign, and in search results
      color = "error", -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "ERROR", "EDITE" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { icon = " ", color = "info", alt = { "A FAZER" } },
    TIP = { icon = "?", color = "hint", alt = { "HINT", "DICA", "SEP" } },
    HACK = { icon = " ", color = "perf", alt = { "GAMBI", "GAMBIARRA", "REFATORAR" } },
    FIX = { icon = icons.DiagnosticError, color = "error", alt = { "ERRO", "FALHA", "ERROR", "CONSERTAR" } },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX", "AVISO", "ATENÇÃO" } },
    PERF = { icon = " ", color = "perf", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO", "SEÇÃO", "NOTA" } },
    TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED", "TESTE" } },
  },
  gui_style = {
    fg = "NONE", -- The gui style to use for the fg highlight group.
    bg = "BOLD", -- The gui style to use for the bg highlight group.
  },
  merge_keywords = true, -- when true, custom keywords will be merged with the defaults
  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
  highlight = {
    multiline = true, -- enable multine todo comments
    multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
    multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
    before = "", -- "fg" or "bg" or empty
    keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
    after = "fg", -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = {}, -- list of file types to exclude highlighting
  },
  -- list of named colors where we try to extract the guifg from the
  -- list of highlight groups or use the hex color if hl not found as a fallback
  colors = {
    error = { "DiagnosticError", "ErrorMsg", "#e05030" },
    warning = { "DiagnosticWarn", "WarningMsg", "#f0a040" },
    perf = { "DiagnosticWarn", "WarningMsg", "#f0e040" },
    info = { "DiagnosticInfo", "#2090c0" },
    hint = { "DiagnosticHint", "#30a070" },
    default = { "Identifier", "#b06070" },
    test = { "Identifier", "#a0d050" },
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    -- regex that will be used to match keywords.
    -- don't replace the (KEYWORDS) placeholder
    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
  },
}

require("todo-comments").setup( config )

map("n", "<leader>Tq", ":TodoQuickFix<cr>", { desc = "Open [T]odo [Q]uick fix list" })
map("n", "<leader>Tt", ":TodoTelescope<cr>", { desc = "Open [T]odo list in [T]elescope" })
map("n", "<leader>Tr", ":Trouble todo<cr>", { desc = "Open [T]odo list in T[r]ouble" })
