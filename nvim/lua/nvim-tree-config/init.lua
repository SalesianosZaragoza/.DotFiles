vim.g.nvim_tree_indent_markers = 0
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = true,
  ignore_ft_on_setup  = {},
  open_on_tab         = true,
  hijack_cursor       = false,
  update_cwd          = false,
  diagnostics = {
    enable = false,
    icons = {
      hint = BlindReturn("!",""),
      info = BlindReturn("I",""),
      warning = BlindReturn("W",""),
      error = BlindReturn("X",""),
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = BlindReturn(100, 25),
    height = BlindReturn(10 , 100),
    hide_root_folder = false,
    side = BlindReturn( 'top' , 'right'),
    mappings = {
      custom_only = false,
      list = {
         {
         key = {"<C-g>"},
       cb = tree_cb("cd"), mode = "n"
   }
      }
    },
    number = false,
    relativenumber = false
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}
