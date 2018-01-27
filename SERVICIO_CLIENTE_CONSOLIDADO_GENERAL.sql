-- SERVICIO AL CLIENTE PENDIENTE



SELECT (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS MES, idCanal, nombreCanal, count(causalDeRechazo) as total_rechazado FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) AND idtipoDeMovimiento = 3 GROUP BY  MES, idCanal;


-- NOMBRE DE LOS MESES 
SELECT MONTH(fechaDistribucion) as MES, (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS NOMBRE_MES FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) GROUP BY  MES ORDER BY  MONTH(fechaDistribucion);

-- RECHAZADOS POR CANTIDAD TAT
SELECT MONTH(fechaDistribucion) as MES, (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS NOMBRE_MES, count(idtipoDeMovimiento) as total_rechazado_TAT, SUM(valorTotalFactura) as valor_total_rechazado_TAT FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) AND idtipoDeMovimiento = 3 AND idCanal = 2 GROUP BY  MES ORDER BY  MONTH(fechaDistribucion);

-- RECHAZADOS POR CANTIDAD MAYORISTAS
SELECT MONTH(fechaDistribucion) as MES, (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS NOMBRE_MES, count(idtipoDeMovimiento) as total_rechazado_MAYORISTAS, SUM(valorTotalFactura) as valor_total_rechazado_MAYORISTAS FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) AND idtipoDeMovimiento = 3 AND idCanal = 3 GROUP BY  MES ORDER BY  MONTH(fechaDistribucion);

-- RECHAZADOS POR CANTIDAD 
SELECT MONTH(fechaDistribucion) as MES, (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS NOMBRE_MES, count(idtipoDeMovimiento) as total_rechazado_POBLACIONES, SUM(valorTotalFactura) as valor_total_rechazado_POBLACIONES FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) AND idtipoDeMovimiento = 3 AND idCanal = 4 GROUP BY  MES ORDER BY  MONTH(fechaDistribucion);

-- RECHAZADOS POR CANTIDAD TAT COSOLIDADO
SELECT T1.MES, T1.NOMBRE_MES, T2.total_rechazado_TAT, T2.valor_total_rechazado_TAT
FROM (SELECT MONTH(fechaDistribucion) as MES, (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS NOMBRE_MES FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) GROUP BY  MES) T1
LEFT JOIN (SELECT MONTH(fechaDistribucion) as MES, (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS NOMBRE_MES, count(idtipoDeMovimiento) as total_rechazado_TAT, SUM(valorTotalFactura) as valor_total_rechazado_TAT FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) AND idtipoDeMovimiento = 3 AND idCanal = 2 GROUP BY  MES) T2
ON T1.MES = T2.MES GROUP BY T1.MES;

-- RECHAZADOS POR CANTIDAD MAYORISTAS COSOLIDADO
SELECT T1. MES, T1.NOMBRE_MES, T2.total_rechazado_MAYORISTAS, T2.valor_total_rechazado_MAYORISTAS
FROM (SELECT MONTH(fechaDistribucion) as MES, (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS NOMBRE_MES FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) GROUP BY  MES) T1
LEFT JOIN (SELECT MONTH(fechaDistribucion) as MES, (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS NOMBRE_MES, count(idtipoDeMovimiento) as total_rechazado_MAYORISTAS, SUM(valorTotalFactura) as valor_total_rechazado_MAYORISTAS FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) AND idtipoDeMovimiento = 3 AND idCanal = 3 GROUP BY  MES) T2
ON T1.MES = T2.MES GROUP BY T1.MES;

-- RECHAZADOS POR CANTIDAD POBLACIONES COSOLIDADO
SELECT T1.MES, T1.NOMBRE_MES, T2.total_rechazado_POBLACIONES, T2.valor_total_rechazado_POBLACIONES
FROM (SELECT MONTH(fechaDistribucion) as MES, (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS NOMBRE_MES FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) GROUP BY  MES) T1
LEFT JOIN (SELECT MONTH(fechaDistribucion) as MES, (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS NOMBRE_MES, count(idtipoDeMovimiento) as total_rechazado_POBLACIONES, SUM(valorTotalFactura) as valor_total_rechazado_POBLACIONES FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) AND idtipoDeMovimiento = 3 AND idCanal = 4 GROUP BY  MES) T2
ON T1.MES = T2.MES GROUP BY T1.MES;


SELECT TT1.MES, TT1.NOMBRE_MES, TT1.total_rechazado_TAT, TT1.valor_total_rechazado_TAT, TT2.total_rechazado_MAYORISTAS, TT2.valor_total_rechazado_MAYORISTAS
FROM 	(SELECT T1.MES, T1.NOMBRE_MES, T2.total_rechazado_TAT, T2.valor_total_rechazado_TAT
		FROM (SELECT MONTH(fechaDistribucion) as MES, (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS NOMBRE_MES FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) GROUP BY  MES) T1
		LEFT JOIN (SELECT MONTH(fechaDistribucion) as MES, (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS NOMBRE_MES, count(idtipoDeMovimiento) as total_rechazado_TAT, SUM(valorTotalFactura) as valor_total_rechazado_TAT FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) AND idtipoDeMovimiento = 3 AND idCanal = 2 GROUP BY  MES) T2
		ON T1.MES = T2.MES) TT1
