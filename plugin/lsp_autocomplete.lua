local utils = require("core.utils")
local gh = utils.gh
local icons = require("resources.icons")
local map = vim.keymap.set

vim.pack.add({
  { src = gh("saghen/blink.cmp"), version = vim.version.range("1") },
  { src = gh("L3MON4D3/LuaSnip"), version = vim.version.range("2") },
  { src = gh("rafamadriz/friendly-snippets") },
})

local config = {
  -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
  -- 'super-tab' for mappings similar to vscode (tab to accept)
  -- 'enter' for enter to accept
  -- 'none' for no mappings
  --
  -- All presets have the following mappings:
  -- C-space: Open menu or open docs if already open
  -- C-n/C-p or Up/Down: Select next/previous item
  -- C-e: Hide menu
  -- C-k: Toggle signature help (if signature.enabled = true)
  --
  -- See :h blink-cmp-config-keymap for defining your own keymap
  -- keymap = { preset = 'default' },
  keymap = {
    -- preset = 'super-tab',
    ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
    ['<PageDown>'] = { function(cmp) return cmp.select_next({ count = 5 }) end, 'fallback' },
    ['<PageUp>'] = { function(cmp) return cmp.select_prev({ count = 5 }) end, 'fallback' },
    ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
    ['<CR>'] = { 'select_and_accept', 'fallback' },
    ['<C-y>'] = { 'select_and_accept', 'fallback' },
    ['<C-e>'] = { 'cancel', 'fallback' },
    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ['<Tab>'] = { 'snippet_forward', 'fallback' },
    ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
    ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
    ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
  },

  appearance = {
    -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- Adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'mono'
  },

  -- (Default) Only show the documentation popup when manually triggered
  completion = {
    keyword = {
      range = "full"
    },
    accept = {
      auto_brackets = {
        enabled = false
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 250,
      window = { border = "rounded" },
    },
    menu = {
      border = "rounded",
      draw = {
        treesitter = { "lsp" },
        columns = {
          { "label", "label_description", gap = 1 },
          { "kind_icon", "kind" },
          { "source_name" }
        }
      }
    },
  },

  snippets = {
    preset = "luasnip",
  },

  signature = {
    enabled = true,
    window = { border = "rounded" },
  },

  -- Default list of enabled providers defined so that you can extend it
  -- elsewhere in your config, without redefining it, due to `opts_extend`
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
  -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
  -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
  --
  -- See the fuzzy documentation for more information
  fuzzy = { implementation = "prefer_rust_with_warning" }
}

local blink = require("blink.cmp")
blink.setup( config )
