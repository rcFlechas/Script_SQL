			SELECT TTTT1.fechaDistribucion, TTTT1.conductor, TTTT1.nombreConductor,IFNULL(TTTT1.entrega_total,0) AS ET, IFNULL(TTTT1.entrega_parcial,0) AS EP, IFNULL(TTTT1.rechazo_total,0) AS RT, IFNULL(TTTT1.volver_zonificar,0) AS VZ, IFNULL(TTTT2.programado,0) AS PG, TTTT1.nombreCanal
            FROM	(SELECT TTT1.fechaDistribucion, TTT1.conductor, TTT1.nombreConductor, TTT1.nombreCanal, TTT1.entrega_total, TTT1.entrega_parcial, TTT2.rechazo_total, TTT2.volver_zonificar
            		FROM	(SELECT TT1.fechaDistribucion, TT1.conductor, TT1.nombreConductor, TT1.nombreCanal, TT1.entrega_total, TT2.entrega_parcial
            				FROM	(SELECT T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T1.nombreCanal, T2.entrega_total
            						FROM (SELECT fechaDistribucion, conductor, nombreConductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST(?   AS DATE) AND CAST(?   AS DATE) GROUP BY  fechaDistribucion, conductor, nombreConductor,nombreCanal) T1   
            						LEFT JOIN (SELECT fechaDistribucion, conductor, nombreConductor, nombreCanal, count(idtipoDeMovimiento) as entrega_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST(?   AS DATE) AND CAST(?   AS DATE) AND idtipoDeMovimiento = 2 GROUP BY  fechaDistribucion, conductor, nombreConductor,nombreCanal)T2
            						ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.nombreCanal = T2.nombreCanal ORDER BY  T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T1.nombreCanal) TT1
            				INNER JOIN	(SELECT T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T1.nombreCanal, T2.entrega_parcial
            							FROM (SELECT fechaDistribucion, conductor, nombreConductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST(?   AS DATE) AND CAST(?   AS DATE) GROUP BY  fechaDistribucion, conductor, nombreConductor, nombreCanal) T1   
            							LEFT JOIN (SELECT fechaDistribucion, conductor, nombreConductor, nombreCanal, count(idtipoDeMovimiento) as entrega_parcial FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST(?   AS DATE) AND CAST(?   AS DATE) AND idtipoDeMovimiento = 4 GROUP BY  fechaDistribucion, conductor, nombreConductor, nombreCanal)T2
            							ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.nombreCanal = T2.nombreCanal ORDER BY  T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T1.nombreCanal) TT2         
            				ON TT1.fechaDistribucion = TT2.fechaDistribucion AND TT1.conductor = TT2.conductor AND TT1.nombreConductor = TT2.nombreConductor AND TT1.nombreCanal = TT2.nombreCanal ORDER BY  TT1.fechaDistribucion, TT1.conductor, TT1.nombreConductor, TT1.nombreCanal) TTT1 
            		INNER JOIN	(SELECT TT1.fechaDistribucion, TT1.conductor, TT1.nombreConductor, TT2.nombreCanal, TT1.rechazo_total, TT2.volver_zonificar
            					FROM	(SELECT T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T1.nombreCanal, T2.rechazo_total
            							FROM (SELECT fechaDistribucion, conductor, nombreConductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST(?   AS DATE) AND CAST(?   AS DATE) GROUP BY  fechaDistribucion, conductor, nombreConductor, nombreCanal) T1   
            							LEFT JOIN (SELECT fechaDistribucion, conductor, nombreConductor, nombreCanal, count(idtipoDeMovimiento) as rechazo_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST(?   AS DATE) AND CAST(?   AS DATE) AND idtipoDeMovimiento = 3 GROUP BY  fechaDistribucion, conductor, nombreConductor, nombreCanal)T2
            							ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.nombreCanal = T2.nombreCanal ORDER BY  T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T1.nombreCanal) TT1 
            					INNER JOIN	(SELECT T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T1.nombreCanal, T2.volver_zonificar
            								FROM (SELECT fechaDistribucion, conductor, nombreConductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST(?   AS DATE) AND CAST(?   AS DATE) GROUP BY  fechaDistribucion, conductor, nombreConductor, nombreCanal) T1   
            								LEFT JOIN (SELECT fechaDistribucion, conductor, nombreConductor, nombreCanal, count(idtipoDeMovimiento) as volver_zonificar FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST(?   AS DATE) AND CAST(?   AS DATE) AND idtipoDeMovimiento = 6 GROUP BY  fechaDistribucion, conductor, nombreConductor, nombreCanal)T2
            								ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.nombreCanal = T2.nombreCanal ORDER BY  T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T1.nombreCanal)TT2 
            					ON TT1.fechaDistribucion = TT2.fechaDistribucion AND TT1.conductor = TT2.conductor AND TT1.nombreConductor = TT2.nombreConductor AND TT1.nombreCanal = TT2.nombreCanal ORDER BY  TT1.fechaDistribucion, TT1.conductor, TT1.nombreConductor, TT1.nombreCanal)TTT2 
            		ON TTT1.fechaDistribucion = TTT2.fechaDistribucion AND TTT1.conductor = TTT2.conductor AND TTT1.nombreConductor = TTT2.nombreConductor AND TTT1.nombreCanal = TTT2.nombreCanal ORDER BY  TTT1.fechaDistribucion, TTT1.conductor, TTT1.nombreConductor, TTT1.nombreCanal) TTTT1
            INNER JOIN	(SELECT T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T1.nombreCanal, T2.programado
            			FROM (SELECT fechaDistribucion, conductor, nombreConductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST(?   AS DATE) AND CAST(?   AS DATE) GROUP BY  fechaDistribucion, conductor, nombreConductor, nombreCanal) T1   
            			LEFT JOIN (SELECT fechaDistribucion, conductor, nombreConductor, nombreCanal, count(idtipoDeMovimiento) as programado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST(?   AS DATE) AND CAST(?   AS DATE) GROUP BY  fechaDistribucion, conductor, nombreConductor, nombreCanal)T2
            			ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.nombreCanal = T2.nombreCanal ORDER BY  T1.fechaDistribucion, T1.conductor, T1.nombreConductor, T1.nombreCanal) TTTT2        
            ON TTTT1.fechaDistribucion = TTTT2.fechaDistribucion AND TTTT1.conductor = TTTT2.conductor AND TTTT1.nombreConductor = TTTT2.nombreConductor AND TTTT1.nombreCanal = TTTT2.nombreCanal ORDER BY  TTTT1.fechaDistribucion, TTTT1.conductor, TTTT1.nombreConductor, TTTT1.nombreCanal;
            
                             
