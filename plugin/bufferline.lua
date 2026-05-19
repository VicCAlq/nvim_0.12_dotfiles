local utils = require("core.utils")
local gh = utils.gh
local icons = require("resources.icons")
local map = vim.keymap.set

vim.pack.add({
  { src = gh("akinsho/bufferline.nvim") },
})

local chars = { "╱", "፨", "◊", "⯎", "⯌", "⎠", "⚕", "🟆", "|" }
vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "#151317" })
vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { fg = "#99ff88", bold = true, italic = true })
vim.api.nvim_set_hl(0, "BufferLineSeparator", { fg = "#ffdd77" })
vim.api.nvim_set_hl(0, "BufferLineCloseButton", { fg = "#bb2244" })
vim.api.nvim_set_hl(0, "BufferLineCloseButtonSelected", { fg = "#ff4444", bold = true })

local config = {
  options = {
    name_formatter = function(buf)
      local path_items = {}
      -- for dir in string.gmatch(buf.path, "(%w+)/") do
      for dir in string.gmatch(buf.path, "([^" .. "/" .. "]+)") do
        table.insert(path_items, dir)
      end

      local path
      if #path_items > 0 then
        path = path_items[#path_items - 1]
      end

      if path and buf and buf.name then
        return path .. "/" .. buf.name
      else
        return ""
      end
    end,
    mode = "buffers",
    themable = true,
    numbers = "none",
    close_command = "bdelete! %d",
    close_icon = icons.Close,
    path_components = 1,
    modified_icon = icons.Modified,
    left_trunc_marker = icons.ArrowLeft,
    right_trunc_marker = icons.ArrowRight,
    truncate_names = true,
    max_name_length = 30,
    max_prefix_length = 30,
    -- tab_size = 20,
    diagnostics = false,
    diagnostics_update_in_insert = false,
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    persist_buffer_sort = true,
    separator_style = { chars[9], chars[9] },
    -- separator_style = "thin",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    show_tab_indicators = true,
    indicator = {
      icon = chars[5] .. " ",
      style = "icon",
    },
    icon_pinned = icons.Pin,
    minimum_padding = 2,
    maximum_padding = 5,
    maximum_length = 15,
    mousemoveevent = true,
    sort_by = "insert_at_end",
    hover = {
      enabled = true,
      delay = 50,
      highlights = {
        tab_selected = { bg = "#254", fg = "#afb" },
        buffer_selected = { bg = "#254", fg = "#afb" },
        fill = { bg = "#254", fg = "#afb" },
      },
      reveal = { "close" },
    },
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        separator = { "|", "|" }, -- use a "true" to enable the default, or set your own character
      },
    },
    groups = {
      options = {
        toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
      },
      items = {
        {
          name = "Tests", -- Mandatory
          highlight = { underline = true, sp = "blue" }, -- Optional
          priority = 2, -- determines where it will appear relative to other groups (Optional)
          icon = " ", -- Optional
          matcher = function(buf) -- Mandatory
            -- for k, v in pairs(buf) do
            --   print(k, v)
            -- end
            return buf.name:match("%_test") or buf.name:match("%_spec")
          end,
        },
        -- {
        --   name = "Docs",
        --   highlight = { undercurl = true, sp = "green" },
        --   auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
        --   matcher = function(buf)
        --     return buf.filename:match("%.md") or buf.filename:match("%.txt")
        --   end,
        --   separator = { -- Optional
        --     style = require("bufferline.groups").separator.tab,
        --   },
        -- },
      },
    },
  },
}

require("bufferline").setup( config )

map("n", "<b", ":BufferLineMovePrev<CR>", { desc = "Move current buffer left", remap = true })
map("n", ">b", ":BufferLineMoveNext<CR>", { desc = "Move current buffer right", remap = true })
map("n", "[b", ":BufferLineCyclePrev<CR>", { desc = "Cycle to previous buffer", remap = true })
map("n", "]b", ":BufferLineCycleNext<CR>", { desc = "Cycle to next buffer", remap = true })
map("n", "<leader>bc", ":BufferLineCloseOthers<CR>", { desc = "Close all other buffers", remap = true })
map("n", "<leader>bp", ":BufferLineTogglePin<CR>", { desc = "(un)[P]in current buffer", remap = true })

