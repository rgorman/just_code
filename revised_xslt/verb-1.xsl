<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="subTree_document">

        <xsl:for-each select="//word">

            <xsl:variable name="head_1" select="./@head"/>
            <xsl:variable name="head_2" select="parent::sentence/word[@id = $head_1]/@head"/>
            <xsl:variable name="head_3" select="parent::sentence/word[@id = $head_2]/@head"/>
            <xsl:variable name="head_4" select="parent::sentence/word[@id = $head_3]/@head"/>
            <xsl:variable name="head_5" select="parent::sentence/word[@id = $head_4]/@head"/>


            <xsl:variable name="pos" select="./pos"/>
            <xsl:variable name="person" select="./person"/>
            <xsl:variable name="number" select="./number"/>
            <xsl:variable name="tense" select="./tense"/>
            <xsl:variable name="mood" select="./mood"/>
            <xsl:variable name="voice" select="./voice"/>
            <xsl:variable name="gender" select="./gender"/>
            <xsl:variable name="case" select="./case"/>
            <xsl:variable name="degree" select="./degree"/>




            <word>
                <xsl:copy-of select="@*"/>
                <xsl:copy-of select="node()"/>

                <xsl:choose>
                    <xsl:when test="$pos = 'verb'">
                        <xsl:if test="$person">

                            <DD-rel-morph-self-person-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $person
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-person-sWord-0>

                            <DD-rel-morph-self-person-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $person
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-person-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-person-sWord-2><xsl:attribute name="ref"
                                                ><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-person-sWord-2>
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
                                                
                                                ./@relation,
                                                $person
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-person-sWord-3><xsl:attribute name="ref"
                                                ><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-person-sWord-3>
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
                                                ./@relation,
                                                $person
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-person-sWord-4><xsl:attribute name="ref"
                                                ><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-person-sWord-4>
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
                                                ./@relation,
                                                $person
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-sWord-4>
                                </xsl:when>
                            </xsl:choose>


                        </xsl:if>


                        <!-- XXX number -->

                        <xsl:if test="./number">

                            <DD-rel-morph-self-number-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $number
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-number-sWord-0>

                            <DD-rel-morph-self-number-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $number
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number
                                                ), '|')"
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
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number
                                                ), '|')"
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
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@relation,
                                                $number
                                                ), '|')"
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
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number
                                                ), '|')"
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
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number
                                                ), '|')"
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
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number
                                                ), '|')"
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
                                                ./@relation,
                                                $number
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-sWord-4>
                                </xsl:when>
                            </xsl:choose>


                        </xsl:if>


                        <!-- XXXX tense -->

                        <DD-rel-morph-self-tense-sWord-0>
                            <xsl:attribute name="ref">
                                <xsl:value-of select="./@cite"/>
                            </xsl:attribute>

                            <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                            <xsl:value-of
                                select="
                                    string-join((
                                    ./@DepDist,
                                    ./@relation,
                                    $tense
                                    ), '|')"
                            > </xsl:value-of>
                        </DD-rel-morph-self-tense-sWord-0>

                        <DD-rel-morph-self-tense-sWord-1>
                            <xsl:attribute name="ref">
                                <xsl:value-of select="./@cite"/>
                            </xsl:attribute>
                            <xsl:choose>
                                <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                        select="
                                            string-join((
                                            ./@DepDist,
                                            ./@relation,
                                            $tense
                                            ), '|')"
                                    > </xsl:value-of>
                                </xsl:when>
                                <xsl:when test="$head_1 > 0">
                                    <xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $tense
                                            ), '|')"
                                    />
                                </xsl:when>

                            </xsl:choose>
                        </DD-rel-morph-self-tense-sWord-1>

                        <xsl:choose>
                            <xsl:when test="$head_2 = 0">
                                <DD-rel-morph-self-tense-sWord-2><xsl:attribute name="ref"
                                            ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $tense
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-tense-sWord-2>
                            </xsl:when>
                            <xsl:when test="$head_2 > 0">
                                <DD-rel-morph-self-tense-sWord-2>
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
                                            
                                            ./@relation,
                                            $tense
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-tense-sWord-2>

                            </xsl:when>
                        </xsl:choose>


                        <xsl:choose>
                            <xsl:when test="$head_3 = 0">
                                <DD-rel-morph-self-tense-sWord-3><xsl:attribute name="ref"
                                            ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $tense
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-tense-sWord-3>
                            </xsl:when>
                            <xsl:when test="$head_3 > 0">
                                <DD-rel-morph-self-tense-sWord-3>
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
                                            ./@relation,
                                            $tense
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-tense-sWord-3>
                            </xsl:when>
                        </xsl:choose>

                        <xsl:choose>
                            <xsl:when test="$head_4 = 0">
                                <DD-rel-morph-self-tense-sWord-4><xsl:attribute name="ref"
                                            ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $tense
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-tense-sWord-4>
                            </xsl:when>
                            <xsl:when test="$head_4 > 0">
                                <DD-rel-morph-self-tense-sWord-4>
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
                                            ./@relation,
                                            $tense
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-tense-sWord-4>
                            </xsl:when>
                        </xsl:choose>

                        <!-- XXXX tense -->

                        <DD-rel-morph-self-mood-sWord-0>
                            <xsl:attribute name="ref">
                                <xsl:value-of select="./@cite"/>
                            </xsl:attribute>

                            <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                            <xsl:value-of
                                select="
                                    string-join((
                                    ./@DepDist,
                                    ./@relation,
                                    $mood
                                    ), '|')"
                            > </xsl:value-of>
                        </DD-rel-morph-self-mood-sWord-0>

                        <DD-rel-morph-self-mood-sWord-1>
                            <xsl:attribute name="ref">
                                <xsl:value-of select="./@cite"/>
                            </xsl:attribute>
                            <xsl:choose>
                                <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                        select="
                                            string-join((
                                            ./@DepDist,
                                            ./@relation,
                                            $mood
                                            ), '|')"
                                    > </xsl:value-of>
                                </xsl:when>
                                <xsl:when test="$head_1 > 0">
                                    <xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $mood
                                            ), '|')"
                                    />
                                </xsl:when>

                            </xsl:choose>
                        </DD-rel-morph-self-mood-sWord-1>

                        <xsl:choose>
                            <xsl:when test="$head_2 = 0">
                                <DD-rel-morph-self-mood-sWord-2><xsl:attribute name="ref"
                                            ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $mood
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-mood-sWord-2>
                            </xsl:when>
                            <xsl:when test="$head_2 > 0">
                                <DD-rel-morph-self-mood-sWord-2>
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
                                            
                                            ./@relation,
                                            $mood
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-mood-sWord-2>

                            </xsl:when>
                        </xsl:choose>


                        <xsl:choose>
                            <xsl:when test="$head_3 = 0">
                                <DD-rel-morph-self-mood-sWord-3><xsl:attribute name="ref"
                                            ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $mood
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-mood-sWord-3>
                            </xsl:when>
                            <xsl:when test="$head_3 > 0">
                                <DD-rel-morph-self-mood-sWord-3>
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
                                            ./@relation,
                                            $mood
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-mood-sWord-3>
                            </xsl:when>
                        </xsl:choose>

                        <xsl:choose>
                            <xsl:when test="$head_4 = 0">
                                <DD-rel-morph-self-mood-sWord-4><xsl:attribute name="ref"
                                            ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $mood
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-mood-sWord-4>
                            </xsl:when>
                            <xsl:when test="$head_4 > 0">
                                <DD-rel-morph-self-mood-sWord-4>
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
                                            ./@relation,
                                            $mood
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-mood-sWord-4>
                            </xsl:when>
                        </xsl:choose>

                        <!-- XXXX voice -->

                        <DD-rel-morph-self-voice-sWord-0>
                            <xsl:attribute name="ref">
                                <xsl:value-of select="./@cite"/>
                            </xsl:attribute>

                            <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                            <xsl:value-of
                                select="
                                    string-join((
                                    ./@DepDist,
                                    ./@relation,
                                    $voice
                                    ), '|')"
                            > </xsl:value-of>
                        </DD-rel-morph-self-voice-sWord-0>

                        <DD-rel-morph-self-voice-sWord-1>
                            <xsl:attribute name="ref">
                                <xsl:value-of select="./@cite"/>
                            </xsl:attribute>
                            <xsl:choose>
                                <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                        select="
                                            string-join((
                                            ./@DepDist,
                                            ./@relation,
                                            $voice
                                            ), '|')"
                                    > </xsl:value-of>
                                </xsl:when>
                                <xsl:when test="$head_1 > 0">
                                    <xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $voice
                                            ), '|')"
                                    />
                                </xsl:when>

                            </xsl:choose>
                        </DD-rel-morph-self-voice-sWord-1>

                        <xsl:choose>
                            <xsl:when test="$head_2 = 0">
                                <DD-rel-morph-self-voice-sWord-2><xsl:attribute name="ref"
                                            ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $voice
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-voice-sWord-2>
                            </xsl:when>
                            <xsl:when test="$head_2 > 0">
                                <DD-rel-morph-self-voice-sWord-2>
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
                                            
                                            ./@relation,
                                            $voice
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-voice-sWord-2>

                            </xsl:when>
                        </xsl:choose>


                        <xsl:choose>
                            <xsl:when test="$head_3 = 0">
                                <DD-rel-morph-self-voice-sWord-3><xsl:attribute name="ref"
                                            ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $voice
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-voice-sWord-3>
                            </xsl:when>
                            <xsl:when test="$head_3 > 0">
                                <DD-rel-morph-self-voice-sWord-3>
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
                                            ./@relation,
                                            $voice
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-voice-sWord-3>
                            </xsl:when>
                        </xsl:choose>

                        <xsl:choose>
                            <xsl:when test="$head_4 = 0">
                                <DD-rel-morph-self-voice-sWord-4><xsl:attribute name="ref"
                                            ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $voice
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-voice-sWord-4>
                            </xsl:when>
                            <xsl:when test="$head_4 > 0">
                                <DD-rel-morph-self-voice-sWord-4>
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
                                            ./@relation,
                                            $voice
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-voice-sWord-4>
                            </xsl:when>
                        </xsl:choose>

                        <!-- XXXX pos-number -->

                        <xsl:if test="./number">
                            <DD-rel-morph-self-pos-number-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $pos,
                                        $number
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-pos-number-sWord-0>

                            <DD-rel-morph-self-pos-number-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $pos,
                                                $number
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $pos,
                                                $number
                                                ), '|')"
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
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $pos,
                                                $number
                                                ), '|')"
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
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@relation,
                                                $pos,
                                                $number
                                                ), '|')"
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
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $pos,
                                                $number
                                                ), '|')"
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
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $pos,
                                                $number
                                                ), '|')"
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
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $pos,
                                                $number
                                                ), '|')"
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
                                                ./@relation,
                                                $pos,
                                                $number
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-pos-number-sWord-4>
                                </xsl:when>
                            </xsl:choose>


                            <!-- XXXX -->

                        </xsl:if>

                        <!-- XXXX person-number -->

                        <xsl:if test="./person">

                            <DD-rel-morph-self-person-number-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $person,
                                        $number
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-person-number-sWord-0>

                            <DD-rel-morph-self-person-number-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-person-number-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-person-number-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-person-number-sWord-2>
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
                                                
                                                ./@relation,
                                                $person,
                                                $number
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-person-number-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-person-number-sWord-3>
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
                                                ./@relation,
                                                $person,
                                                $number
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-person-number-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-person-number-sWord-4>
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
                                                ./@relation,
                                                $person,
                                                $number
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-sWord-4>
                                </xsl:when>
                            </xsl:choose>


                            <!-- XXXX person-tense -->
                            <DD-rel-morph-self-person-tense-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $person,
                                        $tense
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-person-tense-sWord-0>

                            <DD-rel-morph-self-person-tense-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $tense
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $tense
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-person-tense-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-person-tense-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $tense
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-tense-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-person-tense-sWord-2>
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
                                                
                                                ./@relation,
                                                $person,
                                                $tense
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-tense-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-person-tense-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $tense
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-tense-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-person-tense-sWord-3>
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
                                                ./@relation,
                                                $person,
                                                $tense
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-tense-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-person-tense-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $tense
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-tense-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-person-tense-sWord-4>
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
                                                ./@relation,
                                                $person,
                                                $tense
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-tense-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                            <!-- person-mood  -->

                            <DD-rel-morph-self-person-mood-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $person,
                                        $mood
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-person-mood-sWord-0>

                            <DD-rel-morph-self-person-mood-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $mood
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $mood
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-person-mood-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-person-mood-sWord-2><xsl:attribute name="ref"
                                                ><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-mood-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-person-mood-sWord-2>
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
                                                
                                                ./@relation,
                                                $person,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-mood-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-person-mood-sWord-3><xsl:attribute name="ref"
                                                ><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-mood-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-person-mood-sWord-3>
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
                                                ./@relation,
                                                $person,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-mood-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-person-mood-sWord-4><xsl:attribute name="ref"
                                                ><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-mood-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-person-mood-sWord-4>
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
                                                ./@relation,
                                                $person,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-mood-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                            <!-- XXXX -->

                            <!-- XXXX person-voice -->

                            <DD-rel-morph-self-person-voice-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $person,
                                        $voice
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-person-voice-sWord-0>

                            <DD-rel-morph-self-person-voice-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $voice
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $voice
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-person-voice-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-person-voice-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-voice-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-person-voice-sWord-2>
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
                                                
                                                ./@relation,
                                                $person,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-voice-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-person-voice-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-voice-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-person-voice-sWord-3>
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
                                                ./@relation,
                                                $person,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-voice-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-person-voice-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-voice-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-person-voice-sWord-4>
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
                                                ./@relation,
                                                $person,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-voice-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                            <!-- XXXX -->

                            <!-- XXXX person-voice -->

                            <!-- XXXX -->

                            <!-- XXXX -->

                        </xsl:if>


                        <!-- XXXX number-tense -->

                        <xsl:if test="./number">




                            <!-- XXXX number-tense -->
                            <DD-rel-morph-self-number-tense-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $number,
                                        $tense
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-number-tense-sWord-0>

                            <DD-rel-morph-self-number-tense-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-number-tense-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-number-tense-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-number-tense-sWord-2>
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
                                                
                                                ./@relation,
                                                $number,
                                                $tense
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-number-tense-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-number-tense-sWord-3>
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
                                                ./@relation,
                                                $number,
                                                $tense
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-number-tense-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-number-tense-sWord-4>
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
                                                ./@relation,
                                                $number,
                                                $tense
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                            <!-- number-mood  -->

                            <DD-rel-morph-self-number-mood-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $number,
                                        $mood
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-number-mood-sWord-0>

                            <DD-rel-morph-self-number-mood-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $mood
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $mood
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-number-mood-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-number-mood-sWord-2><xsl:attribute name="ref"
                                                ><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-mood-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-number-mood-sWord-2>
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
                                                
                                                ./@relation,
                                                $number,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-mood-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-number-mood-sWord-3><xsl:attribute name="ref"
                                                ><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-mood-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-number-mood-sWord-3>
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
                                                ./@relation,
                                                $number,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-mood-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-number-mood-sWord-4><xsl:attribute name="ref"
                                                ><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-mood-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-number-mood-sWord-4>
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
                                                ./@relation,
                                                $number,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-mood-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                            <!-- XXXX -->

                            <!-- XXXX number-voice -->

                            <DD-rel-morph-self-number-voice-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $number,
                                        $voice
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-number-voice-sWord-0>

                            <DD-rel-morph-self-number-voice-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $voice
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $voice
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-number-voice-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-number-voice-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-voice-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-number-voice-sWord-2>
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
                                                
                                                ./@relation,
                                                $number,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-voice-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-number-voice-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-voice-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-number-voice-sWord-3>
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
                                                ./@relation,
                                                $number,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-voice-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-number-voice-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-voice-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-number-voice-sWord-4>
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
                                                ./@relation,
                                                $number,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-voice-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                            <!-- XXXX -->

                            <!-- XXXX person-voice -->

                            <!-- XXXX -->

                            <!-- XXXX -->

                        </xsl:if>

                        <!-- XXXX -->


                        <!-- XXXX -->


                        <DD-rel-morph-self-tense-mood-sWord-0>
                            <xsl:attribute name="ref">
                                <xsl:value-of select="./@cite"/>
                            </xsl:attribute>

                            <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                            <xsl:value-of
                                select="
                                    string-join((
                                    ./@DepDist,
                                    ./@relation,
                                    $tense,
                                    $mood
                                    ), '|')"
                            > </xsl:value-of>
                        </DD-rel-morph-self-tense-mood-sWord-0>

                        <DD-rel-morph-self-tense-mood-sWord-1>
                            <xsl:attribute name="ref">
                                <xsl:value-of select="./@cite"/>
                            </xsl:attribute>
                            <xsl:choose>
                                <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                        select="
                                            string-join((
                                            ./@DepDist,
                                            ./@relation,
                                            $tense,
                                            $mood
                                            ), '|')"
                                    > </xsl:value-of>
                                </xsl:when>
                                <xsl:when test="$head_1 > 0">
                                    <xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $tense,
                                            $mood
                                            ), '|')"
                                    />
                                </xsl:when>

                            </xsl:choose>
                        </DD-rel-morph-self-tense-mood-sWord-1>

                        <xsl:choose>
                            <xsl:when test="$head_2 = 0">
                                <DD-rel-morph-self-tense-mood-sWord-2><xsl:attribute name="ref"
                                            ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $tense,
                                            $mood
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-tense-mood-sWord-2>
                            </xsl:when>
                            <xsl:when test="$head_2 > 0">
                                <DD-rel-morph-self-tense-mood-sWord-2>
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
                                            
                                            ./@relation,
                                            $tense,
                                            $mood
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-tense-mood-sWord-2>

                            </xsl:when>
                        </xsl:choose>


                        <xsl:choose>
                            <xsl:when test="$head_3 = 0">
                                <DD-rel-morph-self-tense-mood-sWord-3><xsl:attribute name="ref"
                                            ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $tense,
                                            $mood
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-tense-mood-sWord-3>
                            </xsl:when>
                            <xsl:when test="$head_3 > 0">
                                <DD-rel-morph-self-tense-mood-sWord-3>
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
                                            ./@relation,
                                            $tense,
                                            $mood
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-tense-mood-sWord-3>
                            </xsl:when>
                        </xsl:choose>

                        <xsl:choose>
                            <xsl:when test="$head_4 = 0">
                                <DD-rel-morph-self-tense-mood-sWord-4><xsl:attribute name="ref"
                                            ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $tense,
                                            $mood
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-tense-mood-sWord-4>
                            </xsl:when>
                            <xsl:when test="$head_4 > 0">
                                <DD-rel-morph-self-tense-mood-sWord-4>
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
                                            ./@relation,
                                            $tense,
                                            $mood
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-tense-mood-sWord-4>
                            </xsl:when>
                        </xsl:choose>

                        <!-- XXXX -->

                        <!-- XXXX tense-voice -->

                        <DD-rel-morph-self-tense-voice-sWord-0>
                            <xsl:attribute name="ref">
                                <xsl:value-of select="./@cite"/>
                            </xsl:attribute>

                            <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                            <xsl:value-of
                                select="
                                    string-join((
                                    ./@DepDist,
                                    ./@relation,
                                    $tense,
                                    $voice
                                    ), '|')"
                            > </xsl:value-of>
                        </DD-rel-morph-self-tense-voice-sWord-0>

                        <DD-rel-morph-self-tense-voice-sWord-1>
                            <xsl:attribute name="ref">
                                <xsl:value-of select="./@cite"/>
                            </xsl:attribute>
                            <xsl:choose>
                                <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                        select="
                                            string-join((
                                            ./@DepDist,
                                            ./@relation,
                                            $tense,
                                            $voice
                                            ), '|')"
                                    > </xsl:value-of>
                                </xsl:when>
                                <xsl:when test="$head_1 > 0">
                                    <xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $tense,
                                            $voice
                                            ), '|')"
                                    />
                                </xsl:when>

                            </xsl:choose>
                        </DD-rel-morph-self-tense-voice-sWord-1>

                        <xsl:choose>
                            <xsl:when test="$head_2 = 0">
                                <DD-rel-morph-self-tense-voice-sWord-2><xsl:attribute name="ref"
                                            ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $tense,
                                            $voice
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-tense-voice-sWord-2>
                            </xsl:when>
                            <xsl:when test="$head_2 > 0">
                                <DD-rel-morph-self-tense-voice-sWord-2>
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
                                            
                                            ./@relation,
                                            $tense,
                                            $voice
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-tense-voice-sWord-2>

                            </xsl:when>
                        </xsl:choose>


                        <xsl:choose>
                            <xsl:when test="$head_3 = 0">
                                <DD-rel-morph-self-tense-voice-sWord-3><xsl:attribute name="ref"
                                            ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $tense,
                                            $voice
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-tense-voice-sWord-3>
                            </xsl:when>
                            <xsl:when test="$head_3 > 0">
                                <DD-rel-morph-self-tense-voice-sWord-3>
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
                                            ./@relation,
                                            $tense,
                                            $voice
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-tense-voice-sWord-3>
                            </xsl:when>
                        </xsl:choose>

                        <xsl:choose>
                            <xsl:when test="$head_4 = 0">
                                <DD-rel-morph-self-tense-voice-sWord-4><xsl:attribute name="ref"
                                            ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $tense,
                                            $voice
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-tense-voice-sWord-4>
                            </xsl:when>
                            <xsl:when test="$head_4 > 0">
                                <DD-rel-morph-self-tense-voice-sWord-4>
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
                                            ./@relation,
                                            $tense,
                                            $voice
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-tense-voice-sWord-4>
                            </xsl:when>
                        </xsl:choose>

                        <!-- XXXX mood-voice -->



                        <!-- XXXX -->

                        <!-- XXXX tense-voice -->

                        <DD-rel-morph-self-mood-voice-sWord-0>
                            <xsl:attribute name="ref">
                                <xsl:value-of select="./@cite"/>
                            </xsl:attribute>

                            <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                            <xsl:value-of
                                select="
                                    string-join((
                                    ./@DepDist,
                                    ./@relation,
                                    $mood,
                                    $voice
                                    ), '|')"
                            > </xsl:value-of>
                        </DD-rel-morph-self-mood-voice-sWord-0>

                        <DD-rel-morph-self-mood-voice-sWord-1>
                            <xsl:attribute name="ref">
                                <xsl:value-of select="./@cite"/>
                            </xsl:attribute>
                            <xsl:choose>
                                <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                        select="
                                            string-join((
                                            ./@DepDist,
                                            ./@relation,
                                            $mood,
                                            $voice
                                            ), '|')"
                                    > </xsl:value-of>
                                </xsl:when>
                                <xsl:when test="$head_1 > 0">
                                    <xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $mood,
                                            $voice
                                            ), '|')"
                                    />
                                </xsl:when>

                            </xsl:choose>
                        </DD-rel-morph-self-mood-voice-sWord-1>

                        <xsl:choose>
                            <xsl:when test="$head_2 = 0">
                                <DD-rel-morph-self-mood-voice-sWord-2><xsl:attribute name="ref"
                                            ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $mood,
                                            $voice
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-mood-voice-sWord-2>
                            </xsl:when>
                            <xsl:when test="$head_2 > 0">
                                <DD-rel-morph-self-mood-voice-sWord-2>
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
                                            
                                            ./@relation,
                                            $mood,
                                            $voice
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-mood-voice-sWord-2>

                            </xsl:when>
                        </xsl:choose>


                        <xsl:choose>
                            <xsl:when test="$head_3 = 0">
                                <DD-rel-morph-self-mood-voice-sWord-3><xsl:attribute name="ref"
                                            ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $mood,
                                            $voice
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-mood-voice-sWord-3>
                            </xsl:when>
                            <xsl:when test="$head_3 > 0">
                                <DD-rel-morph-self-mood-voice-sWord-3>
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
                                            ./@relation,
                                            $mood,
                                            $voice
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-mood-voice-sWord-3>
                            </xsl:when>
                        </xsl:choose>

                        <xsl:choose>
                            <xsl:when test="$head_4 = 0">
                                <DD-rel-morph-self-mood-voice-sWord-4><xsl:attribute name="ref"
                                            ><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $mood,
                                            $voice
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-mood-voice-sWord-4>
                            </xsl:when>
                            <xsl:when test="$head_4 > 0">
                                <DD-rel-morph-self-mood-voice-sWord-4>
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
                                            ./@relation,
                                            $tense,
                                            $mood
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-mood-voice-sWord-4>
                            </xsl:when>
                        </xsl:choose>

                        <!-- XXXX  -->

                        <xsl:if test="./person">

                            <DD-rel-morph-self-person-number-tense-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $person,
                                        $number,
                                        $tense
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-person-number-tense-sWord-0>

                            <DD-rel-morph-self-person-number-tense-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-person-number-tense-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-person-number-tense-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-tense-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-person-number-tense-sWord-2>
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
                                                
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-tense-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-person-number-tense-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-tense-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-person-number-tense-sWord-3>
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
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-tense-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-person-number-tense-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-tense-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-person-number-tense-sWord-4>
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
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-tense-sWord-4>
                                </xsl:when>
                            </xsl:choose>


                            <!-- XXXX person-tense -->
                            <DD-rel-morph-self-person-number-mood-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $person,
                                        $number,
                                        $mood
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-person-number-mood-sWord-0>

                            <DD-rel-morph-self-person-number-mood-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $mood
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $mood
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-person-number-mood-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-person-number-mood-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-mood-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-person-number-mood-sWord-2>
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
                                                
                                                ./@relation,
                                                $person,
                                                $number,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-mood-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-person-number-mood-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-mood-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-person-number-mood-sWord-3>
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
                                                ./@relation,
                                                $person,
                                                $number,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-mood-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-person-number-mood-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-mood-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-person-number-mood-sWord-4>
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
                                                ./@relation,
                                                $person,
                                                $number,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-mood-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                            <!-- person-mood  -->

                            <DD-rel-morph-self-person-number-voice-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $person,
                                        $number,
                                        $voice
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-person-number-voice-sWord-0>

                            <DD-rel-morph-self-person-number-voice-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $voice
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $voice
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-person-number-voice-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-person-number-voice-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-voice-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-person-number-voice-sWord-2>
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
                                                
                                                ./@relation,
                                                $person,
                                                $number,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-voice-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-person-number-voice-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-voice-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-person-number-voice-sWord-3>
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
                                                ./@relation,
                                                $person,
                                                $number,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-voice-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-person-number-voice-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-voice-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-person-number-voice-sWord-4>
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
                                                ./@relation,
                                                $person,
                                                $number,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-voice-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                            <!-- XXXX -->

                            <!-- XXXX person-tense-mood -->

                            <DD-rel-morph-self-person-tense-mood-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $person,
                                        $tense,
                                        $mood
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-person-tense-mood-sWord-0>

                            <DD-rel-morph-self-person-tense-mood-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $tense,
                                                $mood
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $tense,
                                                $mood
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-person-tense-mood-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-person-tense-mood-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $tense,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-tense-mood-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-person-tense-mood-sWord-2>
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
                                                
                                                ./@relation,
                                                $person,
                                                $tense,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-tense-mood-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-person-tense-mood-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $tense,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-tense-mood-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-person-tense-mood-sWord-3>
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
                                                ./@relation,
                                                $person,
                                                $tense,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-tense-mood-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-person-tense-mood-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $tense,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-tense-mood-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-person-tense-mood-sWord-4>
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
                                                ./@relation,
                                                $person,
                                                $tense,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-tense-mood-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                            <!-- XXXX -->

                            <!-- XXXX person-tense-voice -->

                            <DD-rel-morph-self-person-tense-voice-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $person,
                                        $tense,
                                        $voice
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-person-tense-voice-sWord-0>

                            <DD-rel-morph-self-person-tense-voice-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $tense,
                                                $voice
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $tense,
                                                $voice
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-person-tense-voice-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-person-tense-voice-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $tense,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-tense-voice-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-person-tense-voice-sWord-2>
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
                                                
                                                ./@relation,
                                                $person,
                                                $tense,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-tense-voice-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-person-tense-voice-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $tense,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-tense-voice-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-person-tense-voice-sWord-3>
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
                                                ./@relation,
                                                $person,
                                                $tense,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-tense-voice-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-person-tense-voice-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $tense,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-tense-voice-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-person-tense-voice-sWord-4>
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
                                                ./@relation,
                                                $person,
                                                $tense,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-tense-voice-sWord-4>
                                </xsl:when>
                            </xsl:choose>



                            <!-- XXXX person-mood-voice -->

                            <DD-rel-morph-self-person-mood-voice-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $person,
                                        $mood,
                                        $voice
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-person-mood-voice-sWord-0>

                            <DD-rel-morph-self-person-mood-voice-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-person-mood-voice-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-person-mood-voice-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-mood-voice-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-person-mood-voice-sWord-2>
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
                                                
                                                ./@relation,
                                                $person,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-mood-voice-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-person-mood-voice-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-mood-voice-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-person-mood-voice-sWord-3>
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
                                                ./@relation,
                                                $person,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-mood-voice-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-person-mood-voice-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-mood-voice-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-person-mood-voice-sWord-4>
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
                                                ./@relation,
                                                $person,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-mood-voice-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                            <!-- XXXX -->

                            <!-- XXXX -->

                        </xsl:if>

                        <xsl:if test="./number">

                            <!-- XXXX number-tense-mood -->

                            <DD-rel-morph-self-number-tense-mood-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $number,
                                        $tense,
                                        $mood
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-number-tense-mood-sWord-0>

                            <DD-rel-morph-self-number-tense-mood-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $mood
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $mood
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-number-tense-mood-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-number-tense-mood-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-mood-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-number-tense-mood-sWord-2>
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
                                                
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-mood-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-number-tense-mood-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-mood-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-number-tense-mood-sWord-3>
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
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-mood-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-number-tense-mood-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-mood-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-number-tense-mood-sWord-4>
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
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-mood-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                            <!-- XXXX -->

                            <!-- XXXX number-tense-voice -->

                            <DD-rel-morph-self-number-tense-voice-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $number,
                                        $tense,
                                        $voice
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-number-tense-voice-sWord-0>

                            <DD-rel-morph-self-number-tense-voice-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $voice
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $voice
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-number-tense-voice-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-number-tense-voice-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-voice-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-number-tense-voice-sWord-2>
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
                                                
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-voice-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-number-tense-voice-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-voice-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-number-tense-voice-sWord-3>
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
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-voice-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-number-tense-voice-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-voice-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-number-tense-voice-sWord-4>
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
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-voice-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                            <!-- XXXX -->

                            <!-- XXXX number-mood-voice -->

                            <DD-rel-morph-self-number-mood-voice-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $number,
                                        $mood,
                                        $voice
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-number-mood-voice-sWord-0>

                            <DD-rel-morph-self-number-mood-voice-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-number-mood-voice-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-number-mood-voice-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-mood-voice-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-number-mood-voice-sWord-2>
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
                                                
                                                ./@relation,
                                                $number,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-mood-voice-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-number-mood-voice-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-mood-voice-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-number-mood-voice-sWord-3>
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
                                                ./@relation,
                                                $number,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-mood-voice-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-number-mood-voice-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-mood-voice-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-number-mood-voice-sWord-4>
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
                                                ./@relation,
                                                $number,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-mood-voice-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                            <!-- XXXX -->




                        </xsl:if>

                        <xsl:if test="./person"> </xsl:if>

                        <!-- XXXX tense-mood-voice -->

                        <DD-rel-morph-self-tense-mood-voice-sWord-0>
                            <xsl:attribute name="ref">
                                <xsl:value-of select="./@cite"/>
                            </xsl:attribute>

                            <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                            <xsl:value-of
                                select="
                                    string-join((
                                    ./@DepDist,
                                    ./@relation,
                                    $tense,
                                    $mood,
                                    $voice
                                    ), '|')"
                            > </xsl:value-of>
                        </DD-rel-morph-self-tense-mood-voice-sWord-0>

                        <DD-rel-morph-self-tense-mood-voice-sWord-1>
                            <xsl:attribute name="ref">
                                <xsl:value-of select="./@cite"/>
                            </xsl:attribute>
                            <xsl:choose>
                                <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                        select="
                                            string-join((
                                            ./@DepDist,
                                            ./@relation,
                                            $tense,
                                            $mood,
                                            $voice
                                            ), '|')"
                                    > </xsl:value-of>
                                </xsl:when>
                                <xsl:when test="$head_1 > 0">
                                    <xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $tense,
                                            $mood,
                                            $voice
                                            ), '|')"
                                    />
                                </xsl:when>

                            </xsl:choose>
                        </DD-rel-morph-self-tense-mood-voice-sWord-1>

                        <xsl:choose>
                            <xsl:when test="$head_2 = 0">
                                <DD-rel-morph-self-tense-mood-voice-sWord-2><xsl:attribute
                                        name="ref"><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $tense,
                                            $mood,
                                            $voice
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-tense-mood-voice-sWord-2>
                            </xsl:when>
                            <xsl:when test="$head_2 > 0">
                                <DD-rel-morph-self-tense-mood-voice-sWord-2>
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
                                            
                                            ./@relation,
                                            $tense,
                                            $mood,
                                            $voice
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-tense-mood-voice-sWord-2>

                            </xsl:when>
                        </xsl:choose>


                        <xsl:choose>
                            <xsl:when test="$head_3 = 0">
                                <DD-rel-morph-self-tense-mood-voice-sWord-3><xsl:attribute
                                        name="ref"><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $tense,
                                            $mood,
                                            $voice
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-tense-mood-voice-sWord-3>
                            </xsl:when>
                            <xsl:when test="$head_3 > 0">
                                <DD-rel-morph-self-tense-mood-voice-sWord-3>
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
                                            ./@relation,
                                            $tense,
                                            $mood,
                                            $voice
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-tense-mood-voice-sWord-3>
                            </xsl:when>
                        </xsl:choose>

                        <xsl:choose>
                            <xsl:when test="$head_4 = 0">
                                <DD-rel-morph-self-tense-mood-voice-sWord-4><xsl:attribute
                                        name="ref"><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                        select="
                                            string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $tense,
                                            $mood,
                                            $voice
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-tense-mood-voice-sWord-4>
                            </xsl:when>
                            <xsl:when test="$head_4 > 0">
                                <DD-rel-morph-self-tense-mood-voice-sWord-4>
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
                                            ./@relation,
                                            $tense,
                                            $mood,
                                            $voice
                                            ), '|')"
                                    />
                                </DD-rel-morph-self-tense-mood-voice-sWord-4>
                            </xsl:when>
                        </xsl:choose>

                        <xsl:if test="./person">

                            <!-- XXXX person-number-tense-mood -->

                            <DD-rel-morph-self-person-number-tense-mood-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $person,
                                        $number,
                                        $tense,
                                        $mood
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-person-number-tense-mood-sWord-0>

                            <DD-rel-morph-self-person-number-tense-mood-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense,
                                                $mood
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense,
                                                $mood
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-person-number-tense-mood-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-person-number-tense-mood-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-tense-mood-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-person-number-tense-mood-sWord-2>
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
                                                
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-tense-mood-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-person-number-tense-mood-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-tense-mood-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-person-number-tense-mood-sWord-3>
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
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-tense-mood-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-person-number-tense-mood-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-tense-mood-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-person-number-tense-mood-sWord-4>
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
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense,
                                                $mood
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-tense-mood-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                            <!-- XXXX -->

                            <!-- XXXX person-number-tense-voice -->

                            <DD-rel-morph-self-person-number-tense-voice-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $person,
                                        $number,
                                        $tense,
                                        $voice
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-person-number-tense-voice-sWord-0>

                            <DD-rel-morph-self-person-number-tense-voice-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense,
                                                $voice
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense,
                                                $voice
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-person-number-tense-voice-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-person-number-tense-voice-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-tense-voice-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-person-number-tense-voice-sWord-2>
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
                                                
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-tense-voice-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-person-number-tense-voice-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-tense-voice-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-person-number-tense-voice-sWord-3>
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
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-tense-voice-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-person-number-tense-voice-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-tense-voice-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-person-number-tense-voice-sWord-4>
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
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-tense-voice-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                            <!-- XXXX -->

                            <!-- XXXX person-number-mood-voice -->

                            <DD-rel-morph-self-person-number-mood-voice-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $person,
                                        $number,
                                        $mood,
                                        $voice
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-person-number-mood-voice-sWord-0>

                            <DD-rel-morph-self-person-number-mood-voice-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-person-number-mood-voice-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-person-number-mood-voice-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-mood-voice-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-person-number-mood-voice-sWord-2>
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
                                                
                                                ./@relation,
                                                $person,
                                                $number,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-mood-voice-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-person-number-mood-voice-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-mood-voice-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-person-number-mood-voice-sWord-3>
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
                                                ./@relation,
                                                $person,
                                                $number,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-mood-voice-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-person-number-mood-voice-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-mood-voice-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-person-number-mood-voice-sWord-4>
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
                                                ./@relation,
                                                $person,
                                                $number,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-mood-voice-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                            <!-- XXXX person-tense-mood-voice -->

                            <DD-rel-morph-self-person-tense-mood-voice-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $person,
                                        $tense,
                                        $mood,
                                        $voice
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-person-tense-mood-voice-sWord-0>

                            <DD-rel-morph-self-person-tense-mood-voice-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $tense,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $tense,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-person-tense-mood-voice-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-person-tense-mood-voice-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $tense,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-tense-mood-voice-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-person-tense-mood-voice-sWord-2>
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
                                                
                                                ./@relation,
                                                $person,
                                                $tense,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-tense-mood-voice-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-person-tense-mood-voice-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $tense,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-tense-mood-voice-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-person-tense-mood-voice-sWord-3>
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
                                                ./@relation,
                                                $person,
                                                $tense,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-tense-mood-voice-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-person-tense-mood-voice-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $tense,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-tense-mood-voice-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-person-tense-mood-voice-sWord-4>
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
                                                ./@relation,
                                                $person,
                                                $tense,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-tense-mood-voice-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                        </xsl:if>

                        <!-- XXXX number-tense-mood-voice -->
                        <xsl:if test="./number">

                            <DD-rel-morph-self-number-tense-mood-voice-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $number,
                                        $tense,
                                        $mood,
                                        $voice
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-number-tense-mood-voice-sWord-0>

                            <DD-rel-morph-self-number-tense-mood-voice-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-number-tense-mood-voice-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-number-tense-mood-voice-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-mood-voice-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-number-tense-mood-voice-sWord-2>
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
                                                
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-mood-voice-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-number-tense-mood-voice-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-mood-voice-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-number-tense-mood-voice-sWord-3>
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
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-mood-voice-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-number-tense-mood-voice-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-mood-voice-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-number-tense-mood-voice-sWord-4>
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
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-mood-voice-sWord-4>
                                </xsl:when>
                            </xsl:choose>


                        </xsl:if>

                        <!-- XXXX -->

                        <!-- XXXX person-number-tense-mood-voice -->
                        <xsl:if test="person">

                            <DD-rel-morph-self-person-number-tense-mood-voice-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $person,
                                        $number,
                                        $tense,
                                        $mood,
                                        $voice
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-person-number-tense-mood-voice-sWord-0>

                            <DD-rel-morph-self-person-number-tense-mood-voice-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-person-number-tense-mood-voice-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-person-number-tense-mood-voice-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-tense-mood-voice-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-person-number-tense-mood-voice-sWord-2>
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
                                                
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-tense-mood-voice-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-person-number-tense-mood-voice-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-tense-mood-voice-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-person-number-tense-mood-voice-sWord-3>
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
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-tense-mood-voice-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-person-number-tense-mood-voice-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-tense-mood-voice-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-person-number-tense-mood-voice-sWord-4>
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
                                                ./@relation,
                                                $person,
                                                $number,
                                                $tense,
                                                $mood,
                                                $voice
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-person-number-tense-mood-voice-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                        </xsl:if>

                        <!-- XXXX -->
                        <!-- participles XXXX -->

                        <xsl:if test="./mood = 'participle'">

                            <DD-rel-morph-self-tense-gender-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $tense,
                                        $gender
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-tense-gender-sWord-0>

                            <DD-rel-morph-self-tense-gender-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $tense,
                                                $gender
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $tense,
                                                $gender
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-tense-gender-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-tense-gender-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $tense,
                                                $gender
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-gender-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-tense-gender-sWord-2>
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
                                                
                                                ./@relation,
                                                $tense,
                                                $gender
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-gender-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-tense-gender-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $tense,
                                                $gender
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-gender-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-tense-gender-sWord-3>
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
                                                ./@relation,
                                                $tense,
                                                $gender
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-gender-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-tense-gender-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $tense,
                                                $gender
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-gender-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-tense-gender-sWord-4>
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
                                                ./@relation,
                                                $tense,
                                                $gender
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-gender-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                            <!-- XXXX tense-case -->

                            <DD-rel-morph-self-tense-case-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $tense,
                                        $case
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-tense-case-sWord-0>

                            <DD-rel-morph-self-tense-case-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $tense,
                                                $case
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $tense,
                                                $case
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-tense-case-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-tense-case-sWord-2><xsl:attribute name="ref"
                                                ><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $tense,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-case-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-tense-case-sWord-2>
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
                                                
                                                ./@relation,
                                                $tense,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-case-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-tense-case-sWord-3><xsl:attribute name="ref"
                                                ><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $tense,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-case-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-tense-case-sWord-3>
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
                                                ./@relation,
                                                $tense,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-case-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-tense-case-sWord-4><xsl:attribute name="ref"
                                                ><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $tense,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-case-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-tense-case-sWord-4>
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
                                                ./@relation,
                                                $tense,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-case-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                            <!-- XXXX  -->

                            <!-- voice-gender XXXX  -->

                            <DD-rel-morph-self-voice-gender-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $voice,
                                        $gender
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-voice-gender-sWord-0>

                            <DD-rel-morph-self-voice-gender-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $voice,
                                                $gender
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $voice,
                                                $gender
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-voice-gender-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-voice-gender-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $voice,
                                                $gender
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-voice-gender-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-voice-gender-sWord-2>
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
                                                
                                                ./@relation,
                                                $voice,
                                                $gender
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-voice-gender-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-voice-gender-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $voice,
                                                $gender
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-voice-gender-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-voice-gender-sWord-3>
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
                                                ./@relation,
                                                $voice,
                                                $gender
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-voice-gender-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-voice-gender-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $voice,
                                                $gender
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-voice-gender-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-voice-gender-sWord-4>
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
                                                ./@relation,
                                                $voice,
                                                $gender
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-voice-gender-sWord-4>
                                </xsl:when>
                            </xsl:choose>


                            <!-- XXXX  -->

                            <!-- voice-case XXXX  -->

                            <DD-rel-morph-self-voice-case-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $voice,
                                        $case
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-voice-case-sWord-0>

                            <DD-rel-morph-self-voice-case-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $voice,
                                                $case
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $voice,
                                                $case
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-voice-case-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-voice-case-sWord-2><xsl:attribute name="ref"
                                                ><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $voice,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-voice-case-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-voice-case-sWord-2>
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
                                                
                                                ./@relation,
                                                $voice,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-voice-case-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-voice-case-sWord-3><xsl:attribute name="ref"
                                                ><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $voice,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-voice-case-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-voice-case-sWord-3>
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
                                                ./@relation,
                                                $voice,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-voice-case-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-voice-case-sWord-4><xsl:attribute name="ref"
                                                ><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $voice,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-voice-case-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-voice-case-sWord-4>
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
                                                ./@relation,
                                                $voice,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-voice-case-sWord-4>
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            
                            
                            
                            
                            

                            <DD-rel-morph-self-number-tense-gender-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $number,
                                        
                                        $tense,
                                        $gender
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-number-tense-gender-sWord-0>

                            <DD-rel-morph-self-number-tense-gender-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                
                                                $tense,
                                                $gender
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                
                                                $tense,
                                                $gender
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-number-tense-gender-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-number-tense-gender-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                
                                                $tense,
                                                $gender
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-gender-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-number-tense-gender-sWord-2>
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
                                                
                                                ./@relation,
                                                $number,
                                                
                                                $tense,
                                                $gender
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-gender-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-number-tense-gender-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                
                                                $tense,
                                                $gender
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-gender-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-number-tense-gender-sWord-3>
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
                                                ./@relation,
                                                $number,
                                                
                                                $tense,
                                                $gender
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-gender-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-number-tense-gender-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                
                                                $tense,
                                                $gender
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-gender-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-number-tense-gender-sWord-4>
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
                                                ./@relation,
                                                $number,
                                                
                                                $tense,
                                                $gender
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-gender-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                            <!-- XXXX tense-case -->

                            <DD-rel-morph-self-number-tense-case-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $number,
                                        
                                        $tense,
                                        $case
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-number-tense-case-sWord-0>

                            <DD-rel-morph-self-number-tense-case-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                
                                                $tense,
                                                $case
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                
                                                $tense,
                                                $case
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-number-tense-case-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-number-tense-case-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                
                                                $tense,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-case-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-number-tense-case-sWord-2>
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
                                                
                                                ./@relation,
                                                $number,
                                                
                                                $tense,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-case-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-number-tense-case-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                
                                                $tense,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-case-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-number-tense-case-sWord-3>
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
                                                ./@relation,
                                                $number,
                                                
                                                $tense,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-case-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-number-tense-case-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                
                                                $tense,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-case-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-number-tense-case-sWord-4>
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
                                                ./@relation,
                                                $number,
                                                
                                                $tense,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-case-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                            <!-- XXXX  -->

                            <!-- voice-gender XXXX  -->

                            <DD-rel-morph-self-number-voice-gender-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $number,
                                        
                                        $voice,
                                        $gender
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-number-voice-gender-sWord-0>

                            <DD-rel-morph-self-number-voice-gender-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                
                                                $voice,
                                                $gender
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                
                                                $voice,
                                                $gender
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-number-voice-gender-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-number-voice-gender-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                
                                                $voice,
                                                $gender
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-voice-gender-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-number-voice-gender-sWord-2>
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
                                                
                                                ./@relation,
                                                $number,
                                                
                                                $voice,
                                                $gender
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-voice-gender-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-number-voice-gender-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                
                                                $voice,
                                                $gender
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-voice-gender-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-number-voice-gender-sWord-3>
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
                                                ./@relation,
                                                $number,
                                                
                                                $voice,
                                                $gender
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-voice-gender-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-number-voice-gender-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                
                                                $voice,
                                                $gender
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-voice-gender-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-number-voice-gender-sWord-4>
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
                                                ./@relation,
                                                $number,
                                                
                                                $voice,
                                                $gender
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-voice-gender-sWord-4>
                                </xsl:when>
                            </xsl:choose>


                            <!-- XXXX  -->

                            <!-- voice-case XXXX  -->

                            <DD-rel-morph-self-number-voice-case-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $number,
                                        
                                        $voice,
                                        $case
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-number-voice-case-sWord-0>

                            <DD-rel-morph-self-number-voice-case-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                
                                                $voice,
                                                $case
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                
                                                $voice,
                                                $case
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-number-voice-case-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-number-voice-case-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                
                                                $voice,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-voice-case-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-number-voice-case-sWord-2>
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
                                                
                                                ./@relation,
                                                $number,
                                                
                                                $voice,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-voice-case-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-number-voice-case-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                
                                                $voice,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-voice-case-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-number-voice-case-sWord-3>
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
                                                ./@relation,
                                                $number,
                                                
                                                $voice,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-voice-case-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-number-voice-case-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                
                                                $voice,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-voice-case-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-number-voice-case-sWord-4>
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
                                                ./@relation,
                                                $number,
                                                
                                                $voice,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-voice-case-sWord-4>
                                </xsl:when>
                            </xsl:choose>


                            <!-- XXXX -->

                            <DD-rel-morph-self-tense-gender-case-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $tense,
                                        
                                        $gender,
                                        $case
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-tense-gender-case-sWord-0>

                            <DD-rel-morph-self-tense-gender-case-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $tense,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $tense,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-tense-gender-case-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-tense-gender-case-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $tense,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-gender-case-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-tense-gender-case-sWord-2>
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
                                                
                                                ./@relation,
                                                $tense,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-gender-case-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-tense-gender-case-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $tense,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-gender-case-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-tense-gender-case-sWord-3>
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
                                                ./@relation,
                                                $tense,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-gender-case-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-tense-gender-case-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $tense,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-gender-case-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-tense-gender-case-sWord-4>
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
                                                ./@relation,
                                                $tense,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-gender-case-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                            <!-- XXXX -->

                            <DD-rel-morph-self-voice-gender-case-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $voice,
                                        
                                        $gender,
                                        $case
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-voice-gender-case-sWord-0>

                            <DD-rel-morph-self-voice-gender-case-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-voice-gender-case-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-voice-gender-case-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-voice-gender-case-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-voice-gender-case-sWord-2>
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
                                                
                                                ./@relation,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-voice-gender-case-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-voice-gender-case-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-voice-gender-case-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-voice-gender-case-sWord-3>
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
                                                ./@relation,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-voice-gender-case-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-voice-gender-case-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-voice-gender-case-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-voice-gender-case-sWord-4>
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
                                                ./@relation,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-voice-gender-case-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                            <!-- XXXX -->
                            
                            <DD-rel-morph-self-tense-voice-gender-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                
                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                    string-join((
                                    ./@DepDist,
                                    ./@relation,
$tense,
                                    $voice,
                                    $gender
                                    ), '|')"
                                    > </xsl:value-of>
                            </DD-rel-morph-self-tense-voice-gender-sWord-0>
                            
                            <DD-rel-morph-self-tense-voice-gender-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                        select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
