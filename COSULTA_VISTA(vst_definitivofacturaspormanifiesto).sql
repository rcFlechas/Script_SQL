-- VERIFICAR SUMA 
SELECT * FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion = CAST('2017-02-01' AS DATE) AND valorFacturaSinIva > '30000' AND idCanal = '2' ORDER BY vehiculo;
-- VERIFICAR CONTEO
SELECT SUM(valorFacturaSinIva) AS total_sin_iva  FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion = CAST('2017-02-01' AS DATE) AND valorFacturaSinIva > '30000' AND idCanal = '2' ORDER BY vehiculo;


-- CONTAR FACTURAS SIN IVA, CANAL T.A.T, MAYOR A 30000
SELECT fechaDistribucion, count(valorFacturaSinIva) AS cantidad FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) AND valorFacturaSinIva > '30000' AND idCanal = '2' GROUP BY  fechaDistribucion ORDER BY fechaDistribucion;


-- CONTAR FACTURAS SIN IVA, CANAL T.A.T, MENOR O IGUAL A 30000
SELECT fechaDistribucion, count(valorFacturaSinIva) AS cantidad FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) AND valorFacturaSinIva <= '30000' AND idCanal = '2' GROUP BY  fechaDistribucion ORDER BY fechaDistribucion;

-- FECHAS 
SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion;

-- SUMAR FACTURAS SIN IVA, CANAL T.A.T, MAYOR A 30000
SELECT fechaDistribucion, SUM(valorFacturaSinIva) AS total_TAT FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) AND valorFacturaSinIva > '30000' AND idCanal = '2' GROUP BY  fechaDistribucion ORDER BY fechaDistribucion;

-- SUMAR FACTURAS SIN IVA, CANAL MAYORISTA
SELECT fechaDistribucion, SUM(valorFacturaSinIva) AS total_mayorista FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) AND idCanal = '3' GROUP BY  fechaDistribucion ORDER BY fechaDistribucion;

-- SUMAR FACTURAS SIN IVA, CANAL POBLACIONES
SELECT fechaDistribucion, SUM(valorFacturaSinIva) AS total_poblaciones FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) AND idCanal = '4' GROUP BY  fechaDistribucion ORDER BY fechaDistribucion;


-- POBLACIONES
SELECT T1.fechaDistribucion, T2.total_poblaciones 
FROM	(SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion)T1
LEFT JOIN	(SELECT fechaDistribucion, SUM(valorFacturaSinIva) AS total_poblaciones FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) AND idCanal = '4' GROUP BY  fechaDistribucion)T2
ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion;

-- MAYORISTAS
SELECT T1.fechaDistribucion, T2.total_mayorista
FROM	(SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion)T1
LEFT JOIN	(SELECT fechaDistribucion, SUM(valorFacturaSinIva) AS total_mayorista FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) AND idCanal = '3' GROUP BY  fechaDistribucion)T2
ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion;

-- TAT
SELECT T1.fechaDistribucion, T2.total_TAT
FROM	(SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion)T1
LEFT JOIN	(SELECT fechaDistribucion, SUM(valorFacturaSinIva) AS total_TAT FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) AND idCanal = '2' GROUP BY  fechaDistribucion)T2
ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion;

-- MAYOR 30000
SELECT T1.fechaDistribucion, T2.total_TAT
FROM	(SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion)T1
LEFT JOIN	(SELECT fechaDistribucion, SUM(valorFacturaSinIva) AS total_TAT FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) AND valorFacturaSinIva > '30000' AND idCanal = '2' GROUP BY  fechaDistribucion )T2
ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion;

-- MENOR 10000
SELECT T1.fechaDistribucion, T2.menor_diez
FROM	(SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion)T1
LEFT JOIN	(SELECT fechaDistribucion, count(valorFacturaSinIva) AS menor_diez FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) AND valorFacturaSinIva <= '10000' AND idCanal = '2' GROUP BY  fechaDistribucion)T2
ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion;

