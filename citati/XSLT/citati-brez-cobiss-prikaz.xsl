<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8" />
                <title>ZIC citati s COBISS identifikatorjem</title>
            </head>
            <body>
                <xsl:apply-templates select="root"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="root">
        <h1>ZIC citati s COBISS identifikatorjem</h1>
        <xsl:apply-templates select="delo[not(@cobiss)]"/>
    </xsl:template>
    
    <xsl:template match="delo[not(@cobiss)]">
        <p>
            <xsl:variable name="title">
                <xsl:choose>
                    <xsl:when test="title">
                        <xsl:value-of select="normalize-space(title)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="normalize-space(naslov[1])"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="search-string" select="translate(normalize-space(translate($title,';:.,&quot;','')),' ','+')"/>
            <a href="{ concat('https://plus.si.cobiss.net/opac7/bib/search?q=',$search-string,'&amp;db=cobib&amp;mat=allmaterials')}" target="_blank">
                <xsl:value-of select="$title"/>
            </a>
            <ul>
                <xsl:for-each select="cit">
                    <li>
                        <xsl:value-of select="@avtor0"/>
                        <xsl:if test="@avtor1">
                            <xsl:value-of select="concat('; ',@avtor1)"/>
                        </xsl:if>
                        <xsl:if test="@avtor0 or @avtor1">
                            <xsl:text>. </xsl:text>
                        </xsl:if>
                        <xsl:value-of select="@naslov0"/>
                        <xsl:if test="@naslov1">
                            <xsl:value-of select="concat(' : ',@naslov1)"/>
                        </xsl:if>
                        <xsl:if test="@source">
                            <xsl:text>. V: </xsl:text>
                            <xsl:value-of select="@source"/>
                        </xsl:if>
                        <xsl:if test="@volume">
                            <xsl:text>, vol. </xsl:text>
                            <xsl:value-of select="@volume"/>
                        </xsl:if>
                        <xsl:if test="@issue">
                            <xsl:text>, št. </xsl:text>
                            <xsl:value-of select="@issue"/>
                        </xsl:if>
                        <xsl:if test="@pubPlace or @publisher or @year">
                            <xsl:text> (</xsl:text>
                            <xsl:value-of select="@pubPlace"/>
                            <xsl:if test="@pubPlace and @publisher">
                                <xsl:text>: </xsl:text>
                            </xsl:if>
                            <xsl:value-of select="@publisher"/>
                            <xsl:if test="(@pubPlace or @publisher) and @year">
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                            <xsl:value-of select="@year"/>
                            <xsl:text>)</xsl:text>
                        </xsl:if>
                        <xsl:if test="@page">
                            <xsl:value-of select="concat(', str. ',@page)"/>
                        </xsl:if>
                    </li>
                </xsl:for-each>
                <li>
                    <xsl:text>//delo[@mojID='</xsl:text>
                    <xsl:value-of select="@mojID"/>
                    <xsl:text>']</xsl:text>
                </li>
            </ul>
        </p>
    </xsl:template>
    
</xsl:stylesheet>