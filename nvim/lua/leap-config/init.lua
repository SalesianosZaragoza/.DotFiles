require('leap').add_default_mappings()
vim.keymap.set({'n', 'x', 'o'}, '<C-s>', function() require'leap-ast'.leap() end, {})
