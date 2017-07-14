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



        <word>

          <xsl:copy-of select="@*"/>
          <xsl:copy-of select="node()"/>

          <xsl:choose>
            <xsl:when
              test="
                $pos = 'noun'
                or $pos = 'adjective'
                or $pos = 'article'
                or $pos = 'pronoun'">

              <!-- start of sWord 1 -->
              <xsl:if test="$pos">

                <DD-rel-nominal-morph-self-pos-sWord-0>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      ./@DepDist,
                      ./@relation,
                      $pos
                      ), '|')"/>

                </DD-rel-nominal-morph-self-pos-sWord-0>


              </xsl:if>

              <xsl:if test="$number">

                <DD-rel-nominal-morph-self-number-sWord-0>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      ./@DepDist,
                      ./@relation,
                      $number
                      ), '|')"/>

                </DD-rel-nominal-morph-self-number-sWord-0>


              </xsl:if>

              <xsl:if test="$gender">

                <DD-rel-nominal-morph-self-gender-sWord-0>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      ./@DepDist,
                      ./@relation,
                      $gender
                      ), '|')"/>

                </DD-rel-nominal-morph-self-gender-sWord-0>


              </xsl:if>

              <xsl:if test="$case">

                <DD-rel-nominal-morph-self-case-sWord-0>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      ./@DepDist,
                      ./@relation,
                      $case
                      ), '|')"/>

                </DD-rel-nominal-morph-self-case-sWord-0>


              </xsl:if>

              <xsl:if test="$degree">

                <DD-rel-nominal-morph-self-degree-sWord-0>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      ./@DepDist,
                      ./@relation,
                      $degree
                      ), '|')"/>

                </DD-rel-nominal-morph-self-degree-sWord-0>


              </xsl:if>

              <!-- start of 2 variables -->

              <xsl:if test="$pos and $number">

                <DD-rel-nominal-morph-self-pos-number-sWord-0>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      ./@DepDist,
                      ./@relation,
                      $pos,
                      $number
                      ), '|')"/>

                </DD-rel-nominal-morph-self-pos-number-sWord-0>


              </xsl:if>

              <xsl:if test="$pos and $gender">

                <DD-rel-nominal-morph-self-pos-gender-sWord-0>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      ./@DepDist,
                      ./@relation,
                      $pos,
                      $gender
                      ), '|')"/>

                </DD-rel-nominal-morph-self-pos-gender-sWord-0>


              </xsl:if>

              <xsl:if test="$pos and $case">

                <DD-rel-nominal-morph-self-pos-case-sWord-0>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      ./@DepDist,
                      ./@relation,
                      $pos,
                      $case
                      ), '|')"/>

                </DD-rel-nominal-morph-self-pos-case-sWord-0>


              </xsl:if>

              <xsl:if test="$number and $gender">

                <DD-rel-nominal-morph-self-number-gender-sWord-0>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      ./@DepDist,
                      ./@relation,
                      $number,
                      $gender
                      ), '|')"/>

                </DD-rel-nominal-morph-self-number-gender-sWord-0>


              </xsl:if>

              <xsl:if test="$number and $case">

                <DD-rel-nominal-morph-self-number-case-sWord-0>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      ./@DepDist,
                      ./@relation,
                      $number,
                      $case
                      ), '|')"/>

                </DD-rel-nominal-morph-self-number-case-sWord-0>


              </xsl:if>

              <xsl:if test="$number and $degree">

                <DD-rel-nominal-morph-self-number-degree-sWord-0>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      ./@DepDist,
                      ./@relation,
                      $number,
                      $degree
                      ), '|')"/>

                </DD-rel-nominal-morph-self-number-degree-sWord-0>

              </xsl:if>

              <xsl:if test="$gender and $case">

                <DD-rel-nominal-morph-self-gender-case-sWord-0>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      ./@DepDist,
                      ./@relation,
                      $gender,
                      $case
                      ), '|')"/>

                </DD-rel-nominal-morph-self-gender-case-sWord-0>


              </xsl:if>

              <xsl:if test="$gender and $degree">

                <DD-rel-nominal-morph-self-gender-degree-sWord-0>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      ./@DepDist,
                      ./@relation,
                      $gender,
                      $degree
                      ), '|')"/>

                </DD-rel-nominal-morph-self-gender-degree-sWord-0>


              </xsl:if>

              <xsl:if test="$case and $degree">

                <DD-rel-nominal-morph-self-case-degree-sWord-0>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      ./@DepDist,
                      ./@relation,
                      $case,
                      $degree
                      ), '|')"/>

                </DD-rel-nominal-morph-self-case-degree-sWord-0>


              </xsl:if>

              <!-- start of 3 variables -->

              <xsl:if test="$pos and $number and $gender">

                <DD-rel-nominal-morph-self-pos-number-gender-sWord-0>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      ./@DepDist,
                      ./@relation,
                      $pos,
                      $number,
                      $gender
                      ), '|')"/>

                </DD-rel-nominal-morph-self-pos-number-gender-sWord-0>


              </xsl:if>

              <xsl:if test="$pos and $number and $case">

                <DD-rel-nominal-morph-self-pos-number-case-sWord-0>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      ./@DepDist,
                      ./@relation,
                      $pos,
                      $number,
                      $case
                      ), '|')"/>

                </DD-rel-nominal-morph-self-pos-number-case-sWord-0>

              </xsl:if>

              <xsl:if test="$pos and $gender and $case">

                <DD-rel-nominal-morph-self-pos-gender-case-sWord-0>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      ./@DepDist,
                      ./@relation,
                      $pos,
                      $gender,
                      $case
                      ), '|')"/>

                </DD-rel-nominal-morph-self-pos-gender-case-sWord-0>

              </xsl:if>

              <xsl:if test="$number and $gender and $case">

                <DD-rel-nominal-morph-self-number-gender-case-sWord-0>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      ./@DepDist,
                      ./@relation,
                      $number,
                      $gender,
                      $case
                      ), '|')"/>

                </DD-rel-nominal-morph-self-number-gender-case-sWord-0>

              </xsl:if>

              <xsl:if test="$number and $gender and $degree">

                <DD-rel-nominal-morph-self-number-gender-degree-sWord-0>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      ./@DepDist,
                      ./@relation,
                      $number,
                      $gender,
                      $degree
                      ), '|')"/>

                </DD-rel-nominal-morph-self-number-gender-degree-sWord-0>

              </xsl:if>

              <xsl:if test="$number and $case and $degree">

                <DD-rel-nominal-morph-self-number-case-degree-sWord-0>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      ./@DepDist,
                      ./@relation,
                      $number,
                      $case,
                      $degree
                      ), '|')"/>

                </DD-rel-nominal-morph-self-number-case-degree-sWord-0>

              </xsl:if>

              <xsl:if test="$gender and $case and $degree">

                <DD-rel-nominal-morph-self-gender-case-degree-sWord-0>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      ./@DepDist,
                      ./@relation,
                      $gender,
                      $case,
                      $degree
                      ), '|')"/>

                </DD-rel-nominal-morph-self-gender-case-degree-sWord-0>

              </xsl:if>

              <!-- start of 4 variables -->

              <xsl:if test="$pos and $number and $gender and $case">

                <DD-rel-nominal-morph-self-pos-number-gender-case-sWord-0>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      ./@DepDist,
                      ./@relation,
                      $pos,
                      $number,
                      $gender,
                      $case
                      ), '|')"/>

                </DD-rel-nominal-morph-self-pos-number-gender-case-sWord-0>


              </xsl:if>

              <xsl:if test="$number and $gender and $case and $degree">

                <DD-rel-nominal-morph-self-number-gender-case-degree-sWord-0>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      ./@DepDist,
                      ./@relation,
                      $number,
                      $gender,
                      $case,
                      $degree
                      ), '|')"/>

                </DD-rel-nominal-morph-self-number-gender-case-degree-sWord-0>

              </xsl:if>

              <!-- start of sWord 2 -->



              <xsl:if test="$pos">

                <DD-rel-nominal-morph-self-pos-sWord-1>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      parent::sentence/word[@id = $head_1]/@DepDist,
                      parent::sentence/word[@id = $head_1]/@relation,
                      ./@DepDist,
                      ./@relation,
                      $pos
                      ), '|')"/>

                </DD-rel-nominal-morph-self-pos-sWord-1>


              </xsl:if>

              <xsl:if test="$number">

                <DD-rel-nominal-morph-self-number-sWord-1>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      parent::sentence/word[@id = $head_1]/@DepDist,
                      parent::sentence/word[@id = $head_1]/@relation,
                      ./@DepDist,
                      ./@relation,
                      $number
                      ), '|')"/>

                </DD-rel-nominal-morph-self-number-sWord-1>


              </xsl:if>

              <xsl:if test="$gender">

                <DD-rel-nominal-morph-self-gender-sWord-1>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      parent::sentence/word[@id = $head_1]/@DepDist,
                      parent::sentence/word[@id = $head_1]/@relation,
                      ./@DepDist,
                      ./@relation,
                      $gender
                      ), '|')"/>

                </DD-rel-nominal-morph-self-gender-sWord-1>


              </xsl:if>

              <xsl:if test="$case">

                <DD-rel-nominal-morph-self-case-sWord-1>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      parent::sentence/word[@id = $head_1]/@DepDist,
                      parent::sentence/word[@id = $head_1]/@relation,
                      ./@DepDist,
                      ./@relation,
                      $case
                      ), '|')"/>

                </DD-rel-nominal-morph-self-case-sWord-1>


              </xsl:if>

              <xsl:if test="$degree">

                <DD-rel-nominal-morph-self-degree-sWord-1>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      parent::sentence/word[@id = $head_1]/@DepDist,
                      parent::sentence/word[@id = $head_1]/@relation,
                      ./@DepDist,
                      ./@relation,
                      $degree
                      ), '|')"/>

                </DD-rel-nominal-morph-self-degree-sWord-1>


              </xsl:if>

              <!-- start of 2 variables -->

              <xsl:if test="$pos and $number">

                <DD-rel-nominal-morph-self-pos-number-sWord-1>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      parent::sentence/word[@id = $head_1]/@DepDist,
                      parent::sentence/word[@id = $head_1]/@relation,
                      ./@DepDist,
                      ./@relation,
                      $pos,
                      $number
                      ), '|')"/>

                </DD-rel-nominal-morph-self-pos-number-sWord-1>


              </xsl:if>

              <xsl:if test="$pos and $gender">

                <DD-rel-nominal-morph-self-pos-gender-sWord-1>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      parent::sentence/word[@id = $head_1]/@DepDist,
                      parent::sentence/word[@id = $head_1]/@relation,
                      ./@DepDist,
                      ./@relation,
                      $pos,
                      $gender
                      ), '|')"/>

                </DD-rel-nominal-morph-self-pos-gender-sWord-1>


              </xsl:if>

              <xsl:if test="$pos and $case">

                <DD-rel-nominal-morph-self-pos-case-sWord-1>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      parent::sentence/word[@id = $head_1]/@DepDist,
                      parent::sentence/word[@id = $head_1]/@relation,
                      ./@DepDist,
                      ./@relation,
                      $pos,
                      $case
                      ), '|')"/>

                </DD-rel-nominal-morph-self-pos-case-sWord-1>


              </xsl:if>

              <xsl:if test="$number and $gender">

                <DD-rel-nominal-morph-self-number-gender-sWord-1>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      parent::sentence/word[@id = $head_1]/@DepDist,
                      parent::sentence/word[@id = $head_1]/@relation,
                      ./@DepDist,
                      ./@relation,
                      $number,
                      $gender
                      ), '|')"/>

                </DD-rel-nominal-morph-self-number-gender-sWord-1>


              </xsl:if>

              <xsl:if test="$number and $case">

                <DD-rel-nominal-morph-self-number-case-sWord-1>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      parent::sentence/word[@id = $head_1]/@DepDist,
                      parent::sentence/word[@id = $head_1]/@relation,
                      ./@DepDist,
                      ./@relation,
                      $number,
                      $case
                      ), '|')"/>

                </DD-rel-nominal-morph-self-number-case-sWord-1>


              </xsl:if>

              <xsl:if test="$number and $degree">

                <DD-rel-nominal-morph-self-number-degree-sWord-1>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      parent::sentence/word[@id = $head_1]/@DepDist,
                      parent::sentence/word[@id = $head_1]/@relation,
                      ./@DepDist,
                      ./@relation,
                      $number,
                      $degree
                      ), '|')"/>

                </DD-rel-nominal-morph-self-number-degree-sWord-1>

              </xsl:if>

              <xsl:if test="$gender and $case">

                <DD-rel-nominal-morph-self-gender-case-sWord-1>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      parent::sentence/word[@id = $head_1]/@DepDist,
                      parent::sentence/word[@id = $head_1]/@relation,
                      ./@DepDist,
                      ./@relation,
                      $gender,
                      $case
                      ), '|')"/>

                </DD-rel-nominal-morph-self-gender-case-sWord-1>


              </xsl:if>

              <xsl:if test="$gender and $degree">

                <DD-rel-nominal-morph-self-gender-degree-sWord-1>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      parent::sentence/word[@id = $head_1]/@DepDist,
                      parent::sentence/word[@id = $head_1]/@relation,
                      ./@DepDist,
                      ./@relation,
                      $gender,
                      $degree
                      ), '|')"/>

                </DD-rel-nominal-morph-self-gender-degree-sWord-1>


              </xsl:if>

              <xsl:if test="$case and $degree">

                <DD-rel-nominal-morph-self-case-degree-sWord-1>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      parent::sentence/word[@id = $head_1]/@DepDist,
                      parent::sentence/word[@id = $head_1]/@relation,
                      ./@DepDist,
                      ./@relation,
                      $case,
                      $degree
                      ), '|')"/>

                </DD-rel-nominal-morph-self-case-degree-sWord-1>


              </xsl:if>

              <!-- start of 3 variables -->

              <xsl:if test="$pos and $number and $gender">

                <DD-rel-nominal-morph-self-pos-number-gender-sWord-1>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      parent::sentence/word[@id = $head_1]/@DepDist,
                      parent::sentence/word[@id = $head_1]/@relation,
                      ./@DepDist,
                      ./@relation,
                      $pos,
                      $number,
                      $gender
                      ), '|')"/>

                </DD-rel-nominal-morph-self-pos-number-gender-sWord-1>


              </xsl:if>

              <xsl:if test="$pos and $number and $case">

                <DD-rel-nominal-morph-self-pos-number-case-sWord-1>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      parent::sentence/word[@id = $head_1]/@DepDist,
                      parent::sentence/word[@id = $head_1]/@relation,
                      ./@DepDist,
                      ./@relation,
                      $pos,
                      $number,
                      $case
                      ), '|')"/>

                </DD-rel-nominal-morph-self-pos-number-case-sWord-1>

              </xsl:if>

              <xsl:if test="$pos and $gender and $case">

                <DD-rel-nominal-morph-self-pos-gender-case-sWord-1>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      parent::sentence/word[@id = $head_1]/@DepDist,
                      parent::sentence/word[@id = $head_1]/@relation,
                      ./@DepDist,
                      ./@relation,
                      $pos,
                      $gender,
                      $case
                      ), '|')"/>

                </DD-rel-nominal-morph-self-pos-gender-case-sWord-1>

              </xsl:if>

              <xsl:if test="$number and $gender and $case">

                <DD-rel-nominal-morph-self-number-gender-case-sWord-1>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      parent::sentence/word[@id = $head_1]/@DepDist,
                      parent::sentence/word[@id = $head_1]/@relation,
                      ./@DepDist,
                      ./@relation,
                      $number,
                      $gender,
                      $case
                      ), '|')"/>

                </DD-rel-nominal-morph-self-number-gender-case-sWord-1>

              </xsl:if>

              <xsl:if test="$number and $gender and $degree">

                <DD-rel-nominal-morph-self-number-gender-degree-sWord-1>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      parent::sentence/word[@id = $head_1]/@DepDist,
                      parent::sentence/word[@id = $head_1]/@relation,
                      ./@DepDist,
                      ./@relation,
                      $number,
                      $gender,
                      $degree
                      ), '|')"/>

                </DD-rel-nominal-morph-self-number-gender-degree-sWord-1>

              </xsl:if>

              <xsl:if test="$number and $case and $degree">

                <DD-rel-nominal-morph-self-number-case-degree-sWord-1>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      parent::sentence/word[@id = $head_1]/@DepDist,
                      parent::sentence/word[@id = $head_1]/@relation,
                      ./@DepDist,
                      ./@relation,
                      $number,
                      $case,
                      $degree
                      ), '|')"/>

                </DD-rel-nominal-morph-self-number-case-degree-sWord-1>

              </xsl:if>

              <xsl:if test="$gender and $case and $degree">

                <DD-rel-nominal-morph-self-gender-case-degree-sWord-1>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      parent::sentence/word[@id = $head_1]/@DepDist,
                      parent::sentence/word[@id = $head_1]/@relation,
                      ./@DepDist,
                      ./@relation,
                      $gender,
                      $case,
                      $degree
                      ), '|')"/>

                </DD-rel-nominal-morph-self-gender-case-degree-sWord-1>

              </xsl:if>

              <!-- start of 4 variables -->

              <xsl:if test="$pos and $number and $gender and $case">

                <DD-rel-nominal-morph-self-pos-number-gender-case-sWord-1>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      parent::sentence/word[@id = $head_1]/@DepDist,
                      parent::sentence/word[@id = $head_1]/@relation,
                      ./@DepDist,
                      ./@relation,
                      $pos,
                      $number,
                      $gender,
                      $case
                      ), '|')"/>

                </DD-rel-nominal-morph-self-pos-number-gender-case-sWord-1>


              </xsl:if>

              <xsl:if test="$number and $gender and $case and $degree">

                <DD-rel-nominal-morph-self-number-gender-case-degree-sWord-1>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./@cite"/>
                  </xsl:attribute>

                  <xsl:value-of
                    select="
                      string-join((
                      parent::sentence/word[@id = $head_1]/@DepDist,
                      parent::sentence/word[@id = $head_1]/@relation,
                      ./@DepDist,
                      ./@relation,
                      $number,
                      $gender,
                      $case,
                      $degree
                      ), '|')"/>

                </DD-rel-nominal-morph-self-number-gender-case-degree-sWord-1>

              </xsl:if>



              <xsl:if test="$pos">

                <DD-rel-nominal-morph-self-pos-sWord-2>
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
                      ./@relation,
                      $pos
                      ), '|')"/>

                </DD-rel-nominal-morph-self-pos-sWord-2>


              </xsl:if>

              <xsl:if test="$number">

                <DD-rel-nominal-morph-self-number-sWord-2>
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
                      ./@relation,
                      $number
                      ), '|')"/>

                </DD-rel-nominal-morph-self-number-sWord-2>


              </xsl:if>

              <xsl:if test="$gender">

                <DD-rel-nominal-morph-self-gender-sWord-2>
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
                      ./@relation,
                      $gender
                      ), '|')"/>

                </DD-rel-nominal-morph-self-gender-sWord-2>


              </xsl:if>

              <xsl:if test="$case">

                <DD-rel-nominal-morph-self-case-sWord-2>
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
                      ./@relation,
                      $case
                      ), '|')"/>

                </DD-rel-nominal-morph-self-case-sWord-2>


              </xsl:if>

              <xsl:if test="$degree">

                <DD-rel-nominal-morph-self-degree-sWord-2>
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
                      ./@relation,
                      $degree
                      ), '|')"/>

                </DD-rel-nominal-morph-self-degree-sWord-2>


              </xsl:if>

              <!-- start of 2 variables -->

              <xsl:if test="$pos and $number">

                <DD-rel-nominal-morph-self-pos-number-sWord-2>
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
                      ./@relation,
                      $pos,
                      $number
                      ), '|')"/>

                </DD-rel-nominal-morph-self-pos-number-sWord-2>


              </xsl:if>

              <xsl:if test="$pos and $gender">

                <DD-rel-nominal-morph-self-pos-gender-sWord-2>
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
                      ./@relation,
                      $pos,
                      $gender
                      ), '|')"/>

                </DD-rel-nominal-morph-self-pos-gender-sWord-2>


              </xsl:if>

              <xsl:if test="$pos and $case">

                <DD-rel-nominal-morph-self-pos-case-sWord-2>
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
                      ./@relation,
                      $pos,
                      $case
                      ), '|')"/>

                </DD-rel-nominal-morph-self-pos-case-sWord-2>


              </xsl:if>

              <xsl:if test="$number and $gender">

                <DD-rel-nominal-morph-self-number-gender-sWord-2>
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
                      ./@relation,
                      $number,
                      $gender
                      ), '|')"/>

                </DD-rel-nominal-morph-self-number-gender-sWord-2>


              </xsl:if>

              <xsl:if test="$number and $case">

                <DD-rel-nominal-morph-self-number-case-sWord-2>
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
                      ./@relation,
                      $number,
                      $case
                      ), '|')"/>

                </DD-rel-nominal-morph-self-number-case-sWord-2>


              </xsl:if>

              <xsl:if test="$number and $degree">

                <DD-rel-nominal-morph-self-number-degree-sWord-2>
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
                      ./@relation,
                      $number,
                      $degree
                      ), '|')"/>

                </DD-rel-nominal-morph-self-number-degree-sWord-2>

              </xsl:if>

              <xsl:if test="$gender and $case">

                <DD-rel-nominal-morph-self-gender-case-sWord-2>
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
                      ./@relation,
                      $gender,
                      $case
                      ), '|')"/>

                </DD-rel-nominal-morph-self-gender-case-sWord-2>


              </xsl:if>

              <xsl:if test="$gender and $degree">

                <DD-rel-nominal-morph-self-gender-degree-sWord-2>
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
                      ./@relation,
                      $gender,
                      $degree
                      ), '|')"/>

                </DD-rel-nominal-morph-self-gender-degree-sWord-2>


              </xsl:if>

              <xsl:if test="$case and $degree">

                <DD-rel-nominal-morph-self-case-degree-sWord-2>
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
                      ./@relation,
                      $case,
                      $degree
                      ), '|')"/>

                </DD-rel-nominal-morph-self-case-degree-sWord-2>


              </xsl:if>

              <!-- start of 3 variables -->

              <xsl:if test="$pos and $number and $gender">

                <DD-rel-nominal-morph-self-pos-number-gender-sWord-2>
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
                      ./@relation,
                      $pos,
                      $number,
                      $gender
                      ), '|')"/>

                </DD-rel-nominal-morph-self-pos-number-gender-sWord-2>


              </xsl:if>

              <xsl:if test="$pos and $number and $case">

                <DD-rel-nominal-morph-self-pos-number-case-sWord-2>
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
                      ./@relation,
                      $pos,
                      $number,
                      $case
                      ), '|')"/>

                </DD-rel-nominal-morph-self-pos-number-case-sWord-2>

              </xsl:if>

              <xsl:if test="$pos and $gender and $case">

                <DD-rel-nominal-morph-self-pos-gender-case-sWord-2>
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
                      ./@relation,
                      $pos,
                      $gender,
                      $case
                      ), '|')"/>

                </DD-rel-nominal-morph-self-pos-gender-case-sWord-2>

              </xsl:if>

              <xsl:if test="$number and $gender and $case">

                <DD-rel-nominal-morph-self-number-gender-case-sWord-2>
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
                      ./@relation,
                      $number,
                      $gender,
                      $case
                      ), '|')"/>

                </DD-rel-nominal-morph-self-number-gender-case-sWord-2>

              </xsl:if>

              <xsl:if test="$number and $gender and $degree">

                <DD-rel-nominal-morph-self-number-gender-degree-sWord-2>
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
                      ./@relation,
                      $number,
                      $gender,
                      $degree
                      ), '|')"/>

                </DD-rel-nominal-morph-self-number-gender-degree-sWord-2>

              </xsl:if>

              <xsl:if test="$number and $case and $degree">

                <DD-rel-nominal-morph-self-number-case-degree-sWord-2>
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
                      ./@relation,
                      $number,
                      $case,
                      $degree
                      ), '|')"/>

                </DD-rel-nominal-morph-self-number-case-degree-sWord-2>

              </xsl:if>

              <xsl:if test="$gender and $case and $degree">

                <DD-rel-nominal-morph-self-gender-case-degree-sWord-2>
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
                      ./@relation,
                      $gender,
                      $case,
                      $degree
                      ), '|')"/>

                </DD-rel-nominal-morph-self-gender-case-degree-sWord-2>

              </xsl:if>

              <!-- start of 4 variables -->

              <xsl:if test="$pos and $number and $gender and $case">

                <DD-rel-nominal-morph-self-pos-number-gender-case-sWord-2>
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
                      ./@relation,
                      $pos,
                      $number,
                      $gender,
                      $case
                      ), '|')"/>

                </DD-rel-nominal-morph-self-pos-number-gender-case-sWord-2>


              </xsl:if>

              <xsl:if test="$number and $gender and $case and $degree">

                <DD-rel-nominal-morph-self-number-gender-case-degree-sWord-2>
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
                      ./@relation,
                      $number,
                      $gender,
                      $case,
                      $degree
                      ), '|')"/>

                </DD-rel-nominal-morph-self-number-gender-case-degree-sWord-2>

              </xsl:if>


            </xsl:when>
          </xsl:choose>
          
         <xsl:choose>
           <xsl:when test="$pos = 'noun'
             or $pos = 'adjective'
             or $pos = 'article'
             or $pos = 'pronoun'">
             
             <xsl:choose>
               <xsl:when test="$parent-pos = 'noun'
                 or $parent-pos = 'adjective'
                 or $parent-pos = 'article'
                 or $parent-pos = 'pronoun'">
                 
                 
                 <poop>poop</poop>
                 
               </xsl:when>
             </xsl:choose>
             
             
           </xsl:when>
         </xsl:choose>
          
        </word>


      </xsl:for-each>

    </sentence>




  </xsl:template>

</xsl:stylesheet>
