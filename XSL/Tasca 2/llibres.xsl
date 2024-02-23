<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output encoding="utf-8" indent="yes"/>
    <xsl:template match="/">
        <biblioteca>
            <xsl:apply-templates select="biblioteca/llibre[autor='Mario Vargas Llosa']">
                <xsl:sort select="titol"/>
            </xsl:apply-templates>
        </biblioteca>
    </xsl:template>
    <xsl:template match="llibre">
        <xsl:copy>
            <xsl:copy-of select="*"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
