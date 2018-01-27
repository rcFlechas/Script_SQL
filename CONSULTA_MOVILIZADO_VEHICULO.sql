
SELECT fechaDistribucion, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal;

-- ENTREGA TOTAL
SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) as entrega_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idtipoDeMovimiento = 2 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal;

SELECT T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.entrega_total
FROM	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T1
LEFT JOIN	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) as entrega_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idtipoDeMovimiento = 2 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T2
ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal;


-- ENTREGA PARCIAL
SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) AS entrega_parcial FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idtipoDeMovimiento = 4 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal;

SELECT T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.entrega_parcial
FROM	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T1
LEFT JOIN	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) AS entrega_parcial FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idtipoDeMovimiento = 4 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T2
ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal;


-- RECHAZO TOTAL
SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) AS rechazo_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idtipoDeMovimiento = 3 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal;

SELECT T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.rechazo_total
FROM	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T1
LEFT JOIN	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) AS rechazo_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idtipoDeMovimiento = 3 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T2
ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal;


-- VOLVER ZONIFICAR
SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) AS volver_zonificar FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idtipoDeMovimiento = 6 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal;

SELECT T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.volver_zonificar
FROM	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T1
LEFT JOIN	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) AS volver_zonificar FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idtipoDeMovimiento = 6 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T2
ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal;


-- PROGRAMADO
SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) AS programado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal;

SELECT T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.programado
FROM	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T1
LEFT JOIN	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) AS programado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T2
ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal;


-- VALOR FACTURAS SIN IVA
SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, SUM(valorFacturaSinIva) AS total_facturas FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal;

SELECT T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.total_facturas
FROM	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T1
LEFT JOIN	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, SUM(valorFacturaSinIva) AS total_facturas FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T2
ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal;

-- NOMBRE CONDUCTOR
SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, nombreConductor FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal;

SELECT T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.nombreConductor
FROM	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T1
LEFT JOIN	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, nombreConductor FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T2
ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal;

-- ENTREGA_TOTAL ENTREGA_PARCIAL
SELECT TT1.fechaDistribucion, TT1.vehiculo, TT1.conductor, TT1.nombreCanal, TT1.entrega_total, TT2.entrega_parcial
FROM	(SELECT T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.entrega_total
		FROM	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T1
		LEFT JOIN	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) as entrega_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idtipoDeMovimiento = 2 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T2
		ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal)TT1
INNER JOIN	(SELECT T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.entrega_parcial
			FROM	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T1
			LEFT JOIN	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) AS entrega_parcial FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idtipoDeMovimiento = 4 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T2
			ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal)TT2
ON TT1.fechaDistribucion = TT2.fechaDistribucion AND TT1.vehiculo = TT2.vehiculo AND TT1.conductor = TT2.conductor AND TT1.nombreCanal = TT2.nombreCanal GROUP BY TT1.fechaDistribucion, TT1.vehiculo, TT1.conductor, TT1.nombreCanal;

-- RECHAZO_TOTAL VOLVER_ZONIFICAR
SELECT TT1.fechaDistribucion, TT1.vehiculo, TT1.conductor, TT1.nombreCanal, TT1.rechazo_total, TT2.volver_zonificar
FROM	(SELECT T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.rechazo_total
		FROM	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T1
		LEFT JOIN	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) AS rechazo_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idtipoDeMovimiento = 3 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T2
		ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal)TT1
INNER JOIN	(SELECT T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.volver_zonificar
			FROM	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T1
			LEFT JOIN	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) AS volver_zonificar FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idtipoDeMovimiento = 6 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T2
			ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal)TT2
ON TT1.fechaDistribucion = TT2.fechaDistribucion AND TT1.vehiculo = TT2.vehiculo AND TT1.conductor = TT2.conductor AND TT1.nombreCanal = TT2.nombreCanal GROUP BY TT1.fechaDistribucion, TT1.vehiculo, TT1.conductor, TT1.nombreCanal;

-- PROGRAMADO FACTURAS SIN IVA
SELECT TT1.fechaDistribucion, TT1.vehiculo, TT1.conductor, TT1.nombreCanal, TT1.programado, TT2.total_facturas
FROM	(SELECT T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.programado
		FROM	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T1
		LEFT JOIN	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) AS programado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T2
		ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal)TT1
INNER JOIN	(SELECT T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.total_facturas
			FROM	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T1
			LEFT JOIN	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, SUM(valorFacturaSinIva) AS total_facturas FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T2
			ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal)TT2
ON TT1.fechaDistribucion = TT2.fechaDistribucion AND TT1.vehiculo = TT2.vehiculo AND TT1.conductor = TT2.conductor AND TT1.nombreCanal = TT2.nombreCanal GROUP BY TT1.fechaDistribucion, TT1.vehiculo, TT1.conductor, TT1.nombreCanal;

