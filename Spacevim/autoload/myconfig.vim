function! myconfig#after() abort
  let g:lsp_log_verbose = 1
  if has("nvim")  
    let g:lsp_log_fie = expand('~/nvim-lsp.log')
    " Expand
    imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
    smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

    " Expand or jump
    imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
    smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

    " Jump forward or backward
    imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
    smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
    imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
    smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

    " Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
    " See https://github.com/hrsh7th/vim-vsnip/pull/50
    nmap        s   <Plug>(vsnip-select-text)
    xmap        s   <Plug>(vsnip-select-text)
    nmap        S   <Plug>(vsnip-cut-text)
    xmap        S   <Plug>(vsnip-cut-text)
    
    luafile ~/GIT/ConfigLinuxFiles/Spacevim/init.lua
  endif
  " Required for operations modifying multiple buffers like rename.
  set hidden
endfunction

function! myconfig#before() abort
  let g:tokyonight_style = 'night'
  let g:python3_host_prog = '/usr/bin/python3'
  let g:vimspector_enable_mappings='VISUAL_STUDIO'
  if !has("nvim")
    " disabled plugins
    let g:spacevim_disabled_plugins=[
      \ 'neovim/nvim-lspconfig',
      \ 'nvim-treesitter/nvim-treesitter',
      \ 'nvim-treesitter/playground',
      \ 'nvim-telescope/telescope.nvim',
      \ 'nvim-lua/plenary.nvim',
      \ 'neovim/lsp-config',
      \ 'hrsh7th/cmp-nvim-lsp',
      \ 'hrsh7th/cmp-buffer',
      \ 'hrsh7th/cmp-path',
      \ 'hrsh7th/cmp-cmdline',
      \ 'hrsh7th/nvim-cmp',
      \ 'neoclide/coc.nvim',
      \ 'romgrk/nvim-treesitter-context',
      \ 'chipsenkbeil/distant.nvim',
      \ 'ms-jpq/coq_nvim',
      \ 'github/copilot.vim',
      \ 'plugin/nvim-treesitter.vim'
      \ ]
  endif
  if has("nvim")  
    let g:spacevim_disabled_plugins=[
      \ 'deoplete.nvim',
      \ 'CompleteParameter.vim',
      \ 'vim-which-key'
      \ ]
  endif
endfunction
