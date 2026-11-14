.PHONY: all clean cleanall view

all: main.pdf

main.pdf: main.tex metodologia.bib 1-Artigo\ e\ Previsoes.tex 2-Modelo\ Numerico.tex 3-Caso\ R\ e\ Caso\ M.tex 4-Discussao\ e\ Decisao\ de\ Engenharia.tex
	latexmk -pdf -interaction=nonstopmode -synctex=1 main.tex

clean:
	latexmk -c
	rm -f *.synctex.gz *.bcf *.run.xml *.bbl *.lof *.lot

cleanall:
	latexmk -C
	rm -f *.synctex.gz *.bcf *.run.xml *.bbl *.lof *.lot

view: main.pdf
	open main.pdf
