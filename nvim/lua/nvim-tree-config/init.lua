if (vim.g.visual_impairing) then
vim.g.nvim_tree_show_icons = {
  folders = 0,
  files = 0,
  git = 0,
  folder_arrows = 0,
}
end
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

local blind={
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
      hint ="?",
      info ="I",
      warning ="W",
      error ="E",
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
    width = 25,
    hide_root_folder = false,
    side = 'right',
    mappings = {
      custom_only = false,
      list = {
         {
         key = {"<C-g>"},
       cb = tree_cb("cd"), mode = "n"
   }
      }
    },
    float = {
          enable =true,
          open_win_config = {
            relative = "editor",
            border = "none",
            width = 100,
            height = 30,
            row = 1,
            col = 1,
          },
        },
    number = false,
    relativenumber = false
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
}

local normal ={
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
      hint ="",
      info ="",
      warning ="",
      error ="",
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
    width =25,
    hide_root_folder = false,
    side ='right',
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
  },
}

require'nvim-tree'.setup(BlindReturn(blind ,normal))