-- BufferLineFill	BufferLineFill
-- BufferLineBufferSelected	BufferLineBufferSelected
-- BufferLineErrorSelected	BufferLineErrorSelected
-- BufferLineWarning	BufferLineWarning
-- BufferLineInfo	BufferLineInfo
-- BufferLineError	BufferLineError
-- BufferLineWarningDiagnostic	BufferLineWarningDiagnostic
-- BufferLineErrorDiagnostic	BufferLineErrorDiagnostic
-- BufferLineInfoDiagnostic	BufferLineInfoDiagnostic
-- BufferLineHintDiagnostic	BufferLineHintDiagnostic
-- BufferLineModified	BufferLineModified
-- BufferLinePickVisible	BufferLinePickVisible
-- BufferLineSeparator	BufferLineSeparator
-- BufferLinePick	BufferLinePick

-- BufferLineGroupSeparator	BufferLineGroupSeparator
-- BufferLineTestsSeparator	BufferLineTestsSeparator
-- BufferLineTestsLabel	BufferLineTestsLabel
-- BufferLineTestsSelected	BufferLineTestsSelected
-- BufferLineTests	BufferLineTests
-- BufferLineCloseButtonSelected	BufferLineCloseButtonSelected
-- BufferLineCloseButtonVisible	BufferLineCloseButtonVisible
-- BufferLineCloseButton	BufferLineCloseButton
-- BufferLineOffsetSeparator	BufferLineOffsetSeparator
-- BufferLinePickSelected	BufferLinePickSelected
-- BufferLineDuplicate	BufferLineDuplicate
-- BufferLineDuplicateVisible	BufferLineDuplicateVisible
-- BufferLineDuplicateSelected	BufferLineDuplicateSelected
-- BufferLineModifiedSelected	BufferLineModifiedSelected
-- BufferLineModifiedVisible	BufferLineModifiedVisible
-- BufferLineErrorDiagnosticSelected	BufferLineErrorDiagnosticSelected
-- BufferLineErrorDiagnosticVisible	BufferLineErrorDiagnosticVisible
-- BufferLineErrorVisible	BufferLineErrorVisible
-- BufferLineNumbers	BufferLineNumbers
-- BufferLineWarningDiagnosticVisible	BufferLineWarningDiagnosticVisible
-- BufferLineWarningVisible	BufferLineWarningVisible
-- BufferLineInfoDiagnosticSelected	BufferLineInfoDiagnosticSelected
-- BufferLineInfoDiagnosticVisible	BufferLineInfoDiagnosticVisible
-- BufferLineHint	BufferLineHint
-- BufferLineInfoSelected	BufferLineInfoSelected
-- BufferLineInfoVisible	BufferLineInfoVisible
-- BufferLineHintDiagnosticSelected	BufferLineHintDiagnosticSelected
-- BufferLineHintDiagnosticVisible	BufferLineHintDiagnosticVisible
-- BufferLineHintSelected	BufferLineHintSelected
-- BufferLineHintVisible	BufferLineHintVisible
-- BufferLineDiagnosticSelected	BufferLineDiagnosticSelected
-- BufferLineDiagnosticVisible	BufferLineDiagnosticVisible
-- BufferLineNumbersVisible	BufferLineNumbersVisible
-- BufferLineBufferVisible	BufferLineBufferVisible
-- BufferLineTabClose	BufferLineTabClose
-- BufferLineGroupLabel	BufferLineGroupLabel
-- BufferLineTruncMarker	BufferLineTruncMarker
-- BufferLineDiagnostic	BufferLineDiagnostic
-- BufferLineTestsVisible	BufferLineTestsVisible
-- BufferLineWarningDiagnosticSelected	BufferLineWarningDiagnosticSelected
-- BufferLineTab	BufferLineTab
-- BufferLineBackground	BufferLineBackground
