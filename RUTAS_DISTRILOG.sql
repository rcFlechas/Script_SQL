UPDATE manifiestosdedistribucion SET isFree = '1' WHERE consecutivo = '5792';

SELECT * FROM manifiestosdedistribucion WHERE consecutivo = '7989';

SELECT * FROM manifiestosdedistribucion WHERE consecutivo = '8097';

SELECT * FROM manifiestosdedistribucion WHERE consecutivo = '8017';

SELECT * FROM manifiestosdedistribucion WHERE consecutivo = '8010';
							
SELECT * FROM facturaspormanifiesto WHERE numeroManifiesto = '8010';

-- todos los manifiestos por fecha
SELECT * FROM manifiestosdedistribucion WHERE fechaDistribucion BETWEEN CAST('2017-12-01' AS DATE) AND CAST('2017-12-31' AS DATE) and vehiculo = 'TJP591';
SELECT * FROM rutero WHERE fechaDistribucion = '2017-06-30';
SELECT * FROM manifiestosdedistribucion WHERE fechaDistribucion = '2017-12-15' AND vehiculo = 'IGT690';

SELECT * FROM manifiestosdedistribucion WHERE estadoManifiesto = '3';

SELECT * FROM manifiestosdedistribucion WHERE estadoManifiesto = '3';

SELECT * FROM rutero WHERE fechaDistribucion = '2017-12-28' AND estadoManifiesto = '3';

SELECT * FROM rutero WHERE numeroManifiesto = '8064' AND numeroFactura in ('265063','265237','264486','265564','265059','265240','265584','265586','265206','265204','265201','265199','265197','265223');


-- UPDATE rutero SET estadoManifiesto = '3' WHERE fechaDistribucion = '2017-06-30' AND estadoManifiesto = '4';

-- UPDATE rutero SET estadoManifiesto = '3' WHERE numeroManifiesto = '8010';

SELECT T1.consecutivo, T1.fechaDistribucion, T1.vehiculo, T1.conductor, CONCAT(T3.nombres, ' ', T3.apellidos) AS nombre_conductor, T1.auxiliarDeReparto, T2.nombre_auxiliar, T4.celularCorporativo 
FROM manifiestosdedistribucion T1
INNER JOIN (SELECT cedula, CONCAT(nombres, ' ', apellidos) AS nombre_auxiliar FROM personas) T2
INNER JOIN personas T3
INNER JOIN empleados T4
ON T1.auxiliarDeReparto = T2.cedula AND T1.conductor = T3.cedula AND T1.conductor = T4.cedula
WHERE T1.estadoManifiesto = 3;


SELECT * FROM manifiestosdedistribucion WHERE month(fechaDistribucion) = 10 and year(fechaDistribucion) = 2017;


SELECT consecutivo, vehiculo, conductor, auxiliarDeReparto, canal, ruta, kmSalida 
FROM manifiestosdedistribucion WHERE consecutivo = '7203' AND estadoManifiesto = 3;

UPDATE manifiestosdedistribucion SET vehiculo = '', conductor = '', auxiliarDeReparto = '', canal = '', ruta = '', kmSalida = '', kmEntrada = ''
WHERE consecutivo = ? ;

-- UPDATE manifiestosdedistribucion SET kmEntrada = '19805' WHERE estadoManifiesto = 3 AND vehiculo = 'TJP632';

-- FACTURAS CAMDUN
SELECT * FROM comercializadoraCam.facturascamdun WHERE numeroFactura = '264068';

-- FACTURAS POR MANIFIESTO
SELECT * FROM comercializadoraCam.facturaspormanifiesto WHERE numeroManifiesto = '8058';
SELECT * FROM comercializadoraCam.facturaspormanifiesto WHERE numeroManifiesto = '8028';

-- FACTURAS DESCARGADAS
SELECT * FROM comercializadoraCam.facturasdescargadas WHERE numeroManifiesto = '8066';
SELECT sum(valorRecaudado) toltalRecaudado FROM comercializadoraCam.facturasdescargadas WHERE numeroManifiesto = '8097';

-- BITACORA FACTURAS
-- (FACTURA ENTREGA TOTAL 
-- RECHAZO PARCIAL POR PEDIDO INCOMPLETO
-- RECHAZO TOTAL POR PRODUCTO NO PEDIDO
-- FACTURA DEVUELTA PARA SALIR A RUTA)
SELECT * FROM comercializadoraCam.bitacorafacturas WHERE numeroFactura = '264068';

-- RECOGIDAS POR MANIFIESTO
SELECT * FROM comercializadoraCam.recogidaspormanifiesto WHERE idNumeroManifiesto = '7987';
