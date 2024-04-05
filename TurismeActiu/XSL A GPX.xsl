<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <gpx version="1.1" xmlns="http://www.topografix.com/GPX/1/1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><xsl:text>&#10;</xsl:text>
            <metadata><xsl:text>&#10;</xsl:text>
                <name>Trackpoints i Punts d'Interès</name><xsl:text>&#10;</xsl:text>
            </metadata><xsl:text>&#10;</xsl:text>
            <xsl:apply-templates select="ruta"/>
        </gpx>
    </xsl:template>
    
    <xsl:template match="ruta">
        <trk><xsl:text>&#10;</xsl:text>
            <name>Ruta</name><xsl:text>&#10;</xsl:text>
            <trkseg><xsl:text>&#10;</xsl:text>
                <xsl:apply-templates select="trackpoints/trackpoint"/>
            </trkseg><xsl:text>&#10;</xsl:text>
        </trk><xsl:text>&#10;</xsl:text>
        <xsl:apply-templates select="puntsinteres/pdi"/><xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <xsl:template match="trackpoint">
        <trkpt lat="{cord/lat}" lon="{cord/long}"><xsl:text>&#10;</xsl:text>
            <ele><xsl:value-of select="cord/alt"/></ele><xsl:text>&#10;</xsl:text>
            <time><xsl:value-of select="datahora"/></time><xsl:text>&#10;</xsl:text>
        </trkpt><xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <xsl:template match="pdi">
        <wpt lat="{cord/lat}" lon="{cord/long}"><xsl:text>&#10;</xsl:text>
            <name><xsl:value-of select="nom"/></name><xsl:text>&#10;</xsl:text>
            <ele><xsl:value-of select="cord/alt"/></ele><xsl:text>&#10;</xsl:text>
            <time><xsl:value-of select="datahora"/></time><xsl:text>&#10;</xsl:text>
        </wpt>
    </xsl:template>
</xsl:stylesheet>