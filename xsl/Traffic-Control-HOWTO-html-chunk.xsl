<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version='1.0'
                xmlns="http://www.w3.org/TR/xhtml1/transitional"
                exclude-result-prefixes="#default">

<!-- $Id: Traffic-Control-HOWTO-html-chunk.xsl,v 1.1 2003/09/08 17:07:55 mabrown Exp $ -->

<!-- This stylesheet calls Norman Walsh's 'docbook.xsl' stylesheet
     and therefore generates MULTIPLE HTML FILES as output. -->

<!-- Note the the *order* of the import statements below is important and
     should not be changed. -->

<!-- Change this to the path to where you have installed Norman
     Walsh's XSL stylesheets -->
<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/xhtml/chunk.xsl"/>

<!-- Imports the common LDP customization layer. -->
<xsl:import href="ldp-html-common.xsl"/>

<!-- If there was some reason to override 'ldp-html-common.xsl' or to 
     perform any other customizations that affect *only* the generation
     of multiple HTML files, those templates or parameters could be
     entered here. -->

<xsl:import href="Traffic-Control-HOWTO-html-common.xsl"/>

</xsl:stylesheet>
