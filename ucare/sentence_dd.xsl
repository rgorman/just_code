<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="sentence">
        <sentence>
            <xsl:copy-of select="@*"/>
            <sentence_id>
                <xsl:value-of select="./@id"/>
            </sentence_id>
            <Avg_DD>
                <xsl:value-of select="./@Mean_DepDist"/>
            </Avg_DD>
            <token_count>
                <xsl:value-of select="count(./word)"/>
            </token_count>
                
       </sentence>

    </xsl:template>

</xsl:stylesheet>
