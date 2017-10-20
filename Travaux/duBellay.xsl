<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">

<xsl:param name="modernize">non</xsl:param>


    <xsl:template match="head">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>

    <xsl:template match="l">
        <xsl:apply-templates/>
        <br/>
    </xsl:template>
    
    <xsl:template match="lg">
        <xsl:number/>
        <p>
            <xsl:apply-templates select="l[1]"/>
        </p>
    </xsl:template>

<xsl:template match="choice">
    <xsl:choose>
        <xsl:when test="$modernize eq'oui'">
            <xsl:value-of select="reg"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="orig"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>
    
<xsl:template match="choice/orig"/>
<xsl:template match="choice/reg"/>
    

    <xsl:template match="TEI">
        <html>
            <head>
                <title>
                    <xsl:value-of select="teiHeader/fileDesc/titleStmt/title"/>
                </title>
            </head>
            <body>
                <xsl:apply-templates select="text"/>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
