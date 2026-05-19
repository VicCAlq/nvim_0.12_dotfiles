local utils = require("core.utils")
local gh = utils.gh
local icons = require("resources.icons")
local map = vim.keymap.set

vim.pack.add({
  { src = gh("sphamba/smear-cursor.nvim") },
})

require("smear_cursor").setup({
  -- Normal mode
  stiffness = 0.6,                      -- 0.6      [0, 1]
  trailing_stiffness = 0.30,            -- 0.45     [0, 1]
  stiffness_insert_mode = 0.5,          -- 0.5      [0, 1]
  trailing_stiffness_insert_mode = 0.5, -- 0.5      [0, 1]
  damping = 0.65,                       -- 0.85     [0, 1]
  damping_insert_mode = 0.90,           -- 0.9      [0, 1]
  distance_stop_animating = 0.1,        -- 0.1      > 0

  -- Fire mode
  -- cursor_color = "#aa88ff",
  -- particles_enabled = true, -- When true, better to also set `never_draw_over_target` to true
  -- stiffness = 0.5,
  -- trailing_stiffness = 0.2,
  -- trailing_exponent = 5,
  -- damping = 0.6,
  -- gradient_exponent = 1,
  -- gamma = 1,
  -- never_draw_over_target = true, -- if you want to actually see under the cursor
  -- particle_spread = 1, -- 0: no spread, 1: spread over entire cursor
  -- particles_per_second = 500,
  -- particles_per_length = 50, -- per character width
  -- particle_max_lifetime = 800, -- milliseconds
  -- particle_max_initial_velocity = 20, -- characters width per second
  -- particle_velocity_from_cursor = 0.5, -- 0: none, 1: full
  -- particle_damping = 0.15,
  -- particle_gravity = -50, -- characters width per second squared
  -- min_distance_emit_particles = 0, -- character widths

  -- particle_switch_octant_braille = 0.3 -- fraction of lifetime, used if `legacy_computing_symbols_support` is true
  -- particles_over_text = false

  -- Cursor color. Defaults to Normal gui foreground color
  -- cursor_color = "#d3cdc3",

  -- Background color. Defaults to Normal gui background color
  -- normal_bg = "#282828",

  -- Smear cursor when switching buffers
  smear_between_buffers = true,

  -- Smear cursor when moving within line or to neighbor lines
  smear_between_neighbor_lines = true,

  -- Draw the smear in buffer space instead of screen space when scrolling
  scroll_buffer_space = true,

  -- Use floating windows to display smears outside buffers.
  -- May have performance issues with other plugins.
  use_floating_windows = false,

  -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
  -- Smears will blend better on all backgrounds.
  legacy_computing_symbols_support = true,

  -- Smear cursor in insert mode.
  -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
  smear_insert_mode = true,

  -- Attempt to hide the real cursor when smearing.
  hide_target_hack = true,
})

