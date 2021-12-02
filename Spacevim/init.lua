
require('lualine').setup {
  options = {
    theme = 'tokyonight'
  }
}


vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" }


-- Don't show the dumb matching stuff.
vim.opt.shortmess:append "c"

local lspkind = require "lspkind"
lspkind.init()


require('plugins')
require('keybindings')
require('options')
require('nvim-tree-config')
require('lualine-config')
require('bufferline-config')
require('treesitter-config')
require('autopairs-config')
-- require('whichkey-config')
require('telescope-config')
require('colorizer-config')
require('dashboard-config')
require('blankline-config')
require('format-config')
require('toggleterm-config')
require('comment-config')
require('lsp')
