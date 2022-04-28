local map = vim.api.nvim_set_keymap

-- Map the leader to ,
map('n', ',', '', {})
vim.g.mapleader = ','

options = { noremap = true }

-- Misc remappings
map('n', '<leader><space>', ':nohlsearch<cr>', options)

-- Telescope keybindings
map('n', '<leader>ff', ':Telescope find_files<cr>', options)
map('n', '<leader>fb', ':Telescope buffers<cr>', options)
map('n', '<leader>fg', ':Telescope live_grep<cr>', options)

map('n', '<leader>gg', ':Telescope git_status<cr>', options)
map('n', '<leader>gb', ':Telescope git_branches<cr>', options)

map('n', '<C-Left>', ':tabprevious<cr>', options)
map('n', '<C-Right>', ':tabnext<cr>', options)
map('n', '<leader>K', ':SymbolsOutline<cr>', options)
map('n', '<C-c>', ':cclose<cr>', options)
