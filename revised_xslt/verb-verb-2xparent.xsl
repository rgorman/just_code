<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="subTree_document">

        <test_document>
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


                <xsl:variable name="parent-pos" select="parent::sentence/word[@id = $head_1]/pos"/>
                <xsl:variable name="parent-person"
                    select="parent::sentence/word[@id = $head_1]/person"/>
                <xsl:variable name="parent-number"
                    select="parent::sentence/word[@id = $head_1]/number"/>
                <xsl:variable name="parent-tense"
                    select="parent::sentence/word[@id = $head_1]/tense"/>
                <xsl:variable name="parent-mood" select="parent::sentence/word[@id = $head_1]/mood"/>
                <xsl:variable name="parent-voice"
                    select="parent::sentence/word[@id = $head_1]/voice"/>
                <xsl:variable name="parent-gender"
                    select="parent::sentence/word[@id = $head_1]/gender"/>
                <xsl:variable name="parent-case" select="parent::sentence/word[@id = $head_1]/case"/>
                <xsl:variable name="parent-degree"
                    select="parent::sentence/word[@id = $head_1]/degree"/>


                <xsl:variable name="g2x-parent-pos"
                    select="parent::sentence/word[@id = $head_2]/pos"/>
                <xsl:variable name="g2x-parent-person"
                    select="parent::sentence/word[@id = $head_2]/person"/>
                <xsl:variable name="g2x-parent-number"
                    select="parent::sentence/word[@id = $head_2]/number"/>
                <xsl:variable name="g2x-parent-tense"
                    select="parent::sentence/word[@id = $head_2]/tense"/>
                <xsl:variable name="g2x-parent-mood"
                    select="parent::sentence/word[@id = $head_2]/mood"/>
                <xsl:variable name="g2x-parent-voice"
                    select="parent::sentence/word[@id = $head_2]/voice"/>
                <xsl:variable name="g2x-parent-gender"
                    select="parent::sentence/word[@id = $head_2]/gender"/>
                <xsl:variable name="g2x-parent-case"
                    select="parent::sentence/word[@id = $head_2]/case"/>
                <xsl:variable name="g2x-parent-degree"
                    select="parent::sentence/word[@id = $head_2]/degree"/>

                <word>

                    <xsl:copy-of select="@*"/>
                    <xsl:copy-of select="node()"/>

                    <xsl:choose>
                        <xsl:when test="$pos = 'verb' and $g2x-parent-pos = 'verb'">
                            

                            <xsl:choose>
                                <xsl:when
                                    test="
                                        parent::sentence/word[@id = $head_1]/@relation = 'AuxC'
                                        or parent::sentence/word[@id = $head_1]/@relation = 'COORD'">

                                    <!-- Start of 1 variables -->


                                    <xsl:if test="$g2x-parent-person">


                                        <xsl:if test="$person">

                                            <DD-rel-morph-g2x-parent-person-self-person-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-person-sWord-1>

                                        </xsl:if>





                                        <!-- XXX number -->

                                        <xsl:if test="./number">



                                            <DD-rel-morph-g2x-parent-person-self-number-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-number-sWord-1>




                                        </xsl:if>



                                        <DD-rel-morph-g2x-parent-person-self-tense-sWord-1>
                                            <xsl:attribute name="ref">
                                                <xsl:value-of select="./@cite"/>
                                            </xsl:attribute>


                                            <xsl:value-of
                                                select="
                                                    string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    $g2x-parent-person,
                                                    $parent-number,
                                                    $parent-tense,
                                                    $parent-mood,
                                                    $parent-voice,
                                                    
                                                    ./@DepDist,
                                                    ./@relation,
                                                    $tense
                                                    ), '|')"/>

                                        </DD-rel-morph-g2x-parent-person-self-tense-sWord-1>



                                        <DD-rel-morph-g2x-parent-person-self-mood-sWord-1>
                                            <xsl:attribute name="ref">
                                                <xsl:value-of select="./@cite"/>
                                            </xsl:attribute>



                                            <xsl:value-of
                                                select="
                                                    string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    $g2x-parent-person,
                                                    $parent-number,
                                                    $parent-tense,
                                                    $parent-mood,
                                                    $parent-voice,
                                                    
                                                    ./@DepDist,
                                                    ./@relation,
                                                    $mood
                                                    ), '|')"/>


                                        </DD-rel-morph-g2x-parent-person-self-mood-sWord-1>


                                        <DD-rel-morph-g2x-parent-person-self-voice-sWord-1>
                                            <xsl:attribute name="ref">
                                                <xsl:value-of select="./@cite"/>
                                            </xsl:attribute>


                                            <xsl:value-of
                                                select="
                                                    string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    $g2x-parent-person,
                                                    $parent-number,
                                                    $parent-tense,
                                                    $parent-mood,
                                                    $parent-voice,
                                                    
                                                    ./@DepDist,
                                                    ./@relation,
                                                    $voice
                                                    ), '|')"/>

                                        </DD-rel-morph-g2x-parent-person-self-voice-sWord-1>



                                        <!-- XXXX pos-number -->

                                        <xsl:if test="./number">


                                            <DD-rel-morph-g2x-parent-person-self-pos-number-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $pos,
                                                        $number
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-pos-number-sWord-1>



                                            <!-- XXXX -->

                                        </xsl:if>

                                        <!-- XXXX person-number -->

                                        <xsl:if test="./person">



                                            <DD-rel-morph-g2x-parent-person-self-person-number-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $number
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-person-number-sWord-1>


                                            <!-- XXXX person-tense -->


                                            <DD-rel-morph-g2x-parent-person-self-person-tense-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $tense
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-person-tense-sWord-1>



                                            <DD-rel-morph-g2x-parent-person-self-person-mood-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $mood
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-person-mood-sWord-1>



                                            <DD-rel-morph-g2x-parent-person-self-person-voice-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $voice
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-person-voice-sWord-1>


                                        </xsl:if>


                                        <!-- XXXX number-tense -->

                                        <xsl:if test="./number">



                                            <DD-rel-morph-g2x-parent-person-self-number-tense-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        $tense
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-number-tense-sWord-1>



                                            <DD-rel-morph-g2x-parent-person-self-number-mood-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        $mood
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-number-mood-sWord-1>



                                            <DD-rel-morph-g2x-parent-person-self-number-voice-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        $voice
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-number-voice-sWord-1>



                                        </xsl:if>


                                        <DD-rel-morph-g2x-parent-person-self-tense-mood-sWord-1>
                                            <xsl:attribute name="ref">
                                                <xsl:value-of select="./@cite"/>
                                            </xsl:attribute>

                                            <xsl:value-of
                                                select="
                                                    string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    $g2x-parent-person,
                                                    $parent-number,
                                                    $parent-tense,
                                                    $parent-mood,
                                                    $parent-voice,
                                                    
                                                    ./@DepDist,
                                                    ./@relation,
                                                    $tense,
                                                    $mood
                                                    ), '|')"/>

                                        </DD-rel-morph-g2x-parent-person-self-tense-mood-sWord-1>



                                        <DD-rel-morph-g2x-parent-person-self-tense-voice-sWord-1>
                                            <xsl:attribute name="ref">
                                                <xsl:value-of select="./@cite"/>
                                            </xsl:attribute>

                                            <xsl:value-of
                                                select="
                                                    string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    $g2x-parent-person,
                                                    $parent-number,
                                                    $parent-tense,
                                                    $parent-mood,
                                                    $parent-voice,
                                                    
                                                    ./@DepDist,
                                                    ./@relation,
                                                    $tense,
                                                    $voice
                                                    ), '|')"/>

                                        </DD-rel-morph-g2x-parent-person-self-tense-voice-sWord-1>



                                        <DD-rel-morph-g2x-parent-person-self-mood-voice-sWord-1>
                                            <xsl:attribute name="ref">
                                                <xsl:value-of select="./@cite"/>
                                            </xsl:attribute>

                                            <xsl:value-of
                                                select="
                                                    string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    $g2x-parent-person,
                                                    $parent-number,
                                                    $parent-tense,
                                                    $parent-mood,
                                                    $parent-voice,
                                                    
                                                    ./@DepDist,
                                                    ./@relation,
                                                    $mood,
                                                    $voice
                                                    ), '|')"/>

                                        </DD-rel-morph-g2x-parent-person-self-mood-voice-sWord-1>


                                        <!-- XXXX  -->

                                        <xsl:if test="./person">



                                            <DD-rel-morph-g2x-parent-person-self-person-number-tense-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $number,
                                                        $tense
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-person-number-tense-sWord-1>


                                            <DD-rel-morph-g2x-parent-person-self-person-number-mood-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $number,
                                                        $mood
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-person-number-mood-sWord-1>


                                            <DD-rel-morph-g2x-parent-person-self-person-number-voice-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>


                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $number,
                                                        $voice
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-person-number-voice-sWord-1>



                                            <DD-rel-morph-g2x-parent-person-self-person-tense-mood-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $tense,
                                                        $mood
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-person-tense-mood-sWord-1>



                                            <DD-rel-morph-g2x-parent-person-self-person-tense-voice-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $tense,
                                                        $voice
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-person-tense-voice-sWord-1>


                                            <DD-rel-morph-g2x-parent-person-self-person-mood-voice-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $mood,
                                                        $voice
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-person-mood-voice-sWord-1>


                                        </xsl:if>

                                        <xsl:if test="./number">


                                            <DD-rel-morph-g2x-parent-person-self-number-tense-mood-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        $tense,
                                                        $mood
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-number-tense-mood-sWord-1>


                                            <DD-rel-morph-g2x-parent-person-self-number-tense-voice-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        $tense,
                                                        $voice
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-number-tense-voice-sWord-1>

                                            <DD-rel-morph-g2x-parent-person-self-number-mood-voice-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        $mood,
                                                        $voice
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-number-mood-voice-sWord-1>


                                        </xsl:if>

                                        <xsl:if test="./person"> </xsl:if>


                                        <DD-rel-morph-g2x-parent-person-self-tense-mood-voice-sWord-1>
                                            <xsl:attribute name="ref">
                                                <xsl:value-of select="./@cite"/>
                                            </xsl:attribute>

                                            <xsl:value-of
                                                select="
                                                    string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    $g2x-parent-person,
                                                    $parent-number,
                                                    $parent-tense,
                                                    $parent-mood,
                                                    $parent-voice,
                                                    
                                                    ./@DepDist,
                                                    ./@relation,
                                                    $tense,
                                                    $mood,
                                                    $voice
                                                    ), '|')"/>

                                        </DD-rel-morph-g2x-parent-person-self-tense-mood-voice-sWord-1>


                                        <xsl:if test="./person">


                                            <DD-rel-morph-g2x-parent-person-self-person-number-tense-mood-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $number,
                                                        $tense,
                                                        $mood
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-person-number-tense-mood-sWord-1>



                                            <DD-rel-morph-g2x-parent-person-self-person-number-tense-voice-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $number,
                                                        $tense,
                                                        $voice
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-person-number-tense-voice-sWord-1>


                                            <DD-rel-morph-g2x-parent-person-self-person-number-mood-voice-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $number,
                                                        $mood,
                                                        $voice
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-person-number-mood-voice-sWord-1>


                                            <DD-rel-morph-g2x-parent-person-self-person-tense-mood-voice-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $tense,
                                                        $mood,
                                                        $voice
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-person-tense-mood-voice-sWord-1>

                                        </xsl:if>

                                        <!-- XXXX number-tense-mood-voice -->
                                        <xsl:if test="./number">


                                            <DD-rel-morph-g2x-parent-person-self-number-tense-mood-voice-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        $tense,
                                                        $mood,
                                                        $voice
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-number-tense-mood-voice-sWord-1>

                                        </xsl:if>

                                        <!-- XXXX person-number-tense-mood-voice -->
                                        <xsl:if test="person">

                                            <DD-rel-morph-g2x-parent-person-self-person-number-tense-mood-voice-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $number,
                                                        $tense,
                                                        $mood,
                                                        $voice
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-person-number-tense-mood-voice-sWord-1>

                                        </xsl:if>

                                        <xsl:if test="./mood = 'participle'">

                                            <DD-rel-morph-g2x-parent-person-self-tense-gender-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $tense,
                                                        $gender
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-tense-gender-sWord-1>

                                            <DD-rel-morph-g2x-parent-person-self-tense-case-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $tense,
                                                        $case
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-tense-case-sWord-1>

                                            <DD-rel-morph-g2x-parent-person-self-voice-gender-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $voice,
                                                        $gender
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-voice-gender-sWord-1>


                                            <DD-rel-morph-g2x-parent-person-self-voice-case-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $voice,
                                                        $case
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-voice-case-sWord-1>



                                            <DD-rel-morph-g2x-parent-person-self-number-tense-gender-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        
                                                        $tense,
                                                        $gender
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-number-tense-gender-sWord-1>

                                            <DD-rel-morph-g2x-parent-person-self-number-tense-case-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        
                                                        $tense,
                                                        $case
                                                        ), '|')"/>


                                            </DD-rel-morph-g2x-parent-person-self-number-tense-case-sWord-1>


                                            <DD-rel-morph-g2x-parent-person-self-number-voice-gender-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        
                                                        $voice,
                                                        $gender
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-number-voice-gender-sWord-1>


                                            <DD-rel-morph-g2x-parent-person-self-number-voice-case-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        
                                                        $voice,
                                                        $case
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-number-voice-case-sWord-1>


                                            <DD-rel-morph-g2x-parent-person-self-tense-gender-case-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $tense,
                                                        
                                                        $gender,
                                                        $case
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-tense-gender-case-sWord-1>

                                            <DD-rel-morph-g2x-parent-person-self-voice-gender-case-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $voice,
                                                        
                                                        $gender,
                                                        $case
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-voice-gender-case-sWord-1>


                                            <DD-rel-morph-g2x-parent-person-self-tense-voice-gender-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $tense,
                                                        $voice,
                                                        $gender
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-tense-voice-gender-sWord-1>


                                            <DD-rel-morph-g2x-parent-person-self-tense-voice-case-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $tense,
                                                        $voice,
                                                        $case
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-tense-voice-case-sWord-1>


                                            <DD-rel-morph-g2x-parent-person-self-tense-voice-gender-case-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $tense,
                                                        $voice,
                                                        
                                                        $gender,
                                                        $case
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-tense-voice-gender-case-sWord-1>


                                            <DD-rel-morph-g2x-parent-person-self-number-tense-gender-case-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        $tense,
                                                        
                                                        $gender,
                                                        $case
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-number-tense-gender-case-sWord-1>


                                            <DD-rel-morph-g2x-parent-person-self-number-voice-gender-case-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        $voice,
                                                        
                                                        $gender,
                                                        $case
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-number-voice-gender-case-sWord-1>


                                            <DD-rel-morph-g2x-parent-person-self-number-tense-voice-gender-case-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-person,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        $tense,
                                                        $voice,
                                                        
                                                        $gender,
                                                        $case
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-person-self-number-tense-voice-gender-case-sWord-1>



                                            <!-- XXXX -->

                                        </xsl:if>


                                    </xsl:if>
                                    
                                    
                                    
                                    <xsl:if test="$g2x-parent-number">
                                        
                                     
                                        <xsl:if test="$person">

                                            <DD-rel-morph-g2x-parent-number-self-person-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-person-sWord-1>

                                        </xsl:if>





                                        <!-- XXX number -->

                                        <xsl:if test="./number">



                                            <DD-rel-morph-g2x-parent-number-self-number-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-number-sWord-1>




                                        </xsl:if>



                                        <DD-rel-morph-g2x-parent-number-self-tense-sWord-1>
                                            <xsl:attribute name="ref">
                                                <xsl:value-of select="./@cite"/>
                                            </xsl:attribute>


                                            <xsl:value-of
                                                select="
                                                    string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    $g2x-parent-number,
                                                    $parent-number,
                                                    $parent-tense,
                                                    $parent-mood,
                                                    $parent-voice,
                                                    
                                                    ./@DepDist,
                                                    ./@relation,
                                                    $tense
                                                    ), '|')"/>

                                        </DD-rel-morph-g2x-parent-number-self-tense-sWord-1>



                                        <DD-rel-morph-g2x-parent-number-self-mood-sWord-1>
                                            <xsl:attribute name="ref">
                                                <xsl:value-of select="./@cite"/>
                                            </xsl:attribute>



                                            <xsl:value-of
                                                select="
                                                    string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    $g2x-parent-number,
                                                    $parent-number,
                                                    $parent-tense,
                                                    $parent-mood,
                                                    $parent-voice,
                                                    
                                                    ./@DepDist,
                                                    ./@relation,
                                                    $mood
                                                    ), '|')"/>


                                        </DD-rel-morph-g2x-parent-number-self-mood-sWord-1>


                                        <DD-rel-morph-g2x-parent-number-self-voice-sWord-1>
                                            <xsl:attribute name="ref">
                                                <xsl:value-of select="./@cite"/>
                                            </xsl:attribute>


                                            <xsl:value-of
                                                select="
                                                    string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    $g2x-parent-number,
                                                    $parent-number,
                                                    $parent-tense,
                                                    $parent-mood,
                                                    $parent-voice,
                                                    
                                                    ./@DepDist,
                                                    ./@relation,
                                                    $voice
                                                    ), '|')"/>

                                        </DD-rel-morph-g2x-parent-number-self-voice-sWord-1>



                                        <!-- XXXX pos-number -->

                                        <xsl:if test="./number">


                                            <DD-rel-morph-g2x-parent-number-self-pos-number-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $pos,
                                                        $number
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-pos-number-sWord-1>



                                            <!-- XXXX -->

                                        </xsl:if>

                                        <!-- XXXX person-number -->

                                        <xsl:if test="./person">



                                            <DD-rel-morph-g2x-parent-number-self-person-number-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $number
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-person-number-sWord-1>


                                            <!-- XXXX person-tense -->


                                            <DD-rel-morph-g2x-parent-number-self-person-tense-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $tense
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-person-tense-sWord-1>



                                            <DD-rel-morph-g2x-parent-number-self-person-mood-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $mood
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-person-mood-sWord-1>



                                            <DD-rel-morph-g2x-parent-number-self-person-voice-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $voice
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-person-voice-sWord-1>


                                        </xsl:if>


                                        <!-- XXXX number-tense -->

                                        <xsl:if test="./number">



                                            <DD-rel-morph-g2x-parent-number-self-number-tense-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        $tense
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-number-tense-sWord-1>



                                            <DD-rel-morph-g2x-parent-number-self-number-mood-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        $mood
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-number-mood-sWord-1>



                                            <DD-rel-morph-g2x-parent-number-self-number-voice-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        $voice
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-number-voice-sWord-1>



                                        </xsl:if>


                                        <DD-rel-morph-g2x-parent-number-self-tense-mood-sWord-1>
                                            <xsl:attribute name="ref">
                                                <xsl:value-of select="./@cite"/>
                                            </xsl:attribute>

                                            <xsl:value-of
                                                select="
                                                    string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    $g2x-parent-number,
                                                    $parent-number,
                                                    $parent-tense,
                                                    $parent-mood,
                                                    $parent-voice,
                                                    
                                                    ./@DepDist,
                                                    ./@relation,
                                                    $tense,
                                                    $mood
                                                    ), '|')"/>

                                        </DD-rel-morph-g2x-parent-number-self-tense-mood-sWord-1>



                                        <DD-rel-morph-g2x-parent-number-self-tense-voice-sWord-1>
                                            <xsl:attribute name="ref">
                                                <xsl:value-of select="./@cite"/>
                                            </xsl:attribute>

                                            <xsl:value-of
                                                select="
                                                    string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    $g2x-parent-number,
                                                    $parent-number,
                                                    $parent-tense,
                                                    $parent-mood,
                                                    $parent-voice,
                                                    
                                                    ./@DepDist,
                                                    ./@relation,
                                                    $tense,
                                                    $voice
                                                    ), '|')"/>

                                        </DD-rel-morph-g2x-parent-number-self-tense-voice-sWord-1>



                                        <DD-rel-morph-g2x-parent-number-self-mood-voice-sWord-1>
                                            <xsl:attribute name="ref">
                                                <xsl:value-of select="./@cite"/>
                                            </xsl:attribute>

                                            <xsl:value-of
                                                select="
                                                    string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    $g2x-parent-number,
                                                    $parent-number,
                                                    $parent-tense,
                                                    $parent-mood,
                                                    $parent-voice,
                                                    
                                                    ./@DepDist,
                                                    ./@relation,
                                                    $mood,
                                                    $voice
                                                    ), '|')"/>

                                        </DD-rel-morph-g2x-parent-number-self-mood-voice-sWord-1>


                                        <!-- XXXX  -->

                                        <xsl:if test="./person">



                                            <DD-rel-morph-g2x-parent-number-self-person-number-tense-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $number,
                                                        $tense
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-person-number-tense-sWord-1>


                                            <DD-rel-morph-g2x-parent-number-self-person-number-mood-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $number,
                                                        $mood
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-person-number-mood-sWord-1>


                                            <DD-rel-morph-g2x-parent-number-self-person-number-voice-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>


                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $number,
                                                        $voice
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-person-number-voice-sWord-1>



                                            <DD-rel-morph-g2x-parent-number-self-person-tense-mood-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $tense,
                                                        $mood
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-person-tense-mood-sWord-1>



                                            <DD-rel-morph-g2x-parent-number-self-person-tense-voice-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $tense,
                                                        $voice
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-person-tense-voice-sWord-1>


                                            <DD-rel-morph-g2x-parent-number-self-person-mood-voice-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $mood,
                                                        $voice
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-person-mood-voice-sWord-1>


                                        </xsl:if>

                                        <xsl:if test="./number">


                                            <DD-rel-morph-g2x-parent-number-self-number-tense-mood-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        $tense,
                                                        $mood
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-number-tense-mood-sWord-1>


                                            <DD-rel-morph-g2x-parent-number-self-number-tense-voice-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        $tense,
                                                        $voice
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-number-tense-voice-sWord-1>

                                            <DD-rel-morph-g2x-parent-number-self-number-mood-voice-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        $mood,
                                                        $voice
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-number-mood-voice-sWord-1>


                                        </xsl:if>

                                        <xsl:if test="./person"> </xsl:if>


                                        <DD-rel-morph-g2x-parent-number-self-tense-mood-voice-sWord-1>
                                            <xsl:attribute name="ref">
                                                <xsl:value-of select="./@cite"/>
                                            </xsl:attribute>

                                            <xsl:value-of
                                                select="
                                                    string-join((
                                                    parent::sentence/word[@id = $head_2]/@DepDist,
                                                    parent::sentence/word[@id = $head_2]/@relation,
                                                    $g2x-parent-number,
                                                    $parent-number,
                                                    $parent-tense,
                                                    $parent-mood,
                                                    $parent-voice,
                                                    
                                                    ./@DepDist,
                                                    ./@relation,
                                                    $tense,
                                                    $mood,
                                                    $voice
                                                    ), '|')"/>

                                        </DD-rel-morph-g2x-parent-number-self-tense-mood-voice-sWord-1>


                                        <xsl:if test="./person">


                                            <DD-rel-morph-g2x-parent-number-self-person-number-tense-mood-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $number,
                                                        $tense,
                                                        $mood
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-person-number-tense-mood-sWord-1>



                                            <DD-rel-morph-g2x-parent-number-self-person-number-tense-voice-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $number,
                                                        $tense,
                                                        $voice
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-person-number-tense-voice-sWord-1>


                                            <DD-rel-morph-g2x-parent-number-self-person-number-mood-voice-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $number,
                                                        $mood,
                                                        $voice
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-person-number-mood-voice-sWord-1>


                                            <DD-rel-morph-g2x-parent-number-self-person-tense-mood-voice-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $tense,
                                                        $mood,
                                                        $voice
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-person-tense-mood-voice-sWord-1>

                                        </xsl:if>

                                        <!-- XXXX number-tense-mood-voice -->
                                        <xsl:if test="./number">


                                            <DD-rel-morph-g2x-parent-number-self-number-tense-mood-voice-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        $tense,
                                                        $mood,
                                                        $voice
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-number-tense-mood-voice-sWord-1>

                                        </xsl:if>

                                        <!-- XXXX person-number-tense-mood-voice -->
                                        <xsl:if test="person">

                                            <DD-rel-morph-g2x-parent-number-self-person-number-tense-mood-voice-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $person,
                                                        $number,
                                                        $tense,
                                                        $mood,
                                                        $voice
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-person-number-tense-mood-voice-sWord-1>

                                        </xsl:if>

                                        <xsl:if test="./mood = 'participle'">

                                            <DD-rel-morph-g2x-parent-number-self-tense-gender-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $tense,
                                                        $gender
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-tense-gender-sWord-1>

                                            <DD-rel-morph-g2x-parent-number-self-tense-case-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $tense,
                                                        $case
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-tense-case-sWord-1>

                                            <DD-rel-morph-g2x-parent-number-self-voice-gender-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $voice,
                                                        $gender
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-voice-gender-sWord-1>


                                            <DD-rel-morph-g2x-parent-number-self-voice-case-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $voice,
                                                        $case
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-voice-case-sWord-1>



                                            <DD-rel-morph-g2x-parent-number-self-number-tense-gender-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        
                                                        $tense,
                                                        $gender
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-number-tense-gender-sWord-1>

                                            <DD-rel-morph-g2x-parent-number-self-number-tense-case-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        
                                                        $tense,
                                                        $case
                                                        ), '|')"/>


                                            </DD-rel-morph-g2x-parent-number-self-number-tense-case-sWord-1>


                                            <DD-rel-morph-g2x-parent-number-self-number-voice-gender-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        
                                                        $voice,
                                                        $gender
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-number-voice-gender-sWord-1>


                                            <DD-rel-morph-g2x-parent-number-self-number-voice-case-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        
                                                        $voice,
                                                        $case
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-number-voice-case-sWord-1>


                                            <DD-rel-morph-g2x-parent-number-self-tense-gender-case-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $tense,
                                                        
                                                        $gender,
                                                        $case
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-tense-gender-case-sWord-1>

                                            <DD-rel-morph-g2x-parent-number-self-voice-gender-case-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $voice,
                                                        
                                                        $gender,
                                                        $case
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-voice-gender-case-sWord-1>


                                            <DD-rel-morph-g2x-parent-number-self-tense-voice-gender-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $tense,
                                                        $voice,
                                                        $gender
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-tense-voice-gender-sWord-1>


                                            <DD-rel-morph-g2x-parent-number-self-tense-voice-case-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $tense,
                                                        $voice,
                                                        $case
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-tense-voice-case-sWord-1>


                                            <DD-rel-morph-g2x-parent-number-self-tense-voice-gender-case-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $tense,
                                                        $voice,
                                                        
                                                        $gender,
                                                        $case
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-tense-voice-gender-case-sWord-1>


                                            <DD-rel-morph-g2x-parent-number-self-number-tense-gender-case-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        $tense,
                                                        
                                                        $gender,
                                                        $case
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-number-tense-gender-case-sWord-1>


                                            <DD-rel-morph-g2x-parent-number-self-number-voice-gender-case-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        $voice,
                                                        
                                                        $gender,
                                                        $case
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-number-voice-gender-case-sWord-1>


                                            <DD-rel-morph-g2x-parent-number-self-number-tense-voice-gender-case-sWord-1>
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="./@cite"/>
                                                </xsl:attribute>

                                                <xsl:value-of
                                                  select="
                                                        string-join((
                                                        parent::sentence/word[@id = $head_2]/@DepDist,
                                                        parent::sentence/word[@id = $head_2]/@relation,
                                                        $g2x-parent-number,
                                                        parent::sentence/word[@id = $head_1]/@DepDist,
                                                        parent::sentence/word[@id = $head_1]/@relation,
                                                        
                                                        ./@DepDist,
                                                        ./@relation,
                                                        $number,
                                                        $tense,
                                                        $voice,
                                                        
                                                        $gender,
                                                        $case
                                                        ), '|')"/>

                                            </DD-rel-morph-g2x-parent-number-self-number-tense-voice-gender-case-sWord-1>



                                            <!-- XXXX -->

                                        </xsl:if>


                                    
                                        
                                    </xsl:if>
                                    
                                    



                                    <!-- End of 1 variables -->


                                </xsl:when>
                            </xsl:choose>



                        </xsl:when>
                    </xsl:choose>

                </word>


            </xsl:for-each>


        </test_document>


    </xsl:template>

</xsl:stylesheet>
