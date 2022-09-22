-- Complextras.nvim configuration
local map = vim.api.nvim_set_keymap
map('n', '<C-h>', '<C-w>h', {noremap = true, silent = false})
map('n', '<C-l>', '<C-w>l', {noremap = true, silent = false})
map('n', '<C-j>', '<C-w>j', {noremap = true, silent = false})
map('n', '<C-k>', '<C-w>k', {noremap = true, silent = false})

map('v', '<', '<gv', {noremap = true, silent = false})
map('v', '>', '>gv', {noremap = true, silent = false})

-- keeping it centered
map('n', 'N', 'Nzzzv', {noremap = true})
map('n', 'J', 'mzJ`z', {noremap = true})
-- undo break points
map('n', ',', ',<C-g>u', {noremap = true})
map('n', '.', '.<C-g>u', {noremap = true})
map('n', '?', '?<C-g>u', {noremap = true})
map('n', '!', '!<C-g>u', {noremap = true})
-- Jumplist mutation
map('n', '<expr> k', '(v:count > 5 ? "m\'" . v:count : "") . \'k\'', {noremap = true})
map('n', '<expr> j', '(v:count > 5 ? "m\'" . v:count : "") . \'j\'', {noremap = true})
-- moving text 
map('v', 'K', ':m \'>-2<CR>gv=gv', {noremap = true})
map('v', 'J', ':m \'>+1<CR>gv=gv', {noremap = true})
map('i', '<C-j>', '<esc>:m .+1<CR>==<insert>', {noremap = true})
map('i', '<C-k>', '<esc>:m .-2<CR>==<insert>', {noremap = true})

map('x', "<leader>p", '"_dP', {noremap = true})
