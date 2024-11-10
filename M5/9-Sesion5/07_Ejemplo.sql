-- Archivo: libreria.sql
-- Base de datos: Librería

-- Crear base de datos
CREATE DATABASE libreria;
\c libreria;  -- Conectar a la base de datos libreria

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

-- Ejemplo de inserción de datos con transacciones y propiedades ACID

BEGIN;  -- Inicia la transacción

-- Inserta un autor
INSERT INTO autores (nombre, nacionalidad) VALUES ('Gabriel García Márquez', 'Colombiano');

-- Inserta un libro y vincúlalo al autor
INSERT INTO libros (titulo, autor_id, precio, fecha_publicacion) 
VALUES ('Cien años de soledad', (SELECT autor_id FROM autores WHERE nombre = 'Gabriel García Márquez'), 30.00, '1967-05-30');

-- Inserta una venta de ese libro
INSERT INTO ventas (libro_id, cantidad)
VALUES ((SELECT libro_id FROM libros WHERE titulo = 'Cien años de soledad'), 3);

COMMIT;  -- Confirma la transacción

-- Ejemplo de SAVEPOINT para un punto de retorno intermedio

BEGIN;

-- Inserta un nuevo autor y guarda el punto de retorno
INSERT INTO autores (nombre, nacionalidad) VALUES ('Isabel Allende', 'Chilena');
SAVEPOINT sp_autor;

-- Inserta un libro para este autor
INSERT INTO libros (titulo, autor_id, precio, fecha_publicacion)
VALUES ('La casa de los espíritus', (SELECT autor_id FROM autores WHERE nombre = 'Isabel Allende'), 25.50, '1982-01-01');

-- Revertir hasta el punto de retorno si es necesario
ROLLBACK TO sp_autor;

-- Continúa con la transacción si es necesario
INSERT INTO ventas (libro_id, cantidad)
VALUES ((SELECT libro_id FROM libros WHERE titulo = 'La casa de los espíritus'), 5);

COMMIT;

-- Control de Acceso con DCL

-- Crear un rol de solo lectura para el personal de ventas
CREATE ROLE ventas_lectura;

-- Otorgar permisos de solo lectura a la tabla libros
GRANT SELECT ON libros TO ventas_lectura;

-- Crear un rol con permisos de inserción para el personal de inventario
CREATE ROLE inventario_escritura;

-- Otorgar permisos de inserción en la tabla libros
GRANT INSERT ON libros TO inventario_escritura;

-- Revocar permisos de inserción en la tabla libros
REVOKE INSERT ON libros FROM inventario_escritura;

-- Ejemplos adicionales de TCL (Transactional Control Language)

BEGIN;

-- Agregar una nueva venta
INSERT INTO ventas (libro_id, cantidad)
VALUES ((SELECT libro_id FROM libros WHERE titulo = 'Cien años de soledad'), 2);

-- Confirma la transacción, guardando los cambios
COMMIT;

-- Inserta un autor sin COMMIT, y luego realiza un ROLLBACK
BEGIN;

INSERT INTO autores (nombre, nacionalidad) VALUES ('Jorge Luis Borges', 'Argentino');

-- Deshace la transacción antes de confirmar
ROLLBACK;

-- Consultas adicionales para gestionar la información

-- Consultar el total de ventas por libro
SELECT l.titulo, SUM(v.cantidad) AS total_vendido
FROM libros l
JOIN ventas v ON l.libro_id = v.libro_id
GROUP BY l.titulo;

-- Consultar los libros publicados después de 1980
SELECT titulo, fecha_publicacion
FROM libros
WHERE fecha_publicacion > '1980-01-01';

-- Consultar la información completa de autores y sus libros
SELECT a.nombre AS autor, l.titulo AS libro, l.fecha_publicacion, l.precio
FROM autores a
JOIN libros l ON a.autor_id = l.autor_id;

-- Consultar los libros y su precio con un descuento del 10%
SELECT titulo, precio, precio * 0.9 AS precio_con_descuento
FROM libros;

-- Final del archivo SQL para la base de datos Librería
