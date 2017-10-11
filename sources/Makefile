# Makefile
# needs to be copied to and run from source directory 
ECHO=

# these are the talks which dont work in html
PDFTALKS= \
	talk-01 \
	talk-02-tei \
	tei-history \
	ex-2-analyse


EXERCISES= \
	ex-1-oxygen \
	ex-2-analyse \
	ex-3-roma \
	ex-4-oulipo \
	ex-5-header \
	ex-6-msdesc \
	ex-7-entites \
	ex-8-organisation \
	ex-9-odd \
	ex-11-xslt

DIAPOS= \
	00-programme \
	01-editionNumerique \
	02-richessesTEI \
	03-transcriptionManuscrits \
	04-teiHeader \
	05-msdesc \
	06-entitesNommees \
	07-organisation \
	08-personnalisation \
	09-traitementTEI \
	11-xsltParesseux \
	12-teiCommunity 

default: exercises htmlslides

htmlslides: 
	for f in $(DIAPOS); do echo $$f; \
	saxon -o:../diapos/$$f.html $$f.tei.xml ../xsl/tei2md.xsl; done; \
	cd ../diapos; perl -pi -e \ 's|xmlns="http://www.tei-c.org/ns/Examples"||e' *.html 


exercises:
	for i in $(EXERCISES) ; do \
		teitopdf $$i.xml ; \
		mv $$i.xml.pdf ../diapos/$$i.pdf; \
	done

slides: pdfslides 

pdfslides:  
	for i in $(PDFTALKS) ; do \
#		saxon $$i.xml frenchify.xsl > $$i-fr.xml; \
		teitoslides --profile=tei $$i-fr.xml; 		
	teitoslides --profile=tei $$i.xml; \
		mv $$i.xml.slides ../diapos/$$i.pdf; \
	done

setup:
	mkdir ../diapos ../xsl ../media

clean:
	-rm -f *.aux
	-rm -f *.log
	-rm -f *.nav
	-rm -f *.out
	-rm -f *.snm
	-rm -f *.tex
	-rm -f *.toc
	-rm -f *.vrb
	-rm -f *.eps *.dvi
	-rm -f *.xhtml
	-rm -f *~


validate:
	-for i in $(TALKS) ; do onvdl ../teitalks.nvdl `basename $$i .xml`.xml \
	 | grep -v ': error: unfinished element$$' \
	 | grep -v ': error: unfinished element .* required to finish the element$$'; done


