-- SERVICIO AL CLIENTE CONSOLIDADO GENERAL

SELECT T1.MES, T1.NOMBRE_MES, IFNULL(T2.total_rechazado,0) AS total_rechazado, FLOOR(IFNULL(T2.valor_total_rechazado,0)) AS valor_total_rechazado
FROM (SELECT MONTH(fechaDistribucion) as MES, (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS NOMBRE_MES FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) GROUP BY  MES) T1
LEFT JOIN (SELECT MONTH(fechaDistribucion) as MES, (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS NOMBRE_MES, count(idtipoDeMovimiento) as total_rechazado, SUM(valorTotalFactura) as valor_total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) AND idtipoDeMovimiento = 3 GROUP BY  MES) T2
ON T1.MES = T2.MES GROUP BY T1.MES;

SELECT T1.dia, T1.fechaDistribucion, IFNULL(T2.total_rechazado,0) AS total_rechazado, FLOOR(IFNULL(T2.valor_total_rechazado,0)) AS valor_total_rechazado
FROM	(SELECT DAY(fechaDistribucion) as dia, fechaDistribucion FROM vst_movilizacionfacturasdescargadas WHERE year(fechaDistribucion) = YEAR(current_date()) AND month(fechaDistribucion) = MONTH(current_date()) GROUP BY dia) T1
LEFT JOIN	(SELECT DAY(fechaDistribucion) as dia, count(idtipoDeMovimiento) as total_rechazado, SUM(valorTotalFactura) as valor_total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE year(fechaDistribucion) = YEAR(current_date()) AND month(fechaDistribucion) = MONTH(current_date()) AND idtipoDeMovimiento = 3 GROUP BY dia)T2
ON T1.dia = T2.dia GROUP BY T1.dia;