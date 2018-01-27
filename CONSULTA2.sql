SELECT * FROM rutero WHERE estadoManifiesto = '3' AND idtipoDeMovimiento <> 1 AND idtipoDeMovimiento <> 3 AND vehiculo = 'TTL217' ;

SELECT * FROM rutero WHERE conductor = '1093743966' AND fechaDistribucion = current_date()-1 ;

SELECT * FROM facturascamdun WHERE numeroFactura = 85095;

SELECT * FROM rutero WHERE estadoManifiesto = '3';



-- REPORTE DE EFICIENCIA
Select T1.vehiculo, ROUND(((programado-pendiente)/programado)* 100,2) as eficiencia, 100 - (ROUND(((programado-pendiente)/programado)* 100,2)) as diferencia
FROM (SELECT  vehiculo,conductor,if(idtipoDeMovimiento=1,count(idtipoDeMovimiento),0) as pendiente FROM rutero WHERE rutero.estadoManifiesto = '3' GROUP BY  vehiculo) T1 
INNER JOIN (SELECT  rutero.vehiculo,rutero.conductor,count(idtipoDeMovimiento)as programado FROM rutero WHERE rutero.estadoManifiesto = '3' GROUP BY  vehiculo) T2
ON T1.vehiculo=T2.vehiculo GROUP BY  T2.vehiculo;




-- REPORTE DE EFICIENCIA
SELECT TT1.vehiculo, ROUND(((IFNULL(TT2.programado,0)-IFNULL(TT1.pendiente,0))/IFNULL(TT2.programado,0))* 100,2) as eficiencia,
		100 - (ROUND(((IFNULL(TT2.programado,0)-IFNULL(TT1.pendiente,0))/IFNULL(TT2.programado,0))* 100,2)) as diferencia  
FROM	(SELECT T1.vehiculo, T2.pendiente
		FROM (SELECT  vehiculo FROM rutero WHERE estadoManifiesto = '3' GROUP BY  vehiculo) T1
		LEFT JOIN (SELECT vehiculo, count(idtipoDeMovimiento) as pendiente FROM rutero WHERE estadoManifiesto = '3' AND idtipoDeMovimiento = 1 GROUP BY  vehiculo) T2
		ON T1.vehiculo = T2.vehiculo GROUP BY  T1.vehiculo) TT1 
INNER JOIN	(SELECT  vehiculo, count(idtipoDeMovimiento) as programado FROM rutero WHERE estadoManifiesto = '3' GROUP BY  vehiculo) TT2         
ON TT1.vehiculo = TT2.vehiculo GROUP BY  TT1.vehiculo;


