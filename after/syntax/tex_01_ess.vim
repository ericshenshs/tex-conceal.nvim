echom "Tex-Conceal tex_01_ess.vim loaded"

" set customized tex concealing

" customized tex conceal

" inline (A-Z) {{{1

" return
syn match LineBreak '\\\\' conceal cchar=⏎

" tab
syn match Quad '\\quad' conceal cchar=␣

syn match QQuad '\\qquad' contains=QQuadHead,QQuadTail
syn match QQuadHead '\\' contained conceal cchar=␣
syn match QQuadTail 'qquad' contained conceal cchar=␣

syn match NullQuad '\\null\\quad' contains=NullQuadHead,NullQuadTail
syn match NullQuadHead '\\null' contained conceal
syn match NullQuadTail '\\quad' contained conceal cchar=␣

syn match NullQquad '\\null\\qquad' contains=NullQquadHead,NullQquadTail
syn match NullQquadHead '\\null' contained conceal cchar=␣
syn match NullQquadTail '\\qquad' contained conceal cchar=␣

" comment
syn region CommentInline start='% ' end='\n' keepend contains=CommentInlineBegin, CommentInlineFoldingBegin, CommentInlineFoldingEnd
syn match CommentInlineBegin '% ' contained conceal
syn match CommentInlineFoldingBegin '{{{' conceal cchar={
syn match CommentInlineFoldingEnd '}}}' conceal cchar=}
hi CommentInline gui=italic guifg=#808080

" inline conceal (A-Z)

" titles
syn region Part matchgroup=PartMatch start='\\part{\s*' end='\s*}' concealends keepend
syn region Chapter matchgroup=ChapterMatch start='\\chapter{\s*' end='\s*}' concealends keepend
syn region Section matchgroup=SectionMatch start='\\section{\s*' end='\s*}' concealends keepend
syn region Subsection matchgroup=SubsectionMatch start='\\subsection{\s*' end='\s*}' concealends keepend
syn region Paragraph matchgroup=ParagraphMatch start='\\paragraph{\s*' end='\s*}' concealends keepend
hi Part gui=bold guifg=#50B4D8
hi Chapter gui=bold guifg=#9EDDEF
hi Section gui=bold guifg=#F7E5B7
hi Subsection gui=bold guifg=#CAB3C1
hi Paragraph gui=bold guifg=#96B3C2

" links (external)
syn region Reversedhref matchgroup=ReversedhrefMatch start='\\reversedhref{\s*' end='\s*}' concealends keepend
syn region Url matchgroup=UrlMatch start='\\url{\s*' end='\s*}' concealends keepend
hi Url gui=underline guifg=#CBC3E3

" links (internal)
syntax match Label /\\label{[^}]*}/ containedin=ALL conceal cchar=l
syn region PageRef matchgroup=PageRefMatch start='\\pageref{\s*' end='\s*}' concealends keepend

" hyperref
syntax match HyperrefAll /\\hyperref\[[^]]*\]{[^}]*}/ containedin=ALL
syntax match HyperrefCommand /\\hyperref\[[^]]*\]/ contained conceal containedin=HyperrefAll
syntax region HyperrefText matchgroup=HyperrefTextMatch start='{\s*' end='\s*}' concealends keepend contained containedin=HyperrefAll
hi HyperrefText gui=underline guifg=#1e81b0

" href
syntax match HrefAll /\\href{[^}]*}{[^}]*}/ containedin=ALL
syntax region HrefLink start=+\\href{+ end=+}+ contained conceal containedin=HrefAll
syntax region HrefText matchgroup=HrefTextMatch start='{\s*' end='\s*}' concealends keepend contained containedin=HrefAll
hi HrefText gui=underline guifg=#1e81b0

" font format
syn region Textbf matchgroup=textbfmatch start='\\textbf{\s*' end='\s*}' concealends keepend
hi Textbf gui=bold

" verbatim
syntax region VerbInline start=+\\verb|+ end=+|+ oneline containedin=ALL concealends keepend contains=VerbInlineBegin,VerbInlineEnd
syn match VerbInlineBegin '\\verb|' contained conceal
syn match VerbInlineEnd '|' contained conceal
hi VerbInline gui=italic guifg=#eab676

syntax region LstInline start=+\\lstinline|+ end=+|+ oneline containedin=ALL concealends keepend contains=LstInlineBegin,LstInlineEnd
syn match LstInlineBegin '\\lstinline|' contained conceal
syn match LstInlineEnd '|' contained conceal
hi LstInline gui=italic guifg=#f0982b

