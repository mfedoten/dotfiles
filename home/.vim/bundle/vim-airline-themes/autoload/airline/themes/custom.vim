" vim-airline template by chartoin (http://github.com/chartoin)
" Base 16 Default Scheme by Chris Kempson (http://chriskempson.com)
let g:airline#themes#custom#palette = {}
let s:gui00 = "#181818"
let s:gui01 = "#282828"
let s:gui02 = "#383838"
let s:gui03 = "#585858"
let s:gui04 = "#b8b8b8"
let s:gui05 = "#d8d8d8"
let s:gui06 = "#e8e8e8"
let s:gui07 = "#f8f8f8"
let s:gui08 = "#cc0066"
let s:gui09 = "#ff8c66"
let s:gui0A = "#f7ca88"
let s:gui0B = "#b5aad4"
let s:gui0C = "#86c1b9"
let s:gui0D = "#aacad4"
let s:gui0E = "#e2b6d7"
let s:gui0F = "#b30062"

let s:cterm00 = 233
let s:cterm01 = 235
let s:cterm02 = 237
let s:cterm03 = 240
let s:cterm04 = 249
let s:cterm05 = 253
let s:cterm06 = 254
let s:cterm07 = 15
let s:cterm08 = 125
let s:cterm09 = 209 
let s:cterm0A = 222
let s:cterm0B = 146
let s:cterm0C = 109
let s:cterm0D = 152
let s:cterm0E = 182
let s:cterm0F = 125

let s:N1   = [ s:gui01, s:gui0B, s:cterm01, s:cterm0B ]
let s:N2   = [ s:gui06, s:gui02, s:cterm06, s:cterm02 ]
let s:N3   = [ s:gui05, s:gui01, s:cterm05, s:cterm01 ]
let g:airline#themes#custom#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let s:I1   = [ s:gui01, s:gui0D, s:cterm01, s:cterm0D ]
let s:I2   = [ s:gui06, s:gui02, s:cterm06, s:cterm02 ]
let s:I3   = [ s:gui05, s:gui01, s:cterm05, s:cterm01 ]
let g:airline#themes#custom#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

let s:R1   = [ s:gui01, s:gui08, s:cterm01, s:cterm08 ]
let s:R2   = [ s:gui06, s:gui02, s:cterm06, s:cterm02 ]
let s:R3   = [ s:gui05, s:gui01, s:cterm05, s:cterm01 ]
let g:airline#themes#custom#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

let s:V1   = [ s:gui01, s:gui0E, s:cterm01, s:cterm0E ]
let s:V2   = [ s:gui06, s:gui02, s:cterm06, s:cterm02 ]
let s:V3   = [ s:gui05, s:gui01, s:cterm05, s:cterm01 ]
let g:airline#themes#custom#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

let s:IA1   = [ s:gui05, s:gui01, s:cterm05, s:cterm01 ]
let s:IA2   = [ s:gui05, s:gui01, s:cterm05, s:cterm01 ]
let s:IA3   = [ s:gui05, s:gui01, s:cterm05, s:cterm01 ]
let g:airline#themes#custom#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)


" Warnings
let g:airline#themes#custom#palette.normal.airline_warning =
     \ [ s:gui00, s:gui09, s:cterm00, s:cterm09 ]
let g:airline#themes#custom#palette.insert.airline_warning =
    \ g:airline#themes#custom#palette.normal.airline_warning
let g:airline#themes#custom#palette.visual.airline_warning =
    \ g:airline#themes#custom#palette.normal.airline_warning
let g:airline#themes#custom#palette.replace.airline_warning =
    \ g:airline#themes#custom#palette.normal.airline_warning

" let g:airline#themes#custom#palette.normal_modified.airline_warning =
     " \ [ s:gui09, s:gui01, s:cterm09, s:cterm01 ]
" let g:airline#themes#custom#palette.insert_modified.airline_warning =
    " \ g:airline#themes#custom#palette.normal.airline_warning
" let g:airline#themes#custom#palette.visual_modified.airline_warning =
    " \ g:airline#themes#custom#palette.normal.airline_warning
" let g:airline#themes#custom#palette.replace_modified.airline_warning =
    " \ g:airline#themes#custom#palette.normal.airline_warning


" Errors
let g:airline#themes#custom#palette.normal.airline_error =
     \ [ s:gui07, s:gui0F, s:cterm07, s:cterm0F ]
let g:airline#themes#custom#palette.insert.airline_error =
    \ g:airline#themes#custom#palette.normal.airline_error
let g:airline#themes#custom#palette.visual.airline_error =
    \ g:airline#themes#custom#palette.normal.airline_error
let g:airline#themes#custom#palette.replace.airline_error =
    \ g:airline#themes#custom#palette.normal.airline_error

" let g:airline#themes#custom#palette.normal_modified.airline_error =
    " \ g:airline#themes#custom#palette.normal.airline_error
" let g:airline#themes#custom#palette.insert_modified.airline_error =
    " \ g:airline#themes#custom#palette.normal.airline_error
" let g:airline#themes#custom#palette.visual_modified.airline_error =
    " \ g:airline#themes#custom#palette.normal.airline_error
" let g:airline#themes#custom#palette.replace_modified.airline_error =
    " \ g:airline#themes#custom#palette.normal.airline_error

" Here we define the color map for ctrlp.  We check for the g:loaded_ctrlp
" variable so that related functionality is loaded iff the user is using
" ctrlp. Note that this is optional, and if you do not define ctrlp colors
" they will be chosen automatically from the existing palette.
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#custom#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ s:gui07, s:gui01, s:cterm07, s:cterm01, '' ],
      \ [ s:gui00, s:gui0B, s:cterm00, s:cterm0B, '' ],
      \ [ s:gui09, s:gui09, s:cterm01, s:cterm09, 'bold' ])
