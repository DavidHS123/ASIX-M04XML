<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output encoding="utf-8" indent="yes"/>
    <xsl:template match="/">
        <html lang="es">
            <head>
                <meta charset="UTF-8"/>
                <title>Factura desde XSL</title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            </head>
                <body>
                    <xsl:apply-templates select="factura"/>
                </body>
        </html>
    </xsl:template>

    <xsl:template match="factura">
        <div class="row">
            <xsl:apply-templates select="dadesfactura"/>
        </div>
        <div class="row">
            <xsl:apply-templates select="resumfactura"/>
            <xsl:apply-templates select="dadesreceptor"/>
        </div>
        <xsl:apply-templates select="dadescontracte"/>
        <div class="row">
            <xsl:apply-templates select="infoconsum"/>
            <xsl:apply-templates select="destiimport"/>
        </div>
        <xsl:apply-templates select="dadespagament"/>
    </xsl:template>
    
    <xsl:template match="dadesfactura">
        <div class="logo">
            <img> 
                <xsl:attribute name="src">
                    <xsl:value-of select="logo/src"/>
                </xsl:attribute>
                <xsl:attribute name="alt">
                    <xsl:value-of select="logo/alt"/>
                </xsl:attribute>
                <xsl:attribute name="class">
                    <xsl:value-of select="logo/class"/>
                </xsl:attribute>
            </img> 
        </div>
        <div class="dadesFactura">
            <div>
                <h1>DADES DE LA FACTURA DE ELECTRICIDAD</h1>
            </div>
            <div class="importFactura">
                <p class="texto20px"><b>IMPORTE FACTURA: <xsl:value-of select="import"/></b></p>
                <p>Nº factura: <xsl:value-of select="numfactura"/>emitida el <xsl:value-of select="data"/></p>
                <p>Periodo de consumo: <xsl:value-of select="periodeconsum/inici"/> a <xsl:value-of select="periodeconsum/final"/> (31 días)</p>
                <p>Fecha de cargo: <xsl:value-of select="dataconsum"/></p>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="resumfactura">
        <div class= "resumenFactura">
            <h1>RESUMEN DE LA FACTURA</h1>
            <div class="tabla">
                <table class="tablaAmplio">
                    <tr>
                        <td>Por potencia contratada</td>
                        <td><xsl:value-of select="potencia"/></td>
                    </tr>
                    <tr>
                        <td>Por energía consumida</td>
                        <td><xsl:value-of select="energia"/></td>
                    </tr>
                    <tr>
                        <td>Impuesto electricidad</td>
                        <td><xsl:value-of select="impuesto"/></td>
                    </tr>
                    <tr>
                        <td>Alquiler del contador</td>
                        <td><xsl:value-of select="alquiler"/></td>
                    </tr>
                    <tr>
                        <td>Otros</td>
                        <td><xsl:value-of select="otros"/></td>
                    </tr>
                    <tr>
                        <td>IVA normal</td>
                        <td><xsl:value-of select="iva"/></td>
                    </tr>
                    <tr>
                        <td><b>TOTAL IMPORTE FACTURA</b></td>
                        <td><b><xsl:value-of select="total"/></b></td>
                    </tr>
                </table>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="dadesreceptor">
        <div class="dadesClients">
            <p><xsl:value-of select="nom"/> <xsl:value-of select="cognom"/></p>
            <p><xsl:value-of select="adreça/carrer"/> <xsl:value-of select="adreça/numero"/></p>
            <p><xsl:value-of select="adreça/cp"/> <xsl:value-of select="adreça/ciutat"/></p>
            <p><xsl:value-of select="adreça/provincia"/></p>
            <img>
                <xsl:attribute name="src">
                    <xsl:value-of select="barras/src"/>
                </xsl:attribute>
                <xsl:attribute name="alt">
                    <xsl:value-of select="barras/alt"/>
                </xsl:attribute>
                <xsl:attribute name="class">
                    <xsl:value-of select="barras/class"/>
                </xsl:attribute>
            </img>
        </div>
    </xsl:template>

    <xsl:template match="dadescontracte">
        <div>
            <h1>DATOS DEL CONTRATO</h1>
            <div class="dadesContracte">
                <p>Titular del contrato: NOMBREEJEMLO123</p>
                <p>Direccion de subministro: DIRECCIONEJEMPLO</p>
                <p>Codigo unificado de punto de subministro (CUPS): CODIGOEJEMPLO123</p>
                <p>Tipo de contrato: <b>PVPC - MERCADO REGULADO</b></p>
                <p>Peaje de transporte y distribución: <b>2.0TD</b>  Seguimiento de cargos: <b>1</b></p>
                <p><span class="color">Potencia contratada en punta 4,400kW Potencia contratada en valle: 4,400kW</span></p>
                <p>Referencia del contrato de subministro (Energía XXI Comercializadora de Referencia S.L.U.): 873456876435</p>
                <p>Referencia del contrato de acceso (EDISTRIBUCION REDES DIGITALES): 93415965200</p>
                <p>Fecha final del contrato: 30 de mayo de 2023 (renovación anual automática)</p>
                <p>N° de contador: 81273941</p>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="infoconsum">
        <div>
            <div>
                <h1>INFORMACIÓN DE CONSUMO ELÉCTRICO</h1>
            </div>
            <div class="infoConsum">
                <p class="centrar"><b>Su consumo en el periodo facturado ha sido 440,890kWh</b></p>
            <p>Puede consultar su consumo horario en el portal web de su distribuidora</p>
            <p><a href="https://zonaprivada.edistribucion.com/areaprivada">https://zonaprivada.edistribucion.com/areaprivada</a></p>
            <img src="grafico1.png" alt="grafico1" class="img"/>
            <p>Su consumo medio diario en el periodo facturado ha sido de 2,83 €</p>
            <p>Su consumo medio diario en los ultimos 14 meses ha sido de 3,45 €</p>
            <p>Su consumo acumulado del Ultimo año ha sido de 5.117 kWh</p>
            <p>Las potencias maximas demandadas en el ultimo año han sido 4,870 KW en P1 (punta) y 4,680 kW en P3 (valle).</p>
            <p>Esta información esta disponible desde 10/06/2023</p>
            <p><b>Lectura actual (real)</b> (11 de julio de 2023)</p>
            <div class="row">
                <div class="lectura">
                    <p>Lectura en P1 (punta): 13.654,27 kWh</p>
                    <p>Lectura en P2 (llano): 2.722,49kWh</p>
                    <p>Lectura en P3 (valle): 5,.844,03 kWh</p>
                </div>
                <div class="consum">
                    <p>Consumo en P1: 115,64 kWh</p>
                    <p>Consumo en P2: 109,68 kWh</p>
                    <p>Consumo en P3: 215,57 kWh</p>
                </div>
            </div>
            <p>El consumo medio mensual de los consumidores que estan en su mismo cédigo postal y tienen potencias contratadas inferiores o iguales a 15 kW, para su periodo de facturación es de 230,200 kWh.</p>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="destiimport">
        <div>
            <div>
                <h1>DESTINO DEL IMPORTE DE LA FACTURA</h1>
            </div>
            <div class="destiImport">
                <p class="texto20px">El importe total de su factura tiene este destino:</p>
                <img src="grafico2.png" alt="grafico2" class="img"/><br/>
                <p>La energía incluye, entre otro, el coste de la energía en el mercado, los pagos por capacidad y la retribución al Operador del Sistema (REE) y al Operador de Mercado (OMIE).</p>
                <p>Los peajes retribuyen las redes de transporte y distribución.</p>
                <p>Los cargos incluyen fundamentalmente la retribuci6n a las renovables, cogeneración y residuos (RECORE), las anualidades del déficit y el sobrecoste de generación en TNP (territorios no peninsulares).</p>
        
            </div>
        </div>
    </xsl:template>

    <xsl:template match="dadespagament">
        <div>
            <h1>DATOS DE PAGO</h1>
            <div class="dadesPagament">
                <p>Forma de pago: Domiciliada </p>
                <p>Entidad: 2100 Sucursal: 0221 DC: 21 Cuenta Corriente: 01004***** IBAN:</p>
                <p>Cod.Mandato: E00070920375633100010001 Versién: 0000</p>
                <p>Su pago se justifica con el correspondiente apunte bancario</p>
            </div>
        </div>
    </xsl:template>
    
</xsl:stylesheet>