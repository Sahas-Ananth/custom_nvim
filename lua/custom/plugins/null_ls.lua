-- Plugin which will do the linting and formatting.


return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = {
  },
  config = function()
    -- Some setup so as to avoid conflict with LSP formatting.
    -- local lsp_formatting = function(bufnr)
    --   vim.lsp.buf.format({
    --     filter = function(client)
    --       -- apply whatever logic you want (in this example, we'll only use null-ls)
    --       return client.name == "null-ls"
    --     end,
    --     bufnr = bufnr,
    --     timeout_ms = 5000,
    --   })
    -- end

    -- if you want to set up formatting on save, you can use this as a callback
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local null_ls = require("null-ls")

    null_ls.setup({
      -- Sources for linting, formatting, Code Actions, etc.
      sources = {
        -- Git.
        -- null_ls.builtins.code_actions.gitsigns,
        -- null_ls.builtins.diagnostics.commitlint,
        -- null_ls.builtins.diagnostics.gitlint,

        -- Python.
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,

        -- Bash.
        null_ls.builtins.formatting.beautysh,
        null_ls.builtins.diagnostics.shellcheck,
        -- null_ls.builtins.formatting.shfmt,

        -- YAML.
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.formatting.yamlfmt,

        -- HTML, CSS, JS.
        null_ls.builtins.formatting.prettierd,

        -- C++.
        -- null_ls.builtins.diagnostics.cppcheck,
        -- null_ls.builtins.diagnostics.cpplint,

        -- Cmake / Make.
        -- null_ls.builtins.diagnostics.checkmake,
        -- null_ls.builtins.diagnostics.cmake_lint,
        -- null_ls.builtins.formatting.cmake_format,
        -- null_ls.builtins.formatting.gersemi,

        -- LaTeX.
        -- null_ls.builtins.diagnostics.chktex,
        null_ls.builtins.formatting.latexindent,

        -- Misc.
        -- null_ls.builtins.completion.spell,
        -- null_ls.builtins.diagnostics.dotenv_linter,
        -- null_ls.builtins.diagnostics.misspell,
        -- null_ls.builtins.formatting.trim_newlines,
        -- null_ls.builtins.formatting.trim_whitespace,
        -- null_ls.builtins.hover.dictionary,
      },
      -- add to your shared on_attach callback
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_buf_create_user_command(bufnr, 'Format', function()
            vim.lsp.buf.format({
              filter = function(client)
                -- apply whatever logic you want (in this example, we'll only use null-ls)
                return client.name == "null-ls"
              end,
              bufnr = bufnr,
              timeout_ms = 10000,
            })
          end, { desc = 'Format current buffer with LSP' })

          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            command = "undojoin | Format", -- Might be helpful to have a clean undo history.
            -- callback = function()
            --   lsp_formatting(bufnr)
            -- end,
          })
        end
      end

    })
  end
}
