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
       docker = {
      theme = "ivy",
      binary = "docker", -- in case you want  to use podman or something
      log_level = vim.log.levels.INFO,
      init_term = function(command)
        -- Function used to initialize the terminal with the provided command
        -- by default a new tab with `'term ' .. command` is used.
        -- Example for using Floaterm instead:
        vim.cmd("FloatermNew")
        vim.cmd("FloatermSend " .. command)
      end
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
    },
    command_palette = {
      {"File",
        { "entire selection (C-a)", ':call feedkeys("GVgg")' },
        { "save current file (C-s)", ':w' },
        { "save all files (C-A-s)", ':wa' },
        { "quit (C-q)", ':qa' },
        { "file browser (C-i)", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
        { "search word (A-w)", ":lua require('telescope.builtin').live_grep()", 1 },
        { "git files (A-f)", ":lua require('telescope.builtin').git_files()", 1 },
        { "files (C-f)",     ":lua require('telescope.builtin').find_files()", 1 },
      },
      {"Help",
        { "tips", ":help tips" },
        { "cheatsheet", ":help index" },
        { "tutorial", ":help tutor" },
        { "summary", ":help summary" },
        { "quick reference", ":help quickref" },
        { "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
      },
      {"Vim",
        { "reload vimrc", ":source $MYVIMRC" },
        { 'check health', ":checkhealth" },
        { "jumps (Alt-j)", ":lua require('telescope.builtin').jumplist()" },
        { "commands", ":lua require('telescope.builtin').commands()" },
        { "command history", ":lua require('telescope.builtin').command_history()" },
        { "registers (A-e)", ":lua require('telescope.builtin').registers()" },
        { "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },
        { "vim options", ":lua require('telescope.builtin').vim_options()" },
        { "keymaps", ":lua require('telescope.builtin').keymaps()" },
        { "buffers", ":Telescope buffers" },
        { "search history (C-h)", ":lua require('telescope.builtin').search_history()" },
        { "paste mode", ':set paste!' },
        { 'cursor line', ':set cursorline!' },
        { 'cursor column', ':set cursorcolumn!' },
        { "spell checker", ':set spell!' },
        { "relative number", ':set relativenumber!' },
        { "search highlighting (F12)", ':set hlsearch!' },
      }
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
require('telescope').load_extension('command_palette')
require('telescope').load_extension('tmuxinator')
require('telescope').load_extension('media_files')
require'telescope'.load_extension'z'
require('telescope').load_extension('dap')
require('telescope').load_extension('scaladex')
require('telescope').load_extension('changes')
require('telescope').load_extension('ctags_outline')
require('telescope').load_extension('command_palette')
require('telescope').load_extension('env')
-- require("telescope").load_extension("refactoring")
require("telescope").load_extension("notify")
require("telescope").load_extension("githubcoauthors")
require("telescope").load_extension("lines")
require("telescope").load_extension("undo")
require("telescope").load_extension("docker")
