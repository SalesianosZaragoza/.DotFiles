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
  " LSP config (the mappings used in the default file don't quite work right)
  nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
  nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
  nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
  nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
  nnoremap <silent> <S-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
  " keeping it centered
  nnoremap n nzzzv
  nnoremap N Nzzzv
  nnoremap J mzJ`z
  " undo break points
  inoremap , ,<C-g>u
  inoremap . .<C-g>u
  inoremap ? ?<C-g>u
  inoremap ! !<C-g>u
  " Jumplist mutation
  nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
  nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
  " moving text 
  vnoremap K :m '>-2<CR>gv=gv
  vnoremap J :m '>+1<CR>gv=gv
  nnoremap <leader>j :m .+1<CR>==
  inoremap <C-j> <esc>:m .+1<CR>==
  inoremap <C-k> <esc>:m .-2<CR>==
  nnoremap <leader>k :m .-2<CR>==
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
      \ 'CompleteParameter.vim'
      \ ]
  endif
endfunction
