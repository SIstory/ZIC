<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="root">
        <xsl:for-each select="/root/source/year/issue/pubPart/title[1]">
            <xsl:sort/>
            <naslov>
                <xsl:value-of select="."/>
            </naslov>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