-- REPORTE DETALLADA DE RUTA DIARIO CONDUCTOR
SELECT TTTT1.vehiculo, TTTT1.entrega_total, TTTT1.entrega_parcial, TTTT1.rechazo_total, TTTT1.pendiente, TTTT2.programado
FROM	(SELECT TTT1.vehiculo, TTT1.entrega_total, TTT1.entrega_parcial, TTT2.rechazo_total, TTT2.pendiente
		FROM	(SELECT TT1.vehiculo, TT1.entrega_total, TT2.entrega_parcial
				FROM 	(SELECT T1.vehiculo, T2.entrega_total 
						FROM (SELECT  vehiculo FROM rutero WHERE estadoManifiesto = '3' GROUP BY  vehiculo) T1      
						LEFT JOIN (SELECT vehiculo, count(idtipoDeMovimiento) as entrega_total FROM rutero WHERE estadoManifiesto = '3' AND idtipoDeMovimiento = 2 GROUP BY  vehiculo) T2
						ON T1.vehiculo = T2.vehiculo GROUP BY  T1.vehiculo) TT1 
				INNER JOIN 	(SELECT T1.vehiculo, T2.entrega_parcial 
							FROM (SELECT  vehiculo FROM rutero WHERE estadoManifiesto = '3' GROUP BY  vehiculo) T1      
							LEFT JOIN (SELECT vehiculo, count(idtipoDeMovimiento) as entrega_parcial FROM rutero WHERE estadoManifiesto = '3' AND idtipoDeMovimiento = 4 GROUP BY  vehiculo) T2
							ON T1.vehiculo = T2.vehiculo GROUP BY  T1.vehiculo) TT2 
				ON TT1.vehiculo = TT2.vehiculo GROUP BY  TT1.vehiculo) TTT1
		INNER JOIN	(SELECT TT1.vehiculo, TT1.rechazo_total, TT2.pendiente
					FROM  	(SELECT T1.vehiculo, T2.rechazo_total 
							FROM (SELECT  vehiculo FROM rutero WHERE estadoManifiesto = '3' GROUP BY  vehiculo) T1      
							LEFT JOIN (SELECT vehiculo, count(idtipoDeMovimiento) as rechazo_total FROM rutero WHERE estadoManifiesto = '3' AND idtipoDeMovimiento = 3 GROUP BY  vehiculo) T2
							ON T1.vehiculo = T2.vehiculo GROUP BY  T1.vehiculo) TT1
					INNER JOIN  (SELECT T1.vehiculo, T2.pendiente 
								FROM (SELECT  vehiculo FROM rutero WHERE estadoManifiesto = '3' GROUP BY  vehiculo) T1      
								LEFT JOIN (SELECT vehiculo, count(idtipoDeMovimiento) as pendiente FROM rutero WHERE estadoManifiesto = '3' AND idtipoDeMovimiento = 1 GROUP BY  vehiculo) T2
								ON T1.vehiculo = T2.vehiculo GROUP BY  T1.vehiculo) TT2        
					ON TT1.vehiculo = TT2.vehiculo GROUP BY  TT1.vehiculo) TTT2         
		ON TTT1.vehiculo = TTT2.vehiculo GROUP BY  TTT1.vehiculo) TTTT1
INNER JOIN (SELECT  vehiculo, count(idtipoDeMovimiento) as programado FROM rutero WHERE estadoManifiesto = '3' GROUP BY  vehiculo) TTTT2        
ON TTTT1.vehiculo = TTTT2.vehiculo GROUP BY  TTTT1.vehiculo;  
    
-- REPORTE DETALLADA DE RUTA DIARIO CONDUCTOR
		SELECT TTT1.vehiculo, IFNULL(TTT1.entrega_total,0) as et, IFNULL(TTT1.entrega_parcial,0) as ep, IFNULL(TTT2.rechazo_total,0) as rt, IFNULL(TTT2.pendiente,0) as p
		FROM	(SELECT TT1.vehiculo, TT1.entrega_total, TT2.entrega_parcial
				FROM 	(SELECT T1.vehiculo, T2.entrega_total 
						FROM (SELECT  vehiculo FROM rutero WHERE estadoManifiesto = '3' GROUP BY  vehiculo) T1      
						LEFT JOIN (SELECT vehiculo, count(idtipoDeMovimiento) as entrega_total FROM rutero WHERE estadoManifiesto = '3' AND idtipoDeMovimiento = 2 GROUP BY  vehiculo) T2
						ON T1.vehiculo = T2.vehiculo GROUP BY  T1.vehiculo) TT1 
				INNER JOIN 	(SELECT T1.vehiculo, T2.entrega_parcial 
							FROM (SELECT  vehiculo FROM rutero WHERE estadoManifiesto = '3' GROUP BY  vehiculo) T1      
							LEFT JOIN (SELECT vehiculo, count(idtipoDeMovimiento) as entrega_parcial FROM rutero WHERE estadoManifiesto = '3' AND idtipoDeMovimiento = 4 GROUP BY  vehiculo) T2
							ON T1.vehiculo = T2.vehiculo GROUP BY  T1.vehiculo) TT2 
				ON TT1.vehiculo = TT2.vehiculo GROUP BY  TT1.vehiculo) TTT1
		INNER JOIN	(SELECT TT1.vehiculo, TT1.rechazo_total, TT2.pendiente
					FROM  	(SELECT T1.vehiculo, T2.rechazo_total 
							FROM (SELECT  vehiculo FROM rutero WHERE estadoManifiesto = '3' GROUP BY  vehiculo) T1      
							LEFT JOIN (SELECT vehiculo, count(idtipoDeMovimiento) as rechazo_total FROM rutero WHERE estadoManifiesto = '3' AND idtipoDeMovimiento = 3 GROUP BY  vehiculo) T2
							ON T1.vehiculo = T2.vehiculo GROUP BY  T1.vehiculo) TT1
					INNER JOIN  (SELECT T1.vehiculo, T2.pendiente 
								FROM (SELECT  vehiculo FROM rutero WHERE estadoManifiesto = '3' GROUP BY  vehiculo) T1      
								LEFT JOIN (SELECT vehiculo, count(idtipoDeMovimiento) as pendiente FROM rutero WHERE estadoManifiesto = '3' AND idtipoDeMovimiento = 1 GROUP BY  vehiculo) T2
								ON T1.vehiculo = T2.vehiculo GROUP BY  T1.vehiculo) TT2        
					ON TT1.vehiculo = TT2.vehiculo GROUP BY  TT1.vehiculo) TTT2         
		ON TTT1.vehiculo = TTT2.vehiculo GROUP BY  TTT1.vehiculo;
        
	
