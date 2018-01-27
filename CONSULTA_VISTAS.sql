 SELECT * FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion = CAST('2017-02-18' AS DATE) ORDER BY vehiculo;

-- REPORTE DETALLADA DE RUTA POR VEHICULO EN UN PERIODO DE TIEMPO POR CANAL
SELECT TTTT1.fechaDistribucion, TTTT1.vehiculo, IFNULL(TTTT1.entrega_total,0) AS ET, IFNULL(TTTT1.entrega_parcial,0) AS EP, IFNULL(TTTT1.rechazo_total,0) AS RT, IFNULL(TTTT1.volver_zonificar,0) AS VZ, IFNULL(TTTT2.programado,0) AS PG, TTTT2.nombreCanal
FROM	(SELECT TTT1.fechaDistribucion, TTT1.vehiculo, TTT1.entrega_total, TTT1.entrega_parcial, TTT2.rechazo_total, TTT2.volver_zonificar
		FROM	(SELECT TT1.fechaDistribucion, TT1.vehiculo, TT1.entrega_total, TT2.entrega_parcial
				FROM	(SELECT T1.fechaDistribucion, T1.vehiculo, T2.entrega_total
						FROM (SELECT fechaDistribucion, vehiculo FROM vst_movilizacionfacturasdescargadas WHERE idCanal = 2 AND fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) GROUP BY  fechaDistribucion, vehiculo) T1   
						LEFT JOIN (SELECT fechaDistribucion, vehiculo, count(idtipoDeMovimiento) as entrega_total FROM vst_movilizacionfacturasdescargadas WHERE idCanal = 2 AND fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND idtipoDeMovimiento = 2 GROUP BY  fechaDistribucion, vehiculo)T2
						ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo ORDER BY  T1.fechaDistribucion, T1.vehiculo) TT1
				INNER JOIN	(SELECT T1.fechaDistribucion, T1.vehiculo, T2.entrega_parcial
							FROM (SELECT fechaDistribucion, vehiculo FROM vst_movilizacionfacturasdescargadas WHERE idCanal = 2 AND fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) GROUP BY  fechaDistribucion, vehiculo) T1   
							LEFT JOIN (SELECT fechaDistribucion, vehiculo, count(idtipoDeMovimiento) as entrega_parcial FROM vst_movilizacionfacturasdescargadas WHERE idCanal = 2 AND fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND idtipoDeMovimiento = 4 GROUP BY  fechaDistribucion, vehiculo)T2
							ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo ORDER BY  T1.fechaDistribucion, T1.vehiculo) TT2         
				ON TT1.fechaDistribucion = TT2.fechaDistribucion AND TT1.vehiculo = TT2.vehiculo ORDER BY  TT1.fechaDistribucion, TT1.vehiculo) TTT1 
		INNER JOIN	(SELECT TT1.fechaDistribucion, TT1.vehiculo, TT1.rechazo_total, TT2.volver_zonificar
					FROM	(SELECT T1.fechaDistribucion, T1.vehiculo, T2.rechazo_total
							FROM (SELECT fechaDistribucion, vehiculo FROM vst_movilizacionfacturasdescargadas WHERE idCanal = 2 AND fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) GROUP BY  fechaDistribucion, vehiculo) T1   
							LEFT JOIN (SELECT fechaDistribucion, vehiculo, count(idtipoDeMovimiento) as rechazo_total FROM vst_movilizacionfacturasdescargadas WHERE idCanal = 2 AND fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND idtipoDeMovimiento = 3 GROUP BY  fechaDistribucion, vehiculo)T2
							ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo ORDER BY  T1.fechaDistribucion, T1.vehiculo) TT1 
					INNER JOIN	(SELECT T1.fechaDistribucion, T1.vehiculo, T2.volver_zonificar
								FROM (SELECT fechaDistribucion, vehiculo FROM vst_movilizacionfacturasdescargadas WHERE idCanal = 2 AND fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) GROUP BY  fechaDistribucion, vehiculo) T1   
								LEFT JOIN (SELECT fechaDistribucion, vehiculo, count(idtipoDeMovimiento) as volver_zonificar FROM vst_movilizacionfacturasdescargadas WHERE idCanal = 2 AND fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND idtipoDeMovimiento = 6 GROUP BY  fechaDistribucion, vehiculo)T2
								ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo ORDER BY  T1.fechaDistribucion, T1.vehiculo)TT2 
					ON TT1.fechaDistribucion = TT2.fechaDistribucion AND TT1.vehiculo = TT2.vehiculo ORDER BY  TT1.fechaDistribucion, TT1.vehiculo)TTT2 
		ON TTT1.fechaDistribucion = TTT2.fechaDistribucion AND TTT1.vehiculo = TTT2.vehiculo ORDER BY  TTT1.fechaDistribucion, TTT1.vehiculo) TTTT1
