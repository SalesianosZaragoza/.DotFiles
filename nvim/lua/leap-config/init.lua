require('leap').add_default_mappings()
vim.keymap.set({'n', 'x', 'o'}, '<C-M-t>', function() require'leap-ast'.leap() end, {})