-- ENTRE 10000 Y 20000
SELECT T1.fechaDistribucion, T2.diez_veinte
FROM	(SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion)T1
LEFT JOIN	(SELECT fechaDistribucion, count(valorFacturaSinIva) AS diez_veinte FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE)  AND valorFacturaSinIva >'10000' AND valorFacturaSinIva < '20000' AND idCanal = '2' GROUP BY  fechaDistribucion)T2
ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion;

-- ENTRE 20000 Y 30000
SELECT T1.fechaDistribucion, T2.veinte_treinta
FROM	(SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion)T1
LEFT JOIN	(SELECT fechaDistribucion, count(valorFacturaSinIva) AS veinte_treinta FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE)  AND valorFacturaSinIva >='20000' AND valorFacturaSinIva <= '30000' AND idCanal = '2' GROUP BY  fechaDistribucion)T2
ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion;

-- MAYOR 30000
SELECT T1.fechaDistribucion, T2.mayor_treinta
FROM	(SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion)T1
LEFT JOIN	(SELECT fechaDistribucion, count(valorFacturaSinIva) AS mayor_treinta FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) AND valorFacturaSinIva > '30000' AND idCanal = '2' GROUP BY  fechaDistribucion)T2
ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion;

-- MENOR 10, ENTRE 10 Y 20
SELECT TT1.fechaDistribucion, TT1.menor_diez, TT2.diez_veinte
FROM	(SELECT T1.fechaDistribucion, T2.menor_diez
		FROM	(SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion)T1
		LEFT JOIN	(SELECT fechaDistribucion, count(valorFacturaSinIva) AS menor_diez FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) AND valorFacturaSinIva <= '10000' AND idCanal = '2' GROUP BY  fechaDistribucion)T2
		ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion)TT1
INNER JOIN	(SELECT T1.fechaDistribucion, T2.diez_veinte
			FROM	(SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion)T1
			LEFT JOIN	(SELECT fechaDistribucion, count(valorFacturaSinIva) AS diez_veinte FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE)  AND valorFacturaSinIva >'10000' AND valorFacturaSinIva < '20000' AND idCanal = '2' GROUP BY  fechaDistribucion)T2
			ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion)TT2
ON TT1.fechaDistribucion = TT2.fechaDistribucion GROUP BY TT1.fechaDistribucion;

-- ENTRE 20 Y 30, MAYOR 30
SELECT TT1.fechaDistribucion, TT1.veinte_treinta, TT2.mayor_treinta
FROM	(SELECT T1.fechaDistribucion, T2.veinte_treinta
		FROM	(SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion)T1
		LEFT JOIN	(SELECT fechaDistribucion, count(valorFacturaSinIva) AS veinte_treinta FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE)  AND valorFacturaSinIva >='20000' AND valorFacturaSinIva <= '30000' AND idCanal = '2' GROUP BY  fechaDistribucion)T2
		ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion)TT1
INNER JOIN	(SELECT T1.fechaDistribucion, T2.mayor_treinta
			FROM	(SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion)T1
			LEFT JOIN	(SELECT fechaDistribucion, count(valorFacturaSinIva) AS mayor_treinta FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) AND valorFacturaSinIva > '30000' AND idCanal = '2' GROUP BY  fechaDistribucion)T2
			ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion)TT2
ON TT1.fechaDistribucion = TT2.fechaDistribucion GROUP BY TT1.fechaDistribucion;

-- TOTAL MAYOR 30, TOTAL TAT
SELECT TT1.fechaDistribucion, TT1.total_TAT_mayor30, TT2.total_TAT_general
FROM	(SELECT T1.fechaDistribucion, T2.total_TAT_mayor30
		FROM	(SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion)T1
		LEFT JOIN	(SELECT fechaDistribucion, SUM(valorFacturaSinIva) AS total_TAT_mayor30 FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) AND valorFacturaSinIva > '30000' AND idCanal = '2' GROUP BY  fechaDistribucion )T2
		ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion)TT1
