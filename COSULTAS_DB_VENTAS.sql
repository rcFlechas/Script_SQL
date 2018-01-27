/*INSERT INTO categoria (IdCategoria,Descripcion) VALUES
	(1, 'PINTURA'),
	(2, 'MOLDES'),
	(3, 'HARDWARE'),
	(4, 'SOFTWARE');*/
    
/*  INSERT INTO `producto` (`IdProducto`, `Codigo`, `Nombre`, `Descripcion`, `Stock`, `StockMin`, `PrecioCosto`, `PrecioVenta`, `Utilidad`, `Estado`, `IdCategoria`, Imagen) VALUES
	(1, '11', 'Monitor', 'monitor LCD pantalla de retina liquida', 10.00, 2.00, 80.00, 100.00, 20.00, 'ACTIVO', 3, 'images.jsp'),
	(2, '22', 'Teclado Multifuncional', 'Teclado ergonomico', 12.00, 3.00, 25.00, 45.00, 20.00, 'ACTIVO', 3, 'images.jsp'),
	(3, '33', 'CPU', 'Unidad Central de Procesamiento', 10.00, 5.00, 322.58, 482.24, 159.66, 'ACTIVO', 3, 'images.jsp'); */
    
    
    SELECT SUM(dv.Cantidad) AS Cantidad,p.Nombre AS Producto,dv.Precio,
			SUM(dv.Total) AS Total, SUM(TRUNCATE((Total-(dv.Costo*dv.Cantidad)),2)) AS Ganancia,v.Fecha, SUM(v.Descuento) AS dto FROM venta AS v
			INNER JOIN detalleventa AS dv ON v.IdVenta=dv.IdVenta
			INNER JOIN producto AS p ON dv.IdProducto=p.IdProducto
			INNER JOIN categoria AS c ON p.IdCategoria=c.IdCategoria
			WHERE v.Fecha= '2017-09-24' AND v.Estado="EMITIDO" GROUP BY p.IdProducto
			ORDER BY v.IdVenta DESC;
            
            
            
            SELECT SUM(Descuento) AS dto
        FROM venta
        WHERE Fecha='2017-09-24' AND Estado="EMITIDO";
            
            
            
            DELIMITER //
	CREATE PROCEDURE SP_S_DescuentoVentaPorFecha
	(			
			pfechaini date			
	)
	BEGIN	
		
        SELECT SUM(Descuento) AS dto
        FROM venta
        WHERE Fecha=pfechaini AND Estado="EMITIDO";

	END;//
	DELIMITER &&
    
    
    call SP_S_DescuentoVentaPorFecha('2017-09-23')