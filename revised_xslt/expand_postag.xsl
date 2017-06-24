<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="subTree_document">
        <subTree_document>
            <xsl:for-each select="sentence">
                <sentence>
                    <xsl:copy-of select="@*"/>
                    <xsl:for-each select="word">

                        <xsl:variable name="pos" select="substring(./@postag, 1, 1)"/>
                        <xsl:variable name="person" select="substring(./@postag, 2, 1)"/>
                        <xsl:variable name="number" select="substring(./@postag, 3, 1)"/>
                        <xsl:variable name="tense" select="substring(./@postag, 4, 1)"/>
                        <xsl:variable name="mood" select="substring(./@postag, 5, 1)"/>
                        <xsl:variable name="voice" select="substring(./@postag, 6, 1)"/>
                        <xsl:variable name="gender" select="substring(./@postag, 7, 1)"/>
                        <xsl:variable name="case" select="substring(./@postag, 8, 1)"/>
                        <xsl:variable name="degree" select="substring(./@postag, 9, 1)"/>



                        <word>
                            <xsl:copy-of select="@*"/>
                            <xsl:choose>
                                <xsl:when test="$pos = 'v'">
                                    <pos>verb</pos>

                                    <xsl:choose>
                                        <xsl:when test="$mood = 'i' or $mood = 's' or $mood = 'o'">
                                            <xsl:choose>
                                                <xsl:when test="$person = '1'">
                                                  <person>first</person>
                                                </xsl:when>
                                                <xsl:when test="$person = '2'">
                                                  <person>second</person>
                                                </xsl:when>
                                                <xsl:when test="$person = '3'">
                                                  <person>third</person>
                                                </xsl:when>
                                            </xsl:choose>


                                        </xsl:when>
                                    </xsl:choose>

                                    <xsl:choose>
                                        <xsl:when test="$number = 's'">
                                            <number>singular</number>
                                        </xsl:when>
                                        <xsl:when test="$number = 'p'">
                                            <number>plural</number>
                                        </xsl:when>
                                        <xsl:when test="$number = 'd'">
                                            <number>dual</number>
                                        </xsl:when>
                                    </xsl:choose>



                                    <xsl:choose>
                                        <xsl:when test="$tense = 'p'">
                                            <tense>present</tense>
                                        </xsl:when>
                                        <xsl:when test="$tense = 'i'">
                                            <tense>imperfect</tense>
                                        </xsl:when>
                                        <xsl:when test="$tense = 'a'">
                                            <tense>aorist</tense>
                                        </xsl:when>
                                        <xsl:when test="$tense = 'r'">
                                            <tense>perfect</tense>
                                        </xsl:when>
                                        <xsl:when test="$tense = 'l'">
                                            <tense>pluperfect</tense>
                                        </xsl:when>
                                        <xsl:when test="$tense = 'f'">
                                            <tense>future</tense>
                                        </xsl:when>
                                        <xsl:when test="$tense = 't'">
                                            <tense>futureperfect</tense>
                                        </xsl:when>

                                    </xsl:choose>

                                    <xsl:choose>
                                        <xsl:when test="$mood = 'i'">
                                            <mood>indicative</mood>
                                        </xsl:when>
                                        <xsl:when test="$mood = 's'">
                                            <mood>subjunctive</mood>
                                        </xsl:when>
                                        <xsl:when test="$mood = 'o'">
                                            <mood>optative</mood>
                                        </xsl:when>
                                        <xsl:when test="$mood = 'n'">
                                            <mood>infinitive</mood>
                                        </xsl:when>
                                        <xsl:when test="$mood = 'p'">
                                            <mood>participle</mood>
                                        </xsl:when>

                                    </xsl:choose>



                                    <xsl:choose>
                                        <xsl:when test="$voice = 'a'">
                                            <voice>active</voice>
                                        </xsl:when>
                                        <xsl:when test="$voice = 'p'">
                                            <voice>passive</voice>
                                        </xsl:when>
                                        <xsl:when test="$voice = 'm'">
                                            <voice>middle</voice>
                                        </xsl:when>
                                    </xsl:choose>

                                    <xsl:choose>
                                        <xsl:when test="$mood = 'p'">
                                            <xsl:choose>
                                                <xsl:when test="$gender = 'm'">
                                                  <gender>masculine</gender>
                                                </xsl:when>
                                                <xsl:when test="$gender = 'f'">
                                                  <gender>feminine</gender>
                                                </xsl:when>
                                                <xsl:when test="$gender = 'n'">
                                                  <gender>neuter</gender>
                                                </xsl:when>
                                            </xsl:choose>

                                            <xsl:choose>
                                                <xsl:when test="$case = 'n'">
                                                  <case>nominative</case>
                                                </xsl:when>
                                                <xsl:when test="$case = 'g'">
                                                  <case>genitive</case>
                                                </xsl:when>
                                                <xsl:when test="$case = 'd'">
                                                  <case>dative</case>
                                                </xsl:when>
                                                <xsl:when test="$case = 'a'">
                                                  <case>accusative</case>
                                                </xsl:when>
                                                <xsl:when test="$case = 'v'">
                                                  <case>vocative</case>
                                                </xsl:when>
                                            </xsl:choose>

                                        </xsl:when>

                                    </xsl:choose>






                                </xsl:when>

                            </xsl:choose>
                            <xsl:choose>
                                <xsl:when test="$pos = 'r'">
                                    <pos>preposition</pos>
                                </xsl:when>
                            </xsl:choose>
                            <xsl:choose>
                                <xsl:when
                                    test="$pos = 'n' or $pos = 'p' or $pos = 'l' or $pos = 'a'">
                                     
                                    <xsl:choose>
                                        
                                        <xsl:when test="$pos = 'n'">
                                            <pos>noun</pos>
                                        </xsl:when>
                                        <xsl:when test="$pos = 'p'">
                                            <pos>pronoun</pos>
                                        </xsl:when>
                                        <xsl:when test="$pos = 'l'">
                                            <pos>article</pos>
                                        </xsl:when>
                                        <xsl:when test="$pos = 'a'">
                                            <pos>adjective</pos>
                                        </xsl:when>
                                        
                                        
                                        
                                        <xsl:when test="$number = 's'">
                                            <number>singular</number>
                                        </xsl:when>
                                        <xsl:when test="$number = 'p'">
                                            <number>plural</number>
                                        </xsl:when>
                                        <xsl:when test="$number = 'd'">
                                            <number>dual</number>
                                        </xsl:when>
                                    </xsl:choose>

                                    <xsl:choose>
                                        <xsl:when test="$gender = 'm'">
                                            <gender>masculine</gender>
                                        </xsl:when>
                                        <xsl:when test="$gender = 'f'">
                                            <gender>feminine</gender>
                                        </xsl:when>
                                        <xsl:when test="$gender = 'n'">
                                            <gender>neuter</gender>
                                        </xsl:when>
                                    </xsl:choose>

                                    <xsl:choose>
                                        <xsl:when test="$case = 'n'">
                                            <case>nominative</case>
                                        </xsl:when>
                                        <xsl:when test="$case = 'g'">
                                            <case>genitive</case>
                                        </xsl:when>
                                        <xsl:when test="$case = 'd'">
                                            <case>dative</case>
                                        </xsl:when>
                                        <xsl:when test="$case = 'a'">
                                            <case>accusative</case>
                                        </xsl:when>
                                        <xsl:when test="$case = 'v'">
                                            <case>vocative</case>
                                        </xsl:when>
                                    </xsl:choose>

                                    <xsl:choose>
                                        <xsl:when test="$degree = 'c'">
                                            <degree>comparitive</degree>
                                        </xsl:when>
                                        <xsl:when test="$degree = 's'">
                                            <degree>superlative</degree>
                                        </xsl:when>

                                    </xsl:choose>



                                </xsl:when>
                            </xsl:choose>
                       <xsl:choose>
                           <xsl:when test="$pos = 'c'">
                               <pos>conjunction</pos>
                           </xsl:when>
                       </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="$pos = 'd'">
                                <pos>adverb</pos>
                            </xsl:when>
                            <xsl:when test="$degree = 'c'">
                                <degree>comparitive</degree>
                            </xsl:when>
                            <xsl:when test="$degree = 's'">
                                <degree>superlative</degree>
                            </xsl:when>
                            
                            
                        </xsl:choose>    
                        <xsl:choose>
                            <xsl:when test="$pos = 'u'">
                                <pos>punctuation</pos>
                            </xsl:when>
                        </xsl:choose>
                        </word>

                    </xsl:for-each>

                </sentence>

            </xsl:for-each>

        </subTree_document>

    </xsl:template>


</xsl:stylesheet>