INNER JOIN	(SELECT T1.fechaDistribucion, T2.total_TAT_general
			FROM	(SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion)T1
			LEFT JOIN	(SELECT fechaDistribucion, SUM(valorFacturaSinIva) AS total_TAT_general FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) AND idCanal = '2' GROUP BY  fechaDistribucion)T2
			ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion)TT2
ON TT1.fechaDistribucion = TT2.fechaDistribucion GROUP BY TT1.fechaDistribucion;

-- CONTEO TOTAL DE TAT
SELECT T1.fechaDistribucion, T2.conteo_total
FROM	(SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion)T1
LEFT JOIN	(SELECT fechaDistribucion, count(valorFacturaSinIva) AS conteo_total FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) AND idCanal = '2' GROUP BY  fechaDistribucion)T2
ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion;

-- DETALLADO TAT
SELECT TTTT1.fechaDistribucion, IFNULL(TTTT1.total_TAT_mayor30,0) AS total_TAT_mayor30, IFNULL(TTTT2.menor_diez,0) AS menor_diez, IFNULL(TTTT2.diez_veinte,0) AS diez_veinte, IFNULL(TTTT2.veinte_treinta,0) AS veinte_treinta, IFNULL(TTTT2.mayor_treinta,0) AS mayor_treinta, (IFNULL(TTTT2.menor_diez,0) + IFNULL(TTTT2.diez_veinte,0) + IFNULL(TTTT2.veinte_treinta,0) + IFNULL(TTTT2.mayor_treinta,0)) AS cantidad_total, IFNULL(TTTT1.total_TAT_general,0) AS total_TAT_general 
FROM	(SELECT TT1.fechaDistribucion, TT1.total_TAT_mayor30, TT2.total_TAT_general
		FROM	(SELECT T1.fechaDistribucion, T2.total_TAT_mayor30
				FROM	(SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion)T1
				LEFT JOIN	(SELECT fechaDistribucion, SUM(valorFacturaSinIva) AS total_TAT_mayor30 FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) AND valorFacturaSinIva > '30000' AND idCanal = '2' GROUP BY  fechaDistribucion )T2
				ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion)TT1
		INNER JOIN	(SELECT T1.fechaDistribucion, T2.total_TAT_general
					FROM	(SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion)T1
					LEFT JOIN	(SELECT fechaDistribucion, SUM(valorFacturaSinIva) AS total_TAT_general FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) AND idCanal = '2' GROUP BY  fechaDistribucion)T2
					ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion)TT2
		ON TT1.fechaDistribucion = TT2.fechaDistribucion GROUP BY TT1.fechaDistribucion)TTTT1
INNER JOIN	(SELECT TTT1.fechaDistribucion, TTT1.menor_diez, TTT1.diez_veinte, TTT2.veinte_treinta, TTT2.mayor_treinta
			FROM	(SELECT TT1.fechaDistribucion, TT1.menor_diez, TT2.diez_veinte
					FROM	(SELECT T1.fechaDistribucion, T2.menor_diez
							FROM	(SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion)T1
							LEFT JOIN	(SELECT fechaDistribucion, count(valorFacturaSinIva) AS menor_diez FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) AND valorFacturaSinIva <= '10000' AND idCanal = '2' GROUP BY  fechaDistribucion)T2
							ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion)TT1
					INNER JOIN	(SELECT T1.fechaDistribucion, T2.diez_veinte
								FROM	(SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion)T1
								LEFT JOIN	(SELECT fechaDistribucion, count(valorFacturaSinIva) AS diez_veinte FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE)  AND valorFacturaSinIva >'10000' AND valorFacturaSinIva < '20000' AND idCanal = '2' GROUP BY  fechaDistribucion)T2
								ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion)TT2
					ON TT1.fechaDistribucion = TT2.fechaDistribucion GROUP BY TT1.fechaDistribucion)TTT1
			INNER JOIN	(SELECT TT1.fechaDistribucion, TT1.veinte_treinta, TT2.mayor_treinta
						FROM	(SELECT T1.fechaDistribucion, T2.veinte_treinta
								FROM	(SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion)T1
								LEFT JOIN	(SELECT fechaDistribucion, count(valorFacturaSinIva) AS veinte_treinta FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE)  AND valorFacturaSinIva >='20000' AND valorFacturaSinIva <= '30000' AND idCanal = '2' GROUP BY  fechaDistribucion)T2
								ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion)TT1
						INNER JOIN	(SELECT T1.fechaDistribucion, T2.mayor_treinta
									FROM	(SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion)T1
									LEFT JOIN	(SELECT fechaDistribucion, count(valorFacturaSinIva) AS mayor_treinta FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) AND valorFacturaSinIva > '30000' AND idCanal = '2' GROUP BY  fechaDistribucion)T2
									ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion)TT2
						ON TT1.fechaDistribucion = TT2.fechaDistribucion GROUP BY TT1.fechaDistribucion)TTT2
			ON TTT1.fechaDistribucion = TTT2.fechaDistribucion GROUP BY TTT1.fechaDistribucion)TTTT2
