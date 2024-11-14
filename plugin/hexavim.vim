" hexavim.vim - Simple Hex -> Char converter

" Define :Hexa command
command! Hexa call ConvertHexToChar()

" Convert function
function! ConvertHexToChar()
    let lines = getline(1, '$')

    for i in range(len(lines))
        let lines[i] = substitute(lines[i], '\v(\x{00}-\x{FF}{2})', '\=HexToChar(submatch(0))', 'g')
    endfor

    call setline(1, lines)
endfunction

function! HexToChar(hex)
    return nr2char(str2nr(a:hex, 16))
endfunction