INNER JOIN 	(SELECT T1. MES, T1.NOMBRE_MES, T2.total_rechazado_MAYORISTAS, T2.valor_total_rechazado_MAYORISTAS
			FROM (SELECT MONTH(fechaDistribucion) as MES, (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS NOMBRE_MES FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) GROUP BY  MES) T1
			LEFT JOIN (SELECT MONTH(fechaDistribucion) as MES, (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS NOMBRE_MES, count(idtipoDeMovimiento) as total_rechazado_MAYORISTAS, SUM(valorTotalFactura) as valor_total_rechazado_MAYORISTAS FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) AND idtipoDeMovimiento = 3 AND idCanal = 3 GROUP BY  MES) T2
			ON T1.MES = T2.MES) TT2 
ON TT1.MES = TT2.MES ORDER BY TT1.MES;

-- CONSOLIDADO DE RECHAZOS EN LO QUE VA DEL AÑO
SELECT TTT1.MES, TTT1.NOMBRE_MES, IFNULL(TTT1.total_rechazado_TAT,0) AS total_rechazado_TAT, FLOOR(IFNULL(TTT1.valor_total_rechazado_TAT,0)) AS valor_total_rechazado_TAT, IFNULL(TTT1.total_rechazado_MAYORISTAS,0) AS total_rechazado_MAYORISTAS, FLOOR(IFNULL(TTT1.valor_total_rechazado_MAYORISTAS,0)) AS valor_total_rechazado_MAYORISTAS, IFNULL(TTT2.total_rechazado_POBLACIONES,0) AS total_rechazado_POBLACIONES, FLOOR(IFNULL(TTT2.valor_total_rechazado_POBLACIONES,0)) AS valor_total_rechazado_POBLACIONES 
FROM	(SELECT TT1.MES, TT1.NOMBRE_MES, TT1.total_rechazado_TAT, TT1.valor_total_rechazado_TAT, TT2.total_rechazado_MAYORISTAS, TT2.valor_total_rechazado_MAYORISTAS
		FROM 	(SELECT T1.MES, T1.NOMBRE_MES, T2.total_rechazado_TAT, T2.valor_total_rechazado_TAT
				FROM (SELECT MONTH(fechaDistribucion) as MES, (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS NOMBRE_MES FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) GROUP BY  MES) T1
				LEFT JOIN (SELECT MONTH(fechaDistribucion) as MES, (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS NOMBRE_MES, count(idtipoDeMovimiento) as total_rechazado_TAT, SUM(valorTotalFactura) as valor_total_rechazado_TAT FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) AND idtipoDeMovimiento = 3 AND idCanal = 2 GROUP BY  MES) T2
				ON T1.MES = T2.MES GROUP BY T1.MES) TT1
		INNER JOIN 	(SELECT T1. MES, T1.NOMBRE_MES, T2.total_rechazado_MAYORISTAS, T2.valor_total_rechazado_MAYORISTAS
					FROM (SELECT MONTH(fechaDistribucion) as MES, (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS NOMBRE_MES FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) GROUP BY  MES) T1
					LEFT JOIN (SELECT MONTH(fechaDistribucion) as MES, (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS NOMBRE_MES, count(idtipoDeMovimiento) as total_rechazado_MAYORISTAS, SUM(valorTotalFactura) as valor_total_rechazado_MAYORISTAS FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) AND idtipoDeMovimiento = 3 AND idCanal = 3 GROUP BY  MES) T2
					ON T1.MES = T2.MES GROUP BY T1.MES) TT2 
		ON TT1.MES = TT2.MES GROUP BY TT1.MES) TTT1 
INNER JOIN	(SELECT T1.MES, T1.NOMBRE_MES, T2.total_rechazado_POBLACIONES, T2.valor_total_rechazado_POBLACIONES
			FROM (SELECT MONTH(fechaDistribucion) as MES, (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS NOMBRE_MES FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) GROUP BY  MES) T1
			LEFT JOIN (SELECT MONTH(fechaDistribucion) as MES, (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS NOMBRE_MES, count(idtipoDeMovimiento) as total_rechazado_POBLACIONES, SUM(valorTotalFactura) as valor_total_rechazado_POBLACIONES FROM vst_movilizacionfacturasdescargadas WHERE YEAR(fechaDistribucion) = YEAR(current_date()) AND idtipoDeMovimiento = 3 AND idCanal = 4 GROUP BY  MES) T2
			ON T1.MES = T2.MES GROUP BY T1.MES) TTT2
ON TTT1.MES = TTT2.MES GROUP BY TTT1.MES ORDER BY TTT1.MES;