$tense,
                                        $voice,
                                        $gender
                                        ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                            string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
$tense,
                                            $voice,
                                            $gender
                                            ), '|')"
                                        />
                                    </xsl:when>
                                    
                                </xsl:choose>
                            </DD-rel-morph-self-tense-voice-gender-sWord-1>
                            
                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-tense-voice-gender-sWord-2><xsl:attribute
                                        name="ref"><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
$tense,
                                            $voice,
                                            $gender
                                            ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-voice-gender-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-tense-voice-gender-sWord-2>
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
                                            
                                            ./@relation,
$tense,
                                            $voice,
                                            $gender
                                            ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-voice-gender-sWord-2>
                                    
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-tense-voice-gender-sWord-3><xsl:attribute
                                        name="ref"><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
$tense,
                                            $voice,
                                            $gender
                                            ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-voice-gender-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-tense-voice-gender-sWord-3>
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
                                            ./@relation,
$tense,
                                            $voice,
                                            $gender
                                            ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-voice-gender-sWord-3>
                                </xsl:when>
                            </xsl:choose>
                            
                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-tense-voice-gender-sWord-4><xsl:attribute
                                        name="ref"><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
$tense,
                                            $voice,
                                            $gender
                                            ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-voice-gender-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-tense-voice-gender-sWord-4>
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
                                            ./@relation,
