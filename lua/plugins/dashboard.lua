local g = vim.g
local fn = vim.fn
-- require('dashboard').setup()
local plugins_count = fn.len(fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
g.dashboard_disable_at_vimenter = 1 -- dashboard is disabled by default
g.dashboard_disable_statusline = 1
g.dashboard_default_executive = "telescope"

g.dashboard_custom_header = {
  'MMNddhhhdddmmNMMMMMMMMMMMMMMMMMMMMMMMMNmdddddddNMM',
  'MMmossssssossssyhddddddhhhhhddmmNNdhssooooooooomMM',
  'MMmoosmMNh+:/+ooo++oossssssssssssooooo/:-.`.+ooNMM',
  'MMMsosddy-..:+o+++++++++++++++++++++o/..` `:ooyMMM',
  'MMMmooo-`.:++++++++++++++++++++++++++++-` :++oNMMM',
  'MMMMh+o+:++oo+++++++++++++++++++++++++++--/++dMMMM',
  'MMMMMo::++o+++o++++++++++++++++++++++++++o++yMMMMM',
  'MMMNs..///-:+++//++///++++///////+//++++/+o/mMMMMM',
  'MMN/.-::-::/+/////+//////////////+:::::/--+`sMMMMM',
  'MM+:+++++++o+++o+ss+o++++++++++soy+++++o/:+.:MMMMM',
  'Mh+s+/++y++o++osoysoy+++++++++ssoyy+++++++o/.MMMMM',
  'Moss//+ss/o++ohoyo:ohs+++++++oho:/ys+y+/o/o//MMMMM',
  'M+ds/+oyo/+/+yoss.`/ys+/////oyy:``:yoyo/o/o//MMMMM',
  'NsNs/osyo/+:+o:y+---s+o/:::+syo....osso/+/o/+MMMMM',
  'MyMh/oyys/+:o-/yNms/+s-o/:+o/+dmmhssooo++o+/oMMMMM',
  'MNMm+oyys+++o``ymmhos.`.+oo-``dmmo:/`.so+o//sMMMMM',
  'MMMMhoyy+//:o.`+hdNdd````:````yhmmhy `s:+o//yMMMMM',
  'MMMMMdyy/++/+/-`+oso+`````````-syso-.:++yo//dMMMMM',
  'MMMMMMdy+o+++++/--+:```````````./+//++++d+//mMMMMM',
  'MMMMMMh+/+s+++++/....`````````..-///+++ym+//mMMMMM',
  'MMMMMMNs//ys+++ss:.`````````````./so++odm+/+mMMMMM',
  'MMMMMMmy/+hho+++hmhy+:..`.``.:+yhmy+++hmmo/+mMMMMM',
  'MMMMMMmy++dmy+++smmmmo/:/::::+dmmh+++sdmms++mMMMMM',
  'MMMMMMMy+odmhs+++dmms...//+-..omdo++oymmmy++dMMMMM',
}

g.dashboard_custom_section = {
    a = {description = {"  Find File                 SPC f f"}, command = "Telescope find_files"},
    b = {description = {"  Recents                   SPC f o"}, command = "Telescope oldfiles"},
    c = {description = {"  Find Word                 SPC f w"}, command = "Telescope live_grep"},
    d = {description = {"洛 New File                  SPC f n"}, command = "DashboardNewFile"},
    e = {description = {"  Bookmarks                 SPC b m"}, command = "Telescope marks"},
    f = {description = {"  Load Last Session         SPC s l"}, command = "SessionLoad"}
}

g.dashboard_custom_footer = {
    "   ",
    "> Neko Vim <"
}