ON TTTT1.fechaDistribucion = TTTT2.fechaDistribucion GROUP BY TTTT1.fechaDistribucion;


-- (POBLACIONES, MAYORISTAS, TAT)
SELECT TTT1.fechaDistribucion, IFNULL(TTT1.total_poblaciones,0) as total_poblaciones, IFNULL(TTT1.total_mayorista,0) AS total_mayorista, IFNULL(TTT2.total_TAT,0) AS total_TAT, (IFNULL(TTT1.total_poblaciones,0) + IFNULL(TTT1.total_mayorista,0) + IFNULL(TTT2.total_TAT,0)) AS TOTAL
FROM	(SELECT TT1.fechaDistribucion, TT1.total_poblaciones, TT2.total_mayorista
		FROM	(SELECT T1.fechaDistribucion, T2.total_poblaciones 
				FROM	(SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion)T1
				LEFT JOIN	(SELECT fechaDistribucion, SUM(valorFacturaSinIva) AS total_poblaciones FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) AND idCanal = '4' GROUP BY  fechaDistribucion)T2
				ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion)TT1
		INNER JOIN	(SELECT T1.fechaDistribucion, T2.total_mayorista
					FROM	(SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion)T1
					LEFT JOIN	(SELECT fechaDistribucion, SUM(valorFacturaSinIva) AS total_mayorista FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) AND idCanal = '3' GROUP BY  fechaDistribucion)T2
					ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion)TT2
		ON TT1.fechaDistribucion = TT2.fechaDistribucion GROUP BY TT1.fechaDistribucion)TTT1
INNER JOIN	(SELECT T1.fechaDistribucion, T2.total_TAT
			FROM	(SELECT fechaDistribucion FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) GROUP BY  fechaDistribucion)T1
			LEFT JOIN	(SELECT fechaDistribucion, SUM(valorFacturaSinIva) AS total_TAT FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion BETWEEN CAST('2017-02-01' AS DATE) AND CAST('2017-02-28' AS DATE) AND idCanal = '2' GROUP BY  fechaDistribucion)T2
			ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion)TTT2
ON TTT1.fechaDistribucion = TTT2.fechaDistribucion GROUP BY TTT1.fechaDistribucion;


SELECT TT1.fechaDistribucion, TT1.vehiculo, TT1.nombreCanal
FROM	()TT1
INNER JOIN	()TT2
ON TT1.fechaDistribucion = TT2.fechaDistribucion AND TT1.vehiculo = TT2.vehiculo AND TT1.nombreCanal = TT2.nombreCanal GROUP BY TT1.fechaDistribucion, TT1.vehiculo, TT1.nombreCanal;



SELECT T1.fechaDistribucion, T2.total_poblaciones
FROM	()T1
LEFT JOIN	()T2
ON T1.fechaDistribucion = T2.fechaDistribucion GROUP BY T1.fechaDistribucion;




  
   	