INNER JOIN	(SELECT T1.fechaDistribucion, T1.vehiculo, T2.nombreCanal, T2.programado
			FROM (SELECT fechaDistribucion, vehiculo FROM vst_movilizacionfacturasdescargadas WHERE idCanal = 2 AND fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) GROUP BY  fechaDistribucion, vehiculo) T1   
			LEFT JOIN (SELECT fechaDistribucion, vehiculo, nombreCanal, count(idtipoDeMovimiento) as programado FROM vst_movilizacionfacturasdescargadas WHERE idCanal = 2 AND fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) GROUP BY  fechaDistribucion, vehiculo)T2
			ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo ORDER BY  T1.fechaDistribucion, T1.vehiculo) TTTT2        
ON TTTT1.fechaDistribucion = TTTT2.fechaDistribucion AND TTTT1.vehiculo = TTTT2.vehiculo ORDER BY  TTTT1.fechaDistribucion, TTTT1.vehiculo;

-- REPORTE DETALLADA DE RUTA POR CONDUCTOR EN UN PERIODO DE TIEMPO POR CANAL
SELECT TTTT1.fechaDistribucion, TTTT1.conductor, TTTT1.nombreConductor,IFNULL(TTTT1.entrega_total,0) AS ET, IFNULL(TTTT1.entrega_parcial,0) AS EP, IFNULL(TTTT1.rechazo_total,0) AS RT, IFNULL(TTTT1.volver_zonificar,0) AS VZ, IFNULL(TTTT2.programado,0) AS PG, TTTT2.nombreCanal
FROM	(SELECT TTT1.fechaDistribucion, TTT1.conductor, TTT1.nombreConductor, TTT1.entrega_total, TTT1.entrega_parcial, TTT2.rechazo_total, TTT2.volver_zonificar
		FROM	(SELECT TT1.fechaDistribucion, TT1.conductor, TT1.nombreConductor, TT1.entrega_total, TT2.entrega_parcial
				FROM	(SELECT T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T2.entrega_total
						FROM (SELECT fechaDistribucion, conductor, nombreConductor FROM vst_movilizacionfacturasdescargadas WHERE idCanal = 2 AND fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) GROUP BY  fechaDistribucion, conductor, nombreConductor) T1   
						LEFT JOIN (SELECT fechaDistribucion, conductor, nombreConductor, count(idtipoDeMovimiento) as entrega_total FROM vst_movilizacionfacturasdescargadas WHERE idCanal = 2 AND fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND idtipoDeMovimiento = 2 GROUP BY  fechaDistribucion, conductor, nombreConductor)T2
						ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor ORDER BY  T1.fechaDistribucion, T1.conductor, T1.nombreConductor) TT1
				INNER JOIN	(SELECT T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T2.entrega_parcial
							FROM (SELECT fechaDistribucion, conductor, nombreConductor FROM vst_movilizacionfacturasdescargadas WHERE idCanal = 2 AND fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) GROUP BY  fechaDistribucion, conductor, nombreConductor) T1   
							LEFT JOIN (SELECT fechaDistribucion, conductor, nombreConductor, count(idtipoDeMovimiento) as entrega_parcial FROM vst_movilizacionfacturasdescargadas WHERE idCanal = 2 AND fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND idtipoDeMovimiento = 4 GROUP BY  fechaDistribucion, conductor, nombreConductor)T2
							ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor ORDER BY T1.fechaDistribucion, T1.conductor, T1.nombreConductor) TT2         
				ON TT1.fechaDistribucion = TT2.fechaDistribucion AND TT1.conductor = TT2.conductor AND TT1.nombreConductor = TT2.nombreConductor ORDER BY  TT1.fechaDistribucion, TT1.conductor, TT1.nombreConductor) TTT1 
		INNER JOIN	(SELECT TT1.fechaDistribucion, TT1.conductor, TT1.nombreConductor, TT1.rechazo_total, TT2.volver_zonificar
					FROM	(SELECT T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T2.rechazo_total
							FROM (SELECT fechaDistribucion, conductor, nombreConductor FROM vst_movilizacionfacturasdescargadas WHERE idCanal = 2 AND fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) GROUP BY  fechaDistribucion, conductor, nombreConductor) T1   
							LEFT JOIN (SELECT fechaDistribucion, conductor, nombreConductor, count(idtipoDeMovimiento) as rechazo_total FROM vst_movilizacionfacturasdescargadas WHERE idCanal = 2 AND fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND idtipoDeMovimiento = 3 GROUP BY  fechaDistribucion, conductor, nombreConductor)T2
							ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor ORDER BY T1.fechaDistribucion, T1.conductor, T1.nombreConductor) TT1 
					INNER JOIN	(SELECT T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T2.volver_zonificar
								FROM (SELECT fechaDistribucion, conductor, nombreConductor FROM vst_movilizacionfacturasdescargadas WHERE idCanal = 2 AND fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) GROUP BY  fechaDistribucion, conductor, nombreConductor) T1   
								LEFT JOIN (SELECT fechaDistribucion, conductor, nombreConductor, count(idtipoDeMovimiento) as volver_zonificar FROM vst_movilizacionfacturasdescargadas WHERE idCanal = 2 AND fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND idtipoDeMovimiento = 6 GROUP BY  fechaDistribucion, conductor, nombreConductor)T2
								ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor ORDER BY  T1.fechaDistribucion, T1.conductor, T1.nombreConductor)TT2 
					ON TT1.fechaDistribucion = TT2.fechaDistribucion AND TT1.conductor = TT2.conductor AND TT1.nombreConductor = TT2.nombreConductor ORDER BY  TT1.fechaDistribucion, TT1.conductor, TT1.nombreConductor)TTT2 
		ON TTT1.fechaDistribucion = TTT2.fechaDistribucion AND TTT1.conductor = TTT2.conductor AND TTT1.nombreConductor = TTT2.nombreConductor ORDER BY  TTT1.fechaDistribucion, TTT1.conductor, TTT1.nombreConductor) TTTT1
