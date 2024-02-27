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
            <img src="{logo/src}" alt="{logo/alt}" class="{logo/class}"/>
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
            <img src="{barras/src}" alt="{barras/alt}" class="{barras/class}"/>
        </div>
    </xsl:template>

    <xsl:template match="dadescontracte">
        <div>
            <h1>DATOS DEL CONTRATO</h1>
            <div class="dadesContracte">
                <p>Titular del contrato: <xsl:value-of select="titular"/></p>
                <p>Direccion de subministro: <xsl:value-of select="direccio"/></p>
                <p>Codigo unificado de punto de subministro (CUPS): <xsl:value-of select="codigo"/></p>
                <p>Tipo de contrato: <b><xsl:value-of select="tipocontrato"/></b></p>
                <p>Peaje de transporte y distribución: <b><xsl:value-of select="peaje"/></b>  Seguimiento de cargos: <b><xsl:value-of select="seguimiento"/></b></p>
                <p><span class="color">Potencia contratada en punta <xsl:value-of select="potenciapunta"/> Potencia contratada en valle: <xsl:value-of select="potenciavalle"/></span></p>
                <p>Referencia del contrato de subministro (Energía XXI Comercializadora de Referencia S.L.U.): <xsl:value-of select="referencia_contrato_subministro"/></p>
				<xsl:choose>
				  <xsl:when test="renovacion = 'automatica'">
					<p>Fecha final del contrato: <xsl:value-of select="fecha_final_contrato"/> (renovación anual automática)</p>
				  </xsl:when>
				  <xsl:when test="renovacion = 'manual'">
					<p>Fecha final del contrato: <xsl:value-of select="fecha_final_contrato"/> (renovación anual manual)</p>
				  </xsl:when>
				  <xsl:otherwise>
					<p>Fecha final del contrato: <xsl:value-of select="fecha_final_contrato"/> (renovación anual desconeguda)</p>
				  </xsl:otherwise>
				</xsl:choose>
                <p>Referencia del contrato de acceso (EDISTRIBUCION REDES DIGITALES): <xsl:value-of select="referencia_contrato_acceso"/></p>
                <p>N° de contador: <xsl:value-of select="n_contador"/></p>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="infoconsum">
        <div>
            <div>
                <h1>INFORMACIÓN DE CONSUMO ELÉCTRICO</h1>
            </div>
            <div class="infoConsum">
                <p class="centrar"><b>Su consumo en el periodo facturado ha sido <xsl:value-of select="consumtotal"/></b></p>
            <p>Puede consultar su consumo horario en el portal web de su distribuidora</p>
            <p><a href="https://zonaprivada.edistribucion.com/areaprivada">https://zonaprivada.edistribucion.com/areaprivada</a></p>
            <img src="{grafico1/src}" alt="{grafico1/alt}" class="{grafico1/class}"/>
            <p>Su consumo medio diario en el periodo facturado ha sido de <xsl:value-of select="consum_med_diario_periode"/></p>
            <p>Su consumo medio diario en los ultimos 14 meses ha sido de <xsl:value-of select="consum_med_diario_14meses"/></p>
            <p>Su consumo acumulado del Ultimo año ha sido de <xsl:value-of select="consum_acum_año"/></p>
            <p>Las potencias maximas demandadas en el ultimo año han sido <xsl:value-of select="pot_max_ult_año/p1"/> en P1 (punta) y <xsl:value-of select="pot_max_ult_año/p3"/> en P3 (valle).</p>
            <p>Esta información esta disponible desde <xsl:value-of select="fecha_info"/></p>
            <p><b>Lectura actual (real)</b> (<xsl:value-of select="fecha_lectura"/>)</p>
            <div class="row">
                <div class="lectura">
                    <p>Lectura en P1 (punta): <xsl:value-of select="lecturas/p1"/></p>
                    <p>Lectura en P2 (llano): <xsl:value-of select="lecturas/p2"/></p>
                    <p>Lectura en P3 (valle): <xsl:value-of select="lecturas/p3"/></p>
                </div>
                <div class="consum">
                    <p>Consumo en P1: <xsl:value-of select="consumo/p1"/></p>
                    <p>Consumo en P2: <xsl:value-of select="consumo/p2"/></p>
                    <p>Consumo en P3: <xsl:value-of select="consumo/p3"/></p>
                </div>
            </div>
            <p>El consumo medio mensual de los consumidores que estan en su mismo cédigo postal y tienen potencias contratadas inferiores o iguales a 15 kW, para su periodo de facturación es de <xsl:value-of select="media_consumidores"/></p>
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
                <img src="{grafico2/src}" alt="{grafico2/alt}" class="{grafico2/class}"/>
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
                <xsl:choose>
                    <xsl:when test="@estat = 'pagada'">
                        <p>Estat de la factura: pagada</p>
                        <xsl:choose>
                            <xsl:when test="@metodopagament = 'Targeta'">
                                <p>Quantitat: <xsl:value-of select="@quantitat"/></p>
                                <p>Forma de pago: Targeta </p>
                                <p>Número de targeta: <xsl:value-of select="targeta/numero"/></p>
                                <p>Nom: <xsl:value-of select="targeta/nom"/></p>
                                <p>Cognom: <xsl:value-of select="targeta/cognom"/></p>
                                <p>Data de caducitat: <xsl:value-of select="targeta/datacaducitat"/></p>
                                <p>CVV: <xsl:value-of select="targeta/cvv"/></p>
                            </xsl:when>
                            <xsl:when test="@metodopagament = 'Transferencia'">
                                <p>Forma de pago: Transferencia </p>
                                <p>Entidad: <xsl:value-of select="entitat"/> Sucursal: <xsl:value-of select="sucursal"/> DC: <xsl:value-of select="dc"/> Cuenta Corriente: <xsl:value-of select="cc"/> IBAN: <xsl:value-of select="iban"/></p>
                                <p>Cod.Mandato: <xsl:value-of select="codmandato"/> Versión: <xsl:value-of select="version"/></p>
                                <p>Su pago se justifica con el correspondiente apunte bancario</p>
                            </xsl:when>
                            <xsl:otherwise>
                                <p>Forma de pago: Desconeguda </p>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="@estat = 'pendent'">
                        <p>Estat de la factura: pendent</p>
                    </xsl:when>
                    <xsl:otherwise>
                        <p>Estat de la factura: desconegut</p>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
        </div>
    </xsl:template>
    
</xsl:stylesheet>