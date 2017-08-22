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
    
    <xsl:template match="word[@relation = 'ATR'
        and substring(./@postag, 1, 1) = 'a']">
        
       
        <word>
            <xsl:copy-of select="@*"/>
            <xsl:copy-of select="node()"/>
            <DD><xsl:value-of select="./@DepDist"/></DD>
        </word>
        
        
    </xsl:template>
    
</xsl:stylesheet>