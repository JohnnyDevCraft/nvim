return{
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          cs = { "csharpier" },
          -- you can add prettier/eslint here later if you want
        },
      })
    end,
  }

