require('plugins')
require('keymap')
require('lsp_conf')
require('completion')
require('utils')

local map = vim.api.nvim_set_keymap

-- Trailing chars
vim.opt.list = true
vim.opt.listchars = { trail = '.' }

-- Line numbers and line highlight
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.api.nvim_command('hi CursorLine cterm=None ctermbg=237')

-- Misc
vim.api.nvim_command('syntax enable')
vim.api.nvim_command('filetype plugin indent on')

-- Whitespace
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.expandtab = true
local autocommands = {
  formatting = {
    { 'FileType', 'go', 'setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 nolist' }
  }
}
nvim_create_augroups(autocommands)

-- Theming
vim.opt.termguicolors = true
vim.opt.background = 'dark'
require('onedark').setup {
  style = 'darker' -- available styles: 'darker', 'cool', 'deep', 'warm', 'warmer'
}
vim.cmd([[colorscheme onedark]])

vim.g.hidden = true -- Used for toggleterm
vim.o.hidden = true

vim.o.completeopt = 'menu,menuone,noselect'

vim.o.signcolumn = 'yes'

require('hardline').setup({})
require('gitsigns').setup({
  numhl = true,
  current_line_blame_opts = {
    virt_text_pos = 'overlay', -- 'eol' | 'overlay' | 'right_align'
  }
})
local telescope = require('telescope')

telescope.setup({
  defaults = {
    layout_config = {
      horizontal = { width = 180, height = 180 }
      -- other layout configuration here
    },
    path_display = {
      "truncate"
    }
    -- other defaults configuration here
  },
})
telescope.load_extension('fzf')

require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'css',
    'dockerfile',
    'fish',
    'go',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'lua',
    'php',
    'rust',
    'ruby',
    'scss',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'yaml'
  },
  highlight = {
    enable = true
  }
})

map('n', '<leader><tab>', "<cmd>:NvimTreeToggle<CR>", {})
require('nvim-tree').setup({})

require('toggleterm').setup({
  open_mapping = [[<c-t>]]
})
