let uname = substitute(system('uname'), '\n', '', '')
if uname == 'Linux'
    set guifont=MesloLGS\ NF:h10
elseif uname == 'Darwin' 
    set guifont=MesloLGS\ NF:h12
endif

set guifont=MesloLGS\ NF:h12
    " set guifont=FiraCode\ NF:h16
" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 1
endif

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv

