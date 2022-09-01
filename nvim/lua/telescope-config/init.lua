local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        layout_config = {
          width = BlindReturn( 0.99 , 0.75),
          prompt_position = "top",
          preview_cutoff = 50,
          horizontal = {mirror = false},
          vertical = {mirror = false},
        },
        find_command = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
        prompt_prefix = BlindReturn( "query: ", " " ),
        selection_caret = BlindReturn( ">", " "),
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "vertical",
        file_sorter = require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter =require'telescope.sorters'.get_generic_fuzzy_sorter,
        path_display = {},
        winblend = 0,
        border = {},
        borderchars = BlindReturn( {'', '', '', '', '', '', '', ''}, {'─', '│', '─', '│', '╭', '╮', '╯', '╰'} ),
        color_devicons = true,
        use_less = true,
        set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default + actions.center
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            }
        }
    },
    extensions = {
    arecibo = {
    ["selected_engine"]   = 'npmjs',
    ["url_open_command"]  = 'xdg-open',
    ["show_http_headers"] = false,
    ["show_domain_icons"] = false,
  },
    bookmarks = {
      -- Available: 'brave', 'google_chrome', 'safari', 'firefox', 'firefox_dev'
      selected_browser = 'google_chrome',
      

      -- Either provide a shell command to open the URL
      url_open_command = 'xdg-open',

      -- Or provide the plugin name which is already installed
      -- Available: 'vim_external', 'open_browser'
      url_open_plugin = 'open_browser',
      firefox_profile_name = nil,
    }
  }
}

require('telescope').load_extension('gh')
require'telescope'.load_extension('zoxide')
require('telescope').load_extension('bookmarks')
require('telescope').load_extension('heading')
require("telescope").load_extension("vimspector")
require('telescope').load_extension('coc')
require'telescope'.load_extension('openbrowser')
require('telescope').load_extension('tmuxinator')
require('telescope').load_extension('packer')
require('telescope').load_extension('media_files')
require'telescope'.load_extension'z'
require('telescope').load_extension('dap')
require('telescope').load_extension('scaladex')
require('telescope').load_extension('changes')
require('telescope').load_extension('ctags_outline')
require('telescope').load_extension('command_palette')
require('telescope').load_extension('env')
