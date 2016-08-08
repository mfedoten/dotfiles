$latex = "/usr/texbin/latex -synctex=1 -pvc -shell-escape %O %S";
$pdflatex = "/usr/texbin/pdflatex -synctex=1 -pvc -shell-escape %O %S";
$bibtex = "/usr/texbin/bibtex %O %B";
$pdf_previewer = "open -a /Applications/Skim.app";
$pdf_mode = 1;
$clean_ext = "bbl fls fdb_latexmk pdfsync rel log aux dvi lof lot bit idx gls glo ilg toc ind out blg run.xml py.out py.err %R-blx.bib %R.py synctex synctex.gz nav snm maf mlf mlt mtc mtc[0-9] mtc[1-9][0-9] flg";

# $bibtex_use = 2; # Uncomment to delete .bbl files
$cleanup_includes_cusdep_generated = 1;
# $cleanup_includes_generated =1;
# $pdf_update_method = 0;


