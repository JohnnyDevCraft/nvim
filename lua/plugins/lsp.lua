return {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Capabilities for nvim-cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if ok_cmp then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      -----------------------------------------------------------------------
      -- OmniSharp (.NET / C#)
      -----------------------------------------------------------------------
      local omnisharp_cmd = vim.fn.stdpath("data") .. "/mason/bin/omnisharp"

      vim.lsp.config("omnisharp", {
        cmd = { omnisharp_cmd },
        capabilities = capabilities,
        settings = {
          omnisharp = {
            enableRoslynAnalyzers = true,
            organizeImportsOnFormat = true,
            enableImportCompletion = true,
          },
        },
      })
      vim.lsp.enable("omnisharp")

      -----------------------------------------------------------------------
      -- Angular Language Server
      --
      -- Mason installs ngserver to:
      --   ~/.local/share/nvim/mason/bin/ngserver
      -- The probe locations are critical for Angular LS to function reliably.
      -----------------------------------------------------------------------
      local ngserver = vim.fn.stdpath("data") .. "/mason/bin/ngserver"
      local ng_pkg = vim.fn.stdpath("data") .. "/mason/packages/angular-language-server/node_modules"

      vim.lsp.config("angularls", {
        cmd = {
          ngserver,
          "--stdio",
          "--tsProbeLocations",
          ng_pkg,
          "--ngProbeLocations",
          ng_pkg,
        },
        capabilities = capabilities,
        filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
        root_markers = { "angular.json", "nx.json", "project.json", ".git" },
      })
      vim.lsp.enable("angularls")

      -----------------------------------------------------------------------
      -- LSP keymaps on attach
      -----------------------------------------------------------------------
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })
    end,
  }
