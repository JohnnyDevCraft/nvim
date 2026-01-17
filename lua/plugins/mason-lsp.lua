return  
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "omnisharp",
        "angular-language-server",
      },
      automatic_installation = true,
    },
  }
