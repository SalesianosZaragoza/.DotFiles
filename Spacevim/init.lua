vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" }
-- Don't show the dumb matching stuff.
vim.opt.shortmess:append "c"
require('plugins')
require('keybindings')
require('options')
require('telescope-config')
require('dap')
require('octo')
require('terminal')
require("refactor")
