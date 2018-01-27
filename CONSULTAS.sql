-- REPORTE DE ULTIMA ENTREGA
Select T1.vehiculo, if(ultimo='0000-00-00 00:00:00',null,ultimo) as final, TIMESTAMPDIFF(MINUTE, ultimo, CURRENT_TIMESTAMP) AS duracion 
            FROM (SELECT  vehiculo,conductor,max(fechaSalida) as ultimo 
				FROM rutero WHERE rutero.estadoManifiesto = '3' GROUP BY  vehiculo) T1 
            INNER JOIN (SELECT  rutero.vehiculo,rutero.conductor 
				FROM rutero WHERE rutero.estadoManifiesto = '3' GROUP BY  vehiculo) T2 
            ON T1.vehiculo=T2.vehiculo GROUP BY  T2.vehiculo;
            
SELECT  TT1.vehiculo, if(TT2.ultimo='0000-00-00 00:00:00',null,TT2.ultimo) as final, TIMESTAMPDIFF(MINUTE, TT2.ultimo, CURRENT_TIMESTAMP) AS duracion , IFNULL(TT1.pendiente,0) AS PEN
FROM 	(SELECT T1.vehiculo, T2.pendiente
		FROM	(SELECT  vehiculo FROM rutero WHERE estadoManifiesto = '3' GROUP BY  vehiculo)T1
		LEFT JOIN	(SELECT vehiculo, count(idtipoDeMovimiento) as pendiente FROM rutero WHERE estadoManifiesto = '3' AND idtipoDeMovimiento = '1' GROUP BY  vehiculo) T2
		ON T1.vehiculo=T2.vehiculo GROUP BY  T1.vehiculo)TT1
INNER JOIN	(SELECT  vehiculo, max(fechaSalida) as ultimo FROM rutero WHERE estadoManifiesto = '3' GROUP BY  vehiculo)TT2
ON TT1.vehiculo=TT2.vehiculo GROUP BY  TT1.vehiculo;         
          
          
         
          
          
       
-- REPORTE DE TODOS RECHAZOS DIARIO (GENERAL)
SELECT vehiculo, codigoCliente, nombreDeCliente, direccion, numeroFactura, FLOOR(valorTotalFactura), nombreCausalDeRechazo, telefono
FROM rutero WHERE estadoManifiesto = '3' AND idtipoDeMovimiento = 3 ; 

-- REPORTE DE TODOS RECHAZOS DIARIO (VENDEDOR)
SELECT codigoCliente, nombreDeCliente, direccion, numeroFactura, FLOOR(valorTotalFactura), nombreCausalDeRechazo, telefono
FROM rutero WHERE estadoManifiesto = '3' AND idtipoDeMovimiento = 3 AND vendedor = 'VARON CABRERA ROSSIE';

-- REPORTE DE CONDUCTORES TODOS RECHAZOS DIARIO VS PROGRAMADO
SELECT T1.vehiculo, IFNULL(T2.rechazo_total,0) as rt, (T1.programado - IFNULL(T2.rechazo_total,0)) as pro  
FROM (SELECT  vehiculo, count(idtipoDeMovimiento) as programado FROM rutero WHERE estadoManifiesto = '3' GROUP BY  vehiculo) T1      
LEFT JOIN (SELECT vehiculo, count(idtipoDeMovimiento) as rechazo_total FROM rutero WHERE estadoManifiesto = '3' AND idtipoDeMovimiento = 3 GROUP BY  vehiculo) T2
ON T1.vehiculo = T2.vehiculo GROUP BY  T1.vehiculo;     

-- REPORTE DE CONDUCTORES TODOS RECHAZOS DIARIO 
SELECT vehiculo, count(idtipoDeMovimiento) as rechazo_total
FROM rutero where estadoManifiesto = '3' AND idtipoDeMovimiento = 3 GROUP BY  vehiculo;

SELECT * FROM rutero where estadoManifiesto = '3' 	AND vehiculo = 'TJP590';

-- CONSULTAS RUTERO PENDIENTE
SELECT R.codigoCliente, R.numeroFactura,R.nombreDeCliente, R.nombreEstablecimiento, R.direccion, R.vendedor, UW.celular, UW.canalDeVenta, R.valorTotalFactura, R.idtipoDeMovimiento 
FROM rutero R, usuariosweb UW WHERE R.conductor = '13474632' AND R.estadoManifiesto = '3' AND UW.nombres = R.vendedor AND R.idtipoDeMovimiento = '1' ORDER BY R.numeroManifiesto, R.adherencia;              
-- CONSULTAS RUTERO PENDIENTE                  
SELECT R.codigoCliente, R.numeroFactura,R.nombreDeCliente, R.nombreEstablecimiento, R.direccion, R.vendedor, IFNULL(UW.celular,0) as cel, IFNULL(UW.canalDeVenta,0) as canal, R.valorTotalFactura, R.idtipoDeMovimiento 
FROM rutero AS R
LEFT JOIN  usuariosweb AS UW
ON R.vendedor = UW.nombres  
WHERE R.estadoManifiesto = '3' AND R.idtipoDeMovimiento = '1' AND R.conductor = '79976145' ORDER BY R.numeroManifiesto, R.adherencia;

-- SABER QUE VENDEDOR NO ESTA EN LA BD            
SELECT DISTINCT R.vendedor, UW.nombres
FROM (SELECT vendedor FROM rutero WHERE estadoManifiesto = '3') as R
LEFT JOIN usuariosweb AS UW
ON R.vendedor = UW.nombres;  
           
            
-- RUTERO PENDIENTE POR VEHICULO              
SELECT R.fechaDistribucion, R.numeroManifiesto, R.codigoCliente, R.numeroFactura, R.nombreDeCliente, R.nombreEstablecimiento, R.direccion, R.vendedor, IFNULL(UW.celular,0) as cel_vendedor, FLOOR(R.valorTotalFactura) AS vt, R.idtipoDeMovimiento
FROM rutero R
LEFT JOIN  usuariosweb UW 
ON R.vendedor = UW.nombres 
WHERE R.estadoManifiesto = '3' AND (R.idtipoDeMovimiento = '1' OR R.idtipoDeMovimiento = '3') AND R.vehiculo = 'TJP589' ORDER BY R.numeroManifiesto, R.adherencia;            
            
            
            
            
            
            