-- TODOS LOS CANALES
SELECT TTTT1.fechaDistribucion, TTTT1.numeroManifiesto, TTTT2.nombreConductor, TTTT1.vehiculo, IFNULL(TTTT1.entrega_total,0) AS ET, IFNULL(TTTT1.entrega_parcial,0) AS EP, IFNULL(TTTT1.rechazo_total,0) AS RT, IFNULL(TTTT1.volver_zonificar,0) AS VZ, IFNULL(TTTT2.programado,0) AS PG, (IFNULL(TTTT1.entrega_total,0) + IFNULL(TTTT1.entrega_parcial,0)) AS cant_entregada, TTTT1.nombreCanal, IFNULL(TTTT2.total_facturas,0) AS subtotal_facturas
FROM	(SELECT TTT1.fechaDistribucion, TTT1.numeroManifiesto, TTT1.vehiculo, TTT1.conductor, TTT1.nombreCanal, TTT1.entrega_total, TTT1.entrega_parcial, TTT2.rechazo_total, TTT2.volver_zonificar
		FROM	(SELECT TT1.fechaDistribucion, TT1.numeroManifiesto, TT1.vehiculo, TT1.conductor, TT1.nombreCanal, TT1.entrega_total, TT2.entrega_parcial
				FROM	(SELECT T1.fechaDistribucion, T1.numeroManifiesto, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.entrega_total
						FROM	(SELECT fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal)T1
						LEFT JOIN	(SELECT fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) as entrega_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idtipoDeMovimiento = 2 GROUP BY  fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal)T2
						ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.numeroManifiesto = T2.numeroManifiesto AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.numeroManifiesto, T1.vehiculo, T1.conductor, T1.nombreCanal)TT1
				INNER JOIN	(SELECT T1.fechaDistribucion, T1.numeroManifiesto, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.entrega_parcial
							FROM	(SELECT fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal)T1
							LEFT JOIN	(SELECT fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) AS entrega_parcial FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idtipoDeMovimiento = 4 GROUP BY  fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal)T2
							ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.numeroManifiesto = T2.numeroManifiesto AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.numeroManifiesto, T1.vehiculo, T1.conductor, T1.nombreCanal)TT2
				ON TT1.fechaDistribucion = TT2.fechaDistribucion AND TT1.numeroManifiesto = TT2.numeroManifiesto AND TT1.vehiculo = TT2.vehiculo AND TT1.conductor = TT2.conductor AND TT1.nombreCanal = TT2.nombreCanal GROUP BY TT1.fechaDistribucion, TT1.numeroManifiesto, TT1.vehiculo, TT1.conductor, TT1.nombreCanal)TTT1
		INNER JOIN	(SELECT TT1.fechaDistribucion, TT1.numeroManifiesto, TT1.vehiculo, TT1.conductor, TT1.nombreCanal, TT1.rechazo_total, TT2.volver_zonificar
					FROM	(SELECT T1.fechaDistribucion, T1.numeroManifiesto, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.rechazo_total
							FROM	(SELECT fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal)T1
							LEFT JOIN	(SELECT fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) AS rechazo_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idtipoDeMovimiento = 3 GROUP BY  fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal)T2
							ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.numeroManifiesto = T2.numeroManifiesto AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.numeroManifiesto, T1.vehiculo, T1.conductor, T1.nombreCanal)TT1
					INNER JOIN	(SELECT T1.fechaDistribucion, T1.numeroManifiesto, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.volver_zonificar
								FROM	(SELECT fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal)T1
								LEFT JOIN	(SELECT fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) AS volver_zonificar FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idtipoDeMovimiento = 6 GROUP BY  fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal)T2
								ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.numeroManifiesto = T2.numeroManifiesto AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.numeroManifiesto, T1.vehiculo, T1.conductor, T1.nombreCanal)TT2
					ON TT1.fechaDistribucion = TT2.fechaDistribucion AND TT1.numeroManifiesto = TT2.numeroManifiesto AND TT1.vehiculo = TT2.vehiculo AND TT1.conductor = TT2.conductor AND TT1.nombreCanal = TT2.nombreCanal GROUP BY TT1.fechaDistribucion, TT1.numeroManifiesto, TT1.vehiculo, TT1.conductor, TT1.nombreCanal)TTT2
		ON TTT1.fechaDistribucion = TTT2.fechaDistribucion AND TTT1.numeroManifiesto = TTT2.numeroManifiesto AND TTT1.vehiculo = TTT2.vehiculo AND TTT1.conductor = TTT2.conductor AND TTT1.nombreCanal = TTT2.nombreCanal GROUP BY TTT1.fechaDistribucion, TTT1.numeroManifiesto, TTT1.vehiculo, TTT1.conductor, TTT1.nombreCanal)TTTT1
