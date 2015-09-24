<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>Poenoti različne navedbe števila strani //pubPart/page od največje do najmanjše 
            zapisane. Čeprav so v veliko primerih zapisane številke citiranih strani in ne
            številke strani celotnih objavljenih člankov ali poglavij, vseeno predvidevam, da
            je bolje, da zapišemo najnižjo in najvišjo citirano stran kot pa da ta podatek pustimo prazen.
            Ne izpiše se strani, če je navedena samo ena stran.</desc>
    </doc>
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="pubPart">
        <xsl:variable name="strani">
            <strani>
                <xsl:for-each select="page">
                    <xsl:for-each select="tokenize(.,'\D')">
                        <stran><xsl:value-of select="."/></stran>
                    </xsl:for-each>
                </xsl:for-each>
            </strani>
        </xsl:variable>
        <xsl:variable name="strani-razvrscene">
            <xsl:for-each select="$strani/strani">
                <strani>
                    <xsl:for-each select="stran">
                        <xsl:sort select="number(.)" order="ascending"/>
                        <xsl:if test="string-length(.) gt 0">
                            <xsl:copy-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </strani>
            </xsl:for-each>
        </xsl:variable>
        <pubPart>
            <xsl:for-each select="attribute::*">
                <xsl:variable name="atribut-ime" select="local-name()"/>
                <xsl:attribute name="{$atribut-ime}">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:for-each>
            <xsl:apply-templates select="author"/>
            <xsl:apply-templates select="title"/>
            <xsl:apply-templates select="addTitle"/>
            <xsl:apply-templates select="cobiss"/>
            <xsl:apply-templates select="page"/>
            <xsl:choose>
                <xsl:when test="count($strani-razvrscene/strani/stran) gt 1">
                    <page><xsl:value-of select="concat($strani-razvrscene/strani/stran[1],'-',$strani-razvrscene/strani/stran[position() eq last()])"/></page>
                </xsl:when>
                <xsl:otherwise>
                    <!-- ne procesiram -->
                </xsl:otherwise>
            </xsl:choose>
            <xsl:copy-of select="citedIn"/>
        </pubPart>
    </xsl:template>
    
    <xsl:template match="page">
        <!-- ne procesiram -->
    </xsl:template>
    
    <xsl:template match="author">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="title">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="addTitle">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="cobiss">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    
</xsl:stylesheet>