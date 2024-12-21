echom "Tex-Conceal tex_01_ess.vim loaded"

" set customized tex concealing

" customized tex conceal

" inline (A-Z) {{{1

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

" links (external)
syn region Reversedhref matchgroup=ReversedhrefMatch start='\\reversedhref{\s*' end='\s*}' concealends keepend
syn region Url matchgroup=UrlMatch start='\\url{\s*' end='\s*}' concealends keepend

" links (internal)
syntax match Label /\\label{[^}]*}/ containedin=ALL conceal cchar=l
syn region PageRef matchgroup=PageRefMatch start='\\pageref{\s*' end='\s*}' concealends keepend

" hyperref
syntax match HyperrefAll /\\hyperref\[[^]]*\]{[^}]*}/ containedin=ALL
syntax match HyperrefCommand /\\hyperref\[[^]]*\]/ contained conceal containedin=HyperrefAll
syntax region HyperrefText matchgroup=HyperrefTextMatch start='{\s*' end='\s*}' concealends keepend contained containedin=HyperrefAll
hi HyperrefText gui=underline guifg=#1e81b0

" font format
syn region Textbf matchgroup=textbfmatch start='\\textbf{\s*' end='\s*}' concealends keepend

" verbatim
syn region VerbatimInline matchgroup=VerbatimInlineMatch start='\\verb|' end='|' concealends keepend contains=VerbatimInlineBegin,VerbatimInlineEnd
syn match VerbatimInlineBegin '\\verb|' contained conceal
syn match VerbatimInlineEnd '|' contained conceal
hi VerbatimInline gui=italic guifg=#eab676

" environments (A-Z) {{{1

" c
syn match CardBegin '\\begin{card}' conceal cchar=c
syn match CardEnd '\\end{card}' conceal cchar=c

" e
syn match EnumerateBegin '\\begin{enumerate}' conceal cchar=e
syn match EnumerateEnd '\\end{enumerate}' conceal cchar=e

" i
syn match ItemizeBegin '\\begin{itemize}' conceal cchar=i
syn match ItemizeEnd '\\end{itemize}' conceal cchar=i

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
syn match VerbatimBegin '\\begin{Verbatim}' contained conceal cchar=V
syn match VerbatimEnd '\\end{Verbatim}' contained conceal cchar=V
