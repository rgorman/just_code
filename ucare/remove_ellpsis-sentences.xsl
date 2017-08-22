<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="sentence">
        <xsl:choose>
            <xsl:when test="./word/@insertion_id"></xsl:when>
            <xsl:otherwise><xsl:copy-of select="."></xsl:copy-of></xsl:otherwise>
            
            
        </xsl:choose>
        
    </xsl:template>
    
</xsl:stylesheet>