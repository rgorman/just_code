<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="subTree_document">
        <sWord_document>
            <xsl:for-each select="//word">
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
                    <xsl:choose> <!-- start of code for verbs -->
                        <xsl:when test="substring(./@postag, 5, 1) = 'n'">
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                            
                            <DD-rel-morph-pos-voice-sWord-0>
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
                                    substring(./@postag, 6, 1) 
                                    ), '|'))"
                                    > </xsl:value-of>
                            </DD-rel-morph-pos-voice-sWord-0>
                            
                            <DD-rel-morph-pos-voice-sWord-1>
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
                                        substring(./@postag, 6, 1)
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
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 6, 1) 
                                            ), '|'))"
                                        />
                                    </xsl:when>
                                    
                                </xsl:choose>
                            </DD-rel-morph-pos-voice-sWord-1>
                            
                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-pos-voice-sWord-2><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),                                                      
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 6, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-pos-voice-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-pos-voice-sWord-2>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 6, 1) 
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-pos-voice-sWord-2>
                                    
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-pos-voice-sWord-3><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 6, 1) 
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-pos-voice-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-pos-voice-sWord-3>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 6, 1) 
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-pos-voice-sWord-3>
                                </xsl:when>
                            </xsl:choose>
                            
                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-pos-voice-sWord-4><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 6, 1) 
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-pos-voice-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-pos-voice-sWord-4>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_4]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 6, 1) 
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-pos-voice-sWord-4>
                                </xsl:when>
                            </xsl:choose>
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                            
                            <DD-rel-morph-pos-tense-sWord-0>
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
                                    substring(./@postag, 4, 1) 
                                     ), '|'))"
                                    > </xsl:value-of>
                            </DD-rel-morph-pos-tense-sWord-0>
                            
                            <DD-rel-morph-pos-tense-sWord-1>
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
                                        substring(./@postag, 4, 1)
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
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 4, 1) 
                                            ), '|'))"
                                        />
                                    </xsl:when>
                                    
                                </xsl:choose>
                            </DD-rel-morph-pos-tense-sWord-1>
                            
                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-pos-tense-sWord-2><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),                                                      
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 4, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-pos-tense-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-pos-tense-sWord-2>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 4, 1) 
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-pos-tense-sWord-2>
                                    
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-pos-tense-sWord-3><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 4, 1) 
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-pos-tense-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-pos-tense-sWord-3>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 4, 1),
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 4, 1) 
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-pos-tense-sWord-3>
                                </xsl:when>
                            </xsl:choose>
                            
                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-pos-tense-sWord-4><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 4, 1),
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 4, 1) 
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-pos-tense-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-pos-tense-sWord-4>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_4]/@postag, 4, 1),
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 4, 1),
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 4, 1) 
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-pos-tense-sWord-4>
                                </xsl:when>
                            </xsl:choose>
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXX --> 
                            
                           
                           <!-- code for tense-voice -->
                            
                            <DD-rel-morph-pos-tense-voice-sWord-0>
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
                                    substring(./@postag, 4, 1), 
                                    substring(./@postag, 6, 1)
                                    ), '|'))"
                                    > </xsl:value-of>
                            </DD-rel-morph-pos-tense-voice-sWord-0>
                            
                            <DD-rel-morph-pos-tense-voice-sWord-1>
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
                                        substring(./@postag, 4, 1), 
                                        substring(./@postag, 6, 1)
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
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 4, 1), 
                                            substring(./@postag, 6, 1)
                                            ), '|'))"
                                        />
                                    </xsl:when>
                                    
                                </xsl:choose>
                            </DD-rel-morph-pos-tense-voice-sWord-1>
                            
                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-pos-tense-voice-sWord-2><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),                                                      
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 4, 1), 
                                            substring(./@postag, 6, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-pos-tense-voice-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-pos-tense-voice-sWord-2>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 4, 1), 
                                            substring(./@postag, 6, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-pos-tense-voice-sWord-2>
                                    
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-pos-tense-voice-sWord-3><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 4, 1), 
                                            substring(./@postag, 6, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-pos-tense-voice-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-pos-tense-voice-sWord-3>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 4, 1), 
                                            substring(./@postag, 6, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-pos-tense-voice-sWord-3>
                                </xsl:when>
                            </xsl:choose>
                            
                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-pos-tense-voice-sWord-4><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 4, 1), 
                                            substring(./@postag, 6, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-pos-tense-voice-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-pos-tense-voice-sWord-4>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_4]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_4]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 4, 1), 
                                            substring(./@postag, 6, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-pos-tense-voice-sWord-4>
                                </xsl:when>
                            </xsl:choose>
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                            
                        </xsl:when>
                        
                        <!-- finite verb forms --> 
                        <xsl:when test="(substring(./@postag, 5, 1) = 'i') or (substring(./@postag, 5, 1) = 's') or (substring(./@postag, 5, 1) = 'o')">
                            
                            
                            
                            
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX --> 
                            
                            <DD-rel-morph-pos-person-number-tense-mood-voice-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                
                                <xsl:value-of
                                    select="
                                    normalize-space(string-join((
                                    ./@DepDist,
                                    ./@relation,
                                    substring(./@postag, 1, 1),
                                    substring(./@postag, 2, 1),
                                    substring(./@postag, 3, 1),
                                    substring(./@postag, 4, 1),
                                    substring(./@postag, 5, 1),
                                    substring(./@postag, 6, 1)
                                    ), '|'))"
                                    > </xsl:value-of>
                            </DD-rel-morph-pos-person-number-tense-mood-voice-sWord-0>
                            
                            <DD-rel-morph-pos-person-number-tense-mood-voice-sWord-1>
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
                                        substring(./@postag, 2, 1),
                                        substring(./@postag, 3, 1),
                                        substring(./@postag, 4, 1),
                                        substring(./@postag, 5, 1),
                                        substring(./@postag, 6, 1)
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
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 2, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 5, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 2, 1),
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 4, 1),
                                            substring(./@postag, 5, 1),
                                            substring(./@postag, 6, 1)
                                            ), '|'))"
                                        />
                                    </xsl:when>
                                    
                                </xsl:choose>
                            </DD-rel-morph-pos-person-number-tense-mood-voice-sWord-1>
                            
                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-pos-person-number-tense-mood-voice-sWord-2><xsl:attribute
                                        name="ref"><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 2, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 5, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 2, 1),
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 4, 1),
                                            substring(./@postag, 5, 1),
                                            substring(./@postag, 6, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-pos-person-number-tense-mood-voice-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-pos-person-number-tense-mood-voice-sWord-2>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 2, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 5, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 2, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 5, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 2, 1),
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 4, 1),
                                            substring(./@postag, 5, 1),
                                            substring(./@postag, 6, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-pos-person-number-tense-mood-voice-sWord-2>
                                    
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-pos-person-number-tense-mood-voice-sWord-3><xsl:attribute
                                        name="ref"><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 2, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 5, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 2, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 5, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 2, 1),
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 4, 1),
                                            substring(./@postag, 5, 1),
                                            substring(./@postag, 6, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-pos-person-number-tense-mood-voice-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-pos-person-number-tense-mood-voice-sWord-3>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 2, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 5, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 2, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 5, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 2, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 5, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 2, 1),
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 4, 1),
                                            substring(./@postag, 5, 1),
                                            substring(./@postag, 6, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-pos-person-number-tense-mood-voice-sWord-3>
                                </xsl:when>
                            </xsl:choose>
                            
                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-pos-person-number-tense-mood-voice-sWord-4><xsl:attribute
                                        name="ref"><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 2, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 5, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 2, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 5, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 2, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 5, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 2, 1),
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 4, 1),
                                            substring(./@postag, 5, 1),
                                            substring(./@postag, 5, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-pos-person-number-tense-mood-voice-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-pos-person-number-tense-mood-voice-sWord-4>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_4]/@postag, 2, 1),
                                            substring(parent::sentence/word[@id = $head_4]/@postag, 3, 1),
                                            substring(parent::sentence/word[@id = $head_4]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_4]/@postag, 5, 1),
                                            substring(parent::sentence/word[@id = $head_4]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 2, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 5, 1),
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 2, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 5, 1),
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 2, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 5, 1),
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 2, 1),
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 4, 1),
                                            substring(./@postag, 5, 1),
                                            substring(./@postag, 6, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-pos-person-number-tense-mood-voice-sWord-4>
                                </xsl:when>
                            </xsl:choose>
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                            
                        </xsl:when>
                    </xsl:choose>
                    
                </word>
                
            </xsl:for-each>
            
            
        </sWord_document> 
        
    </xsl:template>
    
</xsl:stylesheet>