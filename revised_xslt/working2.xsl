<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">



    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="subTree_document">

        <sWord_document>

            <xsl:for-each select="comment">
                <xsl:copy-of select="."/>
            </xsl:for-each>
            <xsl:for-each select="annotator">
                <xsl:copy-of select="."/>
            </xsl:for-each>

            <xsl:for-each select="sentence">
                <sentence>
                    <xsl:copy-of select="@*"/>
                    <xsl:for-each select="word">
                        <!-- This step creates variables containing the @id of the @head of each <word>. The process is recursive in that it
                        captures the @head attributes of all <word> elements from the target <word> to the root of the dependency tree.
                        For, example, variable $head_3 contains the @head attribute @id of the "parent"  of variable $head_2, which is the "parent" 
                        of the target <word> -->
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
                                <xsl:variable name="head_8"
                                    select="parent::sentence/word[@id = $head_7]/@head"/>
                                <xsl:variable name="head_9"
                                    select="parent::sentence/word[@id = $head_8]/@head"/>
                                <xsl:variable name="head_10"
                                    select="parent::sentence/word[@id = $head_9]/@head"/>
                                <xsl:variable name="head_11"
                                    select="parent::sentence/word[@id = $head_10]/@head"/>
                                <xsl:variable name="head_12"
                                    select="parent::sentence/word[@id = $head_11]/@head"/>
                                <xsl:variable name="head_13"
                                    select="parent::sentence/word[@id = $head_12]/@head"/>
                                <xsl:variable name="head_14"
                                    select="parent::sentence/word[@id = $head_13]/@head"/>
                                <xsl:variable name="head_15"
                                    select="parent::sentence/word[@id = $head_14]/@head"/>
                                <xsl:variable name="head_16"
                                    select="parent::sentence/word[@id = $head_15]/@head"/>
                                <xsl:variable name="head_17"
                                    select="parent::sentence/word[@id = $head_16]/@head"/>
                                <xsl:variable name="head_18"
                                    select="parent::sentence/word[@id = $head_17]/@head"/>
                                <xsl:variable name="head_19"
                                    select="parent::sentence/word[@id = $head_18]/@head"/>
                                <xsl:variable name="head_20"
                                    select="parent::sentence/word[@id = $head_19]/@head"/>






                                <word>
                                    <!-- This step creates new <word> elements for the output file. The following line copies the attributes from the 
                                    original to the new <word> elements. -->
                                    <xsl:copy-of select="@*"/>




                                    <!-- The following code extracts Dependency distance and adds it to each level of the rel-pos sWords -->

                                    <DD-rel-pos-sWord-0>
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
                                    </DD-rel-pos-sWord-0>


                                    <DD-rel-pos-sWord-1>
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
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@DepDist,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '|'))"
                                                />
                                            </xsl:when>

                                        </xsl:choose>
                                    </DD-rel-pos-sWord-1>
                                    <xsl:choose>
                                        <xsl:when test="$head_2 = 0">
                                            <DD-rel-pos-sWord-2><xsl:attribute name="ref"
                                                  ><xsl:value-of select="./@cite"
                                                  /></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@DepDist,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '|'))"
                                                />
                                            </DD-rel-pos-sWord-2>
                                        </xsl:when>
                                        <xsl:when test="$head_2 > 0">
                                            <DD-rel-pos-sWord-2>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '|'))"
                                                />
                                            </DD-rel-pos-sWord-2>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="$head_3 = 0">
                                            <DD-rel-pos-sWord-3><xsl:attribute name="ref"
                                                  ><xsl:value-of select="./@cite"
                                                  /></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@DepDist,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '|'))"
                                                />
                                            </DD-rel-pos-sWord-3>
                                        </xsl:when>
                                        <xsl:when test="$head_3 > 0">
                                            <DD-rel-pos-sWord-3>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_3]/@DepDist,
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@DepDist,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '|'))"
                                                />
                                            </DD-rel-pos-sWord-3>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="$head_4 = 0">
                                            <DD-rel-pos-sWord-4><xsl:attribute name="ref"
                                                  ><xsl:value-of select="./@cite"
                                                  /></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_3]/@DepDist,
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@DepDist,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '|'))"
                                                />
                                            </DD-rel-pos-sWord-4>
                                        </xsl:when>
                                        <xsl:when test="$head_4 > 0">
                                            <DD-rel-pos-sWord-4>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_4]/@DepDist,
                                                        parent::sentence/word[@id = $head_4]/@relation,
                                                        substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_3]/@DepDist,
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@DepDist,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '|'))"
                                                />
                                            </DD-rel-pos-sWord-4>
                                        </xsl:when>
                                    </xsl:choose>



                                    <!-- End of code block adding Dep Dtst to rel-pos sWords.  Only sWord levels 0-4 are included. Higher sWords are probably too rare to be
     worth condiering.  -->
                                    
                                    
                                    <!-- code adding more detailed combinations of  morphology information to sWords -->
                                    
                                    
                                    <xsl:choose>
                                        <xsl:when test="(substring(./@postag, 1, 1) = 'n') or (substring(./@postag, 1, 1) = 'p') or (substring(./@postag, 1, 1) = 'l')
                                            or (substring(./@postag, 1, 1) = 'a') or (substring(./@postag, 5, 1) = 'p')"> <!-- select words with gender, number, or case morphology -->
                                            
                                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                                            
                                            
                                            <DD-rel-morph-pos-gender-sWord-0>
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
                                            </DD-rel-morph-pos-gender-sWord-0>
                                            
                                            <DD-rel-morph-pos-gender-sWord-1>
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
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />
                                                    </xsl:when>
                                                    
                                                </xsl:choose>
                                            </DD-rel-morph-pos-gender-sWord-1>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_2 = 0">
                                                    <DD-rel-morph-pos-gender-sWord-2><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-gender-sWord-2>
                                                </xsl:when>
                                                <xsl:when test="$head_2 > 0">
                                                    <DD-rel-morph-pos-gender-sWord-2>
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
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-gender-sWord-2>
                                                    
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_3 = 0">
                                                    <DD-rel-morph-pos-gender-sWord-3><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />                                                        
                                                    </DD-rel-morph-pos-gender-sWord-3>
                                                </xsl:when>
                                                <xsl:when test="$head_3 > 0">
                                                    <DD-rel-morph-pos-gender-sWord-3>
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
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-gender-sWord-3>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_4 = 0">
                                                    <DD-rel-morph-pos-gender-sWord-4><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-gender-sWord-4>
                                                </xsl:when>
                                                <xsl:when test="$head_4 > 0">
                                                    <DD-rel-morph-pos-gender-sWord-4>
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
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-gender-sWord-4>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            
                              <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->      
                                            
                                            <DD-rel-morph-pos-case-sWord-0>
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
                                            </DD-rel-morph-pos-case-sWord-0>
                                            
                                            <DD-rel-morph-pos-case-sWord-1>
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
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </xsl:when>
                                                    
                                                </xsl:choose>
                                            </DD-rel-morph-pos-case-sWord-1>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_2 = 0">
                                                    <DD-rel-morph-pos-case-sWord-2><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-case-sWord-2>
                                                </xsl:when>
                                                <xsl:when test="$head_2 > 0">
                                                    <DD-rel-morph-pos-case-sWord-2>
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
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-case-sWord-2>
                                                    
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_3 = 0">
                                                    <DD-rel-morph-pos-case-sWord-3><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />                                                        
                                                    </DD-rel-morph-pos-case-sWord-3>
                                                </xsl:when>
                                                <xsl:when test="$head_3 > 0">
                                                    <DD-rel-morph-pos-case-sWord-3>
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
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-case-sWord-3>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_4 = 0">
                                                    <DD-rel-morph-pos-case-sWord-4><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-case-sWord-4>
                                                </xsl:when>
                                                <xsl:when test="$head_4 > 0">
                                                    <DD-rel-morph-pos-case-sWord-4>
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
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-case-sWord-4>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            
                              <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                                            
                                          
                                            <!-- code adding more detailed combinations of  morphology information to sWords: gender and case. -->
                                          
                                            <DD-rel-morph-pos-gender-case-sWord-0>
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
                                            </DD-rel-morph-pos-gender-case-sWord-0>
                                            
                                            <DD-rel-morph-pos-gender-case-sWord-1>
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
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </xsl:when>
                                                    
                                                </xsl:choose>
                                            </DD-rel-morph-pos-gender-case-sWord-1>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_2 = 0">
                                                    <DD-rel-morph-pos-gender-case-sWord-2><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-gender-case-sWord-2>
                                                </xsl:when>
                                                <xsl:when test="$head_2 > 0">
                                                    <DD-rel-morph-pos-gender-case-sWord-2>
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
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-gender-case-sWord-2>
                                                    
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_3 = 0">
                                                    <DD-rel-morph-pos-gender-case-sWord-3><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />                                                        
                                                    </DD-rel-morph-pos-gender-case-sWord-3>
                                                </xsl:when>
                                                <xsl:when test="$head_3 > 0">
                                                    <DD-rel-morph-pos-gender-case-sWord-3>
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
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-gender-case-sWord-3>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_4 = 0">
                                                    <DD-rel-morph-pos-gender-case-sWord-4><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-gender-case-sWord-4>
                                                </xsl:when>
                                                <xsl:when test="$head_4 > 0">
                                                    <DD-rel-morph-pos-gender-case-sWord-4>
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
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-gender-case-sWord-4>
                                                </xsl:when>
                                            </xsl:choose>
                                          
                                          <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                                            
                                            <!-- code adding more detailed combinations of  morphology information to sWords: number and case. -->
                                            
                                            <DD-rel-morph-pos-number-case-sWord-0>
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
                                            </DD-rel-morph-pos-number-case-sWord-0>
                                            
                                            <DD-rel-morph-pos-number-case-sWord-1>
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
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </xsl:when>
                                                    
                                                </xsl:choose>
                                            </DD-rel-morph-pos-number-case-sWord-1>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_2 = 0">
                                                    <DD-rel-morph-pos-number-case-sWord-2><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-case-sWord-2>
                                                </xsl:when>
                                                <xsl:when test="$head_2 > 0">
                                                    <DD-rel-morph-pos-number-case-sWord-2>
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
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-case-sWord-2>
                                                    
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_3 = 0">
                                                    <DD-rel-morph-pos-number-case-sWord-3><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />                                                        
                                                    </DD-rel-morph-pos-number-case-sWord-3>
                                                </xsl:when>
                                                <xsl:when test="$head_3 > 0">
                                                    <DD-rel-morph-pos-number-case-sWord-3>
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
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-case-sWord-3>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_4 = 0">
                                                    <DD-rel-morph-pos-number-case-sWord-4><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-case-sWord-4>
                                                </xsl:when>
                                                <xsl:when test="$head_4 > 0">
                                                    <DD-rel-morph-pos-number-case-sWord-4>
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
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-case-sWord-4>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                          <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                                            
                                            <!-- Gender, number -->
                                            
                                            <DD-rel-morph-pos-number-gender-sWord-0>
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
                                            </DD-rel-morph-pos-number-gender-sWord-0>
                                            
                                            <DD-rel-morph-pos-number-gender-sWord-1>
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
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />
                                                    </xsl:when>
                                                    
                                                </xsl:choose>
                                            </DD-rel-morph-pos-number-gender-sWord-1>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_2 = 0">
                                                    <DD-rel-morph-pos-number-gender-sWord-2><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-gender-sWord-2>
                                                </xsl:when>
                                                <xsl:when test="$head_2 > 0">
                                                    <DD-rel-morph-pos-number-gender-sWord-2>
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
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-gender-sWord-2>
                                                    
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_3 = 0">
                                                    <DD-rel-morph-pos-number-gender-sWord-3><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />                                                        
                                                    </DD-rel-morph-pos-number-gender-sWord-3>
                                                </xsl:when>
                                                <xsl:when test="$head_3 > 0">
                                                    <DD-rel-morph-pos-number-gender-sWord-3>
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
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-gender-sWord-3>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_4 = 0">
                                                    <DD-rel-morph-pos-number-gender-sWord-4><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-gender-sWord-4>
                                                </xsl:when>
                                                <xsl:when test="$head_4 > 0">
                                                    <DD-rel-morph-pos-number-gender-sWord-4>
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
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-gender-sWord-4>
                                                </xsl:when>
                                            </xsl:choose>
                                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                                            
                                            <DD-rel-morph-pos-number-gender-case-sWord-0>
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
                                            </DD-rel-morph-pos-number-gender-case-sWord-0>
                                            
                                            <DD-rel-morph-pos-number-gender-case-sWord-1>
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
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
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
                                            </DD-rel-morph-pos-number-gender-case-sWord-1>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_2 = 0">
                                                    <DD-rel-morph-pos-number-gender-case-sWord-2><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-gender-case-sWord-2>
                                                </xsl:when>
                                                <xsl:when test="$head_2 > 0">
                                                    <DD-rel-morph-pos-number-gender-case-sWord-2>
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
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-gender-case-sWord-2>
                                                    
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_3 = 0">
                                                    <DD-rel-morph-pos-number-gender-case-sWord-3><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />                                                        
                                                    </DD-rel-morph-pos-number-gender-case-sWord-3>
                                                </xsl:when>
                                                <xsl:when test="$head_3 > 0">
                                                    <DD-rel-morph-pos-number-gender-case-sWord-3>
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
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-gender-case-sWord-3>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_4 = 0">
                                                    <DD-rel-morph-pos-number-gender-case-sWord-4><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-gender-case-sWord-4>
                                                </xsl:when>
                                                <xsl:when test="$head_4 > 0">
                                                    <DD-rel-morph-pos-number-gender-case-sWord-4>
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
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-gender-case-sWord-4>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX --> 
                                            
                                            
                                            
                                            
                                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                                            
                                            
                                            
                                            
                                            
                                              
                                         <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->    
                                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                                            <!-- remove pos tags from following set --> 
                                            
                                            <DD-rel-morph-gender-sWord-0>
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
                                            </DD-rel-morph-gender-sWord-0>
                                            
                                            <DD-rel-morph-gender-sWord-1>
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
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />
                                                    </xsl:when>
                                                    
                                                </xsl:choose>
                                            </DD-rel-morph-gender-sWord-1>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_2 = 0">
                                                    <DD-rel-morph-gender-sWord-2><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-gender-sWord-2>
                                                </xsl:when>
                                                <xsl:when test="$head_2 > 0">
                                                    <DD-rel-morph-gender-sWord-2>
                                                        <xsl:attribute name="ref">
                                                            <xsl:value-of select="./@cite"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@relation,
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-gender-sWord-2>
                                                    
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_3 = 0">
                                                    <DD-rel-morph-gender-sWord-3><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />                                                        
                                                    </DD-rel-morph-gender-sWord-3>
                                                </xsl:when>
                                                <xsl:when test="$head_3 > 0">
                                                    <DD-rel-morph-gender-sWord-3>
                                                        <xsl:attribute name="ref">
                                                            <xsl:value-of select="./@cite"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),                                                            
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-gender-sWord-3>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_4 = 0">
                                                    <DD-rel-morph-gender-sWord-4><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-gender-sWord-4>
                                                </xsl:when>
                                                <xsl:when test="$head_4 > 0">
                                                    <DD-rel-morph-gender-sWord-4>
                                                        <xsl:attribute name="ref">
                                                            <xsl:value-of select="./@cite"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                                            parent::sentence/word[@id = $head_4]/@relation,
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-gender-sWord-4>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            
                              <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->      
                                            
                                            <DD-rel-morph-case-sWord-0>
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
                                            </DD-rel-morph-case-sWord-0>
                                            
                                            <DD-rel-morph-case-sWord-1>
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
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </xsl:when>
                                                    
                                                </xsl:choose>
                                            </DD-rel-morph-case-sWord-1>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_2 = 0">
                                                    <DD-rel-morph-case-sWord-2><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-case-sWord-2>
                                                </xsl:when>
                                                <xsl:when test="$head_2 > 0">
                                                    <DD-rel-morph-case-sWord-2>
                                                        <xsl:attribute name="ref">
                                                            <xsl:value-of select="./@cite"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@relation,
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-case-sWord-2>
                                                    
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_3 = 0">
                                                    <DD-rel-morph-case-sWord-3><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />                                                        
                                                    </DD-rel-morph-case-sWord-3>
                                                </xsl:when>
                                                <xsl:when test="$head_3 > 0">
                                                    <DD-rel-morph-case-sWord-3>
                                                        <xsl:attribute name="ref">
                                                            <xsl:value-of select="./@cite"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),                                                            
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-case-sWord-3>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_4 = 0">
                                                    <DD-rel-morph-case-sWord-4><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-case-sWord-4>
                                                </xsl:when>
                                                <xsl:when test="$head_4 > 0">
                                                    <DD-rel-morph-case-sWord-4>
                                                        <xsl:attribute name="ref">
                                                            <xsl:value-of select="./@cite"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                                            parent::sentence/word[@id = $head_4]/@relation,
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-case-sWord-4>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            
                              <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                                            
                                          
                                            <!-- code adding more detailed combinations of  morphology information to sWords: gender and case. -->
                                          
                                            <DD-rel-morph-gender-case-sWord-0>
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
                                            </DD-rel-morph-gender-case-sWord-0>
                                            
                                            <DD-rel-morph-gender-case-sWord-1>
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
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </xsl:when>
                                                    
                                                </xsl:choose>
                                            </DD-rel-morph-gender-case-sWord-1>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_2 = 0">
                                                    <DD-rel-morph-gender-case-sWord-2><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-gender-case-sWord-2>
                                                </xsl:when>
                                                <xsl:when test="$head_2 > 0">
                                                    <DD-rel-morph-gender-case-sWord-2>
                                                        <xsl:attribute name="ref">
                                                            <xsl:value-of select="./@cite"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@relation,
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-gender-case-sWord-2>
                                                    
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_3 = 0">
                                                    <DD-rel-morph-gender-case-sWord-3><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />                                                        
                                                    </DD-rel-morph-gender-case-sWord-3>
                                                </xsl:when>
                                                <xsl:when test="$head_3 > 0">
                                                    <DD-rel-morph-gender-case-sWord-3>
                                                        <xsl:attribute name="ref">
                                                            <xsl:value-of select="./@cite"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),                                                            
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-gender-case-sWord-3>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_4 = 0">
                                                    <DD-rel-morph-gender-case-sWord-4><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-gender-case-sWord-4>
                                                </xsl:when>
                                                <xsl:when test="$head_4 > 0">
                                                    <DD-rel-morph-gender-case-sWord-4>
                                                        <xsl:attribute name="ref">
                                                            <xsl:value-of select="./@cite"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                                            parent::sentence/word[@id = $head_4]/@relation,
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-gender-case-sWord-4>
                                                </xsl:when>
                                            </xsl:choose>
                                          
                                          <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                                            
                                            <!-- code adding more detailed combinations of  morphology information to sWords: number and case. -->
                                            
                                            <DD-rel-morph-number-case-sWord-0>
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
                                            </DD-rel-morph-number-case-sWord-0>
                                            
                                            <DD-rel-morph-number-case-sWord-1>
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
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </xsl:when>
                                                    
                                                </xsl:choose>
                                            </DD-rel-morph-number-case-sWord-1>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_2 = 0">
                                                    <DD-rel-morph-number-case-sWord-2><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-number-case-sWord-2>
                                                </xsl:when>
                                                <xsl:when test="$head_2 > 0">
                                                    <DD-rel-morph-number-case-sWord-2>
                                                        <xsl:attribute name="ref">
                                                            <xsl:value-of select="./@cite"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@relation,
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-number-case-sWord-2>
                                                    
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_3 = 0">
                                                    <DD-rel-morph-number-case-sWord-3><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />                                                        
                                                    </DD-rel-morph-number-case-sWord-3>
                                                </xsl:when>
                                                <xsl:when test="$head_3 > 0">
                                                    <DD-rel-morph-number-case-sWord-3>
                                                        <xsl:attribute name="ref">
                                                            <xsl:value-of select="./@cite"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),                                                            
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-number-case-sWord-3>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_4 = 0">
                                                    <DD-rel-morph-number-case-sWord-4><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-number-case-sWord-4>
                                                </xsl:when>
                                                <xsl:when test="$head_4 > 0">
                                                    <DD-rel-morph-number-case-sWord-4>
                                                        <xsl:attribute name="ref">
                                                            <xsl:value-of select="./@cite"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                                            parent::sentence/word[@id = $head_4]/@relation,
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-number-case-sWord-4>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                          <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                                            
                                            <!-- Gender, number -->
                                            
                                            <DD-rel-morph-number-gender-sWord-0>
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
                                            </DD-rel-morph-number-gender-sWord-0>
                                            
                                            <DD-rel-morph-number-gender-sWord-1>
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
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />
                                                    </xsl:when>
                                                    
                                                </xsl:choose>
                                            </DD-rel-morph-number-gender-sWord-1>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_2 = 0">
                                                    <DD-rel-morph-number-gender-sWord-2><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-number-gender-sWord-2>
                                                </xsl:when>
                                                <xsl:when test="$head_2 > 0">
                                                    <DD-rel-morph-number-gender-sWord-2>
                                                        <xsl:attribute name="ref">
                                                            <xsl:value-of select="./@cite"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@relation,
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-number-gender-sWord-2>
                                                    
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_3 = 0">
                                                    <DD-rel-morph-number-gender-sWord-3><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />                                                        
                                                    </DD-rel-morph-number-gender-sWord-3>
                                                </xsl:when>
                                                <xsl:when test="$head_3 > 0">
                                                    <DD-rel-morph-number-gender-sWord-3>
                                                        <xsl:attribute name="ref">
                                                            <xsl:value-of select="./@cite"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),                                                            
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-number-gender-sWord-3>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_4 = 0">
                                                    <DD-rel-morph-number-gender-sWord-4><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-number-gender-sWord-4>
                                                </xsl:when>
                                                <xsl:when test="$head_4 > 0">
                                                    <DD-rel-morph-number-gender-sWord-4>
                                                        <xsl:attribute name="ref">
                                                            <xsl:value-of select="./@cite"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                                            parent::sentence/word[@id = $head_4]/@relation,
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-number-gender-sWord-4>
                                                </xsl:when>
                                            </xsl:choose>
                                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                                            <!-- remove pos tages --> 
                                            
                                            <DD-rel-morph-number-gender-case-sWord-0>
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
                                            </DD-rel-morph-number-gender-case-sWord-0>
                                            
                                            <DD-rel-morph-number-gender-case-sWord-1>
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
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </xsl:when>
                                                    
                                                </xsl:choose>
                                            </DD-rel-morph-number-gender-case-sWord-1>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_2 = 0">
                                                    <DD-rel-morph-number-gender-case-sWord-2><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-number-gender-case-sWord-2>
                                                </xsl:when>
                                                <xsl:when test="$head_2 > 0">
                                                    <DD-rel-morph-number-gender-case-sWord-2>
                                                        <xsl:attribute name="ref">
                                                            <xsl:value-of select="./@cite"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@relation,
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-number-gender-case-sWord-2>
                                                    
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_3 = 0">
                                                    <DD-rel-morph-number-gender-case-sWord-3><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />                                                        
                                                    </DD-rel-morph-number-gender-case-sWord-3>
                                                </xsl:when>
                                                <xsl:when test="$head_3 > 0">
                                                    <DD-rel-morph-number-gender-case-sWord-3>
                                                        <xsl:attribute name="ref">
                                                            <xsl:value-of select="./@cite"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),                                                              
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-number-gender-case-sWord-3>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_4 = 0">
                                                    <DD-rel-morph-number-gender-case-sWord-4><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-number-gender-case-sWord-4>
                                                </xsl:when>
                                                <xsl:when test="$head_4 > 0">
                                                    <DD-rel-morph-number-gender-case-sWord-4>
                                                        <xsl:attribute name="ref">
                                                            <xsl:value-of select="./@cite"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                                            parent::sentence/word[@id = $head_4]/@relation,
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-number-gender-case-sWord-4>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            
                                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                                            <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
                                          
                                          
                                          
                                        </xsl:when>
                                    </xsl:choose>       
                                    
                                    <!-- YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY -->
                                    <!-- YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY --> 
                                    <!-- number (but not case or gender) morphology variables --> 
                                    
                                    <xsl:choose>
                                        <xsl:when test="(substring(./@postag, 1, 1) = 'n') or (substring(./@postag, 1, 1) = 'p') or (substring(./@postag, 1, 1) = 'l')
                                            or (substring(./@postag, 1, 1) = 'a') or (substring(./@postag, 5, 1) = 'p') or (substring(./@postag, 1, 1) = 'v')">
                                            
                                            <DD-rel-morph-pos-number-sWord-0>
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
                                            </DD-rel-morph-pos-number-sWord-0>
                                            
                                            
                                            <DD-rel-morph-pos-number-sWord-1>
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
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1)
                                                            ), '|'))"
                                                        />
                                                    </xsl:when>
                                                    
                                                </xsl:choose>
                                            </DD-rel-morph-pos-number-sWord-1>
                                            <xsl:choose>
                                                <xsl:when test="$head_2 = 0">
                                                    <DD-rel-morph-pos-number-sWord-2><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-sWord-2>
                                                </xsl:when>
                                                <xsl:when test="$head_2 > 0">
                                                    <DD-rel-morph-pos-number-sWord-2>
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
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-sWord-2>
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:choose>
                                                <xsl:when test="$head_3 = 0">
                                                    <DD-rel-morph-pos-number-sWord-3><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-sWord-3>
                                                </xsl:when>
                                                <xsl:when test="$head_3 > 0">
                                                    <DD-rel-morph-pos-number-sWord-3>
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
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-sWord-3>
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:choose>
                                                <xsl:when test="$head_4 = 0">
                                                    <DD-rel-morph-pos-number-sWord-4><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-sWord-4>
                                                </xsl:when>
                                                <xsl:when test="$head_4 > 0">
                                                    <DD-rel-morph-pos-number-sWord-4>
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
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-sWord-4>
                                                </xsl:when>
                                            </xsl:choose>
                                            <DD-rel-morph-number-sWord-0>
                                                <xsl:attribute name="ref">
                                                    <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                
                                                <!-- following code has no pos tag -->
                                                
                                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-sWord-0> element. -->
                                                <xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 3, 1)
                                                    ), '|'))"
                                                    > </xsl:value-of>
                                            </DD-rel-morph-number-sWord-0>
                                            
                                            
                                            <DD-rel-morph-number-sWord-1>
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
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 3, 1)
                                                            ), '|'))"
                                                        />
                                                    </xsl:when>
                                                    
                                                </xsl:choose>
                                            </DD-rel-morph-number-sWord-1>
                                            <xsl:choose>
                                                <xsl:when test="$head_2 = 0">
                                                    <DD-rel-morph-number-sWord-2><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 3, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-number-sWord-2>
                                                </xsl:when>
                                                <xsl:when test="$head_2 > 0">
                                                    <DD-rel-morph-number-sWord-2>
                                                        <xsl:attribute name="ref">
                                                            <xsl:value-of select="./@cite"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            ./@relation,
                                                            substring(./@postag, 3, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-number-sWord-2>
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:choose>
                                                <xsl:when test="$head_3 = 0">
                                                    <DD-rel-morph-number-sWord-3><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 3, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-number-sWord-3>
                                                </xsl:when>
                                                <xsl:when test="$head_3 > 0">
                                                    <DD-rel-morph-number-sWord-3>
                                                        <xsl:attribute name="ref">
                                                            <xsl:value-of select="./@cite"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 3, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-number-sWord-3>
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:choose>
                                                <xsl:when test="$head_4 = 0">
                                                    <DD-rel-morph-number-sWord-4><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 3, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-number-sWord-4>
                                                </xsl:when>
                                                <xsl:when test="$head_4 > 0">
                                                    <DD-rel-morph-number-sWord-4>
                                                        <xsl:attribute name="ref">
                                                            <xsl:value-of select="./@cite"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_4]/@DepDist,
                                                            parent::sentence/word[@id = $head_4]/@relation,
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 3, 1),
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 3, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-number-sWord-4>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            
                                        </xsl:when>
                                    </xsl:choose>
                                    
                                    
                                    <!-- YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY --> 
                                    <!-- YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY --> 
                                    
                                    
                                    <!-- ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ -->
                                    <!-- ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ -->
                                    <!-- participle variables -->
                                    
                                    <xsl:choose>
                                        <xsl:when test="(substring(./@postag, 5, 1) = 'p')">
                                            
                                            <DD-rel-morph-pos-voice-gender-case-sWord-0>
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
                                                    substring(./@postag, 6, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1)
                                                    ), '|'))"
                                                    > </xsl:value-of>
                                            </DD-rel-morph-pos-voice-gender-case-sWord-0>
                                            
                                            <DD-rel-morph-pos-voice-gender-case-sWord-1>
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
                                                        substring(./@postag, 6, 1),
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
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </xsl:when>
                                                    
                                                </xsl:choose>
                                            </DD-rel-morph-pos-voice-gender-case-sWord-1>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_2 = 0">
                                                    <DD-rel-morph-pos-voice-gender-case-sWord-2><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-voice-gender-case-sWord-2>
                                                </xsl:when>
                                                <xsl:when test="$head_2 > 0">
                                                    <DD-rel-morph-pos-voice-gender-case-sWord-2>
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
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-voice-gender-case-sWord-2>
                                                    
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_3 = 0">
                                                    <DD-rel-morph-pos-voice-gender-case-sWord-3><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />                                                        
                                                    </DD-rel-morph-pos-voice-gender-case-sWord-3>
                                                </xsl:when>
                                                <xsl:when test="$head_3 > 0">
                                                    <DD-rel-morph-pos-voice-gender-case-sWord-3>
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
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),                                                              
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-voice-gender-case-sWord-3>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_4 = 0">
                                                    <DD-rel-morph-pos-voice-gender-case-sWord-4><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-voice-gender-case-sWord-4>
                                                </xsl:when>
                                                <xsl:when test="$head_4 > 0">
                                                    <DD-rel-morph-pos-voice-gender-case-sWord-4>
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
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-voice-gender-case-sWord-4>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                        
                                    
                                    
                                    
                                    <!-- ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ -->
                                    <!-- ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ -->
                                    <!-- participle variables: tense-gender-case -->
                                    
                                    
                                    <DD-rel-morph-pos-tense-gender-case-sWord-0>
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
                                            substring(./@postag, 7, 1),
                                            substring(./@postag, 8, 1)
                                            ), '|'))"
                                            > </xsl:value-of>
                                    </DD-rel-morph-pos-tense-gender-case-sWord-0>
                                    
                                    <DD-rel-morph-pos-tense-gender-case-sWord-1>
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
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 4, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1)
                                                    ), '|'))"
                                                />
                                            </xsl:when>
                                            
                                        </xsl:choose>
                                    </DD-rel-morph-pos-tense-gender-case-sWord-1>
                                    
                                    <xsl:choose>
                                        <xsl:when test="$head_2 = 0">
                                            <DD-rel-morph-pos-tense-gender-case-sWord-2><xsl:attribute name="ref"
                                                ><xsl:value-of select="./@cite"
                                                /></xsl:attribute>#-<xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 4, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-tense-gender-case-sWord-2>
                                        </xsl:when>
                                        <xsl:when test="$head_2 > 0">
                                            <DD-rel-morph-pos-tense-gender-case-sWord-2>
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
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 4, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-tense-gender-case-sWord-2>
                                            
                                        </xsl:when>
                                    </xsl:choose>
                                    
                                    
                                    <xsl:choose>
                                        <xsl:when test="$head_3 = 0">
                                            <DD-rel-morph-pos-tense-gender-case-sWord-3><xsl:attribute name="ref"
                                                ><xsl:value-of select="./@cite"
                                                /></xsl:attribute>#-<xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,                                                         
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 4, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1)
                                                    ), '|'))"
                                                />                                                        
                                            </DD-rel-morph-pos-tense-gender-case-sWord-3>
                                        </xsl:when>
                                        <xsl:when test="$head_3 > 0">
                                            <DD-rel-morph-pos-tense-gender-case-sWord-3>
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
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),                                                              
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 4, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-tense-gender-case-sWord-3>
                                        </xsl:when>
                                    </xsl:choose>
                                    
                                    <xsl:choose>
                                        <xsl:when test="$head_4 = 0">
                                            <DD-rel-morph-pos-tense-gender-case-sWord-4><xsl:attribute name="ref"
                                                ><xsl:value-of select="./@cite"
                                                /></xsl:attribute>#-<xsl:value-of
                                                    select="
                                                    normalize-space(string-join((
                                                    parent::sentence/word[@id = $head_3]/@DepDist,
                                                    parent::sentence/word[@id = $head_3]/@relation,
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 4, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 4, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-tense-gender-case-sWord-4>
                                        </xsl:when>
                                        <xsl:when test="$head_4 > 0">
                                            <DD-rel-morph-pos-tense-gender-case-sWord-4>
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
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_4]/@postag, 8, 1),
                                                    parent::sentence/word[@id = $head_3]/@DepDist,
                                                    parent::sentence/word[@id = $head_3]/@relation,
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 4, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                    parent::sentence/word[@id = $head_1]/@DepDist,
                                                    parent::sentence/word[@id = $head_1]/@relation,
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                    substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                    ./@DepDist,
                                                    ./@relation,
                                                    substring(./@postag, 1, 1),
                                                    substring(./@postag, 4, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1)
                                                    ), '|'))"
                                                />
                                            </DD-rel-morph-pos-tense-gender-case-sWord-4>
                                        </xsl:when>
                                    </xsl:choose>
                                    
                                    
                                    <!-- ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ -->
                                    <!-- ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ -->
                                    <!-- participle variables: number-voice-gender-case -->
                                    
                                    
                                    
                                    
                                            
                                            <DD-rel-morph-pos-tense-voice-gender-case-sWord-0>
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
                                                    substring(./@postag, 6, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1)
                                                    ), '|'))"
                                                    > </xsl:value-of>
                                            </DD-rel-morph-pos-tense-voice-gender-case-sWord-0>
                                            
                                            <DD-rel-morph-pos-tense-voice-gender-case-sWord-1>
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
                                                        substring(./@postag, 6, 1),
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
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 4, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </xsl:when>
                                                    
                                                </xsl:choose>
                                            </DD-rel-morph-pos-tense-voice-gender-case-sWord-1>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_2 = 0">
                                                    <DD-rel-morph-pos-tense-voice-gender-case-sWord-2><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 4, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-tense-voice-gender-case-sWord-2>
                                                </xsl:when>
                                                <xsl:when test="$head_2 > 0">
                                                    <DD-rel-morph-pos-tense-voice-gender-case-sWord-2>
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
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 4, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-tense-voice-gender-case-sWord-2>
                                                    
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_3 = 0">
                                                    <DD-rel-morph-pos-tense-voice-gender-case-sWord-3><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 4, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />                                                        
                                                    </DD-rel-morph-pos-tense-voice-gender-case-sWord-3>
                                                </xsl:when>
                                                <xsl:when test="$head_3 > 0">
                                                    <DD-rel-morph-pos-tense-voice-gender-case-sWord-3>
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
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),                                                              
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 4, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-tense-voice-gender-case-sWord-3>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_4 = 0">
                                                    <DD-rel-morph-pos-tense-voice-gender-case-sWord-4><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 4, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-tense-voice-gender-case-sWord-4>
                                                </xsl:when>
                                                <xsl:when test="$head_4 > 0">
                                                    <DD-rel-morph-pos-tense-voice-gender-case-sWord-4>
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
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 4, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-tense-voice-gender-case-sWord-4>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                    
                                    
                                    
                                    <!-- ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ -->
                                    <!-- ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ -->
                                    <!-- number-voice-gender-case -->
                                    
                                    <DD-rel-morph-pos-number-voice-gender-case-sWord-0>
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
                                                    substring(./@postag, 6, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1)
                                                    ), '|'))"
                                                    > </xsl:value-of>
                                            </DD-rel-morph-pos-number-voice-gender-case-sWord-0>
                                            
                                            <DD-rel-morph-pos-number-voice-gender-case-sWord-1>
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
                                                        substring(./@postag, 6, 1),
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
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </xsl:when>
                                                    
                                                </xsl:choose>
                                            </DD-rel-morph-pos-number-voice-gender-case-sWord-1>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_2 = 0">
                                                    <DD-rel-morph-pos-number-voice-gender-case-sWord-2><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-voice-gender-case-sWord-2>
                                                </xsl:when>
                                                <xsl:when test="$head_2 > 0">
                                                    <DD-rel-morph-pos-number-voice-gender-case-sWord-2>
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
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-voice-gender-case-sWord-2>
                                                    
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_3 = 0">
                                                    <DD-rel-morph-pos-number-voice-gender-case-sWord-3><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />                                                        
                                                    </DD-rel-morph-pos-number-voice-gender-case-sWord-3>
                                                </xsl:when>
                                                <xsl:when test="$head_3 > 0">
                                                    <DD-rel-morph-pos-number-voice-gender-case-sWord-3>
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
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),                                                              
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-voice-gender-case-sWord-3>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_4 = 0">
                                                    <DD-rel-morph-pos-number-voice-gender-case-sWord-4><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-voice-gender-case-sWord-4>
                                                </xsl:when>
                                                <xsl:when test="$head_4 > 0">
                                                    <DD-rel-morph-pos-number-voice-gender-case-sWord-4>
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
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-voice-gender-case-sWord-4>
                                                </xsl:when>
                                            </xsl:choose>
                                    
                                    
                                    <!-- ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ -->
                                    <!-- ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ -->
                                            <!-- number-tense-gender-case --> 
                                    
                                    <DD-rel-morph-pos-number-tense-gender-case-sWord-0>
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
                                                    substring(./@postag, 4, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1)
                                                    ), '|'))"
                                                    > </xsl:value-of>
                                            </DD-rel-morph-pos-number-tense-gender-case-sWord-0>
                                            
                                            <DD-rel-morph-pos-number-tense-gender-case-sWord-1>
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
                                                        substring(./@postag, 4, 1),
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
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 4, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </xsl:when>
                                                    
                                                </xsl:choose>
                                            </DD-rel-morph-pos-number-tense-gender-case-sWord-1>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_2 = 0">
                                                    <DD-rel-morph-pos-number-tense-gender-case-sWord-2><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 4, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-tense-gender-case-sWord-2>
                                                </xsl:when>
                                                <xsl:when test="$head_2 > 0">
                                                    <DD-rel-morph-pos-number-tense-gender-case-sWord-2>
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
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 4, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-tense-gender-case-sWord-2>
                                                    
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_3 = 0">
                                                    <DD-rel-morph-pos-number-tense-gender-case-sWord-3><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 4, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />                                                        
                                                    </DD-rel-morph-pos-number-tense-gender-case-sWord-3>
                                                </xsl:when>
                                                <xsl:when test="$head_3 > 0">
                                                    <DD-rel-morph-pos-number-tense-gender-case-sWord-3>
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
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),                                                              
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 4, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-tense-gender-case-sWord-3>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_4 = 0">
                                                    <DD-rel-morph-pos-number-tense-gender-case-sWord-4><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 4, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-tense-gender-case-sWord-4>
                                                </xsl:when>
                                                <xsl:when test="$head_4 > 0">
                                                    <DD-rel-morph-pos-number-tense-gender-case-sWord-4>
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
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 4, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-tense-gender-case-sWord-4>
                                                </xsl:when>
                                            </xsl:choose>
                                    
                                    <!-- ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ -->
                                    <!-- ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ -->
                                    <!-- number-tense-gender-case --> 
                                    
                                                                                
                                            <DD-rel-morph-pos-number-tense-voice-gender-case-sWord-0>
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
                                                    substring(./@postag, 4, 1),
                                                    substring(./@postag, 6, 1),
                                                    substring(./@postag, 7, 1),
                                                    substring(./@postag, 8, 1)
                                                    ), '|'))"
                                                    > </xsl:value-of>
                                            </DD-rel-morph-pos-number-tense-voice-gender-case-sWord-0>
                                            
                                            <DD-rel-morph-pos-number-tense-voice-gender-case-sWord-1>
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
                                                        substring(./@postag, 4, 1),
                                                        substring(./@postag, 6, 1),
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
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 4, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </xsl:when>
                                                    
                                                </xsl:choose>
                                            </DD-rel-morph-pos-number-tense-voice-gender-case-sWord-1>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_2 = 0">
                                                    <DD-rel-morph-pos-number-tense-voice-gender-case-sWord-2><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 4, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-tense-voice-gender-case-sWord-2>
                                                </xsl:when>
                                                <xsl:when test="$head_2 > 0">
                                                    <DD-rel-morph-pos-number-tense-voice-gender-case-sWord-2>
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
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 4, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-tense-voice-gender-case-sWord-2>
                                                    
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_3 = 0">
                                                    <DD-rel-morph-pos-number-tense-voice-gender-case-sWord-3><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,                                                         
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 4, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />                                                        
                                                    </DD-rel-morph-pos-number-tense-voice-gender-case-sWord-3>
                                                </xsl:when>
                                                <xsl:when test="$head_3 > 0">
                                                    <DD-rel-morph-pos-number-tense-voice-gender-case-sWord-3>
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
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),                                                              
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 4, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-tense-voice-gender-case-sWord-3>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            <xsl:choose>
                                                <xsl:when test="$head_4 = 0">
                                                    <DD-rel-morph-pos-number-tense-voice-gender-case-sWord-4><xsl:attribute name="ref"
                                                        ><xsl:value-of select="./@cite"
                                                        /></xsl:attribute>#-<xsl:value-of
                                                            select="
                                                            normalize-space(string-join((
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 4, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-tense-voice-gender-case-sWord-4>
                                                </xsl:when>
                                                <xsl:when test="$head_4 > 0">
                                                    <DD-rel-morph-pos-number-tense-voice-gender-case-sWord-4>
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
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_4]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                                            parent::sentence/word[@id = $head_3]/@relation,
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_3]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                                            parent::sentence/word[@id = $head_2]/@relation,
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_2]/@postag, 8, 1),
                                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                                            parent::sentence/word[@id = $head_1]/@relation,
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 3, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 4, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 6, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 7, 1),
                                                            substring(parent::sentence/word[@id = $head_1]/@postag, 8, 1),
                                                            ./@DepDist,
                                                            ./@relation,
                                                            substring(./@postag, 1, 1),
                                                            substring(./@postag, 3, 1),
                                                            substring(./@postag, 4, 1),
                                                            substring(./@postag, 6, 1),
                                                            substring(./@postag, 7, 1),
                                                            substring(./@postag, 8, 1)
                                                            ), '|'))"
                                                        />
                                                    </DD-rel-morph-pos-number-tense-voice-gender-case-sWord-4>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                        </xsl:when>
                                    </xsl:choose>
                                    
                                    <!-- ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ -->
                                    <!-- ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ -->
                                       
                                    
                                    
                                    <!-- Code block adding DD to rel sWords. Only sWord levels 0-5 are included -->


                                    <DD-rel-sWord-0>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <!-- Each <word> element returns its own @relation. These data are output as contents of 
                                        a <rel-sWord-0> element. -->
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation), '|')"
                                        />
                                    </DD-rel-sWord-0>

                                    <DD-rel-sWord-1>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                                  select="
                                                        string-join((
                                                        ./@DepDist,
                                                        ./@relation), '|')"
                                                />
                                            </xsl:when>
                                            <xsl:when test="$head_1 > 0">
                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        ./@DepDist,
                                                        ./@relation
                                                        ), '|')"
                                                />
                                            </xsl:when>

                                        </xsl:choose>
                                    </DD-rel-sWord-1>

                                    <xsl:choose>
                                        <xsl:when test="$head_2 = 0">
                                            <DD-rel-sWord-2><xsl:attribute name="ref"><xsl:value-of
                                                  select="./@cite"/></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        ./@DepDist,
                                                        ./@relation
                                                        ), '|')"
                                                />
                                            </DD-rel-sWord-2>
                                        </xsl:when>
                                        <xsl:when test="$head_2 > 0">
                                            <DD-rel-sWord-2>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        ./@DepDist,
                                                        ./@relation
                                                        ), '|')"
                                                />
                                            </DD-rel-sWord-2>
                                        </xsl:when>
                                    </xsl:choose>

                                    <xsl:choose>
                                        <xsl:when test="$head_3 = 0">
                                            <DD-rel-sWord-3><xsl:attribute name="ref"><xsl:value-of
                                                  select="./@cite"/></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        ./@DepDist,
                                                        ./@relation
                                                        ), '|')"
                                                />
                                            </DD-rel-sWord-3>
                                        </xsl:when>
                                        <xsl:when test="$head_3 > 0">
                                            <DD-rel-sWord-3>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_3]/@DepDist,
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        ./@DepDist,
                                                        ./@relation
                                                        ), '|')"
                                                />
                                            </DD-rel-sWord-3>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="$head_4 = 0">
                                            <DD-rel-sWord-4><xsl:attribute name="ref"><xsl:value-of
                                                  select="./@cite"/></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_3]/@DepDist,
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        ./@DepDist,
                                                        ./@relation
                                                        ), '|')"
                                                />
                                            </DD-rel-sWord-4>
                                        </xsl:when>
                                        <xsl:when test="$head_4 > 0">
                                            <DD-rel-sWord-4>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_4]/@DepDist,
                                                        parent::sentence/word[@id = $head_4]/@relation,
                                                        parent::sentence/word[@id = $head_3]/@DepDist,
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        ./@DepDist,
                                                        ./@relation
                                                        ), '|')"
                                                />
                                            </DD-rel-sWord-4>
                                        </xsl:when>
                                    </xsl:choose>



                                    <!-- End of code block to add DD to rel sWords -->


                                    <!-- The following block of code adds DD to pos sWords.  Only sWord levels 0-6 are included. -->


                                    <DD-pos-sWord-0>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                substring(./@postag, 1, 1)
                                                ), '|')"
                                        > </xsl:value-of>
                                    </DD-pos-sWord-0>

                                    <!-- For all remaining sWord level elements, we first test to see if the level in question is the 
                                    sentence root. If so, we insert the root symbol (#)and terminate the output with the data
                                    of the <word> immediately dependent on the @head. Otherwise, the data for the "parent" word is included
                                    as well.  -->
                                    <DD-pos-sWord-1>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                                  select="
                                                        string-join((
                                                        ./@DepDist,
                                                        substring(./@postag, 1, 1)
                                                        ), '|')"
                                                > </xsl:value-of>
                                            </xsl:when>
                                            <xsl:when test="$head_1 > 0">
                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@DepDist,
                                                        substring(./@postag, 1, 1)
                                                        ), '|')"
                                                />
                                            </xsl:when>

                                        </xsl:choose>
                                    </DD-pos-sWord-1>
                                    <xsl:choose>
                                        <xsl:when test="$head_2 = 0">
                                            <DD-pos-sWord-2><xsl:attribute name="ref"><xsl:value-of
                                                  select="./@cite"/></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@DepDist,
                                                        substring(./@postag, 1, 1)
                                                        ), '|')"
                                                />
                                            </DD-pos-sWord-2>
                                        </xsl:when>
                                        <xsl:when test="$head_2 > 0">
                                            <DD-pos-sWord-2>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@DepDist,
                                                        substring(./@postag, 1, 1)
                                                        ), '|')"
                                                />
                                            </DD-pos-sWord-2>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="$head_3 = 0">
                                            <DD-pos-sWord-3><xsl:attribute name="ref"><xsl:value-of
                                                  select="./@cite"/></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@DepDist,
                                                        substring(./@postag, 1, 1)
                                                        ), '|')"
                                                />
                                            </DD-pos-sWord-3>
                                        </xsl:when>
                                        <xsl:when test="$head_3 > 0">
                                            <DD-pos-sWord-3>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_3]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@DepDist,
                                                        substring(./@postag, 1, 1)
                                                        ), '|')"
                                                />
                                            </DD-pos-sWord-3>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="$head_4 = 0">
                                            <DD-pos-sWord-4><xsl:attribute name="ref"><xsl:value-of
                                                  select="./@cite"/></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_3]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@DepDist,
                                                        substring(./@postag, 1, 1)
                                                        ), '|')"
                                                />
                                            </DD-pos-sWord-4>
                                        </xsl:when>
                                        <xsl:when test="$head_4 > 0">
                                            <DD-pos-sWord-4>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_4]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_3]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@DepDist,
                                                        substring(./@postag, 1, 1)
                                                        ), '|')"
                                                />
                                            </DD-pos-sWord-4>
                                        </xsl:when>
                                    </xsl:choose>

                                    <xsl:choose>
                                        <xsl:when test="$head_5 = 0">
                                            <DD-pos-sWord-5><xsl:attribute name="ref"><xsl:value-of
                                                  select="./@cite"/></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_4]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_3]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@DepDist,
                                                        substring(./@postag, 1, 1)
                                                        ), '|')"
                                                />
                                            </DD-pos-sWord-5>
                                        </xsl:when>
                                        <xsl:when test="$head_5 > 0">
                                            <DD-pos-sWord-5>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_5]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_5]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_4]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_3]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@DepDist,
                                                        substring(./@postag, 1, 1)
                                                        ), '|')"
                                                />
                                            </DD-pos-sWord-5>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="$head_6 = 0">
                                            <DD-pos-sWord-6><xsl:attribute name="ref"><xsl:value-of
                                                  select="./@cite"/></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_5]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_5]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_4]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_3]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@DepDist,
                                                        substring(./@postag, 1, 1)
                                                        ), '|')"
                                                />
                                            </DD-pos-sWord-6>
                                        </xsl:when>
                                        <xsl:when test="$head_6 > 0">
                                            <DD-pos-sWord-6>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_6]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_6]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_5]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_5]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_4]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_3]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@DepDist,
                                                        substring(./@postag, 1, 1)
                                                        ), '|')"
                                                />
                                            </DD-pos-sWord-6>
                                        </xsl:when>
                                    </xsl:choose>

                                    <!-- End of code block bputting DD in pos sWords -->


                                    <!-- Code block to extract rel-pos neighbothood attributes -->

                                    <Neighborhood-rel-pos-sWord-0>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>


                                        <xsl:value-of select="./@Rel_Pos_Subtree"/>
                                    </Neighborhood-rel-pos-sWord-0>

                                    <Neighborhood-rel-pos-sWord-1>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                                  select="./@Rel_Pos_Subtree"> </xsl:value-of>
                                            </xsl:when>
                                            <xsl:when test="$head_1 > 0">
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_1]/@Rel_Pos_Subtree,
                                                        ./@Rel_Pos_Subtree
                                                        ), '-'))"
                                                />
                                            </xsl:when>

                                        </xsl:choose>
                                    </Neighborhood-rel-pos-sWord-1>
                                    <xsl:choose>
                                        <xsl:when test="$head_2 = 0">
                                            <Neighborhood-rel-pos-sWord-2><xsl:attribute name="ref"
                                                  ><xsl:value-of select="./@cite"
                                                  /></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_1]/@Rel_Pos_Subtree,
                                                        ./@Rel_Pos_Subtree
                                                        ), '-'))"
                                                />
                                            </Neighborhood-rel-pos-sWord-2>
                                        </xsl:when>
                                        <xsl:when test="$head_2 > 0">
                                            <Neighborhood-rel-pos-sWord-2>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_2]/@Rel_Pos_Subtree,
                                                        parent::sentence/word[@id = $head_1]/@Rel_Pos_Subtree,
                                                        ./@Rel_Pos_Subtree
                                                        ), '-'))"
                                                />
                                            </Neighborhood-rel-pos-sWord-2>
                                        </xsl:when>
                                    </xsl:choose>


                                    <!-- End of code block extracting rel-pos neighborhood subtrees. -->

                                    <!-- Code to extract rel neighborhood subtrees. -->

                                    <Neighborhood-rel-sWord-0>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>


                                        <xsl:value-of select="./@Relation_Subtree"/>
                                    </Neighborhood-rel-sWord-0>

                                    <Neighborhood-rel-sWord-1>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                                  select="./@Relation_Subtree"> </xsl:value-of>
                                            </xsl:when>
                                            <xsl:when test="$head_1 > 0">
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_1]/@Relation_Subtree,
                                                        ./@Relation_Subtree
                                                        ), '-'))"
                                                />
                                            </xsl:when>

                                        </xsl:choose>
                                    </Neighborhood-rel-sWord-1>


                                    <xsl:choose>
                                        <xsl:when test="$head_2 = 0">
                                            <Neighborhood-rel-sWord-2><xsl:attribute name="ref"
                                                  ><xsl:value-of select="./@cite"
                                                  /></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_1]/@Relation_Subtree,
                                                        ./@Relation_Subtree
                                                        ), '-'))"
                                                />
                                            </Neighborhood-rel-sWord-2>
                                        </xsl:when>
                                        <xsl:when test="$head_2 > 0">
                                            <Neighborhood-rel-sWord-2>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_2]/@Relation_Subtree,
                                                        parent::sentence/word[@id = $head_1]/@Relation_Subtree,
                                                        ./@Relation_Subtree
                                                        ), '-'))"
                                                />
                                            </Neighborhood-rel-sWord-2>
                                        </xsl:when>
                                    </xsl:choose>


                                    <!-- End of code block for rel-pos neighborhood subtrees. -->


                                    <!-- Start of code extracting pos neighborhood subtrees. -->


                                    <Neighborhood-pos-sWord-0>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>


                                        <xsl:value-of select="./@POS_Subtree"/>
                                    </Neighborhood-pos-sWord-0>

                                    <Neighborhood-pos-sWord-1>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                                  select="./@POS_Subtree"> </xsl:value-of>
                                            </xsl:when>
                                            <xsl:when test="$head_1 > 0">
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_1]/@POS_Subtree,
                                                        ./@POS_Subtree
                                                        ), '-'))"
                                                />
                                            </xsl:when>

                                        </xsl:choose>
                                    </Neighborhood-pos-sWord-1>


                                    <xsl:choose>
                                        <xsl:when test="$head_2 = 0">
                                            <Neighborhood-pos-sWord-2><xsl:attribute name="ref"
                                                  ><xsl:value-of select="./@cite"
                                                  /></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_1]/@POS_Subtree,
                                                        ./@POS_Subtree
                                                        ), '-'))"
                                                />
                                            </Neighborhood-pos-sWord-2>
                                        </xsl:when>
                                        <xsl:when test="$head_2 > 0">
                                            <Neighborhood-pos-sWord-2>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_2]/@POS_Subtree,
                                                        parent::sentence/word[@id = $head_1]/@POS_Subtree,
                                                        ./@POS_Subtree
                                                        ), '-'))"
                                                />
                                            </Neighborhood-pos-sWord-2>
                                        </xsl:when>
                                    </xsl:choose>


                                    <!-- End of code block for pos neighborhood subtrees. -->



                                    <!-- Block of code adding projectivity status to sWords. Only sWord levels 0-4 are processed. -->

                                    <project-rel-pos-sWord-0>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                        <xsl:value-of
                                            select="
                                                normalize-space(string-join((
                                                ./@Projectivity,
                                                ./@relation,
                                                substring(./@postag, 1, 1)
                                                ), '-'))"
                                        > </xsl:value-of>
                                    </project-rel-pos-sWord-0>

                                    <!-- For all remaining sWord level elements, we first test to see if the level in question is the 
                                    sentence root. If so, we insert the root symbol (#)and terminate the output with the data
                                    of the <word> immediately dependent on the @head. Otherwise, the data for the "parent" word is included
                                    as well.  -->
                                    <project-rel-pos-sWord-1>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        ./@Projectivity,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '-'))"
                                                > </xsl:value-of>
                                            </xsl:when>
                                            <xsl:when test="$head_1 > 0">
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_1]/@Projectivity,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@Projectivity,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '-'))"
                                                />
                                            </xsl:when>

                                        </xsl:choose>
                                    </project-rel-pos-sWord-1>
                                    <xsl:choose>
                                        <xsl:when test="$head_2 = 0">
                                            <project-rel-pos-sWord-2><xsl:attribute name="ref"
                                                  ><xsl:value-of select="./@cite"
                                                  /></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_1]/@Projectivity,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@Projectivity,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '-'))"
                                                />
                                            </project-rel-pos-sWord-2>
                                        </xsl:when>
                                        <xsl:when test="$head_2 > 0">
                                            <project-rel-pos-sWord-2>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_2]/@Projectivity,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@Projectivity,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@Projectivity,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '-'))"
                                                />
                                            </project-rel-pos-sWord-2>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="$head_3 = 0">
                                            <project-rel-pos-sWord-3><xsl:attribute name="ref"
                                                  ><xsl:value-of select="./@cite"
                                                  /></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_2]/@Projectivity,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@Projectivity,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@Projectivity,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '-'))"
                                                />
                                            </project-rel-pos-sWord-3>
                                        </xsl:when>
                                        <xsl:when test="$head_3 > 0">
                                            <project-rel-pos-sWord-3>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_3]/@Projectivity,
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_2]/@Projectivity,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@Projectivity,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@Projectivity,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '-'))"
                                                />
                                            </project-rel-pos-sWord-3>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="$head_4 = 0">
                                            <project-rel-pos-sWord-4><xsl:attribute name="ref"
                                                  ><xsl:value-of select="./@cite"
                                                  /></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_3]/@Projectivity,
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_2]/@Projectivity,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@Projectivity,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@Projectivity,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '-'))"
                                                />
                                            </project-rel-pos-sWord-4>
                                        </xsl:when>
                                        <xsl:when test="$head_4 > 0">
                                            <project-rel-pos-sWord-4>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_4]/@Projectivity,
                                                        parent::sentence/word[@id = $head_4]/@relation,
                                                        substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_3]/@Projectivity,
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_2]/@Projectivity,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@Projectivity,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@Projectivity,
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '-'))"
                                                />
                                            </project-rel-pos-sWord-4>
                                        </xsl:when>
                                    </xsl:choose>





                                    <!-- End of code extracting projectivity for each sWord level. -->




                                    <!-- The following block of code extracts the @relation and part of the @postag attributes from each imput 
                                    <word> element and creates child elements of the <word> output. This child elements are <rel-pos-Sword-x> 
                                    elements (where x = the number steps from target word to root).  -->

                                    <rel-pos-sWord-0>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                        <xsl:value-of
                                            select="
                                                normalize-space(string-join((
                                                ./@relation,
                                                substring(./@postag, 1, 1)
                                                ), '-'))"
                                        > </xsl:value-of>
                                    </rel-pos-sWord-0>

                                    <!-- For all remaining sWord level elements, we first test to see if the level in question is the 
                                    sentence root. If so, we insert the root symbol (#)and terminate the output with the data
                                    of the <word> immediately dependent on the @head. Otherwise, the data for the "parent" word is included
                                    as well.  -->
                                    <rel-pos-sWord-1>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '-'))"
                                                > </xsl:value-of>
                                            </xsl:when>
                                            <xsl:when test="$head_1 > 0">
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '-'))"
                                                />
                                            </xsl:when>

                                        </xsl:choose>
                                    </rel-pos-sWord-1>
                                    <xsl:choose>
                                        <xsl:when test="$head_2 = 0">
                                            <rel-pos-sWord-2><xsl:attribute name="ref"><xsl:value-of
                                                  select="./@cite"/></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '-'))"
                                                />
                                            </rel-pos-sWord-2>
                                        </xsl:when>
                                        <xsl:when test="$head_2 > 0">
                                            <rel-pos-sWord-2>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '-'))"
                                                />
                                            </rel-pos-sWord-2>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="$head_3 = 0">
                                            <rel-pos-sWord-3><xsl:attribute name="ref"><xsl:value-of
                                                  select="./@cite"/></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '-'))"
                                                />
                                            </rel-pos-sWord-3>
                                        </xsl:when>
                                        <xsl:when test="$head_3 > 0">
                                            <rel-pos-sWord-3>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '-'))"
                                                />
                                            </rel-pos-sWord-3>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="$head_4 = 0">
                                            <rel-pos-sWord-4><xsl:attribute name="ref"><xsl:value-of
                                                  select="./@cite"/></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '-'))"
                                                />
                                            </rel-pos-sWord-4>
                                        </xsl:when>
                                        <xsl:when test="$head_4 > 0">
                                            <rel-pos-sWord-4>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_4]/@relation,
                                                        substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '-'))"
                                                />
                                            </rel-pos-sWord-4>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="$head_5 = 0">
                                            <rel-pos-sWord-5><xsl:attribute name="ref"><xsl:value-of
                                                  select="./@cite"/></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_4]/@relation,
                                                        substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '-'))"
                                                />
                                            </rel-pos-sWord-5>
                                        </xsl:when>
                                        <xsl:when test="$head_5 > 0">
                                            <rel-pos-sWord-5>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        normalize-space(string-join((
                                                        parent::sentence/word[@id = $head_5]/@relation,
                                                        substring(parent::sentence/word[@id = $head_5]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_4]/@relation,
                                                        substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        ./@relation,
                                                        substring(./@postag, 1, 1)
                                                        ), '-'))"
                                                />
                                            </rel-pos-sWord-5>
                                        </xsl:when>
                                    </xsl:choose>
















                                    <!-- End of rel-pos-sWord block of test -->


                                    <!-- Here we add sWord levels for @relation attributes without pos data.  -->

                                    <!-- BEGGINING OF rel-sWord CODE BLOCK -->

                                    <rel-sWord-0>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <!-- Each <word> element returns its own @relation. These data are output as contents of 
                                        a <rel-sWord-0> element. -->
                                        <xsl:value-of select="./@relation"/>
                                    </rel-sWord-0>

                                    <!-- For all remaining sWord level elements, we first test to see if the level in question is the 
                                    sentence root. If so, we insert the root symbol (#)and terminate the output with the data
                                    of the <word> immediately dependent on the @head. Otherwise, the data for the "parent" word is included
                                    as well.  -->
                                    <rel-sWord-1>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                                  select="./@relation"> </xsl:value-of>
                                            </xsl:when>
                                            <xsl:when test="$head_1 > 0">
                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        ./@relation
                                                        ), '-')"
                                                />
                                            </xsl:when>

                                        </xsl:choose>
                                    </rel-sWord-1>
                                    <xsl:choose>
                                        <xsl:when test="$head_2 = 0">
                                            <rel-sWord-2><xsl:attribute name="ref"><xsl:value-of
                                                  select="./@cite"/></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        ./@relation
                                                        ), '-')"
                                                />
                                            </rel-sWord-2>
                                        </xsl:when>
                                        <xsl:when test="$head_2 > 0">
                                            <rel-sWord-2>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        ./@relation
                                                        ), '-')"
                                                />
                                            </rel-sWord-2>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="$head_3 = 0">
                                            <rel-sWord-3><xsl:attribute name="ref"><xsl:value-of
                                                  select="./@cite"/></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        ./@relation
                                                        ), '-')"
                                                />
                                            </rel-sWord-3>
                                        </xsl:when>
                                        <xsl:when test="$head_3 > 0">
                                            <rel-sWord-3>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        ./@relation
                                                        ), '-')"
                                                />
                                            </rel-sWord-3>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="$head_4 = 0">
                                            <rel-sWord-4><xsl:attribute name="ref"><xsl:value-of
                                                  select="./@cite"/></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        ./@relation
                                                        ), '-')"
                                                />
                                            </rel-sWord-4>
                                        </xsl:when>
                                        <xsl:when test="$head_4 > 0">
                                            <rel-sWord-4>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_4]/@relation,
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        ./@relation
                                                        ), '-')"
                                                />
                                            </rel-sWord-4>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="$head_5 = 0">
                                            <rel-sWord-5><xsl:attribute name="ref"><xsl:value-of
                                                  select="./@cite"/></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_4]/@relation,
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        ./@relation
                                                        ), '-')"
                                                />
                                            </rel-sWord-5>
                                        </xsl:when>
                                        <xsl:when test="$head_5 > 0">
                                            <rel-sWord-5>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_5]/@relation,
                                                        parent::sentence/word[@id = $head_4]/@relation,
                                                        parent::sentence/word[@id = $head_3]/@relation,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        ./@relation
                                                        ), '-')"
                                                />
                                            </rel-sWord-5>
                                        </xsl:when>
                                    </xsl:choose>
















                                    <!-- END OF rel-sWord COD BLOCK -->

                                    <!-- The following block of text extracts the part of speech tag from the <word> elements. -->


                                    <pos-sWord-0>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                substring(./@postag, 1, 1)
                                                ), '-')"
                                        > </xsl:value-of>
                                    </pos-sWord-0>

                                    <!-- For all remaining sWord level elements, we first test to see if the level in question is the 
                                    sentence root. If so, we insert the root symbol (#)and terminate the output with the data
                                    of the <word> immediately dependent on the @head. Otherwise, the data for the "parent" word is included
                                    as well.  -->
                                    <pos-sWord-1>
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="./@cite"/>
                                        </xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                                  select="
                                                        string-join((
                                                        substring(./@postag, 1, 1)
                                                        ), '-')"
                                                > </xsl:value-of>
                                            </xsl:when>
                                            <xsl:when test="$head_1 > 0">
                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        substring(./@postag, 1, 1)
                                                        ), '-')"
                                                />
                                            </xsl:when>

                                        </xsl:choose>
                                    </pos-sWord-1>

                                    <xsl:choose>
                                        <xsl:when test="$head_2 = 0">
                                            <pos-sWord-2><xsl:attribute name="ref"><xsl:value-of
                                                  select="./@cite"/></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        string-join((
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        substring(./@postag, 1, 1)
                                                        ), '-')"
                                                />
                                            </pos-sWord-2>
                                        </xsl:when>
                                        <xsl:when test="$head_2 > 0">
                                            <pos-sWord-2>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        substring(./@postag, 1, 1)
                                                        ), '-')"
                                                />
                                            </pos-sWord-2>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="$head_3 = 0">
                                            <pos-sWord-3><xsl:attribute name="ref"><xsl:value-of
                                                  select="./@cite"/></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        string-join((
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        substring(./@postag, 1, 1)
                                                        ), '-')"
                                                />
                                            </pos-sWord-3>
                                        </xsl:when>
                                        <xsl:when test="$head_3 > 0">
                                            <pos-sWord-3>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        substring(./@postag, 1, 1)
                                                        ), '-')"
                                                />
                                            </pos-sWord-3>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="$head_4 = 0">
                                            <pos-sWord-4><xsl:attribute name="ref"><xsl:value-of
                                                  select="./@cite"/></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        string-join((
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        substring(./@postag, 1, 1)
                                                        ), '-')"
                                                />
                                            </pos-sWord-4>
                                        </xsl:when>
                                        <xsl:when test="$head_4 > 0">
                                            <pos-sWord-4>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        substring(./@postag, 1, 1)
                                                        ), '-')"
                                                />
                                            </pos-sWord-4>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="$head_5 = 0">
                                            <pos-sWord-5><xsl:attribute name="ref"><xsl:value-of
                                                  select="./@cite"/></xsl:attribute>#-<xsl:value-of
                                                  select="
                                                        string-join((
                                                        substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        substring(./@postag, 1, 1)
                                                        ), '-')"
                                                />
                                            </pos-sWord-5>
                                        </xsl:when>
                                        <xsl:when test="$head_5 > 0">
                                            <pos-sWord-5>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        substring(parent::sentence/word[@id = $head_5]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_4]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_3]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_2]/@postag, 1, 1),
                                                        substring(parent::sentence/word[@id = $head_1]/@postag, 1, 1),
                                                        substring(./@postag, 1, 1)
                                                        ), '-')"
                                                />
                                            </pos-sWord-5>
                                        </xsl:when>
                                    </xsl:choose>



                                </word>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </sentence>
            </xsl:for-each>
        </sWord_document>
    </xsl:template>


</xsl:stylesheet>