-- TOTAL RECAUDADO EN DINERO POR VEHICULO  
SELECT TT1.vehiculo, TT1.nombresConductor, TT1.numeroManifiesto, TT1.fechaDistribucion, IFNULL(TT2.total_entregado,0) AS entregado, TT1.total_recaudo
FROM 
    (SELECT T1.vehiculo, T1.nombresConductor, T1.numeroManifiesto, T1.fechaDistribucion, T2.total_recaudo
    FROM (SELECT  vehiculo, nombresConductor, numeroManifiesto, fechaDistribucion  FROM rutero WHERE estadoManifiesto = '3' GROUP BY  vehiculo) T1      
	LEFT JOIN (SELECT vehiculo, SUM(valorRecaudado) as total_recaudo FROM rutero WHERE estadoManifiesto = '3' GROUP BY  vehiculo) T2
	ON T1.vehiculo = T2.vehiculo GROUP BY  T1.vehiculo) TT1 
INNER JOIN
    (SELECT T1.vehiculo, T2.total_entregado
    FROM (SELECT  vehiculo FROM rutero WHERE estadoManifiesto = '3' GROUP BY  vehiculo) T1      
	LEFT JOIN (SELECT vehiculo, COUNT(idtipoDeMovimiento) as total_entregado FROM rutero WHERE estadoManifiesto = '3' AND idtipoDeMovimiento <> 1 AND idtipoDeMovimiento <> 3 GROUP BY  vehiculo) T2
	ON T1.vehiculo = T2.vehiculo GROUP BY  T1.vehiculo) TT2 
ON TT1.vehiculo = TT2.vehiculo GROUP BY  TT1.vehiculo; 

SELECT  SUM(valorRecaudado) as total_recaudo 
FROM rutero WHERE estadoManifiesto = '3' AND idtipoDeMovimiento <> 1 AND idtipoDeMovimiento <> 3 ;
   
select DISTINCT * from rutero where fechaDistribucion = CAST('2017-01-17' AS DATE) ORDER BY vehiculo;

