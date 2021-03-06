<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="2.0"  xmlns:skos="http://www.w3.org/2004/02/skos/core#" 
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" 
  xmlns:tei="http://www.tei-c.org/ns/1.0" 
  xmlns="http://www.tei-c.org/ns/1.0" 
  exclude-result-prefixes="tei">
  
  <xsl:template match="@* | node()">
    <xsl:copy copy-namespaces="yes">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- Object Type   -->
  <xsl:template match="tei:objectType">
    <xsl:variable name="noquestion" select=".">
      <!-- <xsl:analyze-string select="." regex="(\w+)\?">
      <xsl:matching-substring>
        <xsl:value-of select="regex-group(1)"/>
      </xsl:matching-substring>            
      <xsl:non-matching-substring>
        <xsl:value-of select="."/>
      </xsl:non-matching-substring>
    </xsl:analyze-string> -->
    </xsl:variable>    
    <xsl:copy>
      <xsl:copy-of select="@*[not(local-name()='ref')]"/>
      <xsl:if test="text()">
        <xsl:variable name="voc_term">
          <xsl:value-of select="document('eagle-vocabulary-object-type.rdf')//skos:prefLabel[lower-case(.)=lower-case($noquestion)]/parent::skos:Concept/@rdf:about"/>
          <xsl:value-of select="document('eagle-vocabulary-object-type.rdf')//skos:altLabel[lower-case(.)=lower-case($noquestion)]/parent::skos:Concept/@rdf:about"/>
        </xsl:variable>
        <xsl:if test="$voc_term!=''">          
            <xsl:attribute name="ref">
              <xsl:value-of select="$voc_term"/>
            </xsl:attribute>                    
        </xsl:if>
      </xsl:if>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <!-- Material   -->
  <xsl:template match="tei:material">
    <xsl:variable name="noquestion" select="."><!-- <xsl:analyze-string select="." regex="(\w+)\?">
      <xsl:matching-substring>
        <xsl:value-of select="regex-group(1)"/>
      </xsl:matching-substring>            
      <xsl:non-matching-substring>
        <xsl:value-of select="."/>
      </xsl:non-matching-substring>
    </xsl:analyze-string> -->
    </xsl:variable>    
    <xsl:copy>
      <xsl:copy-of select="@*[not(local-name()='ref')]"/>
      <xsl:if test="text()">
        <xsl:variable name="voc_term">
          <xsl:value-of select="document('eagle-vocabulary-material.rdf')//skos:prefLabel[lower-case(.)=lower-case($noquestion)]/parent::skos:Concept/@rdf:about"/>
          <xsl:value-of select="document('eagle-vocabulary-material.rdf')//skos:altLabel[lower-case(.)=lower-case($noquestion)]/parent::skos:Concept/@rdf:about"/>
        </xsl:variable>
        <xsl:if test="$voc_term!=''">          
          <xsl:attribute name="ref">
            <xsl:value-of select="$voc_term"/>
          </xsl:attribute>          
        </xsl:if>
      </xsl:if>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <!--  Type of Inscription  -->
  <xsl:template match="tei:term">
    <xsl:variable name="noquestion" select="."><!-- <xsl:analyze-string select="." regex="(\w+)\?">
      <xsl:matching-substring>
        <xsl:value-of select="regex-group(1)"/>
      </xsl:matching-substring>            
      <xsl:non-matching-substring>
        <xsl:value-of select="."/>
      </xsl:non-matching-substring>
    </xsl:analyze-string> -->
    </xsl:variable>
    <xsl:copy>
      <xsl:copy-of select="@*[not(local-name()='ref')]"/>      
      <xsl:if test="text()">
        <xsl:variable name="voc_term">
          <xsl:value-of select="document('eagle-vocabulary-type-of-inscription.rdf')//skos:prefLabel[lower-case(.)=lower-case($noquestion)]/parent::skos:Concept/@rdf:about"/>
          <xsl:value-of select="document('eagle-vocabulary-type-of-inscription.rdf')//skos:altLabel[lower-case(.)=lower-case($noquestion)]/parent::skos:Concept/@rdf:about"/>
        </xsl:variable>
        <xsl:if test="$voc_term!=''">          
          <xsl:attribute name="ref">
            <xsl:value-of select="$voc_term"/>
          </xsl:attribute>                    
        </xsl:if>
      </xsl:if>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <!--  Writing  -->
  <!--   GIVES PROBLEMS!!! probably due to vocabulary file -->
  <xsl:template match="tei:rs[@type='exectution']">
    <xsl:variable name="noquestion" select="."><!-- <xsl:analyze-string select="." regex="(\w+)\?">
      <xsl:matching-substring>
        <xsl:value-of select="regex-group(1)"/>
      </xsl:matching-substring>            
      <xsl:non-matching-substring>
        <xsl:value-of select="."/>
      </xsl:non-matching-substring>
    </xsl:analyze-string> -->
    </xsl:variable>
    <xsl:copy>
      <xsl:copy-of select="@*[not(local-name()='ref')]"/>      
      <xsl:if test="text()">
        <xsl:variable name="voc_term">
          <xsl:value-of select="document('eagle-vocabulary-writing.rdf')//skos:prefLabel[lower-case(.)=lower-case($noquestion)]/parent::skos:Concept/@rdf:about"/>
          <xsl:value-of select="document('eagle-vocabulary-writing.rdf')//skos:altLabel[lower-case(.)=lower-case($noquestion)]/parent::skos:Concept/@rdf:about"/>
        </xsl:variable>
        <xsl:if test="$voc_term!=''">          
          <xsl:attribute name="ref">
            <xsl:value-of select="$voc_term"/>
          </xsl:attribute>                    
        </xsl:if>
      </xsl:if>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <!--  Dating Criteria -->
  <xsl:template match="tei:origDate">
    <xsl:variable name="noquestion" select="."><!-- <xsl:analyze-string select="." regex="(\w+)\?">
      <xsl:matching-substring>
        <xsl:value-of select="regex-group(1)"/>
      </xsl:matching-substring>            
      <xsl:non-matching-substring>
        <xsl:value-of select="."/>
      </xsl:non-matching-substring>
    </xsl:analyze-string> -->
    </xsl:variable>
    <xsl:copy>
      <xsl:copy-of select="@*[not(local-name()='period')]"/>
      <xsl:if test="text()">
        <xsl:variable name="voc_term">
          <xsl:value-of select="document('eagle-vocabulary-dating-criteria.rdf')//skos:prefLabel[lower-case(.)=lower-case($noquestion)]/parent::skos:Concept/@rdf:about"/>
          <xsl:value-of select="document('eagle-vocabulary-dating-criteria.rdf')//skos:altLabel[lower-case(.)=lower-case($noquestion)]/parent::skos:Concept/@rdf:about"/>
        </xsl:variable>
        <xsl:if test="$voc_term!=''">          
          <xsl:attribute name="ref">
            <xsl:value-of select="$voc_term"/>
          </xsl:attribute>                    
        </xsl:if>
      </xsl:if>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template> 
  
  <!--  Decoration  -->
  <xsl:template match="tei:rs[@type='decoration']">
    <xsl:variable name="noquestion" select="."><!-- <xsl:analyze-string select="." regex="(\w+)\?">
      <xsl:matching-substring>
        <xsl:value-of select="regex-group(1)"/>
      </xsl:matching-substring>            
      <xsl:non-matching-substring>
        <xsl:value-of select="."/>
      </xsl:non-matching-substring>
    </xsl:analyze-string> -->
    </xsl:variable>
    <xsl:copy>
      <xsl:copy-of select="@*[not(local-name()='ref')]"/>
      <xsl:if test="text()">
        <xsl:variable name="voc_term">
          <xsl:value-of select="document('eagle-vocabulary-decoration.rdf')//skos:prefLabel[lower-case(.)=lower-case($noquestion)]/parent::skos:Concept/@rdf:about"/>
          <xsl:value-of select="document('eagle-vocabulary-decoration.rdf')//skos:altLabel[lower-case(.)=lower-case($noquestion)]/parent::skos:Concept/@rdf:about"/>
        </xsl:variable>
        <xsl:if test="$voc_term!=''">          
          <xsl:attribute name="ref">
            <xsl:value-of select="$voc_term"/>
          </xsl:attribute>                    
        </xsl:if>
      </xsl:if>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <!--  state preservation  -->
  <xsl:template match="tei:rs[@type='statPreserv']">
    <xsl:variable name="noquestion" select="."><!-- <xsl:analyze-string select="." regex="(\w+)\?">
      <xsl:matching-substring>
        <xsl:value-of select="regex-group(1)"/>
      </xsl:matching-substring>            
      <xsl:non-matching-substring>
        <xsl:value-of select="."/>
      </xsl:non-matching-substring>
    </xsl:analyze-string> -->
    </xsl:variable>
    <xsl:copy>
      <xsl:copy-of select="@*[not(local-name()='ref')]"/>
      <xsl:if test="text()">
        <xsl:variable name="voc_term">
          <xsl:value-of select="document('eagle-vocabulary-state-of-preservation.rdf')//skos:prefLabel[lower-case(.)=lower-case($noquestion)]/parent::skos:Concept/@rdf:about"/>
          <xsl:value-of select="document('eagle-vocabulary-state-of-preservation.rdf')//skos:altLabel[lower-case(.)=lower-case($noquestion)]/parent::skos:Concept/@rdf:about"/>
        </xsl:variable>
        <xsl:if test="$voc_term!=''">          
          <xsl:attribute name="ref">
            <xsl:value-of select="$voc_term"/>
          </xsl:attribute>                    
        </xsl:if>
      </xsl:if>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>