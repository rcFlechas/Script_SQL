-- CONSULTA DE FACTURA
SELECT numeroFactura, fechaDeVenta, cliente,direccion,barrio,ciudad,telefono, vendedor,formaDePago, canal,valorFacturaSinIva, valorIvaFactura, 
       valorTotalFactura, valorRechazo, valorDescuento, valorTotalRecaudado, formato,zona,regional,agencia,isFree, activo, fechaIng, usuario, flag  
FROM facturascamdun
WHERE  numeroFactura='185031';

SELECT * FROM vst_fcturascamdun where numeroFactura='185031';

SELECT numeroFactura, fechaDeVenta, cliente, nitCliente, nombreDeCliente, direccionDeCliente, barrio, ciudad, telefonoCliente, vendedor, formaDePago, pago, canal, nombreCanalDeVenta, valorFacturaSinIva, valorIvaFactura, valorTotalFactura, valorRechazo, valorDescuento, valorTotalRecaudado FROM vst_fcturascamdun where numeroFactura='185031';

-- PRODUCTOS POR FACTURA
SELECT * FROM vst_productosporfactura WHERE numeroFactura='185031';

SELECT codigoProducto, descripcionProducto, cantidad, valorUnitarioConIva, valorTotalConIva FROM vst_productosporfactura WHERE numeroFactura='185031';

-- MOVIMIENTO
SELECT documento, movimiento, usuario, fechaIng, fecha FROM bitacorafacturas WHERE numeroFactura='185031' ORDER BY fechaIng ASC;


-- PRODUCTOS DEVUELTOS
SELECT * FROM vst_productosporfacturaDescargada WHERE numeroManifiesto='6656' AND  numeroFactura='185024' AND cantidadRechazada > 0 order by codigoProducto;

SELECT codigoProducto, descripcionProducto, cantidadRechazada, nombreCausalDeRechazo FROM vst_productosporfacturaDescargada WHERE numeroManifiesto='6656' AND  numeroFactura='185024' AND cantidadRechazada > 0 ORDER BY codigoProducto;

-- DESCUENTOS 
SELECT * FROM vst_fcturascamdun where numeroFactura='183292';

SELECT * FROM vst_productosporfacturaDescargada 
WHERE numeroManifiesto='6671' AND numeroFactura ='185380' AND descuento > 0 ORDER BY codigoProducto;



-- DISTRIBUCION
SELECT * FROM vst_defintivofacturaspormanifiesto where numeroFactura ='185031';

SELECT numeroManifiesto, fechaDistribucion, vehiculo, nombreConductor, nombreDeRuta FROM vst_defintivofacturaspormanifiesto WHERE numeroFactura ='185031';












-- VERIFICAR REPORTE DE CONDUCTORES VALORES DE DEVOLUCIONES
SELECT fechaDistribucion, numeroManifiesto, vehiculo, nombreCanal, SUM(valorFacturaSinIva) AS total_facturas FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-08-01'  AS DATE) AND CAST('2017-08-31'  AS DATE) AND conductor = '1094165949'  AND idCanal = 2 GROUP BY  fechaDistribucion, numeroManifiesto, vehiculo, nombreCanal;


SELECT * FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion = '2017-08-31' AND conductor = '1094165949';













