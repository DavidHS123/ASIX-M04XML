<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:template match="/factura">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title><xsl:value-of select="header/title"/></title>
                <link rel="stylesheet" href="factura.css" type="text/css"/>
            </head>
            <body class="invoice">
                <xsl:apply-templates select="body/titol"/>
                <xsl:apply-templates select="body/companyia"/>
                <xsl:apply-templates select="body/emissorreceptor"/>
                <xsl:apply-templates select="body/invoice-info"/>
                <xsl:apply-templates select="body/items"/>
                <xsl:apply-templates select="body/page"/>
                <xsl:apply-templates select="body/metodesdepagament"/>
                <xsl:apply-templates select="body/publicitat"/>
                <xsl:apply-templates select="body/estat-factura"/>
                <xsl:apply-templates select="body/metodesdepagament/terms"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="titol">
        <div class="container1">
            <div class="title">
                <h1><xsl:value-of select="title/h1"/></h1>
                <p><xsl:value-of select="title/p"/></p>
            </div>
            <div class="responsive-image">
                <img src="{responsive-image/@src}" height="{responsive-image/@height}"/>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="companyia">
        <div class="container2">
            <div class="company-info">
                <h1><xsl:value-of select="company-info/nomempresa"/></h1>
                <p><xsl:value-of select="company-info/carrerempresa"/></p>
                <p><xsl:value-of select="company-info/telefonempresa"/></p>
                <p><xsl:value-of select="company-info/faxempresa"/></p>
                <p><xsl:value-of select="company-info/correuempresa"/></p>
            </div>
            <div class="invoice-details">
                <h1><xsl:value-of select="invoice-details/detallsfactura"/></h1>
                <p>Data de la factura: <xsl:value-of select="invoice-details/datafactura"/></p>
                <p><xsl:value-of select="invoice-details/temafactura"/></p>
                <p><xsl:value-of select="invoice-details/importtotal"/></p>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="emissorreceptor/Emissor">
        <div class="invoice-info">
            <h1>FACTURAR A:</h1>
            <p>Nom: <xsl:value-of select="Nom"/></p>
            <p>Direcció: <xsl:value-of select="Adreça/Carrer"/> <xsl:value-of select="Adreça/Número"/>, <xsl:value-of select="Adreça/Pis"/> <xsl:value-of select="Adreça/Porta"/></p>
            <p>Codi Postal: <xsl:value-of select="Adreça/CP"/></p>
            <p>Ciutat: <xsl:value-of select="Adreça/Ciutat"/></p>
        </div>
    </xsl:template>
    
    <xsl:template match="invoice-info">
    </xsl:template>

    <xsl:template match="items">
        <table>
            <tr>
                <th>NO</th>
                <th>Tipus d'article</th>
                <th>Descripció</th>
                <th>QTY</th>
                <th>Preu</th>
                <th>Import</th>
            </tr>
            <xsl:apply-templates select="item"/>
        </table>
    </xsl:template>

    <xsl:template match="item">
        <tr>
            <td><xsl:value-of select="NO"/></td>
            <td><xsl:value-of select="Tipus-d-article"/></td>
            <td><xsl:value-of select="Descripció"/></td>
            <td><xsl:value-of select="QTY"/></td>
            <td><xsl:value-of select="Preu"/></td>
            <td><xsl:value-of select="Import"/></td>
        </tr>
    </xsl:template>

    <xsl:template match="page">
        <div class="page">
            <div class="container4">
                <table>
                    <tr><td>Subtotal</td><td><xsl:value-of select="container4/total/subtotal"/></td></tr>
                    <tr><td>Fiscalitat</td><td><xsl:value-of select="container4/total/fiscalitat"/></td></tr>
                    <tr><td>Descompte</td><td><xsl:value-of select="container4/total/descompte"/></td></tr>
                    <tr><td>Total General</td><td><xsl:value-of select="container4/total/total-general"/></td></tr>
                </table>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="metodesdepagament">
        <div class="container3">
            <xsl:apply-templates select="PaymentType/*"/>
        </div>
    </xsl:template>

    <xsl:template match="PaymentType/transferencia">
        <div class="payment">
            <h1>Mètode de Pagament: Transferència</h1>
            <p>Nom del banc: <xsl:value-of select="nom-del-banc"/></p>
            <p>Número de compte: <xsl:value-of select="numero-de-compte"/></p>
        </div>
    </xsl:template>

    <xsl:template match="terms">
        <div class="terms">
            <h1><xsl:value-of select="termes"/></h1>
            <p><xsl:value-of select="termesdescripcio"/></p>
        </div>
    </xsl:template>

    <xsl:template match="publicitat">
        <div class="publicitat">
            <p><xsl:value-of select="publi"/></p>
        </div>
    </xsl:template>

    <xsl:template match="estat-factura">
        <div class="estat-factura">
            <xsl:choose>
                <xsl:when test="pendent">
                    <p>Estat de la factura: Pendent</p>
                </xsl:when>
                <xsl:otherwise>
                    <p>Estat de la factura: Pagada</p>
                </xsl:otherwise>
            </xsl:choose>
        </div>
    </xsl:template>

</xsl:stylesheet>