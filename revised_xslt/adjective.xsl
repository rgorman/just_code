<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="xml" indent="yes"/>


    <xsl:template match="subTree_document">

        <sWord_document>
            <xsl:for-each select="//word">
                <xsl:choose>
                    <xsl:when test="./@relation != 'AuxX'">

                        <xsl:variable name="head_1" select="./@head"/>
                        <xsl:variable name="head_2"
                            select="parent::sentence/word[@id = $head_1]/@head"/>
                        <xsl:variable name="head_3"
                            select="parent::sentence/word[@id = $head_2]/@head"/>
                        <xsl:variable name="head_4"
                            select="parent::sentence/word[@id = $head_3]/@head"/>
                        <xsl:variable name="head_5"
                            select="parent::sentence/word[@id = $head_4]/@head"/>
                        <xsl:variable name="head_6"
                            select="parent::sentence/word[@id = $head_5]/@head"/>
                        <xsl:variable name="head_7"
                            select="parent::sentence/word[@id = $head_6]/@head"/>

                        <word>
                            <xsl:copy-of select="@*"/>

                            <xsl:choose>
                                <xsl:when test="substring(./@postag, 1, 1) = 'a'">
                                    <!-- select words with gender, number, or case morphology -->

                                    <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->


                                    <DD-rel-morph-pos-degree-sWord-0>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>

                                        <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                        <xsl:value-of
                                            select="
                                                normalize-space(string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                substring(./@postag, 1, 1),
                                                substring(./@postag, 9, 1)
                                                ), '|'))"
                                        > </xsl:value-of>
                                    </DD-rel-morph-pos-degree-sWord-0>

                                    <DD-rel-morph-pos-degree-sWord-1>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        ./@DepDist,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1),
                                                        substring(./@postag, 9, 1)
                                                        ), '|'))"
                                                > </xsl:value-of>
                                            </xsl:when>
                                            <xsl:when test="$head_1 > 0">
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                        ./@DepDist,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1),
                                                        substring(./@postag, 9, 1)
                                                        ), '|'))"
                                                />
                                            </xsl:when>

                                        </xsl:choose>
                                    </DD-rel-morph-pos-degree-sWord-1>

                                    <xsl:choose>
                                        <xsl:when test="$head_2 = 0">
                                            <DD-rel-morph-pos-degree-sWord-2><xsl:attribute
                                                  name="ref"><xsl:value-of select="./@cite"
                                                  /></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                        ./@DepDist,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1),
                                                        substring(./@postag, 9, 1)
                                                        ), '|'))"
                                                />
                                            </DD-rel-morph-pos-degree-sWord-2>
                                        </xsl:when>
                                        <xsl:when test="$head_2 > 0">
                                            <DD-rel-morph-pos-degree-sWord-2>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                        ./@relation,
                                                        substring(./@postag, 1, 1),
                                                        substring(./@postag, 9, 1)
                                                        ), '|'))"
                                                />
                                            </DD-rel-morph-pos-degree-sWord-2>

                                        </xsl:when>
                                    </xsl:choose>


                                    <xsl:choose>
                                        <xsl:when test="$head_3 = 0">
                                            <DD-rel-morph-pos-degree-sWord-3><xsl:attribute
                                                  name="ref"><xsl:value-of select="./@cite"
                                                  /></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                        ./@DepDist,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1),
                                                        substring(./@postag, 9, 1)
                                                        ), '|'))"
                                                />
                                            </DD-rel-morph-pos-degree-sWord-3>
                                        </xsl:when>
                                        <xsl:when test="$head_3 > 0">
                                            <DD-rel-morph-pos-degree-sWord-3>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_3]/@DepDist,
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 9, 1),
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                        ./@DepDist,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1),
                                                        substring(./@postag, 9, 1)
                                                        ), '|'))"
                                                />
                                            </DD-rel-morph-pos-degree-sWord-3>
                                        </xsl:when>
                                    </xsl:choose>

                                    <xsl:choose>
                                        <xsl:when test="$head_4 = 0">
                                            <DD-rel-morph-pos-degree-sWord-4><xsl:attribute
                                                  name="ref"><xsl:value-of select="./@cite"
                                                  /></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_3]/@DepDist,
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 9, 1),
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                        ./@DepDist,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1),
                                                        substring(./@postag, 9, 1)
                                                        ), '|'))"
                                                />
                                            </DD-rel-morph-pos-degree-sWord-4>
                                        </xsl:when>
                                        <xsl:when test="$head_4 > 0">
                                            <DD-rel-morph-pos-degree-sWord-4>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_4]/@DepDist,
                                                        parent::sentence/word[@id = $head_4]/@relation,
                                                        substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_4]/@postag, 9, 1),
                                                        parent::sentence/word[@id = $head_3]/@DepDist,
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 9, 1),
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                        ./@DepDist,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1),
                                                        substring(./@postag, 9, 1)
                                                        ), '|'))"
                                                />
                                            </DD-rel-morph-pos-degree-sWord-4>
                                        </xsl:when>
                                    </xsl:choose>

                                    <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->

                                    <DD-rel-morph-pos-number-degree-sWord-0>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        
                                        <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 3, 1), 
                                            substring(./@postag, 9, 1)
                                            ), '|'))"
                                            > </xsl:value-of>
                                    </DD-rel-morph-pos-number-degree-sWord-0>
                                    
                                    <DD-rel-morph-pos-number-degree-sWord-1>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                                select="
                                                normalize-space(string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                substring(./@postag, 1, 1),
                                                substring(./@postag, 3, 1), 
                                                substring(./@postag, 9, 1)
                                                ), '|'))"
                                                > </xsl:value-of>
                                            </xsl:when>
                                            <xsl:when test="$head_1 > 0">
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1), 
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </xsl:when>
                                            
                                        </xsl:choose>
                                    </DD-rel-morph-pos-number-degree-sWord-1>
                                    
                                    <xsl:choose>
                                        <xsl:when test="$head_2 = 0">
                                            <DD-rel-morph-pos-number-degree-sWord-2><xsl:attribute name="ref"
                                                ><xsl:value-of select="./@cite"
                                                /></xsl:attribute>#-<xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),                                                      
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1), 
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-number-degree-sWord-2>
                                        </xsl:when>
                                        <xsl:when test="$head_2 > 0">
                                            <DD-rel-morph-pos-number-degree-sWord-2>
                                                <xsl:attribute name="ref">
                                                    <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1), 
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-number-degree-sWord-2>
                                            
                                        </xsl:when>
                                    </xsl:choose>
                                    
                                    
                                    <xsl:choose>
                                        <xsl:when test="$head_3 = 0">
                                            <DD-rel-morph-pos-number-degree-sWord-3><xsl:attribute name="ref"
                                                ><xsl:value-of select="./@cite"
                                                /></xsl:attribute>#-<xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1), 
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-number-degree-sWord-3>
                                        </xsl:when>
                                        <xsl:when test="$head_3 > 0">
                                            <DD-rel-morph-pos-number-degree-sWord-3>
                                                <xsl:attribute name="ref">
                                                    <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_3]/@DepDist,
                                                    parent::sentence/word[@id = $head_3]/@relation,
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1), 
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-number-degree-sWord-3>
                                        </xsl:when>
                                    </xsl:choose>
                                    
                                    <xsl:choose>
                                        <xsl:when test="$head_4 = 0">
                                            <DD-rel-morph-pos-number-degree-sWord-4><xsl:attribute name="ref"
                                                ><xsl:value-of select="./@cite"
                                                /></xsl:attribute>#-<xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_3]/@DepDist,
                                                    parent::sentence/word[@id = $head_3]/@relation,
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1), 
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-number-degree-sWord-4>
                                        </xsl:when>
                                        <xsl:when test="$head_4 > 0">
                                            <DD-rel-morph-pos-number-degree-sWord-4>
                                                <xsl:attribute name="ref">
                                                    <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_4]/@DepDist,
                                                    parent::sentence/word[@id = $head_4]/@relation,
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_3]/@DepDist,
                                                    parent::sentence/word[@id = $head_3]/@relation,
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1), 
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-number-degree-sWord-4>
                                        </xsl:when>
                                    </xsl:choose>
                                    
                                    <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->

                                    <DD-rel-morph-pos-gender-degree-sWord-0>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        
                                        <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 7, 1), 
                                            substring(./@postag, 9, 1)
                                            ), '|'))"
                                            > </xsl:value-of>
                                    </DD-rel-morph-pos-gender-degree-sWord-0>
                                    
                                    <DD-rel-morph-pos-gender-degree-sWord-1>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                                select="
                                                normalize-space(string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                substring(./@postag, 1, 1),
                                                substring(./@postag, 7, 1), 
                                                substring(./@postag, 9, 1)
                                                ), '|'))"
                                                > </xsl:value-of>
                                            </xsl:when>
                                            <xsl:when test="$head_1 > 0">
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 7, 1), 
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </xsl:when>
                                            
                                        </xsl:choose>
                                    </DD-rel-morph-pos-gender-degree-sWord-1>
                                    
                                    <xsl:choose>
                                        <xsl:when test="$head_2 = 0">
                                            <DD-rel-morph-pos-gender-degree-sWord-2><xsl:attribute name="ref"
                                                ><xsl:value-of select="./@cite"
                                                /></xsl:attribute>#-<xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),                                                      
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 7, 1), 
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-gender-degree-sWord-2>
                                        </xsl:when>
                                        <xsl:when test="$head_2 > 0">
                                            <DD-rel-morph-pos-gender-degree-sWord-2>
                                                <xsl:attribute name="ref">
                                                    <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 7, 1), 
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-gender-degree-sWord-2>
                                            
                                        </xsl:when>
                                    </xsl:choose>
                                    
                                    
                                    <xsl:choose>
                                        <xsl:when test="$head_3 = 0">
                                            <DD-rel-morph-pos-gender-degree-sWord-3><xsl:attribute name="ref"
                                                ><xsl:value-of select="./@cite"
                                                /></xsl:attribute>#-<xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 7, 1), 
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-gender-degree-sWord-3>
                                        </xsl:when>
                                        <xsl:when test="$head_3 > 0">
                                            <DD-rel-morph-pos-gender-degree-sWord-3>
                                                <xsl:attribute name="ref">
                                                    <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_3]/@DepDist,
                                                    parent::sentence/word[@id = $head_3]/@relation,
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 7, 1), 
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-gender-degree-sWord-3>
                                        </xsl:when>
                                    </xsl:choose>
                                    
                                    <xsl:choose>
                                        <xsl:when test="$head_4 = 0">
                                            <DD-rel-morph-pos-gender-degree-sWord-4><xsl:attribute name="ref"
                                                ><xsl:value-of select="./@cite"
                                                /></xsl:attribute>#-<xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_3]/@DepDist,
                                                    parent::sentence/word[@id = $head_3]/@relation,
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 7, 1), 
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-gender-degree-sWord-4>
                                        </xsl:when>
                                        <xsl:when test="$head_4 > 0">
                                            <DD-rel-morph-pos-gender-degree-sWord-4>
                                                <xsl:attribute name="ref">
                                                    <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_4]/@DepDist,
                                                    parent::sentence/word[@id = $head_4]/@relation,
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_3]/@DepDist,
                                                    parent::sentence/word[@id = $head_3]/@relation,
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 7, 1), 
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-gender-degree-sWord-4>
                                        </xsl:when>
                                    </xsl:choose>

                                    <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->

                                    <DD-rel-morph-pos-case-degree-sWord-0>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>

                                        <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                        <xsl:value-of
                                            select="
                                                normalize-space(string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                substring(./@postag, 1, 1),
                                                substring(./@postag, 8, 1), 
                                                substring(./@postag, 9, 1)
                                                ), '|'))"
                                        > </xsl:value-of>
                                    </DD-rel-morph-pos-case-degree-sWord-0>

                                    <DD-rel-morph-pos-case-degree-sWord-1>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        ./@DepDist,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1),
                                                        substring(./@postag, 8, 1), 
                                                        substring(./@postag, 9, 1)
                                                        ), '|'))"
                                                > </xsl:value-of>
                                            </xsl:when>
                                            <xsl:when test="$head_1 > 0">
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                        ./@DepDist,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1),
                                                        substring(./@postag, 8, 1), 
                                                        substring(./@postag, 9, 1)
                                                        ), '|'))"
                                                />
                                            </xsl:when>

                                        </xsl:choose>
                                    </DD-rel-morph-pos-case-degree-sWord-1>

                                    <xsl:choose>
                                        <xsl:when test="$head_2 = 0">
                                            <DD-rel-morph-pos-case-degree-sWord-2><xsl:attribute name="ref"
                                                  ><xsl:value-of select="./@cite"
                                                  /></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),                                                      
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                        ./@DepDist,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1),
                                                        substring(./@postag, 8, 1), 
                                                        substring(./@postag, 9, 1)
                                                        ), '|'))"
                                                />
                                            </DD-rel-morph-pos-case-degree-sWord-2>
                                        </xsl:when>
                                        <xsl:when test="$head_2 > 0">
                                            <DD-rel-morph-pos-case-degree-sWord-2>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                        ./@relation,
                                                        substring(./@postag, 1, 1),
                                                        substring(./@postag, 8, 1), 
                                                        substring(./@postag, 9, 1)
                                                        ), '|'))"
                                                />
                                            </DD-rel-morph-pos-case-degree-sWord-2>

                                        </xsl:when>
                                    </xsl:choose>


                                    <xsl:choose>
                                        <xsl:when test="$head_3 = 0">
                                            <DD-rel-morph-pos-case-degree-sWord-3><xsl:attribute name="ref"
                                                  ><xsl:value-of select="./@cite"
                                                  /></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                        ./@DepDist,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1),
                                                        substring(./@postag, 8, 1), 
                                                        substring(./@postag, 9, 1)
                                                        ), '|'))"
                                                />
                                            </DD-rel-morph-pos-case-degree-sWord-3>
                                        </xsl:when>
                                        <xsl:when test="$head_3 > 0">
                                            <DD-rel-morph-pos-case-degree-sWord-3>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_3]/@DepDist,
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 9, 1),
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                        ./@DepDist,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1),
                                                        substring(./@postag, 8, 1), 
                                                        substring(./@postag, 9, 1)
                                                        ), '|'))"
                                                />
                                            </DD-rel-morph-pos-case-degree-sWord-3>
                                        </xsl:when>
                                    </xsl:choose>

                                    <xsl:choose>
                                        <xsl:when test="$head_4 = 0">
                                            <DD-rel-morph-pos-case-degree-sWord-4><xsl:attribute name="ref"
                                                  ><xsl:value-of select="./@cite"
                                                  /></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_3]/@DepDist,
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 9, 1),
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                        ./@DepDist,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1),
                                                        substring(./@postag, 8, 1), 
                                                        substring(./@postag, 9, 1)
                                                        ), '|'))"
                                                />
                                            </DD-rel-morph-pos-case-degree-sWord-4>
                                        </xsl:when>
                                        <xsl:when test="$head_4 > 0">
                                            <DD-rel-morph-pos-case-degree-sWord-4>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_4]/@DepDist,
                                                        parent::sentence/word[@id = $head_4]/@relation,
                                                        substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_4]/@postag, 8, 1),
                                                        substring(parent::sentence/word[@id = $head_4]/@postag, 9, 1),
                                                        parent::sentence/word[@id = $head_3]/@DepDist,
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 9, 1),
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                        ./@DepDist,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1),
                                                        substring(./@postag, 8, 1), 
                                                        substring(./@postag, 9, 1)
                                                        ), '|'))"
                                                />
                                            </DD-rel-morph-pos-case-degree-sWord-4>
                                        </xsl:when>
                                    </xsl:choose>


                                    <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                                    
                                    
                                   
                                    
                                    <DD-rel-morph-pos-number-gender-degree-sWord-0>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        
                                        <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                            a <rel-pos-sWord-0> element. -->
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                    > </xsl:value-of>
                                    </DD-rel-morph-pos-number-gender-degree-sWord-0>
                                    
                                    <DD-rel-morph-pos-number-gender-degree-sWord-1>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                                select="
                                                normalize-space(string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                substring(./@postag, 1, 1),
                                                substring(./@postag, 3, 1),
                                                substring(./@postag, 7, 1),
                                                substring(./@postag, 9, 1)
                                                ), '|'))"
                                                > </xsl:value-of>
                                            </xsl:when>
                                            <xsl:when test="$head_1 > 0">
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </xsl:when>
                                            
                                        </xsl:choose>
                                    </DD-rel-morph-pos-number-gender-degree-sWord-1>
                                    
                                    <xsl:choose>
                                        <xsl:when test="$head_2 = 0">
                                            <DD-rel-morph-pos-number-gender-degree-sWord-2><xsl:attribute
                                                name="ref"><xsl:value-of select="./@cite"
                                                /></xsl:attribute>#-<xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-number-gender-degree-sWord-2>
                                        </xsl:when>
                                        <xsl:when test="$head_2 > 0">
                                            <DD-rel-morph-pos-number-gender-degree-sWord-2>
                                                <xsl:attribute name="ref">
                                                    <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 7, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-number-gender-degree-sWord-2>
                                            
                                        </xsl:when>
                                    </xsl:choose>
                                    
                                    
                                    <xsl:choose>
                                        <xsl:when test="$head_3 = 0">
                                            <DD-rel-morph-pos-number-gender-degree-sWord-3><xsl:attribute
                                                name="ref"><xsl:value-of select="./@cite"
                                                /></xsl:attribute>#-<xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-number-gender-degree-sWord-3>
                                        </xsl:when>
                                        <xsl:when test="$head_3 > 0">
                                            <DD-rel-morph-pos-number-gender-degree-sWord-3>
                                                <xsl:attribute name="ref">
                                                    <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_3]/@DepDist,
                                                    parent::sentence/word[@id = $head_3]/@relation,
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-number-gender-degree-sWord-3>
                                        </xsl:when>
                                    </xsl:choose>
                                    
                                    <xsl:choose>
                                        <xsl:when test="$head_4 = 0">
                                            <DD-rel-morph-pos-number-gender-degree-sWord-4><xsl:attribute
                                                name="ref"><xsl:value-of select="./@cite"
                                                /></xsl:attribute>#-<xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_3]/@DepDist,
                                                    parent::sentence/word[@id = $head_3]/@relation,
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-number-gender-degree-sWord-4>
                                        </xsl:when>
                                        <xsl:when test="$head_4 > 0">
                                            <DD-rel-morph-pos-number-gender-degree-sWord-4>
                                                <xsl:attribute name="ref">
                                                    <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_4]/@DepDist,
                                                    parent::sentence/word[@id = $head_4]/@relation,
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_3]/@DepDist,
                                                    parent::sentence/word[@id = $head_3]/@relation,
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-number-gender-degree-sWord-4>
                                        </xsl:when>
                                    </xsl:choose>

                           <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX --> 
                                    
                                    <DD-rel-morph-pos-number-case-degree-sWord-0>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        
                                        <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                            a <rel-pos-sWord-0> element. -->
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 8, 1),
                                            substring(./@postag, 9, 1)
                                            ), '|'))"
                                            > </xsl:value-of>
                                    </DD-rel-morph-pos-number-case-degree-sWord-0>
                                    
                                    <DD-rel-morph-pos-number-case-degree-sWord-1>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                                select="
                                                normalize-space(string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                substring(./@postag, 1, 1),
                                                substring(./@postag, 3, 1),
                                                substring(./@postag, 8, 1),
                                                substring(./@postag, 9, 1)
                                                ), '|'))"
                                                > </xsl:value-of>
                                            </xsl:when>
                                            <xsl:when test="$head_1 > 0">
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1),
                                                    substring(./@postag, 8, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </xsl:when>
                                            
                                        </xsl:choose>
                                    </DD-rel-morph-pos-number-case-degree-sWord-1>
                                    
                                    <xsl:choose>
                                        <xsl:when test="$head_2 = 0">
                                            <DD-rel-morph-pos-number-case-degree-sWord-2><xsl:attribute
                                                name="ref"><xsl:value-of select="./@cite"
                                                /></xsl:attribute>#-<xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1),
                                                    substring(./@postag, 8, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-number-case-degree-sWord-2>
                                        </xsl:when>
                                        <xsl:when test="$head_2 > 0">
                                            <DD-rel-morph-pos-number-case-degree-sWord-2>
                                                <xsl:attribute name="ref">
                                                    <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1),
                                                    substring(./@postag, 8, 1),
                                                    substring(./@postag, 8, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-number-case-degree-sWord-2>
                                            
                                        </xsl:when>
                                    </xsl:choose>
                                    
                                    
                                    <xsl:choose>
                                        <xsl:when test="$head_3 = 0">
                                            <DD-rel-morph-pos-number-case-degree-sWord-3><xsl:attribute
                                                name="ref"><xsl:value-of select="./@cite"
                                                /></xsl:attribute>#-<xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1),
                                                    substring(./@postag, 8, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-number-case-degree-sWord-3>
                                        </xsl:when>
                                        <xsl:when test="$head_3 > 0">
                                            <DD-rel-morph-pos-number-case-degree-sWord-3>
                                                <xsl:attribute name="ref">
                                                    <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_3]/@DepDist,
                                                    parent::sentence/word[@id = $head_3]/@relation,
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1),
                                                    substring(./@postag, 8, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-number-case-degree-sWord-3>
                                        </xsl:when>
                                    </xsl:choose>
                                    
                                    <xsl:choose>
                                        <xsl:when test="$head_4 = 0">
                                            <DD-rel-morph-pos-number-case-degree-sWord-4><xsl:attribute
                                                name="ref"><xsl:value-of select="./@cite"
                                                /></xsl:attribute>#-<xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_3]/@DepDist,
                                                    parent::sentence/word[@id = $head_3]/@relation,
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1),
                                                    substring(./@postag, 8, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-number-case-degree-sWord-4>
                                        </xsl:when>
                                        <xsl:when test="$head_4 > 0">
                                            <DD-rel-morph-pos-number-case-degree-sWord-4>
                                                <xsl:attribute name="ref">
                                                    <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_4]/@DepDist,
                                                    parent::sentence/word[@id = $head_4]/@relation,
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_3]/@DepDist,
                                                    parent::sentence/word[@id = $head_3]/@relation,
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1),
                                                    substring(./@postag, 8, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-number-case-degree-sWord-4>
                                        </xsl:when>
                                    </xsl:choose>
                                    
                         <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                                    
                                    <DD-rel-morph-pos-gender-case-degree-sWord-0>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                                                              
                                        
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                    > </xsl:value-of>
                                    </DD-rel-morph-pos-gender-case-degree-sWord-0>
                                    
                                    <DD-rel-morph-pos-gender-case-degree-sWord-1>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                                select="
                                                normalize-space(string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                substring(./@postag, 1, 1),
                                                substring(./@postag, 7, 1),
                                                substring(./@postag, 8, 1),
                                                substring(./@postag, 9, 1)
                                                ), '|'))"
                                                > </xsl:value-of>
                                            </xsl:when>
                                            <xsl:when test="$head_1 > 0">
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </xsl:when>
                                            
                                        </xsl:choose>
                                    </DD-rel-morph-pos-gender-case-degree-sWord-1>
                                    
                                    <xsl:choose>
                                        <xsl:when test="$head_2 = 0">
                                            <DD-rel-morph-pos-gender-case-degree-sWord-2><xsl:attribute
                                                name="ref"><xsl:value-of select="./@cite"
                                                /></xsl:attribute>#-<xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-gender-case-degree-sWord-2>
                                        </xsl:when>
                                        <xsl:when test="$head_2 > 0">
                                            <DD-rel-morph-pos-gender-case-degree-sWord-2>
                                                <xsl:attribute name="ref">
                                                    <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-gender-case-degree-sWord-2>
                                            
                                        </xsl:when>
                                    </xsl:choose>
                                    
                                    
                                    <xsl:choose>
                                        <xsl:when test="$head_3 = 0">
                                            <DD-rel-morph-pos-gender-case-degree-sWord-3><xsl:attribute
                                                name="ref"><xsl:value-of select="./@cite"
                                                /></xsl:attribute>#-<xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-gender-case-degree-sWord-3>
                                        </xsl:when>
                                        <xsl:when test="$head_3 > 0">
                                            <DD-rel-morph-pos-gender-case-degree-sWord-3>
                                                <xsl:attribute name="ref">
                                                    <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_3]/@DepDist,
                                                    parent::sentence/word[@id = $head_3]/@relation,
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-gender-case-degree-sWord-3>
                                        </xsl:when>
                                    </xsl:choose>
                                    
                                    <xsl:choose>
                                        <xsl:when test="$head_4 = 0">
                                            <DD-rel-morph-pos-gender-case-degree-sWord-4><xsl:attribute
                                                name="ref"><xsl:value-of select="./@cite"
                                                /></xsl:attribute>#-<xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_3]/@DepDist,
                                                    parent::sentence/word[@id = $head_3]/@relation,
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-gender-case-degree-sWord-4>
                                        </xsl:when>
                                        <xsl:when test="$head_4 > 0">
                                            <DD-rel-morph-pos-gender-case-degree-sWord-4>
                                                <xsl:attribute name="ref">
                                                    <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_4]/@DepDist,
                                                    parent::sentence/word[@id = $head_4]/@relation,
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_3]/@DepDist,
                                                    parent::sentence/word[@id = $head_3]/@relation,
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-gender-case-degree-sWord-4>
                                        </xsl:when>
                                    </xsl:choose>
                                    
                        <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX --> 
                                    
                                    <DD-rel-morph-pos-number-gender-case-degree-sWord-0>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                         
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                    > </xsl:value-of>
                                    </DD-rel-morph-pos-number-gender-case-degree-sWord-0>
                                    
                                    <DD-rel-morph-pos-number-gender-case-degree-sWord-1>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                                select="
                                                normalize-space(string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                substring(./@postag, 1, 1),
                                                substring(./@postag, 3, 1),
                                                substring(./@postag, 7, 1),
                                                substring(./@postag, 8, 1),
                                                substring(./@postag, 9, 1)
                                                ), '|'))"
                                                > </xsl:value-of>
                                            </xsl:when>
                                            <xsl:when test="$head_1 > 0">
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </xsl:when>
                                            
                                        </xsl:choose>
                                    </DD-rel-morph-pos-number-gender-case-degree-sWord-1>
                                    
                                    <xsl:choose>
                                        <xsl:when test="$head_2 = 0">
                                            <DD-rel-morph-pos-number-gender-case-degree-sWord-2><xsl:attribute
                                                name="ref"><xsl:value-of select="./@cite"
                                                /></xsl:attribute>#-<xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-number-gender-case-degree-sWord-2>
                                        </xsl:when>
                                        <xsl:when test="$head_2 > 0">
                                            <DD-rel-morph-pos-number-gender-case-degree-sWord-2>
                                                <xsl:attribute name="ref">
                                                    <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-number-gender-case-degree-sWord-2>
                                            
                                        </xsl:when>
                                    </xsl:choose>
                                    
                                    
                                    <xsl:choose>
                                        <xsl:when test="$head_3 = 0">
                                            <DD-rel-morph-pos-number-gender-case-degree-sWord-3><xsl:attribute
                                                name="ref"><xsl:value-of select="./@cite"
                                                /></xsl:attribute>#-<xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-number-gender-case-degree-sWord-3>
                                        </xsl:when>
                                        <xsl:when test="$head_3 > 0">
                                            <DD-rel-morph-pos-number-gender-case-degree-sWord-3>
                                                <xsl:attribute name="ref">
                                                    <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_3]/@DepDist,
                                                    parent::sentence/word[@id = $head_3]/@relation,
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-number-gender-case-degree-sWord-3>
                                        </xsl:when>
                                    </xsl:choose>
                                    
                                    <xsl:choose>
                                        <xsl:when test="$head_4 = 0">
                                            <DD-rel-morph-pos-number-gender-case-degree-sWord-4><xsl:attribute
                                                name="ref"><xsl:value-of select="./@cite"
                                                /></xsl:attribute>#-<xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_3]/@DepDist,
                                                    parent::sentence/word[@id = $head_3]/@relation,
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1),
                                                    substring(./@postag, 8, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-number-gender-case-degree-sWord-4>
                                        </xsl:when>
                                        <xsl:when test="$head_4 > 0">
                                            <DD-rel-morph-pos-number-gender-case-degree-sWord-4>
                                                <xsl:attribute name="ref">
                                                    <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_4]/@DepDist,
                                                    parent::sentence/word[@id = $head_4]/@relation,
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_3]/@DepDist,
                                                    parent::sentence/word[@id = $head_3]/@relation,
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 9, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 9, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 3, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1),
                                                    substring(./@postag, 9, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-number-gender-case-degree-sWord-4>
                                        </xsl:when>
                                    </xsl:choose>
                                    
                                   


                                </xsl:when>
                            </xsl:choose> <!-- end of code for adjectives --> 


                        </word>




                    </xsl:when>
                </xsl:choose>


            </xsl:for-each>


        </sWord_document>

    </xsl:template>



</xsl:stylesheet>
