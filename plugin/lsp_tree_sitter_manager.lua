local utils = require("core.utils")
local gh = utils.gh
local icons = require("resources.icons")
local map = vim.keymap.set

vim.pack.add({
  { src = gh("romus204/tree-sitter-manager.nvim") },
})

local config  = {
  -- Default Options
  ensure_installed = { -- list of parsers to install at the start of a neovim session
    "angular", "asm", "astro", "awk", "bash", "bash", "c", "cmake",
    "cpp", "c_sharp", "css", "csv", "diff", "dockerfile", "dot", "ecma",
    "elixir", "fish", "gdscript", "gitattributes",
    "gitcommit", "git_config", "gitignore", "git_rebase",
    "glsl", "go", "godot_resource", "gotmpl", "graphql", "hlsl", "html", "html_tags",
    "http", "java", "javadoc", "javascript", "jinja", "jq", "jsdoc", "json",
    "json5", "jsx", "kdl", "kitty", "kotlin", "latex", "llvm", "lua",
    "luadoc", "luap", "luau", "make", "markdown", "markdown_inline", "meson", "nginx",
    "ninja", "nu", "php", "phpdoc", "powershell", "properties", "python", "regex",
    "requirements", "robots_txt", "rust", "scss", "sql", "ssh_config", "sway", "teal",
    "tmux", "toml", "tsx", "typescript", "vim", "vimdoc", "vue", "wgsl", "xml", "yaml",
  },
  border = "rounded", -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
  auto_install = true, -- if enabled, install missing parsers when editing a new file
  highlight = true, -- treesitter highlighting is enabled by default
  languages = {}, -- override or add new parser sources
  parser_dir = vim.fn.stdpath("data") .. "/site/parser",
  query_dir = vim.fn.stdpath("data") .. "/site/queries",}

require("tree-sitter-manager").setup( config )

vim.api.nvim_create_autocmd("FileType", { -- enable treesitter highlighting and indents
  callback = function(args)
    local filetype = args.match
    local lang = vim.treesitter.language.get_lang(filetype)
    if vim.treesitter.language.add(lang or tostring(lang)) then
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.treesitter.start()
    end
  end
})
