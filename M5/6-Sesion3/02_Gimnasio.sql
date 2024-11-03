-- Crear un esquema para gestionar una base de datos de un gimnasio
CREATE SCHEMA gimnasio;

-- Crear una tabla de miembros con diferentes tipos de datos y configurar la clave primaria
CREATE TABLE gimnasio.miembros (
    miembro_id SERIAL PRIMARY KEY, -- Identificador único y automático para cada miembro
    nombre VARCHAR(100) NOT NULL, -- Nombre del miembro con un máximo de 100 caracteres
    fecha_nacimiento DATE NOT NULL, -- Fecha de nacimiento del miembro
    correo VARCHAR(100) UNIQUE NOT NULL, -- Correo único para cada miembro
    telefono CHAR(10) -- Teléfono con longitud fija de 10 caracteres
);

-- Crear una tabla de clases con información de las actividades del gimnasio
CREATE TABLE gimnasio.clases (
    clase_id SERIAL PRIMARY KEY, -- Identificador único y automático para cada clase
    nombre VARCHAR(100) NOT NULL, -- Nombre de la clase
    descripcion TEXT, -- Descripción detallada de la clase
    capacidad_maxima INT NOT NULL CHECK (capacidad_maxima > 0) -- Capacidad máxima de miembros, asegurando números positivos
);

-- Crear una tabla de inscripciones que vincula miembros y clases
CREATE TABLE gimnasio.inscripciones (
    inscripcion_id SERIAL PRIMARY KEY, -- Identificador único para cada inscripción
    miembro_id INT NOT NULL, -- Clave foránea referenciando al miembro
    clase_id INT NOT NULL, -- Clave foránea para referenciar a la clase
    fecha_inscripcion DATE NOT NULL DEFAULT CURRENT_DATE, -- Fecha de inscripción con valor por defecto del día actual
    FOREIGN KEY (miembro_id) REFERENCES gimnasio.miembros (miembro_id), -- Relación con tabla miembros
    FOREIGN KEY (clase_id) REFERENCES gimnasio.clases (clase_id) -- Relación con tabla clases
);

-- Insertar algunos miembros en la tabla de miembros
INSERT INTO gimnasio.miembros (nombre, fecha_nacimiento, correo, telefono) VALUES
('Ana Silva', '1991-07-22', 'ana.silva@gimnasio.com', '1234567890'),
('Miguel Vargas', '1988-10-30', 'miguel.vargas@gimnasio.com', '0987654321');

-- Insertar clases en la tabla de clases
INSERT INTO gimnasio.clases (nombre, descripcion, capacidad_maxima) VALUES
('Yoga Avanzado', 'Clase de yoga para niveles avanzados', 15),
('Crossfit', 'Entrenamiento de alta intensidad', 20);

-- Registrar una inscripción, vinculando miembros y clases
INSERT INTO gimnasio.inscripciones (miembro_id, clase_id) VALUES
(1, 1);

-- Consultar los detalles de inscripciones por miembro específico
SELECT m.nombre AS Miembro, c.nombre AS Clase, i.fecha_inscripcion AS Fecha
FROM gimnasio.inscripciones i
JOIN gimnasio.miembros m ON i.miembro_id = m.miembro_id
JOIN gimnasio.clases c ON i.clase_id = c.clase_id
WHERE m.nombre = 'Ana Silva';

-- Actualizar la clase de una inscripción
UPDATE gimnasio.inscripciones SET clase_id = 2 WHERE inscripcion_id = 1;

-- Borrar un miembro, lo cual eliminará en cascada sus inscripciones si configurado (requiere ON DELETE CASCADE)
ALTER TABLE gimnasio.inscripciones DROP CONSTRAINT inscripciones_miembro_id_fkey;
ALTER TABLE gimnasio.inscripciones ADD CONSTRAINT inscripciones_miembro_id_fkey FOREIGN KEY (miembro_id) REFERENCES gimnasio.miembros (miembro_id) ON DELETE CASCADE;
DELETE FROM gimnasio.miembros WHERE miembro_id = 2;

-- Crear un índice para acelerar búsquedas en la tabla de clases
CREATE INDEX idx_clase_nombre ON gimnasio.clases (nombre);

-- Crear un usuario con permisos específicos
CREATE USER entrenador WITH PASSWORD 'SecurePass2023';

-- Conceder permisos específicos al usuario para leer datos de miembros
GRANT SELECT ON gimnasio.miembros TO entrenador;

-- Crear un rol para la gestión de actividades
CREATE ROLE gestion_actividades;

-- Conceder privilegios de inserción y actualización a la tabla de inscripciones al rol de gestión
GRANT INSERT, UPDATE ON gimnasio.inscripciones TO gestion_actividades;

-- Eliminar esquema junto con todas las tablas del esquema
DROP SCHEMA IF EXISTS gimnasio CASCADE;