INNER JOIN	(SELECT TTT1.fechaDistribucion, TTT1.numeroManifiesto, TTT1.vehiculo, TTT1.conductor, TTT1.nombreCanal,TTT1.programado, TTT1.total_facturas, TTT2.nombreConductor
			FROM	(SELECT TT1.fechaDistribucion, TT1.numeroManifiesto, TT1.vehiculo, TT1.conductor, TT1.nombreCanal, TT1.programado, TT2.total_facturas
					FROM	(SELECT T1.fechaDistribucion, T1.numeroManifiesto, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.programado
							FROM	(SELECT fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal)T1
							LEFT JOIN	(SELECT fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) AS programado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal)T2
							ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.numeroManifiesto = T2.numeroManifiesto AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.numeroManifiesto, T1.vehiculo, T1.conductor, T1.nombreCanal)TT1
					INNER JOIN	(SELECT T1.fechaDistribucion, T1.numeroManifiesto, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.total_facturas
								FROM	(SELECT fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal)T1
								LEFT JOIN	(SELECT fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal, SUM(valorFacturaSinIva) AS total_facturas FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal)T2
								ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.numeroManifiesto = T2.numeroManifiesto AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.numeroManifiesto, T1.vehiculo, T1.conductor, T1.nombreCanal)TT2
					ON TT1.fechaDistribucion = TT2.fechaDistribucion AND TT1.numeroManifiesto = TT2.numeroManifiesto AND TT1.vehiculo = TT2.vehiculo AND TT1.conductor = TT2.conductor AND TT1.nombreCanal = TT2.nombreCanal GROUP BY TT1.fechaDistribucion, TT1.numeroManifiesto, TT1.vehiculo, TT1.conductor, TT1.nombreCanal)TTT1
			INNER JOIN	(SELECT T1.fechaDistribucion, T1.numeroManifiesto, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.nombreConductor
						FROM	(SELECT fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal)T1
						LEFT JOIN	(SELECT fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal, nombreConductor FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' GROUP BY  fechaDistribucion, numeroManifiesto, vehiculo, conductor, nombreCanal)T2
						ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.numeroManifiesto = T2.numeroManifiesto AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.numeroManifiesto, T1.vehiculo, T1.conductor, T1.nombreCanal)TTT2
			ON TTT1.fechaDistribucion = TTT2.fechaDistribucion AND TTT1.numeroManifiesto = TTT2.numeroManifiesto AND TTT1.vehiculo = TTT2.vehiculo AND TTT1.conductor = TTT2.conductor AND TTT1.nombreCanal = TTT2.nombreCanal GROUP BY TTT1.fechaDistribucion, TTT1.numeroManifiesto, TTT1.vehiculo, TTT1.conductor, TTT1.nombreCanal)TTTT2
ON TTTT1.fechaDistribucion = TTTT2.fechaDistribucion AND TTTT1.numeroManifiesto = TTTT2.numeroManifiesto AND TTTT1.vehiculo = TTTT2.vehiculo AND TTTT1.conductor = TTTT2.conductor AND TTTT1.nombreCanal = TTTT2.nombreCanal GROUP BY TTTT1.fechaDistribucion, TTTT1.numeroManifiesto, TTTT1.vehiculo, TTTT1.conductor, TTTT1.nombreCanal;

