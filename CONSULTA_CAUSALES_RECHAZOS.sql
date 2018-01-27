-- SERVICIO AL CLIENTE REPORTES POR CONDUCTOR


SELECT * FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-20' AS DATE) AND idCanal = 2 GROUP BY conductor, nombreConductor, idCanal;

-- DEVUELTO POR CADA CONDUCTOR
SELECT conductor, nombreConductor, count(causalDeRechazo) as total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-20' AS DATE) AND idtipoDeMovimiento = 3 GROUP BY  conductor ORDER BY nombreConductor;

-- DEVUELTO POR CADA CAUSAL
SELECT nombreCausalDeRechazo, count(causalDeRechazo) as total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-20' AS DATE) AND idtipoDeMovimiento = 3 GROUP BY  causalDeRechazo ORDER BY nombreCausalDeRechazo;

-- VALOR RECHAZADO POR CADA CONDUCTOR
SELECT conductor, nombreConductor, SUM(valorTotalFactura) as valor_total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-20' AS DATE) AND idtipoDeMovimiento = 3 GROUP BY  conductor;


-- RENDIMIENTO
SELECT T1.conductor, T1.nombreConductor, IFNULL(T2.rechazo_total,0) as rt, (T1.programado - IFNULL(T2.rechazo_total,0)) as pro 
FROM (SELECT conductor, nombreConductor, count(idtipoDeMovimiento) as programado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-20' AS DATE) GROUP BY  conductor) T1     
LEFT JOIN (SELECT conductor, nombreConductor, count(idtipoDeMovimiento) as rechazo_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-20' AS DATE) AND idtipoDeMovimiento = 3 GROUP BY  conductor) T2 
ON T1.conductor = T2.conductor GROUP BY  T1.conductor ORDER BY T1.nombreConductor;


-- TABLA DEVOLUCIONES 
SELECT T1.conductor, T1.nombreConductor, T1.total_rechazado, FLOOR(T2.valor_total_rechazado) AS valor_total_rechazado
FROM (SELECT conductor, nombreConductor, count(causalDeRechazo) as total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-20' AS DATE) AND idtipoDeMovimiento = 3 GROUP BY  conductor) T1
INNER JOIN (SELECT conductor, nombreConductor, SUM(valorTotalFactura) as valor_total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-20' AS DATE) AND idtipoDeMovimiento = 3 GROUP BY  conductor) T2
ON T1.conductor = T2.conductor GROUP BY T1.conductor ORDER BY T1.nombreConductor;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- DEVUELTO POR FECHA POR CONDUCTOR
SELECT fechaDistribucion, count(causalDeRechazo) as total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-20' AS DATE) AND idtipoDeMovimiento = 3 AND conductor = '1094165949' GROUP BY  fechaDistribucion ORDER BY fechaDistribucion;

-- DEVUELTO POR CADA CAUSAL POR CONDUCTOR
SELECT nombreCausalDeRechazo, count(causalDeRechazo) as total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-20' AS DATE) AND idtipoDeMovimiento = 3 AND conductor = '1094165949' GROUP BY  causalDeRechazo ORDER BY nombreCausalDeRechazo;

-- DEVUELTO POR CADA CAUSAL POR CONDUCTOR POR MES (POR CANTIDAD)
SELECT nombreCausalDeRechazo, count(causalDeRechazo) as total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE MONTH(fechaDistribucion) = '2' AND idtipoDeMovimiento = 3 AND conductor = '1094165949' GROUP BY  causalDeRechazo ORDER BY nombreCausalDeRechazo;

-- DEVUELTO POR CADA CAUSAL POR CONDUCTOR POR MES (POR VALOR)
SELECT nombreCausalDeRechazo, SUM(valorTotalFactura) as valor_total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE MONTH(fechaDistribucion) = '2' AND idtipoDeMovimiento = 3 AND conductor = '1094165949' GROUP BY  causalDeRechazo ORDER BY nombreCausalDeRechazo;


-- VALOR RECHAZADO POR CADA CONDUCTOR
SELECT fechaDistribucion, SUM(valorTotalFactura) as valor_total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-20' AS DATE) AND idtipoDeMovimiento = 3 AND conductor = '1094165949' GROUP BY  fechaDistribucion;

-- RENDIMIENTO POR FECHA
SELECT T1.fechaDistribucion, IFNULL(T2.rechazo_total,0) as rt, (T1.programado - IFNULL(T2.rechazo_total,0)) as pro 
FROM (SELECT fechaDistribucion, count(idtipoDeMovimiento) as programado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-20' AS DATE) AND conductor = '1094165949' GROUP BY  fechaDistribucion) T1     
LEFT JOIN (SELECT fechaDistribucion, count(idtipoDeMovimiento) as rechazo_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-20' AS DATE) AND idtipoDeMovimiento = 3 AND conductor = '1094165949' GROUP BY  fechaDistribucion) T2 
ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY  T1.fechaDistribucion ORDER BY T1.fechaDistribucion;

-- TABLA DEVOLUCIONES  POR FECHA
SELECT T1.fechaDistribucion, T1.total_rechazado, FLOOR(T2.valor_total_rechazado) AS valor_total_rechazado
FROM (SELECT fechaDistribucion, count(causalDeRechazo) as total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-20' AS DATE) AND idtipoDeMovimiento = 3 AND conductor = '1094165949' GROUP BY  fechaDistribucion) T1
INNER JOIN (SELECT fechaDistribucion, SUM(valorTotalFactura) as valor_total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-06-01' AS DATE) AND CAST('2017-06-20' AS DATE) AND idtipoDeMovimiento = 3 AND conductor = '1094165949' GROUP BY  fechaDistribucion) T2
ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion ORDER BY T1.fechaDistribucion;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- DEVOLUCIONES CONSOLIDADO DE TODO EL AÑO
SELECT T1.conductor, T1.nombreConductor, T1.total_rechazado, FLOOR(T2.valor_total_rechazado) AS valor_total_rechazado
FROM (SELECT conductor, nombreConductor, count(causalDeRechazo) as total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) AND idtipoDeMovimiento = 3 GROUP BY  conductor, nombreConductor) T1
INNER JOIN (SELECT conductor, nombreConductor, SUM(valorTotalFactura) as valor_total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) AND idtipoDeMovimiento = 3 GROUP BY  conductor, nombreConductor) T2
ON T1.conductor = T2.conductor GROUP BY T1.conductor, T1.nombreConductor ORDER BY valor_total_rechazado DESC;


SELECT T1.MES, T1.NOMBRE_MES, IFNULL(T2.total_rechazado,0) AS total_rechazado, FLOOR(IFNULL(T2.valor_total_rechazado,0)) AS valor_total_rechazado
FROM (SELECT MONTH(fechaDistribucion) as MES, (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS NOMBRE_MES FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) GROUP BY  MES) T1
LEFT JOIN (SELECT MONTH(fechaDistribucion) as MES, (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS NOMBRE_MES, count(idtipoDeMovimiento) as total_rechazado, SUM(valorTotalFactura) as valor_total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) AND idtipoDeMovimiento = 3 AND conductor = '1090424634' GROUP BY  MES) T2
ON T1.MES = T2.MES GROUP BY T1.MES;

SELECT T1.dia, T1.fechaDistribucion, IFNULL(T2.total_rechazado,0) AS total_rechazado, FLOOR(IFNULL(T2.valor_total_rechazado,0)) AS valor_total_rechazado
FROM	(SELECT DAY(fechaDistribucion) as dia, fechaDistribucion FROM vst_movilizacionfacturasdescargadas WHERE year(fechaDistribucion) = YEAR(current_date()) AND month(fechaDistribucion) = MONTH(current_date()) GROUP BY dia) T1
LEFT JOIN	(SELECT DAY(fechaDistribucion) as dia, count(idtipoDeMovimiento) as total_rechazado, SUM(valorTotalFactura) as valor_total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE year(fechaDistribucion) = YEAR(current_date()) AND month(fechaDistribucion) = MONTH(current_date()) AND idtipoDeMovimiento = 3 AND conductor = '1090424634' GROUP BY dia)T2
ON T1.dia = T2.dia GROUP BY T1.dia;