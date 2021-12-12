vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" }
-- Don't show the dumb matching stuff.
vim.opt.shortmess:append "c"
require('options')
require('plugins')
require('keybindings')
require('telescope-config')
require('dap')
require('octo')
require('terminal')
require("refactor")
require("gitsigns")
require('nvim-tree-config')
