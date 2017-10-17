#STYLESHEET=/home/lou/Public/TEIslides/Remark/TEItoRemark.xsl
STYLESHEET=../xsl/tei2remarks.xsl

# Makefile
# needs to be copied to and run from source directory 
# assumes that folders PDF and Diapos exist
ECHO=

PDFTALKS= \
	03-richessesTEI 



EXERCISES= \
	ex01-analyse \
	ex02-oxygen \
	ex03-roma \
	ex04-oulipo \
	ex05-header \
	ex06-msdesc \
	ex07-entites \
	ex08-organisation \
	ex09-odd \
	ex10-explorations \
	ex12-xslt

DIAPOS= \
	01-editionNumerique \
	02-introductionXML \
	04-transcriptionManuscrits \
	05-teiHeader \
	06-msdesc \
	07-entitesNommees \
	08-organisation \
	09-personnalisation \
	10-TEIflorilege \
	11-traitementTEI \
	12-xsltNuls \
	13-xsltParesseux \
	14-outils \
	15-teiCommunity

default: prog exercises htmlslides pdfslides


setup:
	mkdir ../PDF ../Diapos

# should empty dir if it exists


prog:
	saxon -xi -o:../Diapos/00-programme.html 00-programme.xml $(STYLESHEET)

htmlslides: 
	for f in $(DIAPOS); do echo $$f; \
	saxon -o:../Diapos/$$f.html $$f.xml $(STYLESHEET); done; \
	cd ../Diapos; perl -pi -e's|xmlns="http://www.tei-c.org/ns/Examples"||e' *.html 

exercises:
	for i in $(EXERCISES) ; do \
		teitopdf $$i.xml ; \
		mv $$i.xml.pdf ../PDF/$$i.pdf; \
	done

slides: pdfslides 

pdfslides:  
	for i in $(PDFTALKS) ; do \
		teitoslides --profile=tei $$i.xml; \
		mv $$i.xml.slides ../Diapos/$$i.pdf; \
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
	cp corpHeaderStart.txt driver.tei;\
		for f in *.xml ; do \
		echo "<xi:include href='$$f'/>" >> driver.tei; \
	done; echo "</teiCorpus>" >> driver.tei


