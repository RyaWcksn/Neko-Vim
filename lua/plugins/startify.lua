local g = vim.g
g.startify_custom_header = {
'',
'',
'███    ██ ███████ ██   ██  ██████      ██    ██ ██ ███    ███', 
'████   ██ ██      ██  ██  ██    ██     ██    ██ ██ ████  ████',
'██ ██  ██ █████   █████   ██    ██     ██    ██ ██ ██ ████ ██',
'██  ██ ██ ██      ██  ██  ██    ██      ██  ██  ██ ██  ██  ██',
'██   ████ ███████ ██   ██  ██████        ████   ██ ██      ██',
'',
'',
}
g.webdevicons_enable_startify = 1
g.startify_enable_special = 0
g.startify_session_autoload = 1
g.startify_session_delete_buffers = 1
g.startify_change_to_vcs_root = 1
g.startify_fortune_use_unicode = 1
g.startify_session_persistence = 1
g.startify_lists = {
  { type = 'bookmarks', header = { '   Bookmarks' } }
}
g.startify_bookmarks = {
  { i = '~/.config/nvim/init.lua'},
  { z = '~/.zshrc'},
  { o = '~/Document/org/AGENDA.org'},
}
