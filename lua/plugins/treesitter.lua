return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    priority = 1000,
    build = ":TSUpdate",
    config = function()
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if not ok then
        -- Don't crash on first install; restart after :Lazy sync.
        return
      end

      configs.setup({
        ensure_installed = {
          "c_sharp",
          "lua",
          "json",
          "yaml",
          "xml",
          "bash",
          "html",
          "typescript",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  }
