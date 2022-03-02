local g = vim.g
g.dashboard_disable_at_vimenter = 0 -- dashboard is disabled by default
g.dashboard_disable_statusline = 1
g.dashboard_default_executive = "telescope"


g.dashboard_custom_header = {
  '⣿⡿⢿⡿⣿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿',
  '⣿⡇⠀⢀⣀⠀⠀⠀⠈⠉⠛⠛⣽⣯⣭⣭⣽⣭⣟⣿⠛⠉⠁⠀⠀⠀⠀⠀⢸⣿',
  '⣿⣇⠀⠨⡿⠉⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿',
  '⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿',
  '⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿',
  '⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿',
  '⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠰⠀⠀⠀⠀⠀⠀⠀⢠⢀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿',
  '⡇⢠⠀⠀⢠⠀⠀⠀⢠⠠⠄⠀⢃⠀⠀⠀⠀⠀⡆⠀⢤⠀⢀⠀⠀⠀⠀⣿⣿⣿',
  '⡇⡰⠀⠀⢨⠀⠀⠀⠀⠐⠀⠀⠈⠀⠀⠀⠀⠠⠀⠀⠀⠂⠆⠀⠀⠀⠀⣿⣿⣿',
  '⣇⠿⠀⠀⢸⠀⠀⠀⠈⢹⣿⠋⠙⠀⠀⠀⠀⠀⣿⡿⠛⠛⠃⠀⠀⠀⠀⣿⣿⣿',
  '⣿⣴⡆⠀⠀⠀⠀⠀⠀⢸⢿⡿⡇⠀⠀⠀⠀⠀⠻⣿⡶⠇⠀⠀⢀⠀⠀⣿⣿⣿',
  '⣿⣿⣿⣆⠀⠀⠀⠀⠀⠃⠔⠁⠀⠀⠀⠀⠀⠈⠢⠈⠀⠀⠀⡄⠀⢠ ⣿⣿⣿',
  '⣿⣿⣿⣧⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⢠⡇⠀⢸⣿⣿⣿',
  '⣿⣿⣿⡿⠀⠀⣵⠀⠀⠸⣶⣤⣀⠀⠀⠀⠀⢀⣠⣴⡞⠀⠀⣾⡇⠀⢸⣿⣿⣿',
  '⣿⣿⣿⣷⠂⠀⣿⡇⠀⠀⢿⣿⠏⠀⠀⠀⠀⠀⢿⣿⠁⠀⢠⣿⣷⠀⠸⣿⣿⣿',
  '⣿⣿⣿⡿⡆⢀⣿⣷⠀⠀⠘⣿⣄⠀⠈⠀⢀⠀⣸⠇⠀⠀⣼⣿⣿⠀⠀⣿⣿⣿',
  '⣿⣿⣿⡇⠀⣸⣿⣿⡆⠀⠀⣿⡿⠋⠀⠀⠀⠙⣿⠁⠀⢰⣿⣿⣿⡆⠀⢻⣿⣿',
}

g.dashboard_custom_section = {
    a = {description = {"ﰍ  Find File                               SPC f f"}, command = "Telescope find_files"},
    b = {description = {"  Orgs                                    SPC f o"}, command = "e ~/my-orgs"},
    c = {description = {"  Diary today                          SPC w SPC w"}, command = "VimwikiMakeDiaryNote"},
    d = {description = {"  Diary Tomorrow                       SPC w SPC m"}, command = "VimwikiMakeTomorrowDiaryNote"},
    e = {description = {"  Wiki                                    SPC w w"}, command = "VimwikiIndex"},
    f = {description = {"  Edit NekoRc file                        SPC e n"}, command = ":e ~/.config/nvim/lua/nekorc.lua"}
}

g.dashboard_custom_footer = {
    "  (=^･ω･^=)  ",
    "> Neko  Vim <",
    "      "
}
