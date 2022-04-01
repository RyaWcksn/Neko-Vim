local g = vim.g
g.dashboard_disable_at_vimenter = 0 -- dashboard is disabled by default
g.dashboard_disable_statusline = 1
g.dashboard_default_executive = "telescope"

g.dashboard_custom_header = {
	"⣿⡿⢿⡿⣿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿",
	"⣿⡇⠀⢀⣀⠀⠀⠀⠈⠉⠛⠛⣽⣯⣭⣭⣽⣭⣟⣿⠛⠉⠁⠀⠀⠀⠀⠀⢸⣿",
	"⣿⣇⠀⠨⡿⠉⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿",
	"⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿",
	"⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿",
	"⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿",
	"⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠰⠀⠀⠀⠀⠀⠀⠀⢠⢀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿",
	"⡇⢠⠀⠀⢠⠀⠀⠀⢠⠠⠄⠀⢃⠀⠀⠀⠀⠀⡆⠀⢤⠀⢀⠀⠀⠀⠀⣿⣿⣿",
	"⡇⡰⠀⠀⢨⠀⠀⠀⠀⠐⠀⠀⠈⠀⠀⠀⠀⠠⠀⠀⠀⠂⠆⠀⠀⠀⠀⣿⣿⣿",
	"⣇⠿⠀⠀⢸⠀⠀⠀⠈⢹⣿⠋⠙⠀⠀⠀⠀⠀⣿⡿⠛⠛⠃⠀⠀⠀⠀⣿⣿⣿",
	"⣿⣴⡆⠀⠀⠀⠀⠀⠀⢸⢿⡿⡇⠀⠀⠀⠀⠀⠻⣿⡶⠇⠀⠀⢀⠀⠀⣿⣿⣿",
	"⣿⣿⣿⣆⠀⠀⠀⠀⠀⠃⠔⠁⠀⠀⠀⠀⠀⠈⠢⠈⠀⠀⠀⡄⠀⢠ ⣿⣿⣿",
	"⣿⣿⣿⣧⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⢠⡇⠀⢸⣿⣿⣿",
	"⣿⣿⣿⡿⠀⠀⣵⠀⠀⠸⣶⣤⣀⠀⠀⠀⠀⢀⣠⣴⡞⠀⠀⣾⡇⠀⢸⣿⣿⣿",
	"⣿⣿⣿⣷⠂⠀⣿⡇⠀⠀⢿⣿⠏⠀⠀⠀⠀⠀⢿⣿⠁⠀⢠⣿⣷⠀⠸⣿⣿⣿",
	"⣿⣿⣿⡿⡆⢀⣿⣷⠀⠀⠘⣿⣄⠀⠈⠀⢀⠀⣸⠇⠀⠀⣼⣿⣿⠀⠀⣿⣿⣿",
	"⣿⣿⣿⡇⠀⣸⣿⣿⡆⠀⠀⣿⡿⠋⠀⠀⠀⠙⣿⠁⠀⢰⣿⣿⣿⡆⠀⢻⣿⣿",
}

g.dashboard_custom_section = {
	a = { description = { "ﰍ  Find File   " }, command = "FZF" },
	b = { description = { "  Orgs Agenda " }, command = "e ~/my-orgs" },
	c = { description = { "  New File    " }, command = "DashboardNewFile" },
	d = { description = { "  Config File " }, command = "e ~/.config/nvim/lua/utils/nekorc.lua" },
	e = { description = { "  Sandbox     " }, command = "e ~/sandbox" },
}

g.dashboard_custom_footer = {
	"  (=^･ω･^=)  ",
	"> Neko  Vim <",
	"      ",
}
