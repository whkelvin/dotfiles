syn match Type /\s[A-Z]\w*\s/

" object.'Function'()
syn match csMemberFuncEnclosed /\.[A-Z]\w*(/ contains=csMemberFunc
syn match csMemberFunc /[A-Z]\w*\>/ contained

" 'Main'()
syn match csFuncEnclosed /\s[A-Z]\w*(/ contains=csFunc
syn match csFunc /[A-Z]\w*\>/ contained

" 'Class'<type>"

"syn match csGenericClassEnclosed /[A-Z]\w*</ contains=csGenericClass containedin=csNewType
syn match csGenericClass /[A-Z]\w*\>/ containedin=csNewType


hi csMemberFunc ctermfg=Cyan
hi csFunc ctermfg=Cyan
hi def link csGenericClass Type

"syn match csDot /\./ 
"hi csMemberFunc ctermfg=White