" environments (A-Z) {{{1

" card
" Note that here the order of concealings and hilighting matters.
syn region CardBegin start='\\begin{card}{' end='}' contains=CardBeginBegin,CardBeginEnd,CardContent keepend
syn match CardContent '[^}]*' contained
hi CardContent gui=bold

" 🔴 🔵 🟠 🟡 🟢 🟣 🟤 ⚫ ⚪ ⭕
" 🟥 🟦 🟧 🟨 🟩 🟪 🟫 ⬛ ⬜
" 💠 🔶 🔷 🔸 🔹
" 🔺 🔻
" ✅
syn match CardBeginBegin '\\begin{card}{' contained conceal cchar=-
syn match CardBeginEnd '}' contained conceal
hi CardBeginBegin guibg=#1e81b0
hi CardBeginEnd guibg=#1e81b0

syn match CardEnd '\\end{card}' conceal cchar=⏎
hi CardEnd guibg=#1e81b0

" carddone
" Note that here the order of concealings and hilighting matters.
syn region CardDoneBegin start='\\begin{carddone}{' end='}' contains=CardDoneBeginBegin,CardDoneBeginEnd,CardDoneContent keepend
syn match CardDoneContent '[^}]*' contained
hi CardDoneContent guifg=#808080

syn match CardDoneBeginBegin '\\begin{carddone}{' contained conceal cchar=☑
syn match CardDoneBeginEnd '}' contained conceal
hi CardDoneBeginBegin guibg=#808080
hi CardDoneBeginEnd guibg=#808080

syn match CardDoneEnd '\\end{carddone}' conceal cchar=⏎
hi CardDoneEnd guibg=#808080

" e
syn match EnumerateBegin '\\begin{enumerate}' conceal cchar=e
syn match EnumerateEnd '\\end{enumerate}' conceal cchar=e
syn region EnumerateContext start='\\begin{enumerate}' end='\\end{enumerate}' contains=ItemSymbol,EnumerateBegin,EnumerateEnd keepend

" i
syn match ItemizeBegin '\\begin{itemize}' conceal cchar=i
syn match ItemizeEnd '\\end{itemize}' conceal cchar=i
syn region ItemizeContext start='\\begin{itemize}' end='\\end{itemize}' contains=ItemSymbol,ItemizeBegin,ItemizeEnd keepend

" item
syn match ItemSymbol '\\item' contained conceal cchar=·
hi ItemSymbol gui=italic guifg=#1e81b0

" m
syn region Comment start='\\begin{comment}' end='\\end{comment}' keepend contains=CommentBegin,CommentEnd
syn match CommentBegin '\\begin{comment}' contained conceal cchar=m
syn match CommentEnd '\\end{comment}' contained conceal cchar=m

" p
syn region Python  start='\\begin{python}' end='\\end{python}' keepend contains=PythonBegin,PythonEnd
syn match PythonBegin '\\begin{python}' contained conceal cchar=p
syn match PythonEnd '\\end{python}' contained conceal cchar=p

" P
syn region Problem start='\\begin{problem}' end='\\end{problem}' keepend contains=ProblemBegin,ProblemEnd
syn match ProblemBegin '\\begin{problem}' contained conceal cchar=P
syn match ProblemEnd '\\end{problem}' contained conceal cchar=P

" V
syn region Verbatim  start='\\begin{Verbatim}' end='\\end{Verbatim}' keepend contains=VerbatimBegin,VerbatimEnd
" We use highlighting to see which part is in Verbatim.
" We use \iffalse \fi to devide and conquer bugs.
" We check *.log to check error messages.
syn match VerbatimBegin '\\begin{Verbatim}' contained conceal cchar=`
syn match VerbatimEnd '\\end{Verbatim}' contained conceal cchar=`
hi VerbatimBegin guibg=#eab676
hi VerbatimEnd guibg=#eab676

syn region VerbatimEscape  start='\\begin{VerbatimEscape}' end='\\end{VerbatimEscape}' keepend contains=VerbatimEscapeBegin,VerbatimEscapeEnd
syn match VerbatimEscapeBegin '\\begin{VerbatimEscape}' contained conceal cchar=V
syn match VerbatimEscapeEnd '\\end{VerbatimEscape}' contained conceal cchar=V
hi VerbatimEscapeBegin guibg=#9d00ff
hi VerbatimEscapeEnd guibg=#9d00ff
