-- Crear un nuevo esquema para organizar las tablas de la base de datos para una librería
CREATE SCHEMA biblioteca;

-- Crear una tabla para autores, teniendo en cuenta diferentes tipos de datos y la clave primaria
CREATE TABLE biblioteca.autores (
    autor_id SERIAL PRIMARY KEY, -- 'SERIAL' genera valores únicos automáticamente para cada nuevo registro, usada como clave primaria
    nombre VARCHAR(100) NOT NULL, -- Nombre del autor con un máximo de 100 caracteres
    nacionalidad VARCHAR(50), -- Nacionalidad del autor con un máximo de 50 caracteres
    fecha_nacimiento DATE -- Fecha de nacimiento del autor
);

-- Crear una tabla para libros incluyendo una relación con autores usando claves foráneas
CREATE TABLE biblioteca.libros (
    libro_id SERIAL PRIMARY KEY, -- Identificador único para cada libro
    titulo VARCHAR(150) NOT NULL, -- Título del libro con un máximo de 150 caracteres
    genero VARCHAR(50), -- Género literario del libro
    autor_id INT NOT NULL, -- Referencia al autor del libro
    FOREIGN KEY (autor_id) REFERENCES biblioteca.autores (autor_id), -- Clave foránea para crear la relación con autores
    fecha_publicacion DATE -- Fecha de publicación del libro
);

-- Crear una tabla para registrar préstamos de libros
CREATE TABLE biblioteca.prestamos (
    prestamo_id SERIAL PRIMARY KEY, -- Identificador único para cada préstamo
    libro_id INT NOT NULL, -- ID del libro prestado
    fecha_prestamo DATE NOT NULL, -- Fecha en que se realiza el préstamo
    fecha_devolucion DATE, -- Fecha en que se devuelve el libro, puede ser NULL si aún no se devuelve
    FOREIGN KEY (libro_id) REFERENCES biblioteca.libros (libro_id) -- Relación con la tabla de libros
);

-- Insertar algunos autores como registros iniciales
INSERT INTO biblioteca.autores (nombre, nacionalidad, fecha_nacimiento) VALUES
('Gabriel Garcia Marquez', 'Colombiano', '1927-03-06'),
('Isabel Allende', 'Chilena', '1942-08-02');

-- Insertar algunos libros y vincularlos con sus autores
INSERT INTO biblioteca.libros (titulo, genero, autor_id, fecha_publicacion) VALUES
('Cien Años de Soledad', 'Realismo Mágico', 1, '1967-05-30'),
('La Casa de los Espíritus', 'Ficción', 2, '1982-11-01');

-- Registrar un préstamo de un libro
INSERT INTO biblioteca.prestamos (libro_id, fecha_prestamo, fecha_devolucion) VALUES
(1, '2023-10-01', NULL); -- Dejar fecha_devolucion como NULL si el libro aún no ha sido devuelto

-- Realizar una consulta uniendo varias tablas para obtener el nombre del autor y el título de los libros prestados
SELECT a.nombre AS Autor, l.titulo AS Libro, p.fecha_prestamo AS Prestamo, p.fecha_devolucion AS Devolucion
FROM biblioteca.prestamos p
JOIN biblioteca.libros l ON p.libro_id = l.libro_id
JOIN biblioteca.autores a ON l.autor_id = a.autor_id;

-- Actualizar la fecha de devolución de un libro una vez que es devuelto
UPDATE biblioteca.prestamos SET fecha_devolucion = '2023-10-10' WHERE prestamo_id = 1;

-- Borrar el registro de un libro si es retirado del catálogo
DELETE FROM biblioteca.libros WHERE titulo = 'La Casa de los Espíritus';

-- Crear un índice en la tabla autores para acelerar las búsquedas por nombre
CREATE INDEX idx_autor_nombre ON biblioteca.autores (nombre);

-- Controlar los accesos creando un nuevo usuario de solo lectura
CREATE USER bibliotecario WITH PASSWORD 'ReadOnlyPass#2023';

-- Conceder permiso de solo lectura sobre las tablas de autores y libros al usuario bibliotecario
GRANT SELECT ON biblioteca.autores TO bibliotecario;
GRANT SELECT ON biblioteca.libros TO bibliotecario;

-- Para gestionar, crear roles especializados para administración
CREATE ROLE gestionar_biblioteca;

-- Conceder privilegios de administración al rol
GRANT ALL PRIVILEGES ON SCHEMA biblioteca TO gestionar_biblioteca;

-- Eliminar una tabla si ya no es necesaria pero asegurando la consistencia
BEGIN;
DROP TABLE IF EXISTS biblioteca.prestamos; -- Usar IF EXISTS para prevenir errores si la tabla no existe
COMMIT;

-- Si es necesario reconstruir la base de datos desde cero
DROP SCHEMA IF EXISTS biblioteca CASCADE; -- Elimina todo el esquema y las tablas asociadas