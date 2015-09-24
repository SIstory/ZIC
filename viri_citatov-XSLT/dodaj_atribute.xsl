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
        <xsl:variable name="DID" select="@did"/>
        <xsl:variable name="CID" select="@cid"/>
        <cit did="{@did}" cid="{@cid}">
            <xsl:for-each select="document('../ZIC-izvoz.xml')//delo[field[@name = 'ID'] = $DID]">
                <xsl:for-each select="citat[cid = $CID]">
                    <xsl:if test="avtor0">
                        <xsl:attribute name="avtor0">
                            <xsl:value-of select="avtor0"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="avtor1">
                        <xsl:attribute name="avtor1">
                            <xsl:value-of select="avtor1"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="naslov0">
                        <xsl:attribute name="naslov0">
                            <xsl:value-of select="naslov0"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="naslov1">
                        <xsl:attribute name="naslov1">
                            <xsl:value-of select="naslov1"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="COBISSid">
                        <xsl:attribute name="cobiss">
                            <xsl:value-of select="COBISSid"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:attribute name="source">
                        <xsl:value-of select="vir"/>
                    </xsl:attribute>
                    <xsl:if test="kraj">
                        <xsl:attribute name="pubPlace">
                            <xsl:value-of select="kraj"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="zalozba">
                        <xsl:attribute name="publisher">
                            <xsl:value-of select="zalozba"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="leto">
                        <xsl:attribute name="year">
                            <xsl:value-of select="leto"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="letnik">
                        <xsl:attribute name="volume">
                            <xsl:value-of select="letnik"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="stevilka">
                        <xsl:attribute name="issue">
                            <xsl:value-of select="stevilka"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="str">
                        <xsl:attribute name="page">
                            <xsl:value-of select="str"/>
                        </xsl:attribute>
                    </xsl:if>
                </xsl:for-each>
            </xsl:for-each>
        </cit>
    </xsl:template>
    
</xsl:stylesheet>