SELECT	T1.conductor, T1.nombreConductor, T1.nombreCanal, T2.entrega_total 
FROM	(SELECT conductor, nombreConductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) GROUP BY conductor, nombreConductor, nombreCanal) T1	 
LEFT JOIN	(SELECT conductor, nombreConductor, nombreCanal, count(idtipoDeMovimiento) as entrega_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idtipoDeMovimiento = 2 GROUP BY conductor, nombreConductor,nombreCanal)T2 
ON	T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.conductor, T1.nombreConductor, T1.nombreCanal;
            
SELECT T1.conductor, T1.nombreConductor, T1.nombreCanal, T2.entrega_parcial
FROM	(SELECT conductor, nombreConductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) GROUP BY conductor, nombreConductor, nombreCanal) T1	 
LEFT JOIN	(SELECT conductor, nombreConductor, nombreCanal, count(idtipoDeMovimiento) as entrega_parcial FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idtipoDeMovimiento = 4 GROUP BY conductor, nombreConductor,nombreCanal)T2 
ON	T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.conductor, T1.nombreConductor, T1.nombreCanal;             
            
SELECT T1.conductor, T1.nombreConductor, T1.nombreCanal, T2.rechazo_total
FROM	(SELECT conductor, nombreConductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) GROUP BY conductor, nombreConductor, nombreCanal) T1	 
LEFT JOIN	(SELECT conductor, nombreConductor, nombreCanal, count(idtipoDeMovimiento) as rechazo_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idtipoDeMovimiento = 3 GROUP BY conductor, nombreConductor,nombreCanal)T2 
ON	T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.conductor, T1.nombreConductor, T1.nombreCanal;         
            
