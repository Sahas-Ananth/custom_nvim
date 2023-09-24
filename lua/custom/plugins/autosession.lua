-- Session manager for Neovim
--
return {
  'rmagatti/auto-session',
  config = function()
    require("auto-session").setup {
      log_level = "info",
      auto_save_enabled = nil,
      auto_restore_enabled = nil,
      auto_session_suppress_dirs = { "~/", "/"},
      pre_save_cmds = {":Neotree toggle"},
      post_restore_cmds = {":Neotree toggle reveal"},
    }
  end
}
