<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
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
                <word>
                    <xsl:copy-of select="@*"/>
                    <xsl:attribute name="cite">
                        <xsl:value-of select="./@cite"/>
                        <xsl:value-of select="parent::sentence/@span"/> w-<xsl:value-of
                            select="./@id"/>
                    </xsl:attribute>
                    <xsl:copy-of select="node()"/>
                </word>

            </xsl:for-each>
        </sentence>





    </xsl:template>

</xsl:stylesheet>
