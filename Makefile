all: MAIN.dvi MAIN.ps MAIN.pdf view

MAIN.dvi: Makefile *.tex *.bib
	make clean
	latex MAIN
	bibtex MAIN
	latex MAIN
	@echo
	@echo
	@echo ================ Final pass -- ignore errors above ================
	@echo
	latex MAIN

MAIN.ps: MAIN.dvi
	dvips MAIN

MAIN.pdf: MAIN.dvi
	dvipdfm MAIN

view: MAIN.dvi
	killall xdvi-motif.bin 2>/dev/null || echo -n
	xdvi -geom -0-0 MAIN &

clean:
	rm -f MAIN.aux MAIN.log MAIN.bbl MAIN.blg MAIN.out
