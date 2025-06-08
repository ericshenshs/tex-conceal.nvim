" Use expr-based folding for card environments
setlocal foldmethod=expr
setlocal foldexpr=CardFoldExpr()

function! CardFoldExpr()
  let line = getline(v:lnum)
  if line =~# '\\begin{\(card\|carddone\)}'
    return '>1'
  elseif line =~# '\\end{\(card\|carddone\)}'
    return '<1'
  else
    return '='
  endif
endfunction
