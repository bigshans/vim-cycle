function! cycle#add_cycle(group)
    if !exists('g:cycle_group')
        let g:cycle_group = []
    endif
    call add(g:cycle_group, a:group)
endfunction

function! cycle#add_cycle_filetype(filetype, group)
    if !exists('g:cycle_group_filetype')
        let g:cycle_group_filetype = {}
    endif
    if type(a:filetype) == 3
        for ft in a:filetype
            call cycle#add_cycle_filetype(ft, a:group)
        endfor
        return
    endif
    if !has_key(g:cycle_group_filetype, a:filetype)
        let g:cycle_group_filetype[a:filetype] = []
    endif
    call add(g:cycle_group_filetype[a:filetype], a:group)
endfunction
