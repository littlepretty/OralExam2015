LATEX=latex
BIBTEX=bibtex
DVI2PDF=dvipdf
PS2PDF=ps2pdf
UNAME:=$(shell uname -s)
ifeq ($(UNAME),Linux)
	VIEWER=xdg-open
endif
ifeq ($(UNAME), Darwin)
	VIEWER=open
endif

FILE_NAME=main

.PHONY: all, clean, view

all:
	$(LATEX) $(FILE_NAME).tex
	$(BIBTEX) $(FILE_NAME).aux
	$(LATEX) $(FILE_NAME).tex
	$(LATEX) $(FILE_NAME).tex
	$(DVI2PDF) $(FILE_NAME).dvi
	# $(PS2PDF) $(FILE_NAME).ps

view: all
	mv $(FILE_NAME).pdf jiaqi_yan_fall15.pdf
	FILE_NAME=jiaqi_yan_fall15.pdf
	$(VIEWER) jiaqi_yan_fall15.pdf
	rm *.log *.aux *.dvi *.out *.blg *.bbl *.bak

clean:
	rm *.log *.aux *.dvi *.out *.blg *.bbl *.ps *.bak
