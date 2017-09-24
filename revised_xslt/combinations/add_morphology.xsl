<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="word[not(@lemma)]">
        <word>
            <xsl:attribute name="lemma">NA</xsl:attribute>
            <xsl:copy-of select="@*"/>
        </word>
    </xsl:template>
    
    <xsl:template match="word[not(@postag)]">
        <word>
            <xsl:attribute name="postag">NA</xsl:attribute>
            <xsl:copy-of select="@*"/>
        </word>
    </xsl:template>
    
    <xsl:template match="word[not(@form)]">
        <word>
            <xsl:attribute name="form">NA</xsl:attribute>
            <xsl:copy-of select="@*"/>
        </word>
    </xsl:template>
    
    <xsl:template match="word">
        
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
                <xsl:when test="$pos='d'">
                    <xsl:attribute name="morph-pos">adverb</xsl:attribute>
                </xsl:when>
                <xsl:when test="$pos='l'">
                    <xsl:attribute name="morph-pos">article</xsl:attribute>
                </xsl:when>
                <xsl:when test="$pos='v'">
                    <xsl:attribute name="morph-pos">verb</xsl:attribute>
                </xsl:when>
                <xsl:when test="$pos='a'">
                    <xsl:attribute name="morph-pos">adjective</xsl:attribute>
                </xsl:when>
                <xsl:when test="$pos='p'">
                    <xsl:attribute name="morph-pos">preposition</xsl:attribute>
                </xsl:when>
                <xsl:when test="$pos='n'">
                    <xsl:attribute name="morph-pos">noun</xsl:attribute>
                </xsl:when>
                <xsl:when test="$pos='c'">
                    <xsl:attribute name="morph-pos">conjunction</xsl:attribute>
                </xsl:when>
                <xsl:when test="$pos='u'">
                    <xsl:attribute name="morph-pos">punctuation</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="morph-pos">NA</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:choose>
                <xsl:when test="$person='1'">
                    <xsl:attribute name="morph-person">firstPerson</xsl:attribute>
                </xsl:when>
                <xsl:when test="$person='2'">
                    <xsl:attribute name="morph-person">secondPerson</xsl:attribute>
                </xsl:when>
                <xsl:when test="$person='3'">
                    <xsl:attribute name="morph-person">thirdPerson</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="morph-person">NA</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:choose>
                <xsl:when test="$number='s'">
                    <xsl:attribute name="morph-number">singular</xsl:attribute>
                </xsl:when>
                <xsl:when test="$number='p'">
                    <xsl:attribute name="morph-number">plural</xsl:attribute>
                </xsl:when>
                <xsl:when test="$number='d'">
                    <xsl:attribute name="morph-number">dual</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="morph-number">NA</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:choose>
                <xsl:when test="$tense='p'">
                    <xsl:attribute name="morph-tense">present</xsl:attribute>
                </xsl:when>
                <xsl:when test="$tense='i'">
                    <xsl:attribute name="morph-tense">imperfect</xsl:attribute>
                </xsl:when>
                <xsl:when test="$tense='a'">
                    <xsl:attribute name="morph-tense">aorist</xsl:attribute>
                </xsl:when>
                <xsl:when test="$tense='r'">
                    <xsl:attribute name="morph-tense">perfect</xsl:attribute>
                </xsl:when>
                <xsl:when test="$tense='l'">
                    <xsl:attribute name="morph-tense">pluperfect</xsl:attribute>
                </xsl:when>
                <xsl:when test="$tense='f'">
                    <xsl:attribute name="morph-tense">future</xsl:attribute>
                </xsl:when>
                <xsl:when test="$tense='t'">
                    <xsl:attribute name="morph-tense">futurePerfect</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="morph-tense">NA</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:choose>
                <xsl:when test="$mood='i'">
                    <xsl:attribute name="morph-mood">indicative</xsl:attribute>
                </xsl:when>
                <xsl:when test="$mood='s'">
                    <xsl:attribute name="morph-mood">subjunctive</xsl:attribute>
                </xsl:when>
                <xsl:when test="$mood='o'">
                    <xsl:attribute name="morph-mood">optative</xsl:attribute>
                </xsl:when>
                <xsl:when test="$mood='n'">
                    <xsl:attribute name="morph-mood">infinitive</xsl:attribute>
                </xsl:when>
                <xsl:when test="$mood='p'">
                    <xsl:attribute name="morph-mood">participle</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="morph-mood">NA</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:choose>
                <xsl:when test="$mood='a'">
                    <xsl:attribute name="morph-voice">active</xsl:attribute>
                </xsl:when>
                <xsl:when test="$mood='p'">
                    <xsl:attribute name="morph-voice">passive</xsl:attribute>
                </xsl:when>
                <xsl:when test="$mood='m'">
                    <xsl:attribute name="morph-voice">middle</xsl:attribute>
                </xsl:when>
                <xsl:when test="$mood='e'">
                    <xsl:attribute name="morph-voice">deponent</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="morph-voice">NA</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:choose>
                <xsl:when test="$gender='m'">
                    <xsl:attribute name="morph-gender">masculine</xsl:attribute>
                </xsl:when>
                <xsl:when test="$gender='f'">
                    <xsl:attribute name="morph-gender">feminine</xsl:attribute>
                </xsl:when>
                <xsl:when test="$gender='n'">
                    <xsl:attribute name="morph-gender">neuter</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="morph-gender">NA</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:choose>
                <xsl:when test="$case='n'">
                    <xsl:attribute name="morph-case">nominative</xsl:attribute>
                </xsl:when>
                <xsl:when test="$case='g'">
                    <xsl:attribute name="morph-case">genitive</xsl:attribute>
                </xsl:when>
                <xsl:when test="$case='d'">
                    <xsl:attribute name="morph-case">dative</xsl:attribute>
                </xsl:when>
                <xsl:when test="$case='a'">
                    <xsl:attribute name="morph-case">accusative</xsl:attribute>
                </xsl:when>
                <xsl:when test="$case='b'">
                    <xsl:attribute name="morph-case">ablative</xsl:attribute>
                </xsl:when>
                <xsl:when test="$case='v'">
                    <xsl:attribute name="morph-case">vocative</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="morph-case">NA</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:choose>
                <xsl:when test="$degree='p'">
                    <xsl:attribute name="morph-degree">positive</xsl:attribute>
                </xsl:when>
                <xsl:when test="$degree='c'">
                    <xsl:attribute name="morph-degree">comparative</xsl:attribute>
                </xsl:when>
                <xsl:when test="$degree='s'">
                    <xsl:attribute name="morph-degree">superlative</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="morph-degree">NA</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            
        </word>
    </xsl:template>
    
</xsl:stylesheet>