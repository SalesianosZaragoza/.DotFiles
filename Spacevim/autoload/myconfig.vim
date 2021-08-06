function! myconfig#after() abort
  let g:lsp_log_verbose = 1
  if has("nvim")  
    let g:lsp_log_file = expand('~/vim-lsp.log')
    lua require'lspconfig'.ccls.setup{}
    lua require'lspconfig'.clangd.setup{}
    lua require'lspconfig'.pyright.setup{}
  endif
  " Required for operations modifying multiple buffers like rename.
  set hidden

  let g:LanguageClient_serverCommands = {
      \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
      \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
      \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
      \ 'cpp': ['/usr/bin/clangd'],
      \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
      \ }
  let g:LanguageClient_devel = 1 " Use rust debug build
  let g:LanguageClient_loggingLevel = 'DEBUG' " Use highest logging level
  " note that if you are using Plug mapping you should not use `noremap` mappings.
  nmap <F5> <Plug>(lcn-menu)
  " Or map each action separately
  nmap <silent>K <Plug>(lcn-hover)
  nmap <silent> gd <Plug>(lcn-definition)
  nmap <silent> <F2> <Plug>(lcn-rename)
  " keeping it centered
  nnoremap n nzzzv
  nnoremap N Nzzzv
  nnoremap J nzJ`z
  " undo break points
  inoremap , ,<C-g>u
  inoremap . .<C-g>u
  inoremap ? ?<C-g>u
  inoremap ! !<C-g>u
  " Jumplist mutation
  nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
  nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
  " moving text 
  vnoremap J :m '>+1<CR>gv=gv
  vnoremap K :m '>-2<CR>gv=gv
  nnoremap <leader>j :m .+1<CR>==
  inoremap <C-j> <esc>:m .+1<CR>==
  inoremap <C-k> <esc>:m .-2<CR>==
  nnoremap <leader>k :m .-2<CR>==
endfunction

function! myconfig#before() abort
  let g:spacevim_disabled_plugins=['deoplete.nvim']
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
      \ 'neoclide/coc.nvim'
      \ ]
  endif
endfunction
