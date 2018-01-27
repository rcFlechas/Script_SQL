
SELECT * FROM vst_defintivofacturaspormanifiesto WHERE fechaDistribucion = '2017-06-07';
SELECT * FROM vst_movilizacionfacturasdescargadas WHERE numeroManifiesto = '5817';
SELECT * FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion = '2017-06-07' AND vehiculo = 'FLJ780';

SELECT * FROM vst_productosporfacturaDescargada WHERE numeroFactura IN (SELECT numeroFactura FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion = '2017-06-08' AND vehiculo = 'FLJ780') AND causalDeRechazo > 1;

SELECT codigoProducto, descripcionProducto FROM vst_productosporfacturaDescargada WHERE numeroFactura IN (SELECT numeroFactura FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion = '2017-06-08' AND vehiculo = 'FLJ780') AND causalDeRechazo > 1;
SELECT codigoProducto, descripcionProducto FROM vst_productosporfacturaDescargada WHERE numeroFactura IN (SELECT numeroFactura FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion = '2017-06-08' AND vehiculo = 'FLJ780') AND causalDeRechazo > 1 GROUP BY codigoProducto ORDER BY descripcionProducto;
SELECT codigoProducto, descripcionProducto, count(causalDeRechazo) AS devolucion FROM vst_productosporfacturaDescargada WHERE numeroFactura IN (SELECT numeroFactura FROM vst_movilizacionfacturasdescargadas WHERE fechaDistribucion = '2017-06-08') AND causalDeRechazo > 1 GROUP BY codigoProducto ORDER BY descripcionProducto;

SELECT (ELT(WEEKDAY(fechaDistribucion) + 1, 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo')) AS DIA_SEMANA
FROM vst_movilizacionfacturasdescargadas
WHERE fechaDistribucion BETWEEN CAST('2017-06-05' AS DATE) AND CAST('2017-06-11' AS DATE) GROUP BY fechaDistribucion;

SELECT DAY(fechaDistribucion) as dia
FROM vst_movilizacionfacturasdescargadas
WHERE year(fechaDistribucion) = YEAR(current_date()) AND month(fechaDistribucion) = MONTH(current_date()) group by fechaDistribucion order by fechaDistribucion asc;


SELECT (ELT(MONTH(fechaDistribucion) , 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre')) AS DIA_SEMANA
FROM vst_movilizacionfacturasdescargadas
WHERE fechaDistribucion BETWEEN CAST('2017-06-05' AS DATE) AND CAST('2017-06-11' AS DATE);

select MONTHNAME ('2017-06-05'); 