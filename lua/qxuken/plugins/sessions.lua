return {
  -- Auto Session takes advantage of Neovim's existing session management capabilities to provide seamless automatic session management.
  {
    'rmagatti/auto-session',
    lazy = false,
    opts = { auto_session_suppress_dirs = { '~/', '~/projects', '~/local-projects', '~/Downloads', '/' } },
  },
}
