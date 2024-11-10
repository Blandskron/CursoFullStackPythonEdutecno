-- Archivo: libreria_funciones.sql
-- Base de datos: Librería Funciones

-- Crear base de datos
CREATE DATABASE libreria_funciones;
\c libreria_funciones;  -- Conectar a la base de datos libreria_funciones

-- Tabla autores
CREATE TABLE autores (
    autor_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    nacionalidad VARCHAR(30)
);

-- Tabla libros
CREATE TABLE libros (
    libro_id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    autor_id INT REFERENCES autores(autor_id),
    precio NUMERIC(8, 2) NOT NULL CHECK (precio > 0),
    fecha_publicacion DATE
);

-- Tabla ventas
CREATE TABLE ventas (
    venta_id SERIAL PRIMARY KEY,
    libro_id INT REFERENCES libros(libro_id),
    cantidad INT CHECK (cantidad > 0),
    fecha_venta DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Insertar datos de ejemplo
INSERT INTO autores (nombre, nacionalidad) VALUES 
    ('Gabriel García Márquez', 'Colombiano'),
    ('Isabel Allende', 'Chilena'),
    ('Jorge Luis Borges', 'Argentino');

INSERT INTO libros (titulo, autor_id, precio, fecha_publicacion) VALUES 
    ('Cien años de soledad', 1, 30.00, '1967-05-30'),
    ('La casa de los espíritus', 2, 25.50, '1982-01-01'),
    ('Ficciones', 3, 20.00, '1944-01-01');

INSERT INTO ventas (libro_id, cantidad, fecha_venta) VALUES 
    (1, 3, '2023-01-01'),
    (1, 5, '2023-02-15'),
    (2, 2, '2023-01-10'),
    (2, 7, '2023-03-05'),
    (3, 4, '2023-01-20');

-- CONSULTAS CON FUNCIONES AGREGADAS

-- 1. SUM() - Total de libros vendidos
SELECT l.titulo, SUM(v.cantidad) AS total_vendido
FROM libros l
JOIN ventas v ON l.libro_id = v.libro_id
GROUP BY l.titulo;

-- 2. AVG() - Precio promedio de los libros
SELECT AVG(precio) AS precio_promedio
FROM libros;

-- 3. COUNT() - Número total de ventas realizadas
SELECT COUNT(venta_id) AS total_ventas
FROM ventas;

-- 4. MIN() - Precio mínimo de los libros
SELECT MIN(precio) AS precio_minimo
FROM libros;

-- 5. MAX() - Precio máximo de los libros
SELECT MAX(precio) AS precio_maximo
FROM libros;

-- 6. COUNT(DISTINCT) - Número de autores únicos
SELECT COUNT(DISTINCT autor_id) AS total_autores
FROM autores;

-- 7. GROUP BY y HAVING - Total de libros vendidos por título, solo mostrando los que tienen más de 5 ventas
SELECT l.titulo, SUM(v.cantidad) AS total_vendido
FROM libros l
JOIN ventas v ON l.libro_id = v.libro_id
GROUP BY l.titulo
HAVING SUM(v.cantidad) > 5;

-- 8. Funciones de fecha - Año de la primera y última venta
SELECT MIN(fecha_venta) AS primera_venta, MAX(fecha_venta) AS ultima_venta
FROM ventas;

-- 9. Concatenación de cadenas - Listado de autores con su nacionalidad en un solo campo
SELECT nombre || ' - ' || nacionalidad AS autor_info
FROM autores;

-- 10. COALESCE - Mostrar nacionalidad de los autores o un valor por defecto si es nula
SELECT nombre, COALESCE(nacionalidad, 'Nacionalidad desconocida') AS nacionalidad
FROM autores;

-- 11. ROUND() - Precio promedio de los libros, redondeado a dos decimales
SELECT ROUND(AVG(precio), 2) AS precio_promedio_redondeado
FROM libros;

-- 12. Subconsulta con funciones - Libro más vendido
SELECT titulo
FROM libros
WHERE libro_id = (SELECT libro_id FROM ventas GROUP BY libro_id ORDER BY SUM(cantidad) DESC LIMIT 1);

-- 13. SUM() y AVG() combinados - Promedio de ventas por libro
SELECT l.titulo, AVG(v.cantidad) AS promedio_vendido
FROM libros l
JOIN ventas v ON l.libro_id = v.libro_id
GROUP BY l.titulo;

-- 14. CASE WHEN - Clasificación de libros según su precio
SELECT titulo,
       CASE 
           WHEN precio < 20 THEN 'Barato'
           WHEN precio BETWEEN 20 AND 30 THEN 'Moderado'
           ELSE 'Caro'
       END AS clasificacion_precio
FROM libros;

-- 15. Generación de valores de serie - Días con ventas en enero de 2023
SELECT GENERATE_SERIES('2023-01-01'::DATE, '2023-01-31'::DATE, '1 day'::INTERVAL) AS dia;

-- 16. Función SUM() con JOIN y GROUP BY - Ganancias totales por libro
SELECT l.titulo, SUM(v.cantidad * l.precio) AS total_ganado
FROM libros l
JOIN ventas v ON l.libro_id = v.libro_id
GROUP BY l.titulo;

-- 17. COUNT() y DISTINCT - Total de días únicos con ventas registradas
SELECT COUNT(DISTINCT fecha_venta) AS dias_unicos_ventas
FROM ventas;

-- 18. Subconsulta con SUM() y JOIN - Venta total por autor
SELECT a.nombre, SUM(v.cantidad * l.precio) AS total_ganado_por_autor
FROM autores a
JOIN libros l ON a.autor_id = l.autor_id
JOIN ventas v ON l.libro_id = v.libro_id
GROUP BY a.nombre;

-- Fin del archivo SQL para libreria_funciones
