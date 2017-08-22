<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="word">
       <word>
           <xsl:copy-of select="@*"/>
           <xsl:choose>
               <xsl:when test="./@relation = 'AuxX'">
                   <xsl:attribute name="head">0</xsl:attribute>
               </xsl:when>
           </xsl:choose>
           <xsl:copy-of select="node()"/>
       </word>
            
       
    </xsl:template>
    
</xsl:stylesheet>