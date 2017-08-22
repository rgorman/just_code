<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    <xsl:template match="sentence">
         
            <xsl:variable name="reference">
                <xsl:value-of select="//comment"/>
            </xsl:variable>
        
          
               <sentence id="{./@id}" document_id="{./@document_id}" subdoc="{./@subdoc}"><xsl:attribute name="span">
                  <xsl:value-of select="$reference"/>: s-<xsl:number/>
               </xsl:attribute>
                      <xsl:for-each select="word">
                          <xsl:copy-of select="."/>
                          <xsl:copy-of select="node()"/>
                      </xsl:for-each>        
               </sentence>
           
        
    </xsl:template>
   
    
</xsl:stylesheet>