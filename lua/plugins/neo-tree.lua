return {  
    
	  "nvim-neo-tree/neo-tree.nvim",
	  branch = "v3.x",
	  dependencies = {
		  "nvim-lua/plenary.nvim",
		  "nvim-tree/nvim-web-devicons",
		  "MunifTanjim/nui.nvim",
	  },
	  config = function()
		  require("neo-tree").setup({
			  filesystem = {
				  use_libuv_file_watcher = true,
				  filtered_items = {
					  visible = true,
					  hide_dotfiles = false,
					  hide_gitignored = false,
				  },
			  },
		  })
		  vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
		  vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
		  vim.keymap.set("n", "<leader>th", function()
			  local state = require("neo-tree.sources.manager").get_state("filesystem")
			  require("neo-tree.sources.filesystem.commands").toggle_hidden(state)
		  end, { desc = "Neo-tree toggle hidden files" })
		  vim.keymap.set("n", "<leader>tg", function()
			  local state = require("neo-tree.sources.manager").get_state("filesystem")
			  state.filtered_items.hide_gitignored = not state.filtered_items.hide_gitignored
			  require("neo-tree.sources.filesystem.commands").refresh(state)
		  end, { desc = "Neo-tree toggle gitignored files" })
	  end
}
