cnoremap %% <C-R>=expand('%:h').'/'<cr>

lua << EOF
  require('common')
EOF

map <leader>FF :Telescope find_files cwd=%%<cr>
map <leader>FG :Telescope live_grep cwd=%%<cr>

set colorcolumn=100

set guifont=FuraMono\ Nerd\ Font:h14:m
