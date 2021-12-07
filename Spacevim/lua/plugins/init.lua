require'packer.luarocks'.install_commands()
return require('packer').startup(function(use)
-- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
  use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}
  use {'windwp/nvim-ts-autotag'}
  use {'p00f/nvim-ts-rainbow'}
  use {'windwp/nvim-autopairs'}
  use {'folke/which-key.nvim'}
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}}
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'onsails/lspkind-nvim'
  use 'norcalli/nvim-colorizer.lua'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('gitsigns').setup {current_line_blame = true}
    end
  }
  use 'glepnir/dashboard-nvim'
  use "lukas-reineke/indent-blankline.nvim"
  use 'lukas-reineke/format.nvim'
  use "akinsho/toggleterm.nvim"
  use "terrortylor/nvim-comment"
  use 'szw/vim-maximizer'
  use 'puremourning/vimspector'
  use 'Shougo/vimproc.vim'
  use 'hashivim/vim-terraform'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-treesitter/playground'
  use 'nvim-treesitter/nvim-treesitter'
  use {'neoclide/coc.nvim', branch = 'release'} 
  use 'kyazdani42/nvim-web-devicons'
  use 'scalameta/nvim-metals'
  use 'sudormrfbin/cheatsheet.nvim'
  use 'romgrk/nvim-treesitter-context'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip-integ' 
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-copilot'
  use 'github/copilot.vim'
  use {'tzachar/cmp-tabnine', run = './install.sh'}
  use 'crispgm/telescope-heading.nvim'
  use 'nvim-telescope/telescope-packer.nvim'
  use 'nvim-telescope/telescope-vimspector.nvim'
  use 'fannheyward/telescope-coc.nvim'
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'tpope/vim-dadbod'
  use 'kristijanhusak/vim-dadbod-ui'
  use 'kristijanhusak/vim-dadbod-completion'
  use 'chipsenkbeil/distant.nvim'
  use 'ms-jpq/coq_nvim'
  use 'mfussenegger/nvim-dap-python'
  use 'mfussenegger/nvim-jdtls'
  use 'nvim-telescope/telescope-media-files.nvim'
  use { 'nvim-telescope/telescope-z.nvim',
  requires = {
    {'nvim-lua/plenary.nvim'},
    {'nvim-lua/popup.nvim'},
    {'nvim-telescope/telescope.nvim'},
  },
  config = function()
    require'telescope'.load_extension'z'
    -- ... other telescope settings
  end,
}
  use 'onsails/lspkind-nvim'
  use 'rafamadriz/friendly-snippets'
  use 'kitagry/vs-snippets'
  use 'petertriho/cmp-git'
  use 'TC72/telescope-tele-tabby.nvim'
  use 'tjdevries/complextras.nvim'
  use 'folke/tokyonight.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'unblevable/quick-scope'
  use 'tamago324/telescope-openbrowser.nvim'
  use 'tyru/open-browser.vim'
  use 'camgraff/telescope-tmux.nvim'
  use 'norcalli/nvim-terminal.lua'
  use 'danielpieper/telescope-tmuxinator.nvim'
  use_rocks 'lua-http-parser'
  use {
    "nvim-telescope/telescope-arecibo.nvim",
    rocks = {"openssl", "lua-http-parser"}
  }
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
    }
}
  use 'jvgrootveld/telescope-zoxide'
  use 'dhruvmanila/telescope-bookmarks.nvim'
  use 'nvim-telescope/telescope-github.nvim'
  use 'cljoly/telescope-repo.nvim'

  use {
  "AckslD/nvim-neoclip.lua",
  config = function()
    require('neoclip').setup()
  end,
}
  use 'phaazon/hop.nvim'
  use 'L3MON4D3/LuaSnip'
  use 'kristijanhusak/vim-carbon-now-sh'
  use 'pwntester/octo.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'liuchengxu/vim-which-key'
  use 'AckslD/nvim-whichkey-setup.lua'
  use 'sindrets/diffview.nvim'
  use 'liuchengxu/vim-clap'
 end)


