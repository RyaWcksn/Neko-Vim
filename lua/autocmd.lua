local cmd = vim.cmd
cmd([[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]])
cmd([[autocmd VimEnter * FindFileCache  Dashboard]])