-- REPORTE DETALLADA DE RUTA POR VEHICULO EN UN PERIODO DE TIEMPO
SELECT TTTT1.fechaDistribucion, TTTT1.vehiculo, IFNULL(TTTT1.entrega_total,0) AS ET, IFNULL(TTTT1.entrega_parcial,0) AS EP, IFNULL(TTTT1.rechazo_total,0) AS RT, IFNULL(TTTT1.pendiente,0) AS PD, IFNULL(TTTT2.programado,0) AS PG
FROM	(SELECT TTT1.fechaDistribucion, TTT1.vehiculo, TTT1.entrega_total, TTT1.entrega_parcial, TTT2.rechazo_total, TTT2.pendiente
		FROM	(SELECT TT1.fechaDistribucion, TT1.vehiculo, TT1.entrega_total, TT2.entrega_parcial
				FROM	(SELECT T1.fechaDistribucion, T1.vehiculo, T2.entrega_total
						FROM (SELECT fechaDistribucion, vehiculo FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-01-12' AS DATE) AND CAST('2017-01-17' AS DATE) GROUP BY  fechaDistribucion, vehiculo) T1   
						LEFT JOIN (SELECT fechaDistribucion, vehiculo, count(idtipoDeMovimiento) as entrega_total FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-01-12' AS DATE) AND CAST('2017-01-17' AS DATE) AND idtipoDeMovimiento = 2 GROUP BY  fechaDistribucion, vehiculo)T2
						ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo ORDER BY  T1.fechaDistribucion, T1.vehiculo) TT1
				INNER JOIN	(SELECT T1.fechaDistribucion, T1.vehiculo, T2.entrega_parcial
							FROM (SELECT fechaDistribucion, vehiculo FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-01-12' AS DATE) AND CAST('2017-01-17' AS DATE) GROUP BY  fechaDistribucion, vehiculo) T1   
							LEFT JOIN (SELECT fechaDistribucion, vehiculo, count(idtipoDeMovimiento) as entrega_parcial FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-01-12' AS DATE) AND CAST('2017-01-17' AS DATE) AND idtipoDeMovimiento = 4 GROUP BY  fechaDistribucion, vehiculo)T2
							ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo ORDER BY  T1.fechaDistribucion, T1.vehiculo) TT2         
				ON TT1.fechaDistribucion = TT2.fechaDistribucion AND TT1.vehiculo = TT2.vehiculo ORDER BY  TT1.fechaDistribucion, TT1.vehiculo) TTT1 
		INNER JOIN	(SELECT TT1.fechaDistribucion, TT1.vehiculo, TT1.rechazo_total, TT2.pendiente
					FROM	(SELECT T1.fechaDistribucion, T1.vehiculo, T2.rechazo_total
							FROM (SELECT fechaDistribucion, vehiculo FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-01-12' AS DATE) AND CAST('2017-01-17' AS DATE) GROUP BY  fechaDistribucion, vehiculo) T1   
							LEFT JOIN (SELECT fechaDistribucion, vehiculo, count(idtipoDeMovimiento) as rechazo_total FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-01-12' AS DATE) AND CAST('2017-01-17' AS DATE) AND idtipoDeMovimiento = 3 GROUP BY  fechaDistribucion, vehiculo)T2
							ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo ORDER BY  T1.fechaDistribucion, T1.vehiculo) TT1 
					INNER JOIN	(SELECT T1.fechaDistribucion, T1.vehiculo, T2.pendiente
								FROM (SELECT fechaDistribucion, vehiculo FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-01-12' AS DATE) AND CAST('2017-01-17' AS DATE) GROUP BY  fechaDistribucion, vehiculo) T1   
								LEFT JOIN (SELECT fechaDistribucion, vehiculo, count(idtipoDeMovimiento) as pendiente FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-01-12' AS DATE) AND CAST('2017-01-17' AS DATE) AND idtipoDeMovimiento = 1 GROUP BY  fechaDistribucion, vehiculo)T2
								ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo ORDER BY  T1.fechaDistribucion, T1.vehiculo)TT2 
					ON TT1.fechaDistribucion = TT2.fechaDistribucion AND TT1.vehiculo = TT2.vehiculo ORDER BY  TT1.fechaDistribucion, TT1.vehiculo)TTT2 
		ON TTT1.fechaDistribucion = TTT2.fechaDistribucion AND TTT1.vehiculo = TTT2.vehiculo ORDER BY  TTT1.fechaDistribucion, TTT1.vehiculo) TTTT1
INNER JOIN	(SELECT T1.fechaDistribucion, T1.vehiculo, T2.programado
			FROM (SELECT fechaDistribucion, vehiculo FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-01-12' AS DATE) AND CAST('2017-01-17' AS DATE) GROUP BY  fechaDistribucion, vehiculo) T1   
			LEFT JOIN (SELECT fechaDistribucion, vehiculo, count(idtipoDeMovimiento) as programado FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-01-12' AS DATE) AND CAST('2017-01-17' AS DATE) GROUP BY  fechaDistribucion, vehiculo)T2
			ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.vehiculo = T2.vehiculo ORDER BY  T1.fechaDistribucion, T1.vehiculo) TTTT2        
ON TTTT1.fechaDistribucion = TTTT2.fechaDistribucion AND TTTT1.vehiculo = TTTT2.vehiculo ORDER BY  TTTT1.fechaDistribucion, TTTT1.vehiculo;



-- REPORTE DETALLADA DE RUTA POR CONDUCTOR EN UN PERIODO DE TIEMPO
SELECT TTTT1.fechaDistribucion, TTTT1.conductor, TTTT1.nombresConductor,IFNULL(TTTT1.entrega_total,0) AS ET, IFNULL(TTTT1.entrega_parcial,0) AS EP, IFNULL(TTTT1.rechazo_total,0) AS RT, IFNULL(TTTT1.pendiente,0) AS PD, IFNULL(TTTT2.programado,0) AS PG
FROM	(SELECT TTT1.fechaDistribucion, TTT1.conductor, TTT1.nombresConductor, TTT1.entrega_total, TTT1.entrega_parcial, TTT2.rechazo_total, TTT2.pendiente
		FROM	(SELECT TT1.fechaDistribucion, TT1.conductor, TT1.nombresConductor, TT1.entrega_total, TT2.entrega_parcial
				FROM	(SELECT T1.fechaDistribucion, T1.conductor, T1.nombresConductor, T2.entrega_total
						FROM (SELECT fechaDistribucion, conductor, nombresConductor FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-01-12' AS DATE) AND CAST('2017-01-17' AS DATE) GROUP BY  fechaDistribucion, conductor, nombresConductor) T1   
						LEFT JOIN (SELECT fechaDistribucion, conductor, nombresConductor, count(idtipoDeMovimiento) as entrega_total FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-01-12' AS DATE) AND CAST('2017-01-17' AS DATE) AND idtipoDeMovimiento = 2 GROUP BY  fechaDistribucion, conductor, nombresConductor)T2
						ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.conductor = T2.conductor AND T1.nombresConductor = T2.nombresConductor ORDER BY  T1.fechaDistribucion, T1.conductor, T1.nombresConductor) TT1
				INNER JOIN	(SELECT T1.fechaDistribucion, T1.conductor, T1.nombresConductor, T2.entrega_parcial
							FROM (SELECT fechaDistribucion, conductor, nombresConductor FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-01-12' AS DATE) AND CAST('2017-01-17' AS DATE) GROUP BY  fechaDistribucion, conductor, nombresConductor) T1   
							LEFT JOIN (SELECT fechaDistribucion, conductor, nombresConductor, count(idtipoDeMovimiento) as entrega_parcial FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-01-12' AS DATE) AND CAST('2017-01-17' AS DATE) AND idtipoDeMovimiento = 4 GROUP BY  fechaDistribucion, conductor, nombresConductor)T2
							ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.conductor = T2.conductor AND T1.nombresConductor = T2.nombresConductor ORDER BY T1.fechaDistribucion, T1.conductor, T1.nombresConductor) TT2         
				ON TT1.fechaDistribucion = TT2.fechaDistribucion AND TT1.conductor = TT2.conductor AND TT1.nombresConductor = TT2.nombresConductor ORDER BY  TT1.fechaDistribucion, TT1.conductor, TT1.nombresConductor) TTT1 
		INNER JOIN	(SELECT TT1.fechaDistribucion, TT1.conductor, TT1.nombresConductor, TT1.rechazo_total, TT2.pendiente
					FROM	(SELECT T1.fechaDistribucion, T1.conductor, T1.nombresConductor, T2.rechazo_total
							FROM (SELECT fechaDistribucion, conductor, nombresConductor FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-01-12' AS DATE) AND CAST('2017-01-17' AS DATE) GROUP BY  fechaDistribucion, conductor, nombresConductor) T1   
							LEFT JOIN (SELECT fechaDistribucion, conductor, nombresConductor, count(idtipoDeMovimiento) as rechazo_total FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-01-12' AS DATE) AND CAST('2017-01-17' AS DATE) AND idtipoDeMovimiento = 3 GROUP BY  fechaDistribucion, conductor, nombresConductor)T2
							ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.conductor = T2.conductor AND T1.nombresConductor = T2.nombresConductor ORDER BY T1.fechaDistribucion, T1.conductor, T1.nombresConductor) TT1 
					INNER JOIN	(SELECT T1.fechaDistribucion, T1.conductor, T1.nombresConductor, T2.pendiente
								FROM (SELECT fechaDistribucion, conductor, nombresConductor FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-01-12' AS DATE) AND CAST('2017-01-17' AS DATE) GROUP BY  fechaDistribucion, conductor, nombresConductor) T1   
								LEFT JOIN (SELECT fechaDistribucion, conductor, nombresConductor, count(idtipoDeMovimiento) as pendiente FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-01-12' AS DATE) AND CAST('2017-01-17' AS DATE) AND idtipoDeMovimiento = 1 GROUP BY  fechaDistribucion, conductor, nombresConductor)T2
								ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.conductor = T2.conductor AND T1.nombresConductor = T2.nombresConductor ORDER BY  T1.fechaDistribucion, T1.conductor, T1.nombresConductor)TT2 
					ON TT1.fechaDistribucion = TT2.fechaDistribucion AND TT1.conductor = TT2.conductor AND TT1.nombresConductor = TT2.nombresConductor ORDER BY  TT1.fechaDistribucion, TT1.conductor, TT1.nombresConductor)TTT2 
		ON TTT1.fechaDistribucion = TTT2.fechaDistribucion AND TTT1.conductor = TTT2.conductor AND TTT1.nombresConductor = TTT2.nombresConductor ORDER BY  TTT1.fechaDistribucion, TTT1.conductor, TTT1.nombresConductor) TTTT1
INNER JOIN	(SELECT T1.fechaDistribucion, T1.conductor, T1.nombresConductor, T2.programado
			FROM (SELECT fechaDistribucion, conductor, nombresConductor FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-01-12' AS DATE) AND CAST('2017-01-17' AS DATE) GROUP BY  fechaDistribucion, conductor, nombresConductor) T1   
			LEFT JOIN (SELECT fechaDistribucion, conductor, nombresConductor, count(idtipoDeMovimiento) as programado FROM rutero WHERE fechaDistribucion BETWEEN CAST('2017-01-12' AS DATE) AND CAST('2017-01-17' AS DATE) GROUP BY  fechaDistribucion, conductor, nombresConductor)T2
			ON T1.fechaDistribucion = T2.fechaDistribucion AND T1.conductor = T2.conductor AND T1.nombresConductor = T2.nombresConductor ORDER BY  T1.fechaDistribucion, T1.conductor, T1.nombresConductor) TTTT2        
ON TTTT1.fechaDistribucion = TTTT2.fechaDistribucion AND TTTT1.conductor = TTTT2.conductor AND TTTT1.nombresConductor = TTTT2.nombresConductor ORDER BY  TTTT1.fechaDistribucion, TTTT1.conductor, TTTT1.nombresConductor;












