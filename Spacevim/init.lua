

vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" }
-- Don't show the dumb matching stuff.
vim.opt.shortmess:append "c"

require('plugins')
require('keybindings')
require('options')
require('nvim-tree-config')
require('lualine-config')
require('bufferline-config')
require('treesitter-config')
require('autopairs-config')
require('whichkey-config')
require('telescope-config')
require('colorizer-config')
require('dashboard-config')
require('blankline-config')
require('format-config')
require('toggleterm-config')
require('comment-config')
require('bufferline')
require('dap')
require('octo')
require('terminal')
require("refactor")
require('lsp')
