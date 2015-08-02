$latex = "/usr/texbin/latex --synctex=1 --shell-escape --interaction=nonstopmode %O %S";
$pdflatex = "/usr/texbin/pdflatex --synctex=1 --shell-escape --interaction=nonstopmode %O %S";
$bibtex = "/usr/texbin/bibtex %O %B";
$pdf_previewer = "open -a /Applications/Skim.app";
$pdf_mode = 1;
$clean_ext = "bbl synctex synctex.gz fls fdb_latexmk pdfsync rel log aux dvi lof lot bit idx glo ilg toc ind out blg run.xml";
# $bibtex_use = 2; # Uncomment to delete .bbl files
$cleanup_includes_cusdep_generated = 1;
# $cleanup_includes_generated =1;
# $pdf_update_method = 0;


