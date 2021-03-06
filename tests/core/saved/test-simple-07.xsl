<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="*" mode="one">
    <one>
      <xsl:value-of select="."/>
    </one>
  </xsl:template>
  <xsl:template match="*" mode="two">
    <two>
      <xsl:value-of select="string-length(.)"/>
    </two>
  </xsl:template>
  <xsl:template match="random" mode="two">
    <xxx>
      <xsl:value-of select="string-length(.)"/>
    </xxx>
  </xsl:template>
  <xsl:template match="doc">
    <top>
      <xsl:apply-templates select="version" mode="one"/>
      <xsl:apply-templates select="version" mode="two"/>
    </top>
  </xsl:template>
</xsl:stylesheet>
