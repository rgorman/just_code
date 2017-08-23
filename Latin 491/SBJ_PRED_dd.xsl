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
        <xsl:for-each select="word">
            <xsl:variable name="s-rel" select="./@relation"/>
            <xsl:variable name="head_1" select="./@head"/>
            <xsl:variable name="p-rel" select="parent::sentence/word[@id = $head_1]/@relation"/>
            
            <xsl:choose>
                <xsl:when test="$s-rel = 'SBJ'
                    and $p-rel = 'PRED'">
                    
                    <word>
                        <xsl:copy-of select="@*"/>
                        <xsl:copy-of select="node()"/>
                        <s-rel><xsl:value-of select="$s-rel"/></s-rel>
                        <s-head><xsl:value-of select="$head_1"/></s-head>
                        <p-rel><xsl:value-of select="$p-rel"/></p-rel>
                        <DD><xsl:value-of select="./@DepDist"/></DD>
                    </word>
                    
                </xsl:when>
            </xsl:choose>
            
            
            
        </xsl:for-each>
        
       
        
        
    </xsl:template>
    
</xsl:stylesheet>