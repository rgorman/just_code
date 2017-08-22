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

            <xsl:for-each select="word">
                <xsl:choose>
                    <xsl:when test="./@relation != 'AuxX'">

                        <xsl:variable name="head_1" select="./@head"/>
                        <xsl:variable name="head_2" select="parent::sentence/word[@id = $head_1]/@head"/>
                        
                        <word>
                            <xsl:copy-of select="@*"/>
                            <sentence_id> 
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>sentence_<xsl:value-of select="../@id"/>
                            </sentence_id>
                            
                            
                            <SELF-pos>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                
                                
                                <xsl:value-of
                                    select="
                                    normalize-space(string-join((
                                     substring(./@postag, 1, 1)
                                     ), '|'))"
                                    > </xsl:value-of>
                            </SELF-pos>
                            
                            <SELF-rel>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                
                                
                                <xsl:value-of
                                    select="
                                    normalize-space(string-join((
                                    ./@relation
                                    ), '|'))"
                                    > </xsl:value-of>
                            </SELF-rel>
                            
                            <SELF-rel-pos>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                
                                
                                <xsl:value-of
                                    select="
                                    normalize-space(string-join((
                                    ./@relation,
                                    substring(./@postag, 1, 1)
                                    ), '|'))"
                                    > </xsl:value-of>
                            </SELF-rel-pos>
                            
                            <SELF-DD-pos>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                
                                
                                <xsl:value-of
                                    select="
                                    normalize-space(string-join((
                                    ./@DepDist,
                                    substring(./@postag, 1, 1)
                                    ), '|'))"
                                    > </xsl:value-of>
                            </SELF-DD-pos>
                            
                            <SELF-DD-rel>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                
                                
                                <xsl:value-of
                                    select="
                                    normalize-space(string-join((
                                    ./@DepDist,
                                    ./@relation
                                    ), '|'))"
                                    > </xsl:value-of>
                            </SELF-DD-rel>
                            
                            
                            <SELF-DD-rel-pos>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                
                                
                                <xsl:value-of
                                    select="
                                    normalize-space(string-join((
                                    ./@DepDist,
                                    ./@relation,
                                    substring(./@postag, 1, 1)
                                    ), '|'))"
                                    > </xsl:value-of>
                            </SELF-DD-rel-pos>
                            
                            
                            
                            <PARENT-pos-SELF-pos>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                
                                <xsl:value-of
                                    select="
                                    normalize-space(string-join((
                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                     substring(./@postag, 1, 1)
                                    ), '|'))"
                                />
                                
                            </PARENT-pos-SELF-pos>
                            
                            <PARENT-pos-SELF-rel>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                
                                <xsl:value-of
                                    select="
                                    normalize-space(string-join((
                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                    ./@relation
                                    ), '|'))"
                                />
                                
                            </PARENT-pos-SELF-rel>
                            
                            <PARENT-pos-SELF-rel-pos>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                
                                <xsl:value-of
                                    select="
                                    normalize-space(string-join((
                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                    ./@relation,
                                    substring(./@postag, 1, 1)
                                    ), '|'))"
                                />
                                
                            </PARENT-pos-SELF-rel-pos>
                            
                            <PARENT-rel-SELF-pos>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                
                                <xsl:value-of
                                    select="
                                    normalize-space(string-join((
                                    parent::sentence/word[@id = $head_1]/@relation,
                                    substring(./@postag, 1, 1)
                                    ), '|'))"
                                />
                                
                            </PARENT-rel-SELF-pos>
                            
                            <PARENT-rel-SELF-rel>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                
                                <xsl:value-of
                                    select="
                                    normalize-space(string-join((
                                    parent::sentence/word[@id = $head_1]/@relation,
                                    ./@relation
                                    ), '|'))"
                                />
                                
                                
                            </PARENT-rel-SELF-rel>
                            
                            <PARENT-rel-SELF-rel-pos>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                
                                <xsl:value-of
                                    select="
                                    normalize-space(string-join((
                                    parent::sentence/word[@id = $head_1]/@relation,
                                    ./@relation,
                                    substring(./@postag, 1, 1)
                                    ), '|'))"
                                />
                                
                            </PARENT-rel-SELF-rel-pos>
                            
                            <PARENT-rel-pos-SELF-pos>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                
                                <xsl:value-of
                                    select="
                                    normalize-space(string-join((
                                    parent::sentence/word[@id = $head_1]/@relation,
                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                    substring(./@postag, 1, 1)
                                    ), '|'))"
                                />
                                
                            </PARENT-rel-pos-SELF-pos>
                            
                            <PARENT-rel-pos-SELF-rel>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                
                                <xsl:value-of
                                    select="
                                    normalize-space(string-join((
                                    parent::sentence/word[@id = $head_1]/@relation,
                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                    ./@relation
                                    ), '|'))"
                                />
                                
                                
                            </PARENT-rel-pos-SELF-rel>
                            
                            <PARENT-rel-pos-SELF-rel-pos>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                
                                <xsl:value-of
                                    select="
                                    normalize-space(string-join((
                                    parent::sentence/word[@id = $head_1]/@relation,
                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                    ./@relation,
                                    substring(./@postag, 1, 1)
                                    ), '|'))"
                                />
                                
                            </PARENT-rel-pos-SELF-rel-pos>
                            
                            
                        </word>

                    </xsl:when>
                </xsl:choose>

            </xsl:for-each>

        </sentence>

    </xsl:template>

</xsl:stylesheet>
