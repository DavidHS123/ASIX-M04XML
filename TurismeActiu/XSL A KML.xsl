<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output encoding="utf-8" indent="yes"/>
    <xsl:template match="/">
        <kml xmlns=" ttp://earth.google.com/kml/2.0">
            <Document> 
                <xsl:for-each select="pdi"></xsl:for-each>
                <Placemark> 
                    <name><xsl:value-of select="turismeactiugirona/puntsInteres/puntInteres/nom"/></name> 
                    <description><xsl:value-of select="turismeactiugirona/puntsInteres/puntInteres/nom"/></description> 
                    <Point> 
                        <coordinates><xsl:value-of select="turismeactiugirona/puntsInteres/puntInteres/longitud"/>,<xsl:value-of select= "turismeactiugirona/puntsInteres/puntInteres/latitud"/>,<xsl:value-of select= "turismeactiugirona/puntsInteres/puntInteres/elevacio"/></coordinates> 
                    </Point> 
                </Placemark> 
            </Document> 
        </kml>
    </xsl:template>
</xsl:stylesheet>