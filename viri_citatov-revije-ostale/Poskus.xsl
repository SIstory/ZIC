<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="root">

        <naslov>
            <xsl:for-each select="//title">
                <xsl:sort/>
            </xsl:for-each>
        </naslov>

    </xsl:template>




</xsl:stylesheet>