$tense,
                                            $voice,
                                            $gender
                                            ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-voice-gender-sWord-4>
                                </xsl:when>
                            </xsl:choose>


                            <!-- XXXX -->
                            
                            <DD-rel-morph-self-tense-voice-case-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                
                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                    string-join((
                                    ./@DepDist,
                                    ./@relation,
                                    $tense,
                                    $voice,
                                    $case
                                    ), '|')"
                                    > </xsl:value-of>
                            </DD-rel-morph-self-tense-voice-case-sWord-0>
                            
                            <DD-rel-morph-self-tense-voice-case-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                        select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $tense,
                                        $voice,
                                        $case
                                        ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                            string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $tense,
                                            $voice,
                                            $case
                                            ), '|')"
                                        />
                                    </xsl:when>
                                    
                                </xsl:choose>
                            </DD-rel-morph-self-tense-voice-case-sWord-1>
                            
                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-tense-voice-case-sWord-2><xsl:attribute
                                        name="ref"><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            string-join((
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $tense,
                                            $voice,
                                            $case
                                            ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-voice-case-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-tense-voice-case-sWord-2>
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
                                            
                                            ./@relation,
                                            $tense,
                                            $voice,
                                            $case
                                            ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-voice-case-sWord-2>
                                    
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-tense-voice-case-sWord-3><xsl:attribute
                                        name="ref"><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            string-join((
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $tense,
                                            $voice,
                                            $case
                                            ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-voice-case-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-tense-voice-case-sWord-3>
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
                                            ./@relation,
                                            $tense,
                                            $voice,
                                            $case
                                            ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-voice-case-sWord-3>
                                </xsl:when>
                            </xsl:choose>
                            
                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-tense-voice-case-sWord-4><xsl:attribute
                                        name="ref"><xsl:value-of select="./@cite"
                                        /></xsl:attribute>#-<xsl:value-of
                                            select="
                                            string-join((
                                            parent::sentence/word[@id = $head_3]/@DepDist,
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            parent::sentence/word[@id = $head_2]/@DepDist,
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            parent::sentence/word[@id = $head_1]/@DepDist,
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            
                                            ./@DepDist,
                                            ./@relation,
                                            $tense,
                                            $voice,
                                            $case
                                            ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-voice-case-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-tense-voice-case-sWord-4>
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
                                            ./@relation,
                                            $tense,
                                            $voice,
                                            $case
                                            ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-voice-case-sWord-4>
                                </xsl:when>
                            </xsl:choose>


                            <!-- XXXX -->

                            <DD-rel-morph-self-tense-voice-gender-case-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $tense,
                                        $voice,
                                        
                                        $gender,
                                        $case
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-tense-voice-gender-case-sWord-0>

                            <DD-rel-morph-self-tense-voice-gender-case-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $tense,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $tense,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-tense-voice-gender-case-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-tense-voice-gender-case-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $tense,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-voice-gender-case-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-tense-voice-gender-case-sWord-2>
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
                                                
                                                ./@relation,
                                                $tense,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-voice-gender-case-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-tense-voice-gender-case-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $tense,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-voice-gender-case-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-tense-voice-gender-case-sWord-3>
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
                                                ./@relation,
                                                $tense,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-voice-gender-case-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-tense-voice-gender-case-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $tense,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-voice-gender-case-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-tense-voice-gender-case-sWord-4>
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
                                                ./@relation,
                                                $tense,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-tense-voice-gender-case-sWord-4>
                                </xsl:when>
                            </xsl:choose>


                            <!-- XXXX -->

                            <DD-rel-morph-self-number-tense-gender-case-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $number,
                                        $tense,
                                        
                                        $gender,
                                        $case
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-number-tense-gender-case-sWord-0>

                            <DD-rel-morph-self-number-tense-gender-case-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-number-tense-gender-case-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-number-tense-gender-case-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-gender-case-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-number-tense-gender-case-sWord-2>
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
                                                
                                                ./@relation,
                                                $number,
                                                $tense,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-gender-case-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-number-tense-gender-case-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-gender-case-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-number-tense-gender-case-sWord-3>
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
                                                ./@relation,
                                                $number,
                                                $tense,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-gender-case-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-number-tense-gender-case-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-gender-case-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-number-tense-gender-case-sWord-4>
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
                                                ./@relation,
                                                $number,
                                                $tense,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-gender-case-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                            <!-- XXXX -->

                            <DD-rel-morph-self-number-voice-gender-case-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $number,
                                        $voice,
                                        
                                        $gender,
                                        $case
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-number-voice-gender-case-sWord-0>

                            <DD-rel-morph-self-number-voice-gender-case-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-number-voice-gender-case-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-number-voice-gender-case-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-voice-gender-case-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-number-voice-gender-case-sWord-2>
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
                                                
                                                ./@relation,
                                                $number,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-voice-gender-case-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-number-voice-gender-case-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-voice-gender-case-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-number-voice-gender-case-sWord-3>
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
                                                ./@relation,
                                                $number,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-voice-gender-case-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-number-voice-gender-case-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $voice,
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-voice-gender-case-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-number-voice-gender-case-sWord-4>
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
                                                ./@relation,
                                                $number,
                                                $voice,
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-voice-gender-case-sWord-4>
                                </xsl:when>
                            </xsl:choose>

                            <!-- XXXX -->

                            <DD-rel-morph-self-number-tense-voice-gender-case-sWord-0>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>

                                <!-- Each <word> element returns its own @relation and pos. These data are output as contents of 
                                        a <rel-pos-sWord-0> element. -->
                                <xsl:value-of
                                    select="
                                        string-join((
                                        ./@DepDist,
                                        ./@relation,
                                        $number,
                                        $tense,
                                        $voice,
                                        
                                        $gender,
                                        $case
                                        ), '|')"
                                > </xsl:value-of>
                            </DD-rel-morph-self-number-tense-voice-gender-case-sWord-0>

                            <DD-rel-morph-self-number-tense-voice-gender-case-sWord-1>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="./@cite"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$head_1 = 0">#-<xsl:value-of
                                            select="
                                                string-join((
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        > </xsl:value-of>
                                    </xsl:when>
                                    <xsl:when test="$head_1 > 0">
                                        <xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </xsl:when>

                                </xsl:choose>
                            </DD-rel-morph-self-number-tense-voice-gender-case-sWord-1>

                            <xsl:choose>
                                <xsl:when test="$head_2 = 0">
                                    <DD-rel-morph-self-number-tense-voice-gender-case-sWord-2><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-voice-gender-case-sWord-2>
                                </xsl:when>
                                <xsl:when test="$head_2 > 0">
                                    <DD-rel-morph-self-number-tense-voice-gender-case-sWord-2>
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
                                                
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-voice-gender-case-sWord-2>

                                </xsl:when>
                            </xsl:choose>


                            <xsl:choose>
                                <xsl:when test="$head_3 = 0">
                                    <DD-rel-morph-self-number-tense-voice-gender-case-sWord-3><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-voice-gender-case-sWord-3>
                                </xsl:when>
                                <xsl:when test="$head_3 > 0">
                                    <DD-rel-morph-self-number-tense-voice-gender-case-sWord-3>
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
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-voice-gender-case-sWord-3>
                                </xsl:when>
                            </xsl:choose>

                            <xsl:choose>
                                <xsl:when test="$head_4 = 0">
                                    <DD-rel-morph-self-number-tense-voice-gender-case-sWord-4><xsl:attribute
                                            name="ref"><xsl:value-of select="./@cite"
                                            /></xsl:attribute>#-<xsl:value-of
                                            select="
                                                string-join((
                                                parent::sentence/word[@id = $head_3]/@DepDist,
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                parent::sentence/word[@id = $head_2]/@DepDist,
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                parent::sentence/word[@id = $head_1]/@DepDist,
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                
                                                ./@DepDist,
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-voice-gender-case-sWord-4>
                                </xsl:when>
                                <xsl:when test="$head_4 > 0">
                                    <DD-rel-morph-self-number-tense-voice-gender-case-sWord-4>
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
                                                ./@relation,
                                                $number,
                                                $tense,
                                                $voice,
                                                
                                                $gender,
                                                $case
                                                ), '|')"
                                        />
                                    </DD-rel-morph-self-number-tense-voice-gender-case-sWord-4>
                                </xsl:when>
                            </xsl:choose>


                            <!-- XXXX -->

                        </xsl:if>

                        <!-- XXXX -->

                    </xsl:when>
                </xsl:choose>




            </word>


        </xsl:for-each>

    </xsl:template>


</xsl:stylesheet>
