-- REPORTE RUTA DIARIA POR VENDEDOR
SELECT R.codigoCliente, R.numeroFactura, R.idtipoDeMovimiento, R.nombreDeCliente, R.direccion, R.nombresConductor, E.celularCorporativo, R.nombreCausalDeRechazo 
FROM rutero R, empleados E
WHERE R.estadoManifiesto = '3' AND R.vendedor = 'VARON CABRERA ROSSIE' AND E.cedula = R.conductor
ORDER BY nombreDeCliente ASC;
            
-- REPORTE DEVOLUCION DIARIA POR VENDEDOR            
SELECT codigoCliente, nombreDeCliente, direccion, numeroFactura, FLOOR(valorTotalFactura) as vt, nombreCausalDeRechazo, telefono 
FROM rutero WHERE estadoManifiesto = '3' AND idtipoDeMovimiento = 3 AND vendedor = 'VARON CABRERA ROSSIE';   

-- TODOS LOS VENDEDORES ACTIVOS 

SELECT * FROM comercializadoraCam.rutero WHERE estadoManifiesto ='3' AND vendedor = 'VARON CABRERA ROSSIE';

SELECT T1.nombres, T1.celular, T1.email, T2.idCanalDeVenta, T2.nombreCanalDeVenta 
FROM usuariosweb T1
INNER JOIN tiposcanaldeventas T2 
ON T1.canalDeVenta = T2.idCanalDeVenta
WHERE T1.activo = 1 AND IdPerfilDeUsuario = 6;
        