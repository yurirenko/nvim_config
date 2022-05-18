--[[
Plugins managed by Packer.nvim:
https://github.com/wbthomason/packer.nvim
Useful commands:

You must run this or `PackerSync` whenever you make changes to your plugin configuration
:PackerCompile

Only install missing plugins
:PackerInstall

Update and install plugins
:PackerUpdate

Remove any disabled or unused plugins
:PackerClean

Performs `PackerClean` and then `PackerUpdate`
:PackerSync
--]]
local packer = require('packer')
packer.startup(function()
  use 'wbthomason/packer.nvim'

  -- Utility functions used by other plugins (telescope and gitsigns)
  use('nvim-lua/plenary.nvim')

  -- Theme
  use('navarasu/onedark.nvim')
  use('kyazdani42/nvim-web-devicons')

  -- Statusline
  use('ojroques/nvim-hardline')

  -- LSP stuff
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  })
  use('neovim/nvim-lspconfig')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/nvim-cmp')
  use('L3MON4D3/LuaSnip')
  use('saadparwaiz1/cmp_luasnip')
  use('ray-x/lsp_signature.nvim')

  -- Telescope, file search and navigation
  use({
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}}
  })
  use({
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  })

  -- Terminal
  use({'akinsho/toggleterm.nvim', tag = 'v1.*'})

  -- Filetree in the sidepanel
  use('kyazdani42/nvim-tree.lua')

  -- Git plugins
  use({
    'lewis6991/gitsigns.nvim',
    tag = 'release'
  })
  use({
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim'
  })

  -- Delete the buffer while keeping the window layout
  use('famiu/bufdelete.nvim')
end)
