return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<leader>ff', function()
        builtin.find_files({
          hidden = true,
          no_ignore = true,
        })
      end, {})
      vim.keymap.set('n', '<leader>fg', function()
        builtin.live_grep({
          additional_args = function()
            return { "--hidden", "--no-ignore", "--glob", "!.git/*" }
          end,
        })
      end, {})
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require('telescope').setup({
        extensions = {
          ["ui-select"] = {
            require('telescope.themes').get_dropdown {}
          }
        }
      })

      require('telescope').load_extension('ui-select')
    end
  }
}
