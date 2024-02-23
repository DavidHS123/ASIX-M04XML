<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Factura Electrònica</title>
                <style>
                    body { font-family: Arial, sans-serif; }
                    .header, .footer { background-color: #f2f2f2; padding: 20px; text-align: center; }
                    .content { margin: 20px; }
                    table { width: 100%; border-collapse: collapse; }
                    th, td { border: 1px solid #ddd; padding: 8px; }
                    th { background-color: #4CAF50; color: white; }
                </style>
            </head>
            <body>
                <div class="header">
                    <h1>Factura</h1>
                </div>
                <div class="content">
                    <xsl:apply-templates select="factura"/>
                </div>
                <div class="footer">
                    <p>Gràcies per la seva confiança.</p>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="factura">
        <xsl:apply-templates select="dadesfactura"/>
        <xsl:apply-templates select="pagament"/>
        <xsl:apply-templates select="dadesemissor"/>
        <xsl:apply-templates select="dadesreceptor"/>
        <xsl:apply-templates select="periodesconsum/periode"/>
        <xsl:apply-templates select="missatgepublicitari"/>
    </xsl:template>

    <xsl:template match="dadesfactura">
        <h2>Dades de la Factura</h2>
        <p><strong>Número de factura:</strong> <xsl:value-of select="numfactura"/></p>
        <p><strong>Data:</strong> <xsl:value-of select="data"/></p>
        <img>
            <xsl:attribute name="src">
                <xsl:value-of select="img/src"/>
            </xsl:attribute>
            <xsl:attribute name="alt">Logo de l'empresa</xsl:attribute>
        </img>
    </xsl:template>

    <xsl:template match="pagament">
        <h2>Detalls de Pagament</h2>
        <p><strong>Estat:</strong> <xsl:value-of select="@estat"/></p>
        <p><strong>Mètode de pagament:</strong> <xsl:value-of select="@metodopagament"/></p>
        <xsl:apply-templates select="targeta"/>
    </xsl:template>

    <xsl:template match="targeta">
        <div>
            <p><strong>Detalls de la Targeta</strong></p>
            <p><strong>Número de targeta:</strong> <xsl:value-of select="numero"/></p>
            <p><strong>Nom:</strong> <xsl:value-of select="nom"/></p>
            <p><strong>Cognoms:</strong> <xsl:value-of select="cognom"/></p>
            <p><strong>Data de caducitat:</strong> <xsl:value-of select="datacaducitat"/></p>
            <p><strong>CVV:</strong> <xsl:value-of select="cvv"/></p>
        </div>
    </xsl:template>

    <xsl:template match="dadesemissor">
        <h2>Dades de l'Emissor</h2>
        <p><strong>Nom:</strong> <xsl:value-of select="nom"/></p>
        <p><strong>Cognom:</strong> <xsl:value-of select="cognom"/></p>
        <p><strong>Adreça:</strong> <xsl:value-of select="adreça"/></p>
        <p><strong>Telèfon:</strong> <xsl:value-of select="telefon"/></p>
        <p><strong>Email:</strong> <xsl:value-of select="email"/></p>
    </xsl:template>

    <xsl:template match="dadesreceptor">
        <h2>Dades del Receptor</h2>
        <p><strong>Nom:</strong> <xsl:value-of select="nom"/></p>
        <p><strong>Cognom:</strong> <xsl:value-of select="cognom"/></p>
        <p><strong>Adreça:</strong> <xsl:value-of select="adreça"/></p>
        <p><strong>Telèfon:</strong> <xsl:value-of select="telefon"/></p>
        <p><strong>Email:</strong> <xsl:value-of select="email"/></p>
    </xsl:template>

    <xsl:template match="periode">
        <h2>Períodes de Consum</h2>
        <table>
            <tr>
                <th>Data Inici</th>
                <th>Data Fi</th>
                <th>Consum (kWh)</th>
            </tr>
            <tr>
                <td><xsl:value-of select="datainici"/></td>
                <td><xsl:value-of select="datafi"/></td>
                <td><xsl:value-of select="consum"/></td>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="missatgepublicitari">
        <div style="margin-top: 20px;">
            <p><strong>Missatge Publicitari:</strong> <xsl:value-of select="."/></p>
        </div>
    </xsl:template>

</xsl:stylesheet>
