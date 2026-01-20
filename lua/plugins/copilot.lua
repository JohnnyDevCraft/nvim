return {

  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "github/copilot.vim" },
    { "nvim-lua/plenary.nvim", branch = "master" },
  },
  build = "make tiktoken",
  opts = {
  
  },
  config = function()
    vim.keymap.set("n", "<Leader>zc", ":CopilotChat<CR>")
		vim.keymap.set("n", "<Leader>ze", ":CopilotChatExplain<CR>")
		vim.keymap.set("n", "<Leader>zr", ":CopilotChatReview<CR>")
		vim.keymap.set("n", "<Leader>zf", ":CopilotChatFix<CR>")

  end,
 }
