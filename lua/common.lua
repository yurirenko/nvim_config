require('plugins')
require('keymap')
require('lsp_conf')
require('completion')

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

vim.opt.termguicolors = true
vim.opt.background = 'dark'

-- vim.g.hidden = true -- Used for toggleterm
-- vim.api.nvim_set_var('onedark_style', 'warmer') -- 'darker', 'cool', 'deep', 'warm', 'warmer'
require('onedark').setup {
  style = 'darker'
}
vim.cmd([[colorscheme onedark]])

vim.o.completeopt = 'menu,menuone,noselect'

-- vim.o.hidden = true
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

require('lsp_signature').setup({
  hint_prefix = ''
})

require('nvim-treesitter.configs').setup({
  ensure_installed = 'maintained',
  highlight = {
    enable = true
  }
})

map('n', '<leader><tab>', "<cmd>:NvimTreeToggle<CR>", {})
require('nvim-tree').setup({})
