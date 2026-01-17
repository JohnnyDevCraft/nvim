return  
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "omnisharp",
      },
      automatic_installation = true,
    },
  }
