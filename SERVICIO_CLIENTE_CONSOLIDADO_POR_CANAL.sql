-- SERVICIO AL CLIENTE CONSOLIDADOS POR CANAL



SELECT idCanal, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-30' AS DATE) GROUP BY idCanal ;

-- TODOS LOS CANALES
SELECT idCanal, nombreCanal, count(idtipoDeMovimiento) as total_rechazado, SUM(valorTotalFactura) as valor_total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-30' AS DATE) AND idtipoDeMovimiento = 3 GROUP BY  idCanal; 

SELECT T1.idCanal, T1.nombreCanal, IFNULL(T2.total_rechazado,0) AS total_rechazado,  FLOOR(IFNULL(T2.valor_total_rechazado,0)) AS valor_total_rechazado
FROM	(SELECT idCanal, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-30' AS DATE) GROUP BY idCanal) T1 
LEFT JOIN	(SELECT idCanal, nombreCanal, count(idtipoDeMovimiento) as total_rechazado, SUM(valorTotalFactura) as valor_total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-30' AS DATE) AND idtipoDeMovimiento = 3 GROUP BY  idCanal) T2
ON T1.idCanal = T2.idCanal GROUP BY T1.idCanal;

-- DIAS DE LA SEMANA QUE MAS SE DUVUELVE
SELECT (WEEKDAY(fechaDistribucion) + 1) AS DIA, (ELT(WEEKDAY(fechaDistribucion) + 1, 'L', 'M', 'M', 'J', 'V', 'S', 'D')) AS DIA_SEMANA FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-30' AS DATE) GROUP BY DIA ORDER BY DIA;

SELECT (WEEKDAY(fechaDistribucion) + 1) AS DIA, count(idtipoDeMovimiento) as total_rechazado, SUM(valorTotalFactura) as valor_total_rechazado  FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-30' AS DATE) AND idtipoDeMovimiento = 3 GROUP BY DIA ORDER BY DIA;

SELECT T1.DIA, T1.DIA_SEMANA, IFNULL(T2.total_rechazado,0) AS total_rechazado, FLOOR(IFNULL(T2.valor_total_rechazado,0)) AS valor_total_rechazado
FROM (SELECT (WEEKDAY(fechaDistribucion) + 1) AS DIA, (ELT(WEEKDAY(fechaDistribucion) + 1, 'L', 'M', 'M', 'J', 'V', 'S', 'D')) AS DIA_SEMANA FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-30' AS DATE) GROUP BY DIA) T1
LEFT JOIN (SELECT (WEEKDAY(fechaDistribucion) + 1) AS DIA, count(idtipoDeMovimiento) as total_rechazado, SUM(valorTotalFactura) as valor_total_rechazado  FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-30' AS DATE) AND idtipoDeMovimiento = 3 GROUP BY DIA) T2
ON T1.DIA = T2.DIA GROUP BY T1.DIA ORDER BY T1.DIA;
-- TODOS LOS CANALES

-- DETALLE POR TAT
SELECT DAY(fechaDistribucion) as dia FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-30' AS DATE) GROUP BY fechaDistribucion ORDER BY fechaDistribucion asc;


SELECT DAY(fechaDistribucion) as dia, count(idtipoDeMovimiento) as total_rechazado, SUM(valorTotalFactura) as valor_total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-30' AS DATE) AND idtipoDeMovimiento = 3 AND idCanal = 2 GROUP BY fechaDistribucion ORDER BY fechaDistribucion asc;

SELECT T1.dia, IFNULL(T2.total_rechazado,0) AS total_rechazado, FLOOR(IFNULL(T2.valor_total_rechazado,0)) AS valor_total_rechazado
FROM	(SELECT DAY(fechaDistribucion) as dia FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-07-30' AS DATE) GROUP BY fechaDistribucion) T1
LEFT JOIN	(SELECT DAY(fechaDistribucion) as dia, count(idtipoDeMovimiento) as total_rechazado, SUM(valorTotalFactura) as valor_total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-07-30' AS DATE) AND idtipoDeMovimiento = 3 AND idCanal = 2 GROUP BY fechaDistribucion)T2
ON T1.dia = T2.dia GROUP BY T1.dia;

-- DIAS DE LA SEMANA QUE MAS SE DUVUELVE
SELECT T1.DIA, T1.DIA_SEMANA, IFNULL(T2.total_rechazado,0) AS total_rechazado, FLOOR(IFNULL(T2.valor_total_rechazado,0)) AS valor_total_rechazado
FROM (SELECT (WEEKDAY(fechaDistribucion) + 1) AS DIA, (ELT(WEEKDAY(fechaDistribucion) + 1, 'L', 'M', 'M', 'J', 'V', 'S', 'D')) AS DIA_SEMANA FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-07-30' AS DATE) GROUP BY DIA) T1
LEFT JOIN (SELECT (WEEKDAY(fechaDistribucion) + 1) AS DIA, count(idtipoDeMovimiento) as total_rechazado, SUM(valorTotalFactura) as valor_total_rechazado  FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-07-30' AS DATE) AND idtipoDeMovimiento = 3 AND idCanal = 2 GROUP BY DIA) T2
ON T1.DIA = T2.DIA GROUP BY T1.DIA ORDER BY T1.DIA;
-- DETALLE POR TAT

-- DETALLE POR MAYOSRISTA
SELECT T1.dia, IFNULL(T2.total_rechazado,0) AS total_rechazado, FLOOR(IFNULL(T2.valor_total_rechazado,0)) AS valor_total_rechazado
FROM	(SELECT DAY(fechaDistribucion) as dia FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-30' AS DATE) GROUP BY fechaDistribucion) T1
LEFT JOIN	(SELECT DAY(fechaDistribucion) as dia, count(idtipoDeMovimiento) as total_rechazado, SUM(valorTotalFactura) as valor_total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-30' AS DATE) AND idtipoDeMovimiento = 3 AND idCanal = 3 GROUP BY fechaDistribucion)T2
ON T1.dia = T2.dia GROUP BY T1.dia;

-- DIAS DE LA SEMANA QUE MAS SE DUVUELVE
SELECT T1.DIA, T1.DIA_SEMANA, IFNULL(T2.total_rechazado,0) AS total_rechazado, FLOOR(IFNULL(T2.valor_total_rechazado,0)) AS valor_total_rechazado
FROM (SELECT (WEEKDAY(fechaDistribucion) + 1) AS DIA, (ELT(WEEKDAY(fechaDistribucion) + 1, 'L', 'M', 'M', 'J', 'V', 'S', 'D')) AS DIA_SEMANA FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-30' AS DATE) GROUP BY DIA) T1
LEFT JOIN (SELECT (WEEKDAY(fechaDistribucion) + 1) AS DIA, count(idtipoDeMovimiento) as total_rechazado, SUM(valorTotalFactura) as valor_total_rechazado  FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-30' AS DATE) AND idtipoDeMovimiento = 3 AND idCanal = 3 GROUP BY DIA) T2
ON T1.DIA = T2.DIA GROUP BY T1.DIA ORDER BY T1.DIA;
-- DETALLE POR MAYOSRISTA

-- DETALLE POR POBLACIONES
SELECT T1.dia, IFNULL(T2.total_rechazado,0) AS total_rechazado, FLOOR(IFNULL(T2.valor_total_rechazado,0)) AS valor_total_rechazado
FROM	(SELECT DAY(fechaDistribucion) as dia FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-30' AS DATE) GROUP BY fechaDistribucion) T1
LEFT JOIN	(SELECT DAY(fechaDistribucion) as dia, count(idtipoDeMovimiento) as total_rechazado, SUM(valorTotalFactura) as valor_total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-30' AS DATE) AND idtipoDeMovimiento = 3 AND idCanal = 4 GROUP BY fechaDistribucion)T2
ON T1.dia = T2.dia GROUP BY T1.dia;

-- DIAS DE LA SEMANA QUE MAS SE DUVUELVE
SELECT T1.DIA, T1.DIA_SEMANA, IFNULL(T2.total_rechazado,0) AS total_rechazado, FLOOR(IFNULL(T2.valor_total_rechazado,0)) AS valor_total_rechazado
FROM (SELECT (WEEKDAY(fechaDistribucion) + 1) AS DIA, (ELT(WEEKDAY(fechaDistribucion) + 1, 'L', 'M', 'M', 'J', 'V', 'S', 'D')) AS DIA_SEMANA FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-30' AS DATE) GROUP BY DIA) T1
LEFT JOIN (SELECT (WEEKDAY(fechaDistribucion) + 1) AS DIA, count(idtipoDeMovimiento) as total_rechazado, SUM(valorTotalFactura) as valor_total_rechazado  FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-30' AS DATE) AND idtipoDeMovimiento = 3 AND idCanal = 4 GROUP BY DIA) T2
ON T1.DIA = T2.DIA GROUP BY T1.DIA ORDER BY T1.DIA;
-- DETALLE POR POBLACIONES