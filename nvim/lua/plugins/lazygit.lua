return {
  "kdheepak/lazygit.nvim",
  lazy = true,
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
  },
  config = function()
    -- Configure lazygit
    vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
    vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
    vim.g.lazygit_floating_window_corner_chars = {'╭', '╮', '╰', '╯'} -- customize lazygit popup window corner characters
    vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
    vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed
    
    -- Configure lazygit to use the current file's directory
    vim.g.lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1
    vim.g.lazygit_config_file_path = '' -- custom config file path
  end,
}
