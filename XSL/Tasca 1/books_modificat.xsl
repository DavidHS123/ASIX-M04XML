<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output encoding="UTF-8" indent="yes"/> 
    <xsl:template match="/">
        <html> 
            <head> 
                <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
                <title>XSL example</title>
				<link rel="stylesheet" type="text/css" href="estils.css"/>
            </head> 
            <body> 
                <xsl:for-each select="collection/book"> 
                    <h1>Title:<xsl:value-of select="title"/>
                    </h1> 
                    <p> 
                        <strong>Year of first publication: :</strong>
                        <xsl:value-of select="year/."/> 
                    </p> 
                    <p> 
                        <strong>Publisher: </strong> 
                        <xsl:value-of select="publisher/."/> 
                    </p> 
                    <p> 
                        <strong>Note: </strong> 
                        <xsl:value-of select="note/."/> 
                    </p> 
                    <p> 
                        <strong>Amazon URL: </strong> 
                        <a href="{amazon}">
                            <xsl:value-of select="amazon"/> 
                        </a> 
                    </p> 
                    <p> 
                        <strong>Price at Amazon:</strong> 
                        <xsl:value-of select="amazon/@price" /> 
                    </p> 
                </xsl:for-each> 
            </body> 
        </html>
    </xsl:template>
</xsl:stylesheet>
