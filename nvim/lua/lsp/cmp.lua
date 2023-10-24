local lspkind = require "lspkind"
local cmp = require "cmp"
local luasnip = require 'luasnip'
cmp.setup {
  enabled = function()
    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
        or require("cmp_dap").is_dap_buffer()
  end,
  experimental = {
    -- I like the new menu better! Nice work hrsh7th
    native_menu = false,


    -- Let's play with this for a day or two
    ghost_text = false,
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  sorting = {
    -- TODO: Would be cool to add stuff like "See variable names before method names" in rust, or something like that.
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,

      -- copied from cmp-under, but I don't think I need the plugin for this.
      -- I might add some more of my own.
      function(entry1, entry2)
        local _, entry1_under = entry1.completion_item.label:find "^_+"
        local _, entry2_under = entry2.completion_item.label:find "^_+"
        entry1_under = entry1_under or 0
        entry2_under = entry2_under or 0
        if entry1_under > entry2_under then
          return false
        elseif entry1_under < entry2_under then
          return true
        end
      end,

      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  formatting = {
    -- Youtube: How to set up nice formatting for your sources.
    format = lspkind.cmp_format {
      mode = 'symbol_text',
      preset = 'default',
      menu = {
        buffer = "[buf]",
        treesitter = "[ts]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        vsnip = "[snip]",
        gh_issues = "[issues]",
        cmp_tabnine = "[TN]",
        copilot = "[copilot]",
      },
    },
  },

  mapping = {
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ["<C-c>"] = cmp.mapping.close(),
    ['<Down>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<Up>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<Tab>'] = cmp.mapping(
          cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          }),{ "i", "c" }
    ),
    ['<Cr>'] = cmp.mapping(
          cmp.mapping.confirm ({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          }), { "i", "c" }
    ),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<S-Tab>'] = cmp.mapping(
          cmp.mapping.confirm ({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),{"i","c"}),
    ['<S-Cr>'] = cmp.mapping(
          cmp.mapping.confirm ({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),{"i","c"}),
  },
  sources = cmp.config.sources({
    { name = 'gh_issues' },
    { name = 'nvim_lua' },
    { name = 'cmp_tabnine' },
    { name = 'nvim_lsp' },
    { name = 'copilot' },
    { name = 'treesitter' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'rg' },
    { name = 'vsnip' },
    { name = 'buffer', keyword_length = 5 },
    { name = 'plugins' },
    { name = 'tags' },
    { name = 'npm', keyword_length = 4 },
    { name = 'zsh' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'nvim_lsp_document_symbol' },
    {
      name = "dictionary",
      keyword_length = 2,
    },
    {
      name = 'spell',
      option = {
        keep_all_entries = false,
        enable_in_context = function()
          return true
        end,
      },
    },
    {
      name = 'look',
      keyword_length = 2,
      option = {
        convert_case = true,
        loud = true
        --dict = '/usr/share/dict/words'
      }
    },

    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  }),
  --   sources = {
  --   },
}

cmp.setup.cmdline("/", {
  completion = {
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp_document_symbol" },
  }, {
    -- { name = "buffer", keyword_length = 5 },
  }),
})

require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
  sources = {
    { name = "dap" },
  },
})

cmp.setup.filetype('gitcommit', {
  sources = {
    { name = 'commit' }
  }
})

--[[
" Setup buffer configuration (nvim-lua source only enables in Lua filetype).
"
" ON YOUTUBE I SAID: This only _adds_ sources for a filetype, not removes the global ones.
"
" BUT I WAS WRONG! This will override the global setup. Sorry for any confusion.
autocmd FileType lua lua require'cmp'.setup.buffer {
\   sources = {
\     { name = 'nvim_lua' },
\     { name = 'buffer' },
\   },
\ }
--]]

-- Add vim-dadbod-completion in sql files
_ = vim.cmd [[
  augroup DadbodSql
    au!
    autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer { sources = { { name = 'vim-dadbod-completion' } } }
  augroup END
]]

_ = vim.cmd [[
  augroup CmpZsh
    au!
    autocmd Filetype zsh lua require'cmp'.setup.buffer { sources = { { name = "zsh" }, } }
  augroup END
]]

--[[
" Disable cmp for a buffer
autocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
--]]


