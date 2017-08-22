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
        <sentence>
            <xsl:copy-of select="@*"/>
            <xsl:for-each select="word">
                <xsl:choose>
                    <xsl:when test="./@insertion_id ">
                        <word id="{./@id}" 
                            form="{./@form}" 
                            insertion_id="{./@insertion_id}"
                            artificial="{./@artificial}"
                            lemma="{./@lemma}" 
                            postag="{./@postag}" 
                            relation="{./@relation}" 
                            head="{./@head}" 
                            cite="{./@cite}{parent::sentence/@span} w-{./@id}"/>        
                    </xsl:when>
                    <xsl:otherwise>
                        <word id="{./@id}" 
                            form="{./@form}" 
                            lemma="{./@lemma}" 
                            postag="{./@postag}" 
                            relation="{./@relation}" 
                            head="{./@head}" 
                            cite="{./@cite} {parent::sentence/@span} w-{./@id}"/>
                    </xsl:otherwise>
                </xsl:choose>           
                
                
            </xsl:for-each>
            
            
        </sentence>
            
                
                
              
            
    </xsl:template>
    
</xsl:stylesheet>