-- POR CANAL
SELECT TTTT1.fechaDistribucion, TTTT2.nombreConductor, TTTT1.vehiculo, IFNULL(TTTT1.entrega_total,0) AS ET, IFNULL(TTTT1.entrega_parcial,0) AS EP, IFNULL(TTTT1.rechazo_total,0) AS RT, IFNULL(TTTT1.volver_zonificar,0) AS VZ, IFNULL(TTTT2.programado,0) AS PG, (IFNULL(TTTT1.entrega_total,0) + IFNULL(TTTT1.entrega_parcial,0)) AS cant_entregada, TTTT1.nombreCanal, IFNULL(TTTT2.total_facturas,0) AS subtotal_facturas
FROM	(SELECT TTT1.fechaDistribucion, TTT1.vehiculo, TTT1.conductor, TTT1.nombreCanal, TTT1.entrega_total, TTT1.entrega_parcial, TTT2.rechazo_total, TTT2.volver_zonificar
		FROM	(SELECT TT1.fechaDistribucion, TT1.vehiculo, TT1.conductor, TT1.nombreCanal, TT1.entrega_total, TT2.entrega_parcial
				FROM	(SELECT T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.entrega_total
						FROM	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idCanal = 2 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T1
						LEFT JOIN	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) as entrega_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idtipoDeMovimiento = 2 AND idCanal = 2 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T2
						ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal)TT1
				INNER JOIN	(SELECT T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.entrega_parcial
							FROM	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idCanal = 2 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T1
							LEFT JOIN	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) AS entrega_parcial FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idtipoDeMovimiento = 4 AND idCanal = 2 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T2
							ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal)TT2
				ON TT1.fechaDistribucion = TT2.fechaDistribucion AND TT1.vehiculo = TT2.vehiculo AND TT1.conductor = TT2.conductor AND TT1.nombreCanal = TT2.nombreCanal GROUP BY TT1.fechaDistribucion, TT1.vehiculo, TT1.conductor, TT1.nombreCanal)TTT1
		INNER JOIN	(SELECT TT1.fechaDistribucion, TT1.vehiculo, TT1.conductor, TT1.nombreCanal, TT1.rechazo_total, TT2.volver_zonificar
					FROM	(SELECT T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.rechazo_total
							FROM	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idCanal = 2 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T1
							LEFT JOIN	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) AS rechazo_total FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idtipoDeMovimiento = 3 AND idCanal = 2 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T2
							ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal)TT1
					INNER JOIN	(SELECT T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.volver_zonificar
								FROM	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idCanal = 2 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T1
								LEFT JOIN	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) AS volver_zonificar FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idtipoDeMovimiento = 6 AND idCanal = 2 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T2
								ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal)TT2
					ON TT1.fechaDistribucion = TT2.fechaDistribucion AND TT1.vehiculo = TT2.vehiculo AND TT1.conductor = TT2.conductor AND TT1.nombreCanal = TT2.nombreCanal GROUP BY TT1.fechaDistribucion, TT1.vehiculo, TT1.conductor, TT1.nombreCanal)TTT2
		ON TTT1.fechaDistribucion = TTT2.fechaDistribucion AND TTT1.vehiculo = TTT2.vehiculo AND TTT1.conductor = TTT2.conductor AND TTT1.nombreCanal = TTT2.nombreCanal GROUP BY TTT1.fechaDistribucion, TTT1.vehiculo, TTT1.conductor, TTT1.nombreCanal)TTTT1
INNER JOIN	(SELECT TTT1.fechaDistribucion, TTT1.vehiculo, TTT1.conductor, TTT1.nombreCanal,TTT1.programado, TTT1.total_facturas, TTT2.nombreConductor
			FROM	(SELECT TT1.fechaDistribucion, TT1.vehiculo, TT1.conductor, TT1.nombreCanal, TT1.programado, TT2.total_facturas
					FROM	(SELECT T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.programado
							FROM	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idCanal = 2 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T1
							LEFT JOIN	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, count(idtipoDeMovimiento) AS programado FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idCanal = 2 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T2
							ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal)TT1
					INNER JOIN	(SELECT T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.total_facturas
								FROM	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idCanal = 2 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T1
								LEFT JOIN	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, SUM(valorFacturaSinIva) AS total_facturas FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idCanal = 2 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T2
								ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal)TT2
					ON TT1.fechaDistribucion = TT2.fechaDistribucion AND TT1.vehiculo = TT2.vehiculo AND TT1.conductor = TT2.conductor AND TT1.nombreCanal = TT2.nombreCanal GROUP BY TT1.fechaDistribucion, TT1.vehiculo, TT1.conductor, TT1.nombreCanal)TTT1
			INNER JOIN	(SELECT T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal, T2.nombreConductor
						FROM	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idCanal = 2 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T1
						LEFT JOIN	(SELECT fechaDistribucion, vehiculo, conductor, nombreCanal, nombreConductor FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion BETWEEN CAST('2017-01-01' AS DATE) AND CAST('2017-01-31' AS DATE) AND vehiculo = 'TJP591' AND idCanal = 2 GROUP BY  fechaDistribucion, vehiculo, conductor, nombreCanal)T2
						ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo AND T1.conductor = T2.conductor AND T1.nombreCanal = T2.nombreCanal GROUP BY T1.fechaDistribucion, T1.vehiculo, T1.conductor, T1.nombreCanal)TTT2
			ON TTT1.fechaDistribucion = TTT2.fechaDistribucion AND TTT1.vehiculo = TTT2.vehiculo AND TTT1.conductor = TTT2.conductor AND TTT1.nombreCanal = TTT2.nombreCanal GROUP BY TTT1.fechaDistribucion, TTT1.vehiculo, TTT1.conductor, TTT1.nombreCanal)TTTT2
ON TTTT1.fechaDistribucion = TTTT2.fechaDistribucion AND TTTT1.vehiculo = TTTT2.vehiculo AND TTTT1.conductor = TTTT2.conductor AND TTTT1.nombreCanal = TTTT2.nombreCanal GROUP BY TTTT1.fechaDistribucion, TTTT1.vehiculo, TTTT1.conductor, TTTT1.nombreCanal;



