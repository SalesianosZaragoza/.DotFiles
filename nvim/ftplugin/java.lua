local M = {}

function M.setup()
    local on_attach = function(client, bufnr)
      require'jdtls.setup'.add_commands()
      require'jdtls'.setup_dap()
      require'lsp-status'.register_progress()
      require'compe'.setup {
          enabled = true;
          autocomplete = true;
          debug = false;
          min_length = 1;
          preselect = 'enable';
          throttle_time = 80;
          source_timeout = 200;
          incomplete_delay = 400;
          max_abbr_width = 100;
          max_kind_width = 100;
          max_menu_width = 100;
          documentation = true;

          source = {
            path = true;
            buffer = true;
            calc = true;
            vsnip = false;
            nvim_lsp = true;
            nvim_lua = true;
            spell = true;
            tags = true;
            snippets_nvim = false;
            treesitter = true;
          };
        }

      require'lspkind'.init()
      require'lspsaga'.init_lsp_saga()

      -- Kommentary
      vim.api.nvim_set_keymap("n", "<leader>/", "<plug>kommentary_line_default", {})
      vim.api.nvim_set_keymap("v", "<leader>/", "<plug>kommentary_visual_default", {})

      require'formatter'.setup{
          filetype = {
              java = {
                  function()
                      return {
                          exe = 'java',
                          args = { '-jar', os.getenv('HOME') .. '/.local/jars/google-java-format.jar', vim.api.nvim_buf_get_name(0) },
                          stdin = true
                      }
                  end
              }
          }
      }

      vim.api.nvim_exec([[
        augroup FormatAutogroup
          autocmd!
          autocmd BufWritePost *.java FormatWrite
        augroup end
      ]], true)

      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

      vim.api.nvim_exec([[
          hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
          hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
          hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
          augroup lsp_document_highlight
            autocmd!
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
          augroup END
      ]], false)

    end

    local root_markers = {'gradlew', 'pom.xml'}
    local root_dir = require('jdtls.setup').find_root(root_markers)
    local home = os.getenv('HOME')

if vim.fn.has "mac" == 1 then
  WORKSPACE_PATH = home .. "/workspace/"
  CONFIG = "mac"
elseif vim.fn.has "unix" == 1 then
  WORKSPACE_PATH = home .. "/workspace/"
  CONFIG = "linux"
else
  print "Unsupported system"
end
    local capabilities = {
        workspace = {
            configuration = true
        },
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = true
                }
            }
        }
    }

    local workspace_folder = home .. "/.workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
    print(workspace_folder)
    print(CONFIG)
    local config = {
        flags = {
          allow_incremental_sync = true,
        };
        capabilities = capabilities,
        on_attach = on_attach,
    }

    config.settings = {
        ['java.format.settings.url'] = home .. "/.config/nvim/language-servers/java-google-formatter.xml",
        ['java.format.settings.profile'] = "GoogleStyle",
        java = {
          signatureHelp = { enabled = true };
          contentProvider = { preferred = 'fernflower' };
          completion = {
            favoriteStaticMembers = {
              "org.hamcrest.MatcherAssert.assertThat",
              "org.hamcrest.Matchers.*",
              "org.hamcrest.CoreMatchers.*",
              "org.junit.jupiter.api.Assertions.*",
              "java.util.Objects.requireNonNull",
              "java.util.Objects.requireNonNullElse",
              "org.mockito.Mockito.*"
            }
          };
          sources = {
            organizeImports = {
              starThreshold = 9999;
              staticStarThreshold = 9999;
            };
          };
          codeGeneration = {
            toString = {
              template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
            }
          };
          configuration = {
            runtimes = {
              --{
              --  name = "JavaSE-11",
              --  path = home .. "/.sdkman/candidates/java/11.0.10-open/",
              --},
              --{
              --  name = "JavaSE-14",
              --  path = home .. "/.sdkman/candidates/java/14.0.2-open/",
              --},
            }
          };
        };
    }
    config.cmd = {

    -- 💀
    "java", -- or '/path/to/java11_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. home .. "/.local/share/nvim/lsp_servers/jdtls/lombok.jar",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    -- 💀
    "-jar",
    vim.fn.glob(home .. "/.local/share/nvim/lsp_servers/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
    -- Must point to the                                                     Change this to
    -- eclipse.jdt.ls installation                                           the actual version

    -- 💀
    "-configuration",
    home .. "/.local/share/nvim/lsp_servers/jdtls/config_" .. CONFIG,
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
    -- Must point to the                      Change to one of `linux`, `win` or `mac`
    -- eclipse.jdt.ls installation            Depending on your system.

    -- 💀
    -- See `data directory configuration` section in the README
    "-data",
    workspace_folder,
  }
    config.on_attach = on_attach
    config.on_init = function(client, _)
        client.notify('workspace/didChangeConfiguration', { settings = config.settings })
    end

    -- local jar_patterns = {
    --     '/dev/microsoft/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar',
    --     '/dev/dgileadi/vscode-java-decompiler/server/*.jar',
    --     '/dev/microsoft/vscode-java-test/server/*.jar',
    -- }

    -- local bundles = {}
    -- for _, jar_pattern in ipairs(jar_patterns) do
    --   for _, bundle in ipairs(vim.split(vim.fn.glob(home .. jar_pattern), '\n')) do
    --     if not vim.endswith(bundle, 'com.microsoft.java.test.runner.jar') then
    --       table.insert(bundles, bundle)
    --     end
    --   end
    -- end

    local extendedClientCapabilities = require'jdtls'.extendedClientCapabilities
    extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
    config.init_options = {
      -- bundles = bundles;
      extendedClientCapabilities = extendedClientCapabilities;
    }

    -- UI
    local finders = require'telescope.finders'
    local sorters = require'telescope.sorters'
    local actions = require'telescope.actions'
    local pickers = require'telescope.pickers'
    require('jdtls.ui').pick_one_async = function(items, prompt, label_fn, cb)
      local opts = {}
      pickers.new(opts, {
        prompt_title = prompt,
        finder    = finders.new_table {
          results = items,
          entry_maker = function(entry)
            return {
              value = entry,
              display = label_fn(entry),
              ordinal = label_fn(entry),
            }
          end,
        },
        sorter = sorters.get_generic_fuzzy_sorter(),
        attach_mappings = function(prompt_bufnr)
          actions.goto_file_selection_edit:replace(function()
            local selection = actions.get_selected_entry(prompt_bufnr)
            actions.close(prompt_bufnr)

            cb(selection.value)
          end)

          return true
        end,
      }):find()
    end

    -- Server
    require('jdtls').start_or_attach(config)
end
M.setup()
