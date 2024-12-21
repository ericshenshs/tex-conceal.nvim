echom "Tex-Conceal tex_01_ess.vim loaded"

" set customized tex concealing

" customized tex conceal and highlight
syn match ItemizeBegin '\\begin{itemize}' conceal cchar=I
syn match ItemizeEnd '\\end{itemize}' conceal cchar=I
syn match EnumerateBegin '\\begin{enumerate}' conceal cchar=E
syn match EnumerateEnd '\\end{enumerate}' conceal cchar=E

syn region VerbatimInline matchgroup=VerbatimInlineMatch start='\\verb|' end='|' concealends keepend
syn region Verbatim  start='\\begin{Verbatim}' end='\\end{Verbatim}' keepend contains=VerbatimBegin,VerbatimEnd
syn match VerbatimBegin '\\begin{Verbatim}' contained conceal cchar=V
syn match VerbatimEnd '\\end{Verbatim}' contained conceal cchar=V

syn match CardBegin '\\begin{card}' conceal cchar=c
syn match CardEnd '\\end{card}' conceal cchar=c
syn match CapitalCardBegin '\\begin{Card}' conceal cchar=C
syn match CapitalCardEnd '\\end{Card}' conceal cchar=C

syn region Python  start='\\begin{python}' end='\\end{python}' keepend contains=PythonBegin,PythonEnd
syn match PythonBegin '\\begin{python}' contained conceal cchar=p
syn match PythonEnd '\\end{python}' contained conceal cchar=p

syn region Problem start='\\begin{problem}' end='\\end{problem}' keepend contains=ProblemBegin,ProblemEnd
syn match ProblemBegin '\\begin{problem}' contained conceal cchar=P
syn match ProblemEnd '\\end{problem}' contained conceal cchar=P

syn region Comment start='\\begin{comment}' end='\\end{comment}' keepend contains=CommentBegin,CommentEnd
syn match CommentBegin '\\begin{comment}' contained conceal
syn match CommentEnd '\\end{comment}' contained conceal
syn region CommentStyleII start='% ' end='\n' keepend contains=CommentStyleIIBegin, TODO, WAIT, DONE, SOON, CommentFoldingStart, CommentFoldingEnd
syn match CommentStyleIIBegin '% ' contained conceal
syn match CommentFoldingStart '{{{' conceal
syn match CommentFoldingEnd '}}}' conceal

syn region Url matchgroup=UrlMatch start='\\url{\s*' end='\s*}' concealends keepend
syn region Reversedhref matchgroup=ReversedhrefMatch start='\\reversedhref{\s*' end='\s*}' concealends keepend

syn region Part matchgroup=PartMatch start='\\part{\s*' end='\s*}' concealends keepend
syn region Chapter matchgroup=ChapterMatch start='\\chapter{\s*' end='\s*}' concealends keepend
syn region Section matchgroup=SectionMatch start='\\section{\s*' end='\s*}' concealends keepend
syn region Subsection matchgroup=SubsectionMatch start='\\subsection{\s*' end='\s*}' concealends keepend
syn region Paragraph matchgroup=ParagraphMatch start='\\paragraph{\s*' end='\s*}' concealends keepend

syn region Label matchgroup=LabelMatch start='\\label{\s*' end='\s*}' concealends keepend
syn region PageRef matchgroup=PageRefMatch start='\\pageref{\s*' end='\s*}' concealends keepend

syn region Textbf matchgroup=textbfmatch start='\\textbf{\s*' end='\s*}' concealends keepend

syn match TODO 'TODO'
syn match WAIT 'WAIT'
syn match DONE 'DONE'
syn match SOON 'SOON'

" hi conceal gui=None guifg=None guibg=#1e81b0
hi conceal gui=None guifg=None guibg=None

" for dark background
hi Verbatim gui=None guifg=#E7EAE5
" for light background"
" hi Verbatim gui=None guifg=#28282B

hi link VerbatimInline Verbatim
hi Python gui=None guifg=#DDD6E1
hi Problem gui=None guifg=#DDD6E1
hi Comment gui=None guifg=#808080
hi CommentStyleII gui=None guifg=#808080
""
hi Url gui=underline guifg=#CBC3E3
hi Label gui=None guifg=None

"" Section
hi Part gui=None guifg=#50B4D8
hi Chapter gui=None guifg=#9EDDEF
hi Section gui=None guifg=#F7E5B7
hi Subsection gui=None guifg=#CAB3C1
hi Paragraph gui=None guifg=#96B3C2

"" TODO
hi TODO gui=None guifg=#1AA7EC guibg=#BEBEBE
hi WAIT gui=None guifg=#ED7117 guibg=#BEBEBE
hi DONE gui=None guifg=#4CBB17 guibg=#BEBEBE
hi SOON gui=None guifg=#FB02FF guibg=#BEBEBE

hi PythonBegin guibg=#1e81b0
hi ProblemBegin guibg=#1e81b0
hi ItemizeBegin guibg=#e28743
hi VerbatimBegin guibg=#eab676
hi EnumerateBegin guibg=#76b5c5
hi PythonEnd guibg=#1e81b0
hi ProblemEnd guibg=#1e81b0
hi ItemizeEnd guibg=#e28743
hi VerbatimEnd guibg=#eab676
hi EnumerateEnd guibg=#76b5c5
hi CardBegin guibg=#1e81b0
hi CardEnd guibg=#1e81b0
hi CapitalCardBegin guibg=#1e81b0
hi CapitalCardEnd guibg=#1e81b0
