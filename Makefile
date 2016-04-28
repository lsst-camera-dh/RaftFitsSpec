manuscript=FITS_Raft

TEXFILES = $(wildcard *.tex $(manuscript).bib )

all: $(manuscript).pdf

pdf: $(manuscript).pdflatex

ps: $(manuscript).ps

ps2pdf: $(manuscript).ps
	pstopdf $(manuscript).ps

force: touch all

bib: 
	bibtex $(manuscript)

%.pdf: %.dvi
	dvipdf $<

%.ps: %.dvi
	dvips $<

%.dvi: %.tex $(TEXFILES)
	latex $(manuscript).tex
	latex $(manuscript).tex

%.pdflatex: %.tex $(TEXFILES)
	pdflatex $(manuscript).tex
	pdflatex $(manuscript).tex

touch:
	touch $(manuscript).tex

clean:
	rm -f *.out *.log *.dvi *.aux *~ */*~ *.blg *.bbl *.bb *.nav $(manuscript).pdf *.snm *.toc $(manuscript).ps 

cleanall:
	make clean
	rm -f *.pdf
