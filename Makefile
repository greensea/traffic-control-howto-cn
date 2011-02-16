# -- Makefile for linux IP docs; written 2002-08-09; -MAB
#
#  $Id: Makefile,v 1.2 2003/07/26 21:27:15 mabrown Exp $
#
# -- using ./configure && make


.SUFFIXES:
.SUFFIXES: .xml

# -- a few binaries used for the production of content
#
XSLTPROC           = xsltproc
XSLTPROC_OPTIONS   = --nonet

# -- some directories used in the production of the
#    output
#
BASE               = Traffic-Control-HOWTO
VERSION            = $(shell cat VERSION)
BASEVER            = ${BASE}-${VERSION}
SRCXML             = ${BASE}.xml
XSLCHUNK           = xsl/${BASE}-html-chunk.xsl
XSLNOCHUNK         = xsl/${BASE}-html-nochunk.xsl
XML_CATALOG_FILES  = xsl/catalog.xml
#datadir            = /home/gargoyle/mabrown/tmp
#installdir         = ${datadir}/${BASEVER}
output             = html

.PHONY: html html-nochunk images scripts output install install-dir pubdate humandate css html-chunk
#
# -- this is the first target.  It by default only makes
#    the chunked HTML output (and supporting items)
#
html: html-chunk
	find ${output}/ -type d -print0 \
	  | xargs -0 chmod --change 0755
	find ${output}/ -type f -print0 \
	  | xargs -0 chmod --change 0644

html-chunk: images pubdate humandate css
	XML_CATALOG_FILES=${XML_CATALOG_FILES} ${XSLTPROC}     \
	  ${XSLTPROC_OPTIONS} -stringparam base.dir ${output}/ \
	  ${XSLCHUNK} ${SRCXML}

html-nochunk:
	XML_CATALOG_FILES=${XML_CATALOG_FILES} ${XSLTPROC}     \
	  ${XSLTPROC_OPTIONS} \ ${XSLNOCHUNK} ${SRCXML}        \
	  > ${output}/${BASE}.html

#installdir:
#	test -d ${installdir}  || mkdir -p ${installdir}
#
#install: installdir html
#	cp -ra output/* ${installdir}/

output:
	test -d ${output}      || mkdir -p ${output}

css:
	cp ${BASE}.css    ${output}

images:
	cp -ra images/ ${output}/


pubdate:
	date '+%x' > PUBDATE

humandate:
	date '+%x' > HUMANDATE
