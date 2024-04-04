<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  
  <!-- Template principal -->
  <xsl:template match="/">
    <kml xmlns="http://www.opengis.net/kml/2.2">
      <Document>
        <!-- Afegeix el nom de la ruta -->
        <name><xsl:value-of select="ruta/nom"/></name>
        <!-- Processa els trackpoints -->
        <xsl:apply-templates select="ruta/trackpoints/trackpoint"/>
        <!-- Processa els punts d'interès -->
        <xsl:apply-templates select="ruta/puntsinteres/pdi"/>
      </Document>
    </kml>
  </xsl:template>
  
  <!-- Template per als trackpoints -->
  <xsl:template match="trackpoint">
    <Placemark>
      <Point>
        <coordinates><xsl:value-of select="cord/long"/>,<xsl:value-of select="cord/lat"/>,<xsl:value-of select="cord/alt"/></coordinates>
      </Point>
      <TimeStamp>
        <when><xsl:value-of select="datahora"/></when>
      </TimeStamp>
    </Placemark>
  </xsl:template>
  
  <!-- Template per als punts d'interès -->
  <xsl:template match="pdi">
    <Placemark>
      <name><xsl:value-of select="nom"/></name>
      <Point>
        <coordinates><xsl:value-of select="cord/long"/>,<xsl:value-of select="cord/lat"/>,<xsl:value-of select="cord/alt"/></coordinates>
      </Point>
      <TimeStamp>
        <when><xsl:value-of select="datahora"/></when>
      </TimeStamp>
    </Placemark>
  </xsl:template>
  
</xsl:stylesheet>
