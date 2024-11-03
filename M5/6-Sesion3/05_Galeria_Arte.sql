-- Crear un esquema para gestionar una base de datos de una galería de arte
CREATE SCHEMA galeria_arte;

-- Crear una tabla de artistas con diferentes tipos de datos y configurar la clave primaria
CREATE TABLE galeria_arte.artistas (
    artista_id SERIAL PRIMARY KEY, -- Identificador único y automático para cada artista
    nombre VARCHAR(100) NOT NULL, -- Nombre del artista
    nacionalidad VARCHAR(50), -- Nacionalidad del artista
    fecha_nacimiento DATE -- Fecha de nacimiento del artista
);

-- Crear una tabla de obras con información detallada
CREATE TABLE galeria_arte.obras (
    obra_id SERIAL PRIMARY KEY, -- Identificador único y automático para cada obra
    titulo VARCHAR(100) NOT NULL, -- Título de la obra
    artista_id INT NOT NULL, -- Clave foránea para referenciar al artista
    año_creacion INT, -- Año de creación de la obra
    descripcion TEXT, -- Descripción detallada de la obra
    FOREIGN KEY (artista_id) REFERENCES galeria_arte.artistas (artista_id) -- Relación con tabla artistas
);

-- Crear una tabla de exposiciones que vincula obras y artistas
CREATE TABLE galeria_arte.exposiciones (
    exposicion_id SERIAL PRIMARY KEY, -- Identificador único para cada exposición
    nombre VARCHAR(100) NOT NULL, -- Nombre de la exposición
    fecha_inicio DATE NOT NULL, -- Fecha de inicio de la exposición
    fecha_fin DATE NOT NULL, -- Fecha de fin de la exposición
    obra_id INT NOT NULL, -- Clave foránea para referenciar la obra expuesta
    FOREIGN KEY (obra_id) REFERENCES galeria_arte.obras (obra_id) -- Relación con tabla obras
);

-- Insertar algunos artistas en la tabla de artistas
INSERT INTO galeria_arte.artistas (nombre, nacionalidad, fecha_nacimiento) VALUES
('Pablo Picasso', 'Española', '1881-10-25'),
('Frida Kahlo', 'Mexicana', '1907-07-06');

-- Insertar obras en la tabla de obras
INSERT INTO galeria_arte.obras (titulo, artista_id, año_creacion, descripcion) VALUES
('Guernica', 1, 1937, 'Obra famosa de Picasso representando el bombardeo de Guernica'),
('Las dos Fridas', 2, 1939, 'Una de las obras más conocidas de Frida Kahlo');

-- Registrar una exposición vinculando una obra
INSERT INTO galeria_arte.exposiciones (nombre, fecha_inicio, fecha_fin, obra_id) VALUES
('Exposición de Arte Moderno', '2023-11-01', '2023-12-01', 1);

-- Consultar los detalles de exposiciones de un artista específico
SELECT a.nombre AS Artista, o.titulo AS Obra, e.nombre AS Exposicion, e.fecha_inicio AS FechaInicio, e.fecha_fin AS FechaFin
FROM galeria_arte.exposiciones e
JOIN galeria_arte.obras o ON e.obra_id = o.obra_id
JOIN galeria_arte.artistas a ON o.artista_id = a.artista_id
WHERE a.nombre = 'Pablo Picasso';

-- Actualizar las fechas de una exposición
UPDATE galeria_arte.exposiciones SET fecha_inicio = '2023-11-10', fecha_fin = '2023-12-10' WHERE exposicion_id = 1;

-- Borrar un artista, lo cual eliminará en cascada sus obras y exposiciones si configurado (requiere ON DELETE CASCADE)
ALTER TABLE galeria_arte.obras DROP CONSTRAINT obras_artista_id_fkey;
ALTER TABLE galeria_arte.obras ADD CONSTRAINT obras_artista_id_fkey FOREIGN KEY (artista_id) REFERENCES galeria_arte.artistas (artista_id) ON DELETE CASCADE;
DELETE FROM galeria_arte.artistas WHERE artista_id = 2;

-- Crear un índice para acelerar búsquedas en la tabla de obras
CREATE INDEX idx_obra_titulo ON galeria_arte.obras (titulo);

-- Crear un usuario con permisos específicos
CREATE USER curador WITH PASSWORD 'SecurePass2023';

-- Conceder permisos específicos al usuario para leer datos de artistas y obras
GRANT SELECT ON galeria_arte.artistas TO curador;
GRANT SELECT ON galeria_arte.obras TO curador;

-- Crear un rol para la gestión de exposiciones
CREATE ROLE gestion_exposiciones;

-- Conceder privilegios de inserción y actualización a la tabla de exposiciones al rol de gestión
GRANT INSERT, UPDATE ON galeria_arte.exposiciones TO gestion_exposiciones;

-- Eliminar esquema junto con todas las tablas del esquema
DROP SCHEMA IF EXISTS galeria_arte CASCADE;