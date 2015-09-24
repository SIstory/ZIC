<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>V elemente //pubPart/citedIn/cit se poleg nujnih atributov did in cid iz prvotne baze
            ZIC doda še vse ostale atribute</desc>
    </doc>
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="cit">
        <cit did="{@did}" cid="{@cid}">
            <!-- ostale atribute ne procesiram -->
        </cit>
    </xsl:template>
    
</xsl:stylesheet>