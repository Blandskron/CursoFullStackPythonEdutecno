-- Crear un esquema para gestionar una base de datos de una librería
CREATE SCHEMA libreria;

-- Crear una tabla de libros con diferentes tipos de datos y configurar la clave primaria
CREATE TABLE libreria.libros (
    libro_id SERIAL PRIMARY KEY, -- Identificador único y automático para cada libro
    titulo VARCHAR(200) NOT NULL, -- Título del libro
    autor VARCHAR(150) NOT NULL, -- Autor del libro
    genero VARCHAR(50), -- Género literario
    año_publicacion INT NOT NULL -- Año de publicación del libro
);

-- Crear una tabla de clientes con información detallada
CREATE TABLE libreria.clientes (
    cliente_id SERIAL PRIMARY KEY, -- Identificador único para cada cliente
    nombre VARCHAR(100) NOT NULL, -- Nombre del cliente
    correo VARCHAR(100) UNIQUE NOT NULL, -- Correo único para cada cliente
    telefono CHAR(10) -- Teléfono con longitud fija de 10 caracteres
);

-- Crear una tabla de préstamos que vincula clientes y libros
CREATE TABLE libreria.prestamos (
    prestamo_id SERIAL PRIMARY KEY, -- Identificador único para cada préstamo
    cliente_id INT NOT NULL, -- Clave foránea referenciando al cliente
    libro_id INT NOT NULL, -- Clave foránea para referenciar al libro
    fecha_prestamo DATE NOT NULL DEFAULT CURRENT_DATE, -- Fecha del préstamo con valor por defecto del día actual
    fecha_devolucion DATE, -- Fecha de devolución del libro
    FOREIGN KEY (cliente_id) REFERENCES libreria.clientes (cliente_id), -- Relación con tabla clientes
    FOREIGN KEY (libro_id) REFERENCES libreria.libros (libro_id) -- Relación con tabla libros
);

-- Insertar algunos libros en la tabla de libros
INSERT INTO libreria.libros (titulo, autor, genero, año_publicacion) VALUES
('Cien Años de Soledad', 'Gabriel García Márquez', 'Realismo Mágico', 1967),
('1984', 'George Orwell', 'Distopía', 1949);

-- Insertar clientes en la tabla de clientes
INSERT INTO libreria.clientes (nombre, correo, telefono) VALUES
('Pedro Gómez', 'pedro.gomez@correo.com', '1234567890'),
('Lucía Fernández', 'lucia.fernandez@correo.com', '0987654321');

-- Registrar un préstamo, vinculando clientes y libros
INSERT INTO libreria.prestamos (cliente_id, libro_id) VALUES
(1, 1);

-- Consultar los detalles de préstamos por cliente específico
SELECT c.nombre AS Cliente, l.titulo AS Libro, p.fecha_prestamo AS FechaPrestamo
FROM libreria.prestamos p
JOIN libreria.clientes c ON p.cliente_id = c.cliente_id
JOIN libreria.libros l ON p.libro_id = l.libro_id
WHERE c.nombre = 'Pedro Gómez';

-- Actualizar la fecha de devolución de un préstamo
UPDATE libreria.prestamos SET fecha_devolucion = '2023-11-15' WHERE prestamo_id = 1;

-- Borrar un libro, asegurarse de eliminar los préstamos relacionados si configurado (requiere ON DELETE CASCADE)
ALTER TABLE libreria.prestamos DROP CONSTRAINT prestamos_libro_id_fkey;
ALTER TABLE libreria.prestamos ADD CONSTRAINT prestamos_libro_id_fkey FOREIGN KEY (libro_id) REFERENCES libreria.libros (libro_id) ON DELETE CASCADE;
DELETE FROM libreria.libros WHERE libro_id = 2;

-- Crear un índice para acelerar búsquedas en la tabla de libros
CREATE INDEX idx_libro_titulo ON libreria.libros (titulo);

-- Crear un usuario con permisos específicos
CREATE USER bibliotecario WITH PASSWORD 'SecurePass2023';

-- Conceder permisos específicos al usuario para leer datos de libros
GRANT SELECT ON libreria.libros TO bibliotecario;

-- Crear un rol para la gestión de préstamos
CREATE ROLE gestion_prestamos;

-- Conceder privilegios de inserción y actualización a la tabla de préstamos al rol de gestión
GRANT INSERT, UPDATE ON libreria.prestamos TO gestion_prestamos;

-- Eliminar esquema junto con todas las tablas del esquema
DROP SCHEMA IF EXISTS libreria CASCADE;