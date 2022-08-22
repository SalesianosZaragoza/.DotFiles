require'packer.luarocks'.install_commands()
return require('packer').startup(function(use)
-- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate", config = "require('treesitter-config')"}
  use {
    'tamton-aquib/staline.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = "require('staline-config')"
  }
  use { "LinArcX/telescope-command-palette.nvim" }
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }
  use {'windwp/nvim-ts-autotag', event = "InsertEnter", after = "nvim-treesitter"}
  use {'p00f/nvim-ts-rainbow', after = "nvim-treesitter"}
  use {'windwp/nvim-autopairs', config = "require('autopairs-config')", after = "nvim-cmp"}
  use {'folke/which-key.nvim', event = "BufWinEnter", config = "require('whichkey-config')"}
  use {'nvim-telescope/telescope.nvim'}
  use { "LinArcX/telescope-env.nvim" }
  use ( "williamboman/mason-lspconfig.nvim" )
  use {'neovim/nvim-lspconfig', config = "require('lsp')"}
  use {'hrsh7th/cmp-nvim-lsp'}
  use "folke/lua-dev.nvim"
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-vsnip'}
  use {'hrsh7th/vim-vsnip'}
  use {'onsails/lspkind-nvim'}
  use {'norcalli/nvim-colorizer.lua', config = "require('colorizer-config')", event = "BufRead"}
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = "require('gitsigns')"
  }
  use {'glepnir/dashboard-nvim', cmd = "Dashboard", config = "require('dashboard-config')"}
  use {"lukas-reineke/indent-blankline.nvim", config = "require('blankline-config')", event = "BufRead"}
  use {"akinsho/toggleterm.nvim",branch='main', config = "require('toggleterm-config')"}
  use {"terrortylor/nvim-comment", config = "require('comment-config')"}
  use {'tami5/lspsaga.nvim', config = "require('lspsaga-config')"}
  use {'williamboman/nvim-lsp-installer'}
  use {'jose-elias-alvarez/null-ls.nvim', config = "require('null-ls-config')"}
  use {"folke/zen-mode.nvim", config = 'require("zen-mode-config")'}
  use {"folke/twilight.nvim", config = "require('twilight-config')"}
  use {'andweeb/presence.nvim', config = "require('presence-config')"}
  use 'szw/vim-maximizer'
  use 'puremourning/vimspector'
  use 'Shougo/vimproc.vim'
  use 'hashivim/vim-terraform'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-treesitter/playground'
  use {'neoclide/coc.nvim', branch = 'release'} 
  use 'kyazdani42/nvim-web-devicons'
  use 'scalameta/nvim-metals'
  use 'sudormrfbin/cheatsheet.nvim'
  use 'romgrk/nvim-treesitter-context'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip-integ' 
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  --use 'hrsh7th/cmp-copilot'
  use 'github/copilot.vim'
  use {'tzachar/cmp-tabnine', run = './install.sh'}
  use 'crispgm/telescope-heading.nvim'
  use 'nvim-telescope/telescope-packer.nvim'
  use 'nvim-telescope/telescope-vimspector.nvim'
  use 'fannheyward/telescope-coc.nvim'
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'
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
  }}
  use { 'softinio/scaladex.nvim' }
  use 'onsails/lspkind-nvim'
  use { "williamboman/mason.nvim", 
    config = function()
      require("mason").setup()
    end,
    }
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
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
    }
}
  use { 'kkharji/lspsaga.nvim' }  -- nightly
  use 'fcying/telescope-ctags-outline.nvim'
  use 'jvgrootveld/telescope-zoxide'
  use 'dhruvmanila/telescope-bookmarks.nvim'
  use 'nvim-telescope/telescope-github.nvim'
  use 'cljoly/telescope-repo.nvim'
  use { "LinArcX/telescope-changes.nvim" }
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
  use 'liuchengxu/vim-which-key'
  use 'AckslD/nvim-whichkey-setup.lua'
  use 'sindrets/diffview.nvim'
  use 'liuchengxu/vim-clap'
use({
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  config = function()
    require("lsp_lines").setup()
  end,
})
 end)

