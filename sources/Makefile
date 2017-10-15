STYLESHEET=../xsl/tei2md.xsl

# Makefile
# needs to be copied to and run from source directory 
# assumes that folders PDF and Diapos exist
ECHO=

PDFTALKS= \
	02-richessesTEI \
	tei-florilege \
	10-xsltNuls 

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
	03-transcriptionManuscrits \
	04-teiHeader \
	05-msdesc \
	06-entitesNommees \
	07-organisation \
	08-personnalisation \
	09-traitementTEI \
	11-xsltParesseux \
	12-teiCommunity 

default: exercises htmlslides pdfslides

setup:
	mkdir ../pdf ../diapos
# should empty dir if it exists

htmlslides: 
	for f in $(DIAPOS); do echo $$f; \
	saxon -o:../diapos/$$f.html $$f.tei.xml $(STYLESHEET); done; \
	cd ../diapos; perl -pi -e \ 's|xmlns="http://www.tei-c.org/ns/Examples"||e' *.html 


exercises:
	for i in $(EXERCISES) ; do \
		teitopdf $$i.xml ; \
		mv $$i.xml.pdf ../pdf/$$i.pdf; \
	done

slides: pdfslides 

pdfslides:  
	for i in $(PDFTALKS) ; do \
		teitoslides --profile=tei $$i.xml; \
		mv $$i.xml.slides ../diapos/$$i.pdf; \
	done


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

driver:
	cp /home/lou/Public/corpHeaderStart.txt driver.tei;\
		for f in *.xml ; do \
		echo "<xi:include href='$$f'/>" >> driver.tei; \
	done; echo "</teiCorpus>" >> driver.tei


