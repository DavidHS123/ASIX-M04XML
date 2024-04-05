<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:kml="http://www.opengis.net/kml/2.0">
    <xsl:template match="/">
        <kml:kml xmlns:kml="http://www.opengis.net/kml/2.0">
            <kml:Document>
                <kml:name>Trackpoints i Punts d'Interès</kml:name>
                <Style id="redline"> 
                    <LineStyle> 
                        <color>ff0000ff</color> 
                        <width>6</width> 
                    </LineStyle> 
                    <PolyStyle> 
                        <color>f£f0000ff</color>
                    </PolyStyle> 
                </Style>
                <xsl:apply-templates select="ruta"/>
            </kml:Document>
        </kml:kml>
    </xsl:template>
    
    <xsl:template match="ruta">
        <kml:Placemark>
            <name>clampedtoGround</name>
            <styleUrl>#redline</styleUrl>
            <LineString> 
                <extrude>1</extrude> 
                <tessellate>1</tessellate> 
                <coordinates>
                    <xsl:for-each select="trackpoints/trackpoint">
                        <xsl:value-of select="cord/long"/>,<xsl:value-of select="cord/lat"/>,<xsl:value-of select="cord/alt"/><xsl:text> </xsl:text><xsl:text>&#10;</xsl:text>
                    </xsl:for-each>
                </coordinates>
            </LineString>
        </kml:Placemark>
        <xsl:apply-templates select="puntsinteres/pdi"/>
    </xsl:template>
    
    <xsl:template match="pdi">
        <kml:Placemark>
            <kml:name><xsl:value-of select="nom"/></kml:name>
            <kml:Point>
                <kml:coordinates>
                    <xsl:value-of select="cord/long"/>,<xsl:value-of select="cord/lat"/>,<xsl:value-of select="cord/alt"/>
                </kml:coordinates>
                <kml:description>Data i Hora: <xsl:value-of select="datahora"/></kml:description>
            </kml:Point>
        </kml:Placemark>
    </xsl:template>
</xsl:stylesheet>
