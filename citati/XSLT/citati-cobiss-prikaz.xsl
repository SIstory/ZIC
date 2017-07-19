<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="1.0">
    
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <meta charset="UTF-8" />
                <title>ZIC citati s COBISS identifikatorjem</title>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="root">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    
    <xsl:template match="delo">
        <li></li>
    </xsl:template>
    
</xsl:stylesheet>