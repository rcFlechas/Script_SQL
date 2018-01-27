SELECT e.fechaIng, e.nombreEstablecimiento, e.direccion, c.nombre_ciudad, b.nombre_barrio, e.latitud, e.longitud
FROM establecimientos e
INNER JOIN barrio b
INNER JOIN ciudad c
ON e.id_barrio = b.id_barrio AND c.id_ciudad = b.id_ciudad
WHERE c.id_ciudad = 5;


SELECT * FROM censo.establecimientos WHERE usuario = '27819010' AND fechaIng between '2017-04-10' and '2017-04-10'; 

-- TODOS POR TODOS
SELECT DATE(E.fechaIng) AS fecha, E.idCliente, E.nombreEstablecimiento, E.direccion, E.latitud, E.longitud, D.id_departamento, D.nombre_departamento, C.id_ciudad, C.nombre_ciudad, B.id_barrio, B.nombre_barrio, TC.id_clasificacion, TC.nombre_clasificacion, UW.nombres
FROM establecimientos E
INNER JOIN barrio B
INNER JOIN ciudad C
INNER JOIN departamento D 
INNER JOIN tipoclasificacion TC
INNER JOIN usuariosweb UW
ON B.id_barrio = E.id_barrio AND C.id_ciudad = B.id_ciudad AND D.id_departamento = C.id_departamento AND TC.id_clasificacion = E.id_clasificacion AND UW.cedula = E.usuario
ORDER BY fecha;

-- TODOS POR CIUDAD (TODOS BARRIOS (TODOS CLASIFICACION))
SELECT DATE(E.fechaIng) AS fecha, E.idCliente, E.nombreEstablecimiento, E.direccion, E.latitud, E.longitud, D.id_departamento, D.nombre_departamento, C.id_ciudad, C.nombre_ciudad, B.id_barrio, B.nombre_barrio, TC.id_clasificacion, TC.nombre_clasificacion, UW.nombres
FROM establecimientos E
INNER JOIN barrio B
INNER JOIN ciudad C
INNER JOIN departamento D 
INNER JOIN tipoclasificacion TC
INNER JOIN usuariosweb UW
ON B.id_barrio = E.id_barrio AND C.id_ciudad = B.id_ciudad AND D.id_departamento = C.id_departamento AND TC.id_clasificacion = E.id_clasificacion AND UW.cedula = E.usuario
WHERE E.id_barrio in (SELECT id_barrio FROM barrio WHERE id_ciudad = 1)
ORDER BY fecha;

-- TODOS POR BARRIO (TODOS CLASIFICACION)
SELECT DATE(E.fechaIng) AS fecha, E.idCliente, E.nombreEstablecimiento, E.direccion, E.latitud, E.longitud, D.id_departamento, D.nombre_departamento, C.id_ciudad, C.nombre_ciudad, B.id_barrio, B.nombre_barrio, TC.id_clasificacion, TC.nombre_clasificacion, UW.nombres
FROM establecimientos E
INNER JOIN barrio B
INNER JOIN ciudad C
INNER JOIN departamento D 
INNER JOIN tipoclasificacion TC
INNER JOIN usuariosweb UW
ON B.id_barrio = E.id_barrio AND C.id_ciudad = B.id_ciudad AND D.id_departamento = C.id_departamento AND TC.id_clasificacion = E.id_clasificacion AND UW.cedula = E.usuario
WHERE E.id_barrio = 1
ORDER BY fecha;

-- TODOS POR CIUDAD (TODOS BARRIOS (POR CLASIFICACION))
SELECT DATE(E.fechaIng) AS fecha, E.idCliente, E.nombreEstablecimiento, E.direccion, E.latitud, E.longitud, D.id_departamento, D.nombre_departamento, C.id_ciudad, C.nombre_ciudad, B.id_barrio, B.nombre_barrio, TC.id_clasificacion, TC.nombre_clasificacion, UW.nombres
FROM establecimientos E
INNER JOIN barrio B
INNER JOIN ciudad C
INNER JOIN departamento D 
INNER JOIN tipoclasificacion TC
INNER JOIN usuariosweb UW
ON B.id_barrio = E.id_barrio AND C.id_ciudad = B.id_ciudad AND D.id_departamento = C.id_departamento AND TC.id_clasificacion = E.id_clasificacion AND UW.cedula = E.usuario
WHERE E.id_barrio in (SELECT id_barrio FROM barrio WHERE id_ciudad = 3) AND E.id_clasificacion = 6
ORDER BY fecha;

-- TODOS POR BARRIO (POR CLASIFICACION)
SELECT DATE(E.fechaIng) AS fecha, E.idCliente, E.nombreEstablecimiento, E.direccion, E.latitud, E.longitud, D.id_departamento, D.nombre_departamento, C.id_ciudad, C.nombre_ciudad, B.id_barrio, B.nombre_barrio, TC.id_clasificacion, TC.nombre_clasificacion, UW.nombres
FROM establecimientos E
INNER JOIN barrio B
INNER JOIN ciudad C
INNER JOIN departamento D 
INNER JOIN tipoclasificacion TC
INNER JOIN usuariosweb UW
ON B.id_barrio = E.id_barrio AND C.id_ciudad = B.id_ciudad AND D.id_departamento = C.id_departamento AND TC.id_clasificacion = E.id_clasificacion AND UW.cedula = E.usuario
WHERE E.id_barrio = 350 AND E.id_clasificacion = 6
ORDER BY fecha;


--------------------------------------------------------------------------------------------------------------------------------------------------------------

-- FECHAS POR TODOS
SELECT DATE(E.fechaIng) AS fecha, E.idCliente, E.nombreEstablecimiento, E.direccion, E.latitud, E.longitud, D.id_departamento, D.nombre_departamento, C.id_ciudad, C.nombre_ciudad, B.id_barrio, B.nombre_barrio, TC.id_clasificacion, TC.nombre_clasificacion, UW.nombres
FROM establecimientos E
INNER JOIN barrio B
INNER JOIN ciudad C
INNER JOIN departamento D 
INNER JOIN tipoclasificacion TC
INNER JOIN usuariosweb UW
ON B.id_barrio = E.id_barrio AND C.id_ciudad = B.id_ciudad AND D.id_departamento = C.id_departamento AND TC.id_clasificacion = E.id_clasificacion AND UW.cedula = E.usuario
WHERE E.fechaIng BETWEEN TIMESTAMP('2017-01-01 00:00:00') AND TIMESTAMP('2017-01-31 23:59:59')
ORDER BY fecha;

-- FECHAS POR CIUDAD (TODOS BARRIOS (TODOS CLASIFICACION))
SELECT DATE(E.fechaIng) AS fecha, E.idCliente, E.nombreEstablecimiento, E.direccion, E.latitud, E.longitud, D.id_departamento, D.nombre_departamento, C.id_ciudad, C.nombre_ciudad, B.id_barrio, B.nombre_barrio, TC.id_clasificacion, TC.nombre_clasificacion, UW.nombres
FROM establecimientos E
INNER JOIN barrio B
INNER JOIN ciudad C
INNER JOIN departamento D 
INNER JOIN tipoclasificacion TC
INNER JOIN usuariosweb UW
ON B.id_barrio = E.id_barrio AND C.id_ciudad = B.id_ciudad AND D.id_departamento = C.id_departamento AND TC.id_clasificacion = E.id_clasificacion AND UW.cedula = E.usuario
WHERE E.fechaIng BETWEEN TIMESTAMP('2017-01-01 00:00:00') AND TIMESTAMP('2017-01-31 23:59:59') AND E.id_barrio in (SELECT id_barrio FROM barrio WHERE id_ciudad = 1)
ORDER BY fecha;

-- FECHAS POR BARRIO (TODOS CLASIFICACION)
SELECT DATE(E.fechaIng) AS fecha, E.idCliente, E.nombreEstablecimiento, E.direccion, E.latitud, E.longitud, D.id_departamento, D.nombre_departamento, C.id_ciudad, C.nombre_ciudad, B.id_barrio, B.nombre_barrio, TC.id_clasificacion, TC.nombre_clasificacion, UW.nombres
FROM establecimientos E
INNER JOIN barrio B
INNER JOIN ciudad C
INNER JOIN departamento D 
INNER JOIN tipoclasificacion TC
INNER JOIN usuariosweb UW
ON B.id_barrio = E.id_barrio AND C.id_ciudad = B.id_ciudad AND D.id_departamento = C.id_departamento AND TC.id_clasificacion = E.id_clasificacion AND UW.cedula = E.usuario
WHERE E.fechaIng BETWEEN TIMESTAMP('2017-01-01 00:00:00') AND TIMESTAMP('2017-01-31 23:59:59') AND E.id_barrio = 1
ORDER BY fecha;

-- FECHAS POR CIUDAD (TODOS BARRIOS (POR CLASIFICACION))
SELECT DATE(E.fechaIng) AS fecha, E.idCliente, E.nombreEstablecimiento, E.direccion, E.latitud, E.longitud, D.id_departamento, D.nombre_departamento, C.id_ciudad, C.nombre_ciudad, B.id_barrio, B.nombre_barrio, TC.id_clasificacion, TC.nombre_clasificacion, UW.nombres
FROM establecimientos E
INNER JOIN barrio B
INNER JOIN ciudad C
INNER JOIN departamento D 
INNER JOIN tipoclasificacion TC
INNER JOIN usuariosweb UW
ON B.id_barrio = E.id_barrio AND C.id_ciudad = B.id_ciudad AND D.id_departamento = C.id_departamento AND TC.id_clasificacion = E.id_clasificacion AND UW.cedula = E.usuario
WHERE E.fechaIng BETWEEN TIMESTAMP('2017-01-01 00:00:00') AND TIMESTAMP('2017-01-31 23:59:59') AND E.id_barrio in (SELECT id_barrio FROM barrio WHERE id_ciudad = 3) AND E.id_clasificacion = 6
ORDER BY fecha;

-- FECHAS POR BARRIO (POR CLASIFICACION)
SELECT DATE(E.fechaIng) AS fecha, E.idCliente, E.nombreEstablecimiento, E.direccion, E.latitud, E.longitud, D.id_departamento, D.nombre_departamento, C.id_ciudad, C.nombre_ciudad, B.id_barrio, B.nombre_barrio, TC.id_clasificacion, TC.nombre_clasificacion, UW.nombres
FROM establecimientos E
INNER JOIN barrio B
INNER JOIN ciudad C
INNER JOIN departamento D 
INNER JOIN tipoclasificacion TC
INNER JOIN usuariosweb UW
ON B.id_barrio = E.id_barrio AND C.id_ciudad = B.id_ciudad AND D.id_departamento = C.id_departamento AND TC.id_clasificacion = E.id_clasificacion AND UW.cedula = E.usuario
WHERE E.fechaIng BETWEEN TIMESTAMP('2017-01-01 00:00:00') AND TIMESTAMP('2017-01-31 23:59:59') AND E.id_barrio = 350 AND E.id_clasificacion = 6
ORDER BY fecha;