SELECT T1.conductor, T1.nombreConductor, T1.nombreCanal, T2.volver_zonificar
FROM	(SELECT conductor, nombreConductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) GROUP BY conductor, nombreConductor, nombreCanal) T1	 
LEFT JOIN	(SELECT conductor, nombreConductor, nombreCanal, count(idtipoDeMovimiento) as volver_zonificar FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idtipoDeMovimiento = 6 GROUP BY conductor, nombreConductor,nombreCanal)T2 
ON	T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.conductor, T1.nombreConductor, T1.nombreCanal;                   
            
SELECT T1.conductor, T1.nombreConductor, T1.nombreCanal, T2.programado
FROM	(SELECT conductor, nombreConductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) GROUP BY conductor, nombreConductor, nombreCanal) T1	 
LEFT JOIN	(SELECT conductor, nombreConductor, nombreCanal, count(idtipoDeMovimiento) as programado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) GROUP BY conductor, nombreConductor,nombreCanal)T2 
ON	T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.conductor, T1.nombreConductor, T1.nombreCanal;

SELECT TT1.conductor, TT1.nombreConductor, TT1.nombreCanal, TT1.entrega_total, TT2.entrega_parcial 
FROM	(SELECT	T1.conductor, T1.nombreConductor, T1.nombreCanal, T2.entrega_total 
		FROM	(SELECT conductor, nombreConductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) GROUP BY conductor, nombreConductor, nombreCanal) T1	 
		LEFT JOIN	(SELECT conductor, nombreConductor, nombreCanal, count(idtipoDeMovimiento) as entrega_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idtipoDeMovimiento = 2 GROUP BY conductor, nombreConductor,nombreCanal)T2 
		ON	T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.conductor, T1.nombreConductor, T1.nombreCanal) TT1 
INNER JOIN	(SELECT T1.conductor, T1.nombreConductor, T1.nombreCanal, T2.entrega_parcial
			FROM	(SELECT conductor, nombreConductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) GROUP BY conductor, nombreConductor, nombreCanal) T1	 
			LEFT JOIN	(SELECT conductor, nombreConductor, nombreCanal, count(idtipoDeMovimiento) as entrega_parcial FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idtipoDeMovimiento = 4 GROUP BY conductor, nombreConductor,nombreCanal)T2 
			ON	T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.conductor, T1.nombreConductor, T1.nombreCanal)TT2
ON TT1.conductor = TT2.conductor AND TT1.nombreConductor = TT2.nombreConductor AND TT1.nombreCanal = TT2.nombreCanal GROUP BY TT1.conductor, TT1.nombreConductor, TT1.nombreCanal;

SELECT TT1.conductor, TT1.nombreConductor, TT2.nombreCanal, TT1.rechazo_total, TT2.volver_zonificar
FROM	(SELECT T1.conductor, T1.nombreConductor, T1.nombreCanal, T2.rechazo_total
		FROM	(SELECT conductor, nombreConductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) GROUP BY conductor, nombreConductor, nombreCanal) T1	 
		LEFT JOIN	(SELECT conductor, nombreConductor, nombreCanal, count(idtipoDeMovimiento) as rechazo_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idtipoDeMovimiento = 3 GROUP BY conductor, nombreConductor,nombreCanal)T2 
		ON	T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.conductor, T1.nombreConductor, T1.nombreCanal) TT1 
INNER JOIN	(SELECT T1.conductor, T1.nombreConductor, T1.nombreCanal, T2.volver_zonificar
			FROM	(SELECT conductor, nombreConductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) GROUP BY conductor, nombreConductor, nombreCanal) T1	 
			LEFT JOIN	(SELECT conductor, nombreConductor, nombreCanal, count(idtipoDeMovimiento) as volver_zonificar FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idtipoDeMovimiento = 6 GROUP BY conductor, nombreConductor,nombreCanal)T2 
			ON	T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.conductor, T1.nombreConductor, T1.nombreCanal)TT2
ON TT1.conductor = TT2.conductor AND TT1.nombreConductor = TT2.nombreConductor AND TT1.nombreCanal = TT2.nombreCanal GROUP BY TT1.conductor, TT1.nombreConductor, TT1.nombreCanal;

SELECT TTT1.conductor, TTT1.nombreConductor, TTT1.nombreCanal, TTT1.entrega_total, TTT1.entrega_parcial, TTT2.rechazo_total, TTT2.volver_zonificar
FROM	(SELECT TT1.conductor, TT1.nombreConductor, TT1.nombreCanal, TT1.entrega_total, TT2.entrega_parcial 
		FROM	(SELECT	T1.conductor, T1.nombreConductor, T1.nombreCanal, T2.entrega_total 
				FROM	(SELECT conductor, nombreConductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) GROUP BY conductor, nombreConductor, nombreCanal) T1	 
				LEFT JOIN	(SELECT conductor, nombreConductor, nombreCanal, count(idtipoDeMovimiento) as entrega_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idtipoDeMovimiento = 2 GROUP BY conductor, nombreConductor,nombreCanal)T2 
				ON	T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.conductor, T1.nombreConductor, T1.nombreCanal) TT1 
		INNER JOIN	(SELECT T1.conductor, T1.nombreConductor, T1.nombreCanal, T2.entrega_parcial
					FROM	(SELECT conductor, nombreConductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) GROUP BY conductor, nombreConductor, nombreCanal) T1	 
					LEFT JOIN	(SELECT conductor, nombreConductor, nombreCanal, count(idtipoDeMovimiento) as entrega_parcial FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idtipoDeMovimiento = 4 GROUP BY conductor, nombreConductor,nombreCanal)T2 
					ON	T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.conductor, T1.nombreConductor, T1.nombreCanal)TT2
		ON TT1.conductor = TT2.conductor AND TT1.nombreConductor = TT2.nombreConductor AND TT1.nombreCanal = TT2.nombreCanal GROUP BY TT1.conductor, TT1.nombreConductor, TT1.nombreCanal) TTT1 
INNER JOIN	(SELECT TT1.conductor, TT1.nombreConductor, TT2.nombreCanal, TT1.rechazo_total, TT2.volver_zonificar
			FROM	(SELECT T1.conductor, T1.nombreConductor, T1.nombreCanal, T2.rechazo_total
					FROM	(SELECT conductor, nombreConductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) GROUP BY conductor, nombreConductor, nombreCanal) T1	 
					LEFT JOIN	(SELECT conductor, nombreConductor, nombreCanal, count(idtipoDeMovimiento) as rechazo_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idtipoDeMovimiento = 3 GROUP BY conductor, nombreConductor,nombreCanal)T2 
					ON	T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.conductor, T1.nombreConductor, T1.nombreCanal) TT1 
			INNER JOIN	(SELECT T1.conductor, T1.nombreConductor, T1.nombreCanal, T2.volver_zonificar
						FROM	(SELECT conductor, nombreConductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) GROUP BY conductor, nombreConductor, nombreCanal) T1	 
						LEFT JOIN	(SELECT conductor, nombreConductor, nombreCanal, count(idtipoDeMovimiento) as volver_zonificar FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idtipoDeMovimiento = 6 GROUP BY conductor, nombreConductor,nombreCanal)T2 
						ON	T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.conductor, T1.nombreConductor, T1.nombreCanal)TT2
			ON TT1.conductor = TT2.conductor AND TT1.nombreConductor = TT2.nombreConductor AND TT1.nombreCanal = TT2.nombreCanal GROUP BY TT1.conductor, TT1.nombreConductor, TT1.nombreCanal)TTT2
ON TTT1.conductor = TTT2.conductor AND TTT1.nombreConductor = TTT2.nombreConductor AND TTT1.nombreCanal = TTT2.nombreCanal GROUP BY TTT1.conductor, TTT1.nombreConductor, TTT1.nombreCanal;
 
 
-- DEFINITIVO TODOS
SELECT TTTT1.conductor, TTTT1.nombreConductor,IFNULL(TTTT1.entrega_total,0) AS ET, IFNULL(TTTT1.entrega_parcial,0) AS EP, IFNULL(TTTT1.rechazo_total,0) AS RT, IFNULL(TTTT1.volver_zonificar,0) AS VZ, IFNULL(TTTT2.programado,0) AS PG, TTTT1.nombreCanal, TTTT1.idCanal
FROM	(SELECT TTT1.conductor, TTT1.nombreConductor, TTT1.idCanal, TTT1.nombreCanal, TTT1.entrega_total, TTT1.entrega_parcial, TTT2.rechazo_total, TTT2.volver_zonificar
		FROM	(SELECT TT1.conductor, TT1.nombreConductor, TT1.idCanal, TT1.nombreCanal, TT1.entrega_total, TT2.entrega_parcial 
				FROM	(SELECT	T1.conductor, T1.nombreConductor, T1.idCanal, T1.nombreCanal, T2.entrega_total 
						FROM	(SELECT conductor, nombreConductor, idCanal, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) GROUP BY conductor, nombreConductor, idCanal) T1	 
						LEFT JOIN	(SELECT conductor, nombreConductor, idCanal, nombreCanal, count(idtipoDeMovimiento) as entrega_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idtipoDeMovimiento = 2 GROUP BY conductor, nombreConductor,idCanal)T2 
						ON	T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.idCanal = T2.idCanal GROUP BY T1.conductor, T1.nombreConductor, T1.idCanal) TT1 
				INNER JOIN	(SELECT T1.conductor, T1.nombreConductor, T1.idCanal, T1.nombreCanal, T2.entrega_parcial
							FROM	(SELECT conductor, nombreConductor, idCanal, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) GROUP BY conductor, nombreConductor, idCanal) T1	 
							LEFT JOIN	(SELECT conductor, nombreConductor, idCanal, nombreCanal, count(idtipoDeMovimiento) as entrega_parcial FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idtipoDeMovimiento = 4 GROUP BY conductor, nombreConductor,idCanal)T2 
							ON	T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.idCanal = T2.idCanal GROUP BY T1.conductor, T1.nombreConductor, T1.idCanal)TT2
				ON TT1.conductor = TT2.conductor AND TT1.nombreConductor = TT2.nombreConductor AND TT1.idCanal = TT2.idCanal GROUP BY TT1.conductor, TT1.nombreConductor, TT1.idCanal) TTT1 
		INNER JOIN	(SELECT TT1.conductor, TT1.nombreConductor, TT1.idCanal, TT2.nombreCanal, TT1.rechazo_total, TT2.volver_zonificar
					FROM	(SELECT T1.conductor, T1.nombreConductor, T1.idCanal, T1.nombreCanal, T2.rechazo_total
							FROM	(SELECT conductor, nombreConductor, idCanal, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) GROUP BY conductor, nombreConductor, idCanal) T1	 
							LEFT JOIN	(SELECT conductor, nombreConductor, idCanal, nombreCanal, count(idtipoDeMovimiento) as rechazo_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idtipoDeMovimiento = 3 GROUP BY conductor, nombreConductor,idCanal)T2 
							ON	T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.idCanal = T2.idCanal GROUP BY T1.conductor, T1.nombreConductor, T1.idCanal) TT1 
					INNER JOIN	(SELECT T1.conductor, T1.nombreConductor, T1.idCanal, T1.nombreCanal, T2.volver_zonificar
								FROM	(SELECT conductor, nombreConductor, idCanal, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) GROUP BY conductor, nombreConductor, idCanal) T1	 
								LEFT JOIN	(SELECT conductor, nombreConductor, idCanal, nombreCanal, count(idtipoDeMovimiento) as volver_zonificar FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idtipoDeMovimiento = 6 GROUP BY conductor, nombreConductor,idCanal)T2 
								ON	T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.idCanal = T2.idCanal GROUP BY T1.conductor, T1.nombreConductor, T1.idCanal)TT2
					ON TT1.conductor = TT2.conductor AND TT1.nombreConductor = TT2.nombreConductor AND TT1.idCanal = TT2.idCanal GROUP BY TT1.conductor, TT1.nombreConductor, TT1.idCanal)TTT2
		ON TTT1.conductor = TTT2.conductor AND TTT1.nombreConductor = TTT2.nombreConductor AND TTT1.idCanal = TTT2.idCanal GROUP BY TTT1.conductor, TTT1.nombreConductor, TTT1.idCanal) TTTT1 
INNER JOIN	(SELECT T1.conductor, T1.nombreConductor, T1.idCanal, T1.nombreCanal, T2.programado
			FROM	(SELECT conductor, nombreConductor, idCanal, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) GROUP BY conductor, nombreConductor, idCanal) T1	 
			LEFT JOIN	(SELECT conductor, nombreConductor, idCanal, nombreCanal, count(idtipoDeMovimiento) as programado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) GROUP BY conductor, nombreConductor,idCanal)T2 
			ON	T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.idCanal = T2.idCanal GROUP BY T1.conductor, T1.nombreConductor, T1.idCanal)TTTT2
ON TTTT1.conductor = TTTT2.conductor AND TTTT1.nombreConductor = TTTT2.nombreConductor AND TTTT1.idCanal = TTTT2.idCanal GROUP BY TTTT1.conductor, TTTT1.nombreConductor, TTTT1.idCanal ORDER BY TTTT1.idCanal, TTTT1.nombreConductor;

-- DEFINITIVO POR CANAL
SELECT TTTT1.conductor, TTTT1.nombreConductor,IFNULL(TTTT1.entrega_total,0) AS ET, IFNULL(TTTT1.entrega_parcial,0) AS EP, IFNULL(TTTT1.rechazo_total,0) AS RT, IFNULL(TTTT1.volver_zonificar,0) AS VZ, IFNULL(TTTT2.programado,0) AS PG, TTTT1.nombreCanal, TTTT1.idCanal
FROM	(SELECT TTT1.conductor, TTT1.nombreConductor, TTT1.idCanal, TTT1.nombreCanal, TTT1.entrega_total, TTT1.entrega_parcial, TTT2.rechazo_total, TTT2.volver_zonificar
		FROM	(SELECT TT1.conductor, TT1.nombreConductor, TT1.idCanal, TT1.nombreCanal, TT1.entrega_total, TT2.entrega_parcial 
				FROM	(SELECT	T1.conductor, T1.nombreConductor, T1.idCanal, T1.nombreCanal, T2.entrega_total 
						FROM	(SELECT conductor, nombreConductor, idCanal, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idCanal = 2 GROUP BY conductor, nombreConductor, idCanal) T1	 
						LEFT JOIN	(SELECT conductor, nombreConductor, idCanal, nombreCanal, count(idtipoDeMovimiento) as entrega_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idCanal = 2 AND idtipoDeMovimiento = 2 GROUP BY conductor, nombreConductor,idCanal)T2 
						ON	T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.idCanal = T2.idCanal GROUP BY T1.conductor, T1.nombreConductor, T1.idCanal) TT1 
				INNER JOIN	(SELECT T1.conductor, T1.nombreConductor, T1.idCanal, T1.nombreCanal, T2.entrega_parcial
							FROM	(SELECT conductor, nombreConductor, idCanal, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idCanal = 2 GROUP BY conductor, nombreConductor, idCanal) T1	 
							LEFT JOIN	(SELECT conductor, nombreConductor, idCanal, nombreCanal, count(idtipoDeMovimiento) as entrega_parcial FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idCanal = 2 AND idtipoDeMovimiento = 4 GROUP BY conductor, nombreConductor,idCanal)T2 
							ON	T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.idCanal = T2.idCanal GROUP BY T1.conductor, T1.nombreConductor, T1.idCanal)TT2
				ON TT1.conductor = TT2.conductor AND TT1.nombreConductor = TT2.nombreConductor AND TT1.idCanal = TT2.idCanal GROUP BY TT1.conductor, TT1.nombreConductor, TT1.idCanal) TTT1 
		INNER JOIN	(SELECT TT1.conductor, TT1.nombreConductor, TT1.idCanal, TT2.nombreCanal, TT1.rechazo_total, TT2.volver_zonificar
					FROM	(SELECT T1.conductor, T1.nombreConductor, T1.idCanal, T1.nombreCanal, T2.rechazo_total
							FROM	(SELECT conductor, nombreConductor, idCanal, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idCanal = 2 GROUP BY conductor, nombreConductor, idCanal) T1	 
							LEFT JOIN	(SELECT conductor, nombreConductor, idCanal, nombreCanal, count(idtipoDeMovimiento) as rechazo_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idCanal = 2 AND idtipoDeMovimiento = 3 GROUP BY conductor, nombreConductor,idCanal)T2 
							ON	T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.idCanal = T2.idCanal GROUP BY T1.conductor, T1.nombreConductor, T1.idCanal) TT1 
					INNER JOIN	(SELECT T1.conductor, T1.nombreConductor, T1.idCanal, T1.nombreCanal, T2.volver_zonificar
								FROM	(SELECT conductor, nombreConductor, idCanal, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idCanal = 2 GROUP BY conductor, nombreConductor, idCanal) T1	 
								LEFT JOIN	(SELECT conductor, nombreConductor, idCanal, nombreCanal, count(idtipoDeMovimiento) as volver_zonificar FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idCanal = 2 AND idtipoDeMovimiento = 6 GROUP BY conductor, nombreConductor,idCanal)T2 
								ON	T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.idCanal = T2.idCanal GROUP BY T1.conductor, T1.nombreConductor, T1.idCanal)TT2
					ON TT1.conductor = TT2.conductor AND TT1.nombreConductor = TT2.nombreConductor AND TT1.idCanal = TT2.idCanal GROUP BY TT1.conductor, TT1.nombreConductor, TT1.idCanal)TTT2
		ON TTT1.conductor = TTT2.conductor AND TTT1.nombreConductor = TTT2.nombreConductor AND TTT1.idCanal = TTT2.idCanal GROUP BY TTT1.conductor, TTT1.nombreConductor, TTT1.idCanal) TTTT1 
INNER JOIN	(SELECT T1.conductor, T1.nombreConductor, T1.idCanal, T1.nombreCanal, T2.programado
			FROM	(SELECT conductor, nombreConductor, idCanal, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idCanal = 2 GROUP BY conductor, nombreConductor, idCanal) T1	 
			LEFT JOIN	(SELECT conductor, nombreConductor, idCanal, nombreCanal, count(idtipoDeMovimiento) as programado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-05-01' AS DATE) AND CAST('2017-05-31' AS DATE) AND idCanal = 2 GROUP BY conductor, nombreConductor,idCanal)T2 
			ON	T1.conductor = T2.conductor AND T1.nombreConductor = T2.nombreConductor AND T1.idCanal = T2.idCanal GROUP BY T1.conductor, T1.nombreConductor, T1.idCanal)TTTT2
ON TTTT1.conductor = TTTT2.conductor AND TTTT1.nombreConductor = TTTT2.nombreConductor AND TTTT1.idCanal = TTTT2.idCanal GROUP BY TTTT1.conductor, TTTT1.nombreConductor, TTTT1.idCanal ORDER BY TTTT1.idCanal, TTTT1.nombreConductor;