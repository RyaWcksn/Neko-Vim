local cmd = vim.cmd
cmd([[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]])
cmd([[autocmd User dashboardReady let &l:stl = ' This statusline rocks!']])
