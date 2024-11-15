command! Hexa call ConvertHexToChar()

function! ConvertHexToChar()
    let lines = getline(1, '$')

    for i in range(len(lines))
        let lines[i] = substitute(lines[i], '\v([0-9A-Fa-f]{2})', '\=HexToChar(submatch(0))', 'g')
    endfor

    call setline(1, lines)
endfunction

function! HexToChar(hex)
    let num = str2nr(a:hex, 16)

    if num >= 0 && num <= 127
        return nr2char(num)
    else
        return a:hex  
    endif
endfunction

