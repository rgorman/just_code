<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">



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
                        
                        <word>
                            <xsl:copy-of select="@*"/>
                            <xsl:choose>
                            <xsl:when test="(substring(./@postag, 1, 1) = 'n') or (substring(./@postag, 1, 1) = 'p') or (substring(./@postag, 1, 1) = 'l')
                                or (substring(./@postag, 1, 1) = 'a') or (substring(./@postag, 5, 1) = 'p')">
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                            <DD-rel-morph-self-number-sWord-0>
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
                                    substring(./@postag, 3, 1)
                                    ), '|'))"
                                    > </xsl:value-of>
                            </DD-rel-morph-self-number-sWord-0>
                            
                            <DD-rel-morph-self-number-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                        select="
                                        normalize-space(string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        substring(./@postag, 3, 1)
                                        ), '|'))"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 3, 1)
                                            ), '|'))"
                                        />
                                    </xsl:when>
                                    
                                </xsl:choose>
                            </DD-rel-morph-self-number-sWord-1>
                            
                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-number-sWord-2><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                           ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 3, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-number-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-number-sWord-2>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@relation,
                                            substring(./@postag, 3, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-number-sWord-2>
                                    
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-number-sWord-3><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 3, 1)
                                            ), '|'))"
                                        />                                                        
                                    </DD-rel-morph-self-number-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-number-sWord-3>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                                                    
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 3, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-number-sWord-3>
                                </xsl:when>
                            </xsl:choose>
                            
                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-number-sWord-4><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 3, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-number-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-number-sWord-4>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 3, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-number-sWord-4>
                                </xsl:when>
                            </xsl:choose>
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                            
                            
                            <DD-rel-morph-self-gender-sWord-0>
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
                                    substring(./@postag, 7, 1)
                                    ), '|'))"
                                    > </xsl:value-of>
                            </DD-rel-morph-self-gender-sWord-0>
                            
                            <DD-rel-morph-self-gender-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                        select="
                                        normalize-space(string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        substring(./@postag, 7, 1)
                                        ), '|'))"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />
                                    </xsl:when>
                                    
                                </xsl:choose>
                            </DD-rel-morph-self-gender-sWord-1>
                            
                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-gender-sWord-2><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-gender-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-gender-sWord-2>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@relation,
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-gender-sWord-2>
                                    
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-gender-sWord-3><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />                                                        
                                    </DD-rel-morph-self-gender-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-gender-sWord-3>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                                                                                          
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-gender-sWord-3>
                                </xsl:when>
                            </xsl:choose>
                            
                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-gender-sWord-4><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-gender-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-gender-sWord-4>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-gender-sWord-4>
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                            
                            <DD-rel-morph-self-case-sWord-0>
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
                                    substring(./@postag, 8, 1)
                                    ), '|'))"
                                    > </xsl:value-of>
                            </DD-rel-morph-self-case-sWord-0>
                            
                            <DD-rel-morph-self-case-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                        select="
                                        normalize-space(string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        substring(./@postag, 8, 1)
                                        ), '|'))"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </xsl:when>
                                    
                                </xsl:choose>
                            </DD-rel-morph-self-case-sWord-1>
                            
                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-case-sWord-2><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-case-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-case-sWord-2>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@relation,
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-case-sWord-2>
                                    
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-case-sWord-3><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />                                                        
                                    </DD-rel-morph-self-case-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-case-sWord-3>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-case-sWord-3>
                                </xsl:when>
                            </xsl:choose>
                            
                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-case-sWord-4><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-case-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-case-sWord-4>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-case-sWord-4>
                                </xsl:when>
                            </xsl:choose>
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                            
                            <DD-rel-morph-self-number-gender-sWord-0>
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
                                    substring(./@postag, 3, 1),
                                    substring(./@postag, 7, 1)
                                    ), '|'))"
                                    > </xsl:value-of>
                            </DD-rel-morph-self-number-gender-sWord-0>
                            
                            <DD-rel-morph-self-number-gender-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                        select="
                                        normalize-space(string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        substring(./@postag, 3, 1),
                                        substring(./@postag, 7, 1)
                                        ), '|'))"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />
                                    </xsl:when>
                                    
                                </xsl:choose>
                            </DD-rel-morph-self-number-gender-sWord-1>
                            
                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-number-gender-sWord-2><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-number-gender-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-number-gender-sWord-2>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@relation,
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-number-gender-sWord-2>
                                    
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-number-gender-sWord-3><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />                                                        
                                    </DD-rel-morph-self-number-gender-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-number-gender-sWord-3>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-number-gender-sWord-3>
                                </xsl:when>
                            </xsl:choose>
                            
                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-number-gender-sWord-4><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-number-gender-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-number-gender-sWord-4>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-number-gender-sWord-4>
                                </xsl:when>
                            </xsl:choose>
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                            
                            <DD-rel-morph-self-number-case-sWord-0>
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
                                    substring(./@postag, 3, 1),
                                    substring(./@postag, 8, 1)
                                    ), '|'))"
                                    > </xsl:value-of>
                            </DD-rel-morph-self-number-case-sWord-0>
                            
                            <DD-rel-morph-self-number-case-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                        select="
                                        normalize-space(string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        substring(./@postag, 3, 1),
                                        substring(./@postag, 8, 1)
                                        ), '|'))"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </xsl:when>
                                    
                                </xsl:choose>
                            </DD-rel-morph-self-number-case-sWord-1>
                            
                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-number-case-sWord-2><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-number-case-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-number-case-sWord-2>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@relation,
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-number-case-sWord-2>
                                    
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-number-case-sWord-3><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />                                                        
                                    </DD-rel-morph-self-number-case-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-number-case-sWord-3>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-number-case-sWord-3>
                                </xsl:when>
                            </xsl:choose>
                            
                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-number-case-sWord-4><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-number-case-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-number-case-sWord-4>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-number-case-sWord-4>
                                </xsl:when>
                            </xsl:choose>
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                            
                            <DD-rel-morph-self-gender-case-sWord-0>
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
                                    substring(./@postag, 7, 1),
                                    substring(./@postag, 8, 1)
                                    ), '|'))"
                                    > </xsl:value-of>
                            </DD-rel-morph-self-gender-case-sWord-0>
                            
                            <DD-rel-morph-self-gender-case-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                        select="
                                        normalize-space(string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        substring(./@postag, 7, 1),
                                        substring(./@postag, 8, 1)
                                        ), '|'))"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </xsl:when>
                                    
                                </xsl:choose>
                            </DD-rel-morph-self-gender-case-sWord-1>
                            
                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-gender-case-sWord-2><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-gender-case-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-gender-case-sWord-2>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@relation,
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-gender-case-sWord-2>
                                    
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-gender-case-sWord-3><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />                                                        
                                    </DD-rel-morph-self-gender-case-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-gender-case-sWord-3>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-gender-case-sWord-3>
                                </xsl:when>
                            </xsl:choose>
                            
                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-gender-case-sWord-4><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-gender-case-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-gender-case-sWord-4>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-gender-case-sWord-4>
                                </xsl:when>
                            </xsl:choose>
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                            
                            <DD-rel-morph-self-number-gender-case-sWord-0>
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
                                    substring(./@postag, 3, 1),
                                    substring(./@postag, 7, 1),
                                    substring(./@postag, 8, 1)
                                    ), '|'))"
                                    > </xsl:value-of>
                            </DD-rel-morph-self-number-gender-case-sWord-0>
                            
                            <DD-rel-morph-self-number-gender-case-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                        select="
                                        normalize-space(string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        substring(./@postag, 3, 1),
                                        substring(./@postag, 7, 1),
                                        substring(./@postag, 8, 1)
                                        ), '|'))"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </xsl:when>
                                    
                                </xsl:choose>
                            </DD-rel-morph-self-number-gender-case-sWord-1>
                            
                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-number-gender-case-sWord-2><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-number-gender-case-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-number-gender-case-sWord-2>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@relation,
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-number-gender-case-sWord-2>
                                    
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-number-gender-case-sWord-3><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />                                                        
                                    </DD-rel-morph-self-number-gender-case-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-number-gender-case-sWord-3>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-number-gender-case-sWord-3>
                                </xsl:when>
                            </xsl:choose>
                            
                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-number-gender-case-sWord-4><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-number-gender-case-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-number-gender-case-sWord-4>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-number-gender-case-sWord-4>
                                </xsl:when>
                            </xsl:choose>
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                            
                            <DD-rel-morph-self-pos-sWord-0>
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
                                    substring(./@postag, 1, 1)
                                    ), '|'))"
                                    > </xsl:value-of>
                            </DD-rel-morph-self-pos-sWord-0>
                            
                            <DD-rel-morph-self-pos-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                        select="
                                        normalize-space(string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        substring(./@postag, 1, 1)
                                        ), '|'))"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1) 
                                            ), '|'))"
                                        />
                                    </xsl:when>
                                    
                                </xsl:choose>
                            </DD-rel-morph-self-pos-sWord-1>
                            
                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-pos-sWord-2><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-pos-sWord-2>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@relation,
                                            substring(./@postag, 1, 1) 
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-sWord-2>
                                    
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-pos-sWord-3><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1) 
                                            ), '|'))"
                                        />                                                        
                                    </DD-rel-morph-self-pos-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-pos-sWord-3>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1) 
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-sWord-3>
                                </xsl:when>
                            </xsl:choose>
                            
                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-pos-sWord-4><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1) 
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-pos-sWord-4>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-sWord-4>
                                </xsl:when>
                            </xsl:choose>
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->  
                            
                            <DD-rel-morph-self-pos-number-sWord-0>
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
                                    substring(./@postag, 3, 1)
                                    ), '|'))"
                                    > </xsl:value-of>
                            </DD-rel-morph-self-pos-number-sWord-0>
                            
                            <DD-rel-morph-self-pos-number-sWord-1>
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
                                        substring(./@postag, 3, 1)
                                        ), '|'))"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1), 
                                            substring(./@postag, 3, 1)
                                            ), '|'))"
                                        />
                                    </xsl:when>
                                    
                                </xsl:choose>
                            </DD-rel-morph-self-pos-number-sWord-1>
                            
                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-pos-number-sWord-2><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                           ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 3, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-number-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-pos-number-sWord-2>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@relation,
                                            substring(./@postag, 1, 1), 
                                            substring(./@postag, 3, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-number-sWord-2>
                                    
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-pos-number-sWord-3><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1), 
                                            substring(./@postag, 3, 1)
                                            ), '|'))"
                                        />                                                        
                                    </DD-rel-morph-self-pos-number-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-pos-number-sWord-3>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                                                    
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1), 
                                            substring(./@postag, 3, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-number-sWord-3>
                                </xsl:when>
                            </xsl:choose>
                            
                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-pos-number-sWord-4><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1), 
                                            substring(./@postag, 3, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-number-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-pos-number-sWord-4>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 3, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-number-sWord-4>
                                </xsl:when>
                            </xsl:choose>
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                            
                            
                            <DD-rel-morph-self-pos-gender-sWord-0>
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
                                    substring(./@postag, 7, 1)
                                    ), '|'))"
                                    > </xsl:value-of>
                            </DD-rel-morph-self-pos-gender-sWord-0>
                            
                            <DD-rel-morph-self-pos-gender-sWord-1>
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
                                        substring(./@postag, 7, 1)
                                        ), '|'))"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />
                                    </xsl:when>
                                    
                                </xsl:choose>
                            </DD-rel-morph-self-pos-gender-sWord-1>
                            
                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-pos-gender-sWord-2><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-gender-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-pos-gender-sWord-2>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-gender-sWord-2>
                                    
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-pos-gender-sWord-3><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />                                                        
                                    </DD-rel-morph-self-pos-gender-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-pos-gender-sWord-3>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                                                                                          
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-gender-sWord-3>
                                </xsl:when>
                            </xsl:choose>
                            
                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-pos-gender-sWord-4><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-gender-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-pos-gender-sWord-4>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-gender-sWord-4>
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                            
                            <DD-rel-morph-self-pos-case-sWord-0>
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
                                    substring(./@postag, 8, 1)
                                    ), '|'))"
                                    > </xsl:value-of>
                            </DD-rel-morph-self-pos-case-sWord-0>
                            
                            <DD-rel-morph-self-pos-case-sWord-1>
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
                                        substring(./@postag, 8, 1)
                                        ), '|'))"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </xsl:when>
                                    
                                </xsl:choose>
                            </DD-rel-morph-self-pos-case-sWord-1>
                            
                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-pos-case-sWord-2><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-case-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-pos-case-sWord-2>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-case-sWord-2>
                                    
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-pos-case-sWord-3><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />                                                        
                                    </DD-rel-morph-self-pos-case-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-pos-case-sWord-3>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-case-sWord-3>
                                </xsl:when>
                            </xsl:choose>
                            
                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-pos-case-sWord-4><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-case-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-pos-case-sWord-4>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-case-sWord-4>
                                </xsl:when>
                            </xsl:choose>
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                            
                            <DD-rel-morph-self-pos-number-gender-sWord-0>
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
                                    substring(./@postag, 7, 1)
                                    ), '|'))"
                                    > </xsl:value-of>
                            </DD-rel-morph-self-pos-number-gender-sWord-0>
                            
                            <DD-rel-morph-self-pos-number-gender-sWord-1>
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
                                        substring(./@postag, 7, 1)
                                        ), '|'))"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />
                                    </xsl:when>
                                    
                                </xsl:choose>
                            </DD-rel-morph-self-pos-number-gender-sWord-1>
                            
                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-pos-number-gender-sWord-2><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-number-gender-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-pos-number-gender-sWord-2>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-number-gender-sWord-2>
                                    
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-pos-number-gender-sWord-3><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />                                                        
                                    </DD-rel-morph-self-pos-number-gender-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-pos-number-gender-sWord-3>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-number-gender-sWord-3>
                                </xsl:when>
                            </xsl:choose>
                            
                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-pos-number-gender-sWord-4><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-number-gender-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-pos-number-gender-sWord-4>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1), 
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-number-gender-sWord-4>
                                </xsl:when>
                            </xsl:choose>
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                            
                            <DD-rel-morph-self-pos-number-case-sWord-0>
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
                                    substring(./@postag, 8, 1)
                                    ), '|'))"
                                    > </xsl:value-of>
                            </DD-rel-morph-self-pos-number-case-sWord-0>
                            
                            <DD-rel-morph-self-pos-number-case-sWord-1>
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
                                        substring(./@postag, 8, 1)
                                        ), '|'))"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1), 
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </xsl:when>
                                    
                                </xsl:choose>
                            </DD-rel-morph-self-pos-number-case-sWord-1>
                            
                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-pos-number-case-sWord-2><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1), 
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-number-case-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-pos-number-case-sWord-2>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@relation,
                                            substring(./@postag, 1, 1), 
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-number-case-sWord-2>
                                    
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-pos-number-case-sWord-3><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1), 
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />                                                        
                                    </DD-rel-morph-self-pos-number-case-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-pos-number-case-sWord-3>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1), 
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-number-case-sWord-3>
                                </xsl:when>
                            </xsl:choose>
                            
                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-pos-number-case-sWord-4><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1), 
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-number-case-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-pos-number-case-sWord-4>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1), 
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-number-case-sWord-4>
                                </xsl:when>
                            </xsl:choose>
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                            
                            <DD-rel-morph-self-pos-gender-case-sWord-0>
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
                                    substring(./@postag, 8, 1)
                                    ), '|'))"
                                    > </xsl:value-of>
                            </DD-rel-morph-self-pos-gender-case-sWord-0>
                            
                            <DD-rel-morph-self-pos-gender-case-sWord-1>
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
                                        substring(./@postag, 8, 1)
                                        ), '|'))"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </xsl:when>
                                    
                                </xsl:choose>
                            </DD-rel-morph-self-pos-gender-case-sWord-1>
                            
                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-pos-gender-case-sWord-2><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-gender-case-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-pos-gender-case-sWord-2>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-gender-case-sWord-2>
                                    
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-pos-gender-case-sWord-3><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />                                                        
                                    </DD-rel-morph-self-pos-gender-case-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-pos-gender-case-sWord-3>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-gender-case-sWord-3>
                                </xsl:when>
                            </xsl:choose>
                            
                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-pos-gender-case-sWord-4><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-gender-case-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-pos-gender-case-sWord-4>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-gender-case-sWord-4>
                                </xsl:when>
                            </xsl:choose>
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                            
                            <DD-rel-morph-self-pos-number-gender-case-sWord-0>
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
                                    substring(./@postag, 8, 1)
                                    ), '|'))"
                                    > </xsl:value-of>
                            </DD-rel-morph-self-pos-number-gender-case-sWord-0>
                            
                            <DD-rel-morph-self-pos-number-gender-case-sWord-1>
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
                                        substring(./@postag, 8, 1)
                                        ), '|'))"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1), 
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </xsl:when>
                                    
                                </xsl:choose>
                            </DD-rel-morph-self-pos-number-gender-case-sWord-1>
                            
                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-pos-number-gender-case-sWord-2><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-number-gender-case-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-pos-number-gender-case-sWord-2>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-number-gender-case-sWord-2>
                                    
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-pos-number-gender-case-sWord-3><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />                                                        
                                    </DD-rel-morph-self-pos-number-gender-case-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-pos-number-gender-case-sWord-3>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-number-gender-case-sWord-3>
                                </xsl:when>
                            </xsl:choose>
                            
                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-pos-number-gender-case-sWord-4><xsl:attribute name="ref"
                                        ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-number-gender-case-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-pos-number-gender-case-sWord-4>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            ./@DepDist,
                                            ./@relation,
                                            substring(./@postag, 1, 1),
                                            substring(./@postag, 3, 1),
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                        />
                                    </DD-rel-morph-self-pos-number-gender-case-sWord-4>
                                </xsl:when>
                                
                            </xsl:choose>
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->  
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                            
                            
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->  
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->  
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->  
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                            
                           
                                
                                    
                               
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->  
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                            
                            
                            
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->  
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->  
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->  
                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->  
                            
                    
                        </word>
                        
                        
                    
                
            </xsl:for-each>
        </sWord_document>
        
    </xsl:template>


</xsl:stylesheet>