INNER JOIN	(SELECT T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T2.nombreCanal, T2.programado
			FROM (SELECT fechaDistribucion, conductor, nombreConductor FROM vst_movilizacionfacturasdescargadas WHERE idCanal = 2 AND fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) GROUP BY  fechaDistribucion, conductor, nombreConductor) T1   
			LEFT JOIN (SELECT fechaDistribucion, conductor, nombreConductor, nombreCanal, count(idtipoDeMovimiento) as programado FROM vst_movilizacionfacturasdescargadas WHERE idCanal = 2 AND fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) GROUP BY  fechaDistribucion, conductor, nombreConductor)T2
			ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor ORDER BY  T1.fechaDistribucion, T1.conductor, T1.nombreConductor) TTTT2        
ON TTTT1.fechaDistribucion = TTTT2.fechaDistribucion AND TTTT1.conductor = TTTT2.conductor AND TTTT1.nombreConductor = TTTT2.nombreConductor ORDER BY  TTTT1.fechaDistribucion, TTTT1.conductor, TTTT1.nombreConductor;

-- REPORTE DETALLADA DE RUTA POR VEHICULO EN UN PERIODO DE TIEMPO 222222
SELECT TTTT1.fechaDistribucion, TTTT1.vehiculo, IFNULL(TTTT1.entrega_total,0) AS ET, IFNULL(TTTT1.entrega_parcial,0) AS EP, IFNULL(TTTT1.rechazo_total,0) AS RT, IFNULL(TTTT1.volver_zonificar,0) AS VZ, IFNULL(TTTT2.programado,0) AS PG, TTTT1.nombreCanal
FROM	(SELECT TTT1.fechaDistribucion, TTT1.vehiculo, TTT1.nombreCanal, TTT1.entrega_total, TTT1.entrega_parcial, TTT2.rechazo_total, TTT2.volver_zonificar
		FROM	(SELECT TT1.fechaDistribucion, TT1.vehiculo, TT1.nombreCanal, TT1.entrega_total, TT2.entrega_parcial
				FROM	(SELECT T1.fechaDistribucion, T1.vehiculo, T1.nombreCanal, T2.entrega_total
						FROM (SELECT fechaDistribucion, vehiculo, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-02-18' AS DATE) AND CAST('2017-02-18' AS DATE) GROUP BY  fechaDistribucion, vehiculo, nombreCanal) T1   
						LEFT JOIN (SELECT fechaDistribucion, vehiculo, nombreCanal, count(idtipoDeMovimiento) as entrega_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-02-18' AS DATE) AND CAST('2017-02-18' AS DATE) AND idtipoDeMovimiento = 2 GROUP BY  fechaDistribucion, vehiculo, nombreCanal)T2
						ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.nombreCanal = T2.nombreCanal ORDER BY  T1.fechaDistribucion, T1.vehiculo, T1.nombreCanal) TT1
				INNER JOIN	(SELECT T1.fechaDistribucion, T1.vehiculo, T1.nombreCanal, T2.entrega_parcial
							FROM (SELECT fechaDistribucion, vehiculo, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-02-18' AS DATE) AND CAST('2017-02-18' AS DATE) GROUP BY  fechaDistribucion, vehiculo, nombreCanal) T1   
							LEFT JOIN (SELECT fechaDistribucion, vehiculo, nombreCanal, count(idtipoDeMovimiento) as entrega_parcial FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-02-18' AS DATE) AND CAST('2017-02-18' AS DATE) AND idtipoDeMovimiento = 4 GROUP BY  fechaDistribucion, vehiculo, nombreCanal)T2
							ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.nombreCanal = T2.nombreCanal ORDER BY  T1.fechaDistribucion, T1.vehiculo, T1.nombreCanal) TT2         
				ON TT1.fechaDistribucion = TT2.fechaDistribucion AND TT1.vehiculo = TT2.vehiculo AND TT1.nombreCanal = TT2.nombreCanal ORDER BY  TT1.fechaDistribucion, TT1.vehiculo, TT1.nombreCanal) TTT1 
		INNER JOIN	(SELECT TT1.fechaDistribucion, TT1.vehiculo, TT1.nombreCanal, TT1.rechazo_total, TT2.volver_zonificar
					FROM	(SELECT T1.fechaDistribucion, T1.vehiculo, T1.nombreCanal, T2.rechazo_total
							FROM (SELECT fechaDistribucion, vehiculo, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-02-18' AS DATE) AND CAST('2017-02-18' AS DATE) GROUP BY  fechaDistribucion, vehiculo, nombreCanal) T1   
							LEFT JOIN (SELECT fechaDistribucion, vehiculo, nombreCanal, count(idtipoDeMovimiento) as rechazo_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-02-18' AS DATE) AND CAST('2017-02-18' AS DATE) AND idtipoDeMovimiento = 3 GROUP BY  fechaDistribucion, vehiculo, nombreCanal)T2
							ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.nombreCanal = T2.nombreCanal ORDER BY  T1.fechaDistribucion, T1.vehiculo, T1.nombreCanal) TT1 
					INNER JOIN	(SELECT T1.fechaDistribucion, T1.vehiculo, T1.nombreCanal, T2.volver_zonificar
								FROM (SELECT fechaDistribucion, vehiculo, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-02-18' AS DATE) AND CAST('2017-02-18' AS DATE) GROUP BY  fechaDistribucion, vehiculo, nombreCanal) T1   
								LEFT JOIN (SELECT fechaDistribucion, vehiculo, nombreCanal, count(idtipoDeMovimiento) as volver_zonificar FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-02-18' AS DATE) AND CAST('2017-02-18' AS DATE) AND idtipoDeMovimiento = 6 GROUP BY  fechaDistribucion, vehiculo, nombreCanal)T2
								ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.nombreCanal = T2.nombreCanal ORDER BY  T1.fechaDistribucion, T1.vehiculo, T1.nombreCanal)TT2 
					ON TT1.fechaDistribucion = TT2.fechaDistribucion AND TT1.vehiculo = TT2.vehiculo AND TT1.nombreCanal = TT2.nombreCanal ORDER BY  TT1.fechaDistribucion, TT1.vehiculo, TT1.nombreCanal)TTT2 
		ON TTT1.fechaDistribucion = TTT2.fechaDistribucion AND TTT1.vehiculo = TTT2.vehiculo AND TTT1.nombreCanal = TTT2.nombreCanal ORDER BY  TTT1.fechaDistribucion, TTT1.vehiculo, TTT1.nombreCanal) TTTT1
INNER JOIN	(SELECT T1.fechaDistribucion, T1.vehiculo, T2.nombreCanal, T2.programado
			FROM (SELECT fechaDistribucion, vehiculo, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-02-18' AS DATE) AND CAST('2017-02-18' AS DATE) GROUP BY  fechaDistribucion, vehiculo, nombreCanal) T1   
			LEFT JOIN (SELECT fechaDistribucion, vehiculo, nombreCanal, count(idtipoDeMovimiento) as programado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-02-18' AS DATE) AND CAST('2017-02-18' AS DATE) GROUP BY  fechaDistribucion, vehiculo, nombreCanal)T2
			ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.nombreCanal = T2.nombreCanal ORDER BY  T1.fechaDistribucion, T1.vehiculo, T1.nombreCanal) TTTT2        
ON TTTT1.fechaDistribucion = TTTT2.fechaDistribucion AND TTTT1.vehiculo = TTTT2.vehiculo AND TTTT1.nombreCanal = TTTT2.nombreCanal ORDER BY  TTTT1.fechaDistribucion, TTTT1.vehiculo, TTTT1.nombreCanal;


-- REPORTE DETALLADA DE RUTA POR CONDUCTOR EN UN PERIODO DE TIEMPO 2222
SELECT TTTT1.fechaDistribucion, TTTT1.conductor, TTTT1.nombreConductor,IFNULL(TTTT1.entrega_total,0) AS ET, IFNULL(TTTT1.entrega_parcial,0) AS EP, IFNULL(TTTT1.rechazo_total,0) AS RT, IFNULL(TTTT1.volver_zonificar,0) AS VZ, IFNULL(TTTT2.programado,0) AS PG, TTTT1.nombreCanal
FROM	(SELECT TTT1.fechaDistribucion, TTT1.conductor, TTT1.nombreConductor, TTT1.nombreCanal, TTT1.entrega_total, TTT1.entrega_parcial, TTT2.rechazo_total, TTT2.volver_zonificar
		FROM	(SELECT TT1.fechaDistribucion, TT1.conductor, TT1.nombreConductor, TT1.nombreCanal, TT1.entrega_total, TT2.entrega_parcial
				FROM	(SELECT T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T1.nombreCanal, T2.entrega_total
						FROM (SELECT fechaDistribucion, conductor, nombreConductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-02-18' AS DATE) AND CAST('2017-02-18' AS DATE) GROUP BY  fechaDistribucion, conductor, nombreConductor,nombreCanal) T1   
						LEFT JOIN (SELECT fechaDistribucion, conductor, nombreConductor, nombreCanal, count(idtipoDeMovimiento) as entrega_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-02-18' AS DATE) AND CAST('2017-02-18' AS DATE) AND idtipoDeMovimiento = 2 GROUP BY  fechaDistribucion, conductor, nombreConductor,nombreCanal)T2
						ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.nombreCanal = T2.nombreCanal ORDER BY  T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T1.nombreCanal) TT1
				INNER JOIN	(SELECT T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T1.nombreCanal, T2.entrega_parcial
							FROM (SELECT fechaDistribucion, conductor, nombreConductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-02-18' AS DATE) AND CAST('2017-02-18' AS DATE) GROUP BY  fechaDistribucion, conductor, nombreConductor, nombreCanal) T1   
							LEFT JOIN (SELECT fechaDistribucion, conductor, nombreConductor, nombreCanal, count(idtipoDeMovimiento) as entrega_parcial FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-02-18' AS DATE) AND CAST('2017-02-18' AS DATE) AND idtipoDeMovimiento = 4 GROUP BY  fechaDistribucion, conductor, nombreConductor, nombreCanal)T2
							ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.nombreCanal = T2.nombreCanal ORDER BY  T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T1.nombreCanal) TT2         
				ON TT1.fechaDistribucion = TT2.fechaDistribucion AND TT1.conductor = TT2.conductor AND TT1.nombreConductor = TT2.nombreConductor AND TT1.nombreCanal = TT2.nombreCanal ORDER BY  TT1.fechaDistribucion, TT1.conductor, TT1.nombreConductor, TT1.nombreCanal) TTT1 
		INNER JOIN	(SELECT TT1.fechaDistribucion, TT1.conductor, TT1.nombreConductor, TT2.nombreCanal, TT1.rechazo_total, TT2.volver_zonificar
					FROM	(SELECT T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T1.nombreCanal, T2.rechazo_total
							FROM (SELECT fechaDistribucion, conductor, nombreConductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-02-18' AS DATE) AND CAST('2017-02-18' AS DATE) GROUP BY  fechaDistribucion, conductor, nombreConductor, nombreCanal) T1   
							LEFT JOIN (SELECT fechaDistribucion, conductor, nombreConductor, nombreCanal, count(idtipoDeMovimiento) as rechazo_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-02-18' AS DATE) AND CAST('2017-02-18' AS DATE) AND idtipoDeMovimiento = 3 GROUP BY  fechaDistribucion, conductor, nombreConductor, nombreCanal)T2
							ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.nombreCanal = T2.nombreCanal ORDER BY  T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T1.nombreCanal) TT1 
					INNER JOIN	(SELECT T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T1.nombreCanal, T2.volver_zonificar
								FROM (SELECT fechaDistribucion, conductor, nombreConductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-02-18' AS DATE) AND CAST('2017-02-18' AS DATE) GROUP BY  fechaDistribucion, conductor, nombreConductor, nombreCanal) T1   
								LEFT JOIN (SELECT fechaDistribucion, conductor, nombreConductor, nombreCanal, count(idtipoDeMovimiento) as volver_zonificar FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-02-18' AS DATE) AND CAST('2017-02-18' AS DATE) AND idtipoDeMovimiento = 6 GROUP BY  fechaDistribucion, conductor, nombreConductor, nombreCanal)T2
								ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.nombreCanal = T2.nombreCanal ORDER BY  T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T1.nombreCanal)TT2 
					ON TT1.fechaDistribucion = TT2.fechaDistribucion AND TT1.conductor = TT2.conductor AND TT1.nombreConductor = TT2.nombreConductor AND TT1.nombreCanal = TT2.nombreCanal ORDER BY  TT1.fechaDistribucion, TT1.conductor, TT1.nombreConductor, TT1.nombreCanal)TTT2 
		ON TTT1.fechaDistribucion = TTT2.fechaDistribucion AND TTT1.conductor = TTT2.conductor AND TTT1.nombreConductor = TTT2.nombreConductor AND TTT1.nombreCanal = TTT2.nombreCanal ORDER BY  TTT1.fechaDistribucion, TTT1.conductor, TTT1.nombreConductor, TTT1.nombreCanal) TTTT1
INNER JOIN	(SELECT T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T1.nombreCanal, T2.programado
			FROM (SELECT fechaDistribucion, conductor, nombreConductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-02-18' AS DATE) AND CAST('2017-02-18' AS DATE) GROUP BY  fechaDistribucion, conductor, nombreConductor, nombreCanal) T1   
			LEFT JOIN (SELECT fechaDistribucion, conductor, nombreConductor, nombreCanal, count(idtipoDeMovimiento) as programado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-02-18' AS DATE) AND CAST('2017-02-18' AS DATE) GROUP BY  fechaDistribucion, conductor, nombreConductor, nombreCanal)T2
			ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.nombreCanal = T2.nombreCanal ORDER BY  T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T1.nombreCanal) TTTT2        
ON TTTT1.fechaDistribucion = TTTT2.fechaDistribucion AND TTTT1.conductor = TTTT2.conductor AND TTTT1.nombreConductor = TTTT2.nombreConductor AND TTTT1.nombreCanal = TTTT2.nombreCanal ORDER BY  TTTT1.fechaDistribucion, TTTT1.conductor, TTTT1.nombreConductor, TTTT1.nombreCanal;















