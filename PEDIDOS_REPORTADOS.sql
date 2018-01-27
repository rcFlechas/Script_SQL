SELECT conductor, nombresConductor FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-05-02' AS DATE) AND CAST('2017-05-13' AS DATE) GROUP BY conductor, nombresConductor;

-- TOTAL DE PEDIDOS
SELECT conductor, nombresConductor, count(idtipoDeMovimiento) as total_pedidos FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-05-02' AS DATE) AND CAST('2017-05-13' AS DATE) GROUP BY conductor, nombresConductor;

-- PEDIDOS REPORTADOS
SELECT conductor, nombresConductor, count(idtipoDeMovimiento) as pedidos_reportados FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-05-02' AS DATE) AND CAST('2017-05-13' AS DATE) AND idtipoDeMovimiento <> 1 GROUP BY conductor, nombresConductor;

SELECT T1.conductor, T1.nombresConductor, T2.total_pedidos
FROM	(SELECT conductor, nombresConductor FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-05-02' AS DATE) AND CAST('2017-05-13' AS DATE) GROUP BY conductor, nombresConductor) T1
LEFT JOIN	(SELECT conductor, nombresConductor, count(idtipoDeMovimiento) as total_pedidos FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-05-02' AS DATE) AND CAST('2017-05-13' AS DATE) GROUP BY conductor, nombresConductor) T2
ON T1.conductor = T2.conductor AND T1.nombresConductor = T2.nombresConductor GROUP BY T1.conductor, T1.nombresConductor;

SELECT T1.conductor, T1.nombresConductor, T2.pedidos_reportados
FROM	(SELECT conductor, nombresConductor FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-05-02' AS DATE) AND CAST('2017-05-13' AS DATE) GROUP BY conductor, nombresConductor) T1
LEFT JOIN	(SELECT conductor, nombresConductor, count(idtipoDeMovimiento) as pedidos_reportados FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-05-02' AS DATE) AND CAST('2017-05-13' AS DATE) AND idtipoDeMovimiento <> 1 GROUP BY conductor, nombresConductor) T2
ON T1.conductor = T2.conductor AND T1.nombresConductor = T2.nombresConductor GROUP BY T1.conductor, T1.nombresConductor;


-- CONSOLIDADO (TODOS LOS CONDUCTORES)
SELECT TT1.conductor, TT1.nombresConductor, IFNULL(TT1.total_pedidos,0) AS total_pedidos, IFNULL(TT2.pedidos_reportados,0) AS pedidos_reportados, ((IFNULL(TT2.pedidos_reportados,0) / IFNULL(TT1.total_pedidos,0)) * 100) AS rendimiento
FROM	(SELECT T1.conductor, T1.nombresConductor, T2.total_pedidos
		FROM	(SELECT conductor, nombresConductor FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-05-02' AS DATE) AND CAST('2017-05-13' AS DATE) GROUP BY conductor, nombresConductor) T1
		LEFT JOIN	(SELECT conductor, nombresConductor, count(idtipoDeMovimiento) as total_pedidos FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-05-02' AS DATE) AND CAST('2017-05-13' AS DATE) GROUP BY conductor, nombresConductor) T2
		ON T1.conductor = T2.conductor AND T1.nombresConductor = T2.nombresConductor GROUP BY T1.conductor, T1.nombresConductor) TT1
INNER JOIN	(SELECT T1.conductor, T1.nombresConductor, T2.pedidos_reportados
			FROM	(SELECT conductor, nombresConductor FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-05-02' AS DATE) AND CAST('2017-05-13' AS DATE) GROUP BY conductor, nombresConductor) T1
			LEFT JOIN	(SELECT conductor, nombresConductor, count(idtipoDeMovimiento) as pedidos_reportados FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-05-02' AS DATE) AND CAST('2017-05-13' AS DATE) AND idtipoDeMovimiento <> 1 GROUP BY conductor, nombresConductor) T2
			ON T1.conductor = T2.conductor AND T1.nombresConductor = T2.nombresConductor GROUP BY T1.conductor, T1.nombresConductor) TT2
ON TT1.conductor = TT2.conductor AND TT1.nombresConductor = TT2.nombresConductor GROUP BY TT1.conductor, TT1.nombresConductor;

-- ----------------------------------------------------------------------------------------------------------------------------

SELECT fechaDistribucion FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-05-02' AS DATE) AND CAST('2017-05-13' AS DATE) AND conductor = '1090404177' GROUP BY fechaDistribucion;

SELECT T1.fechaDistribucion, T2.total_pedidos
FROM (SELECT fechaDistribucion FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-05-02' AS DATE) AND CAST('2017-05-13' AS DATE) AND conductor = '1090404177' GROUP BY fechaDistribucion) T1
LEFT JOIN (SELECT fechaDistribucion, count(idtipoDeMovimiento) as total_pedidos FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-05-02' AS DATE) AND CAST('2017-05-13' AS DATE) AND conductor = '1090404177' GROUP BY fechaDistribucion) T2
ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion;

SELECT T1.fechaDistribucion, T2.pedidos_reportados
FROM (SELECT fechaDistribucion FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-05-02' AS DATE) AND CAST('2017-05-13' AS DATE) AND conductor = '1090404177' GROUP BY fechaDistribucion) T1
LEFT JOIN (SELECT fechaDistribucion, count(idtipoDeMovimiento) as pedidos_reportados FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-05-02' AS DATE) AND CAST('2017-05-13' AS DATE) AND conductor = '1090404177' AND idtipoDeMovimiento <> 1 GROUP BY fechaDistribucion) T2
ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion;

SELECT TT1.fechaDistribucion, IFNULL(TT1.total_pedidos,0) AS total_pedidos, IFNULL(TT2.pedidos_reportados,0) AS pedidos_reportados, ((IFNULL(TT2.pedidos_reportados,0) / IFNULL(TT1.total_pedidos,0)) * 100) AS rendimiento
FROM 	(SELECT T1.fechaDistribucion, T2.total_pedidos
		FROM (SELECT fechaDistribucion FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-05-02' AS DATE) AND CAST('2017-05-13' AS DATE) AND conductor = '1090404177' GROUP BY fechaDistribucion) T1
		LEFT JOIN (SELECT fechaDistribucion, count(idtipoDeMovimiento) as total_pedidos FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-05-02' AS DATE) AND CAST('2017-05-13' AS DATE) AND conductor = '1090404177' GROUP BY fechaDistribucion) T2
		ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion)TT1
INNER JOIN 	(SELECT T1.fechaDistribucion, T2.pedidos_reportados
			FROM (SELECT fechaDistribucion FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-05-02' AS DATE) AND CAST('2017-05-13' AS DATE) AND conductor = '1090404177' GROUP BY fechaDistribucion) T1
			LEFT JOIN (SELECT fechaDistribucion, count(idtipoDeMovimiento) as pedidos_reportados FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-05-02' AS DATE) AND CAST('2017-05-13' AS DATE) AND conductor = '1090404177' AND idtipoDeMovimiento <> 1 GROUP BY fechaDistribucion) T2
			ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion)TT2
ON TT1.fechaDistribucion = TT2.fechaDistribucion GROUP BY TT1.fechaDistribucion;