-- Crear un esquema para gestionar una base de datos de una universidad
CREATE SCHEMA universidad;

-- Crear una tabla de estudiantes con diferentes tipos de datos y configurar la clave primaria
CREATE TABLE universidad.estudiantes (
    estudiante_id SERIAL PRIMARY KEY, -- Identificador único y automático para cada estudiante
    nombre VARCHAR(100) NOT NULL, -- Nombre del estudiante con un máximo de 100 caracteres
    fecha_nacimiento DATE NOT NULL, -- Fecha de nacimiento del estudiante
    correo VARCHAR(100) UNIQUE NOT NULL, -- Correo único para cada estudiante
    telefono CHAR(10) -- Teléfono con longitud fija de 10 caracteres
);

-- Crear una tabla de cursos con información detallada
CREATE TABLE universidad.cursos (
    curso_id SERIAL PRIMARY KEY, -- Identificador único y automático para cada curso
    nombre VARCHAR(100) NOT NULL, -- Nombre del curso
    descripcion TEXT, -- Descripción detallada del curso
    creditos INT NOT NULL CHECK (creditos > 0) -- Créditos del curso, asegurando números positivos
);

-- Crear una tabla de inscripciones que vincula estudiantes y cursos
CREATE TABLE universidad.inscripciones (
    inscripcion_id SERIAL PRIMARY KEY, -- Identificador único para cada inscripción
    estudiante_id INT NOT NULL, -- Clave foránea referenciando al estudiante
    curso_id INT NOT NULL, -- Clave foránea para referenciar al curso
    fecha_inscripcion DATE NOT NULL DEFAULT CURRENT_DATE, -- Fecha de inscripción con valor por defecto del día actual
    calificacion NUMERIC(3, 2) CHECK (calificacion BETWEEN 0 AND 10), -- Calificación del curso, restricción entre 0 y 10
    FOREIGN KEY (estudiante_id) REFERENCES universidad.estudiantes (estudiante_id), -- Relación con tabla estudiantes
    FOREIGN KEY (curso_id) REFERENCES universidad.cursos (curso_id) -- Relación con tabla cursos
);

-- Insertar algunos estudiantes en la tabla de estudiantes
INSERT INTO universidad.estudiantes (nombre, fecha_nacimiento, correo, telefono) VALUES
('Carlos Mejía', '2002-08-12', 'carlos@estudiante.com', '1234567890'),
('Laura Martín', '2000-05-30', 'laura@estudiante.com', '0987654321');

-- Insertar cursos en la tabla de cursos
INSERT INTO universidad.cursos (nombre, descripcion, creditos) VALUES
('Matemáticas Avanzadas', 'Curso de nivel avanzado de matemáticas', 6),
('Introducción a la Programación', 'Fundamentos de programación en varios lenguajes', 5);

-- Registrar una inscripción, vinculando estudiantes y cursos
INSERT INTO universidad.inscripciones (estudiante_id, curso_id, calificacion) VALUES
(1, 1, 9.5);

-- Consultar los detalles de inscripciones por estudiante específico
SELECT e.nombre AS Estudiante, c.nombre AS Curso, i.fecha_inscripcion AS Fecha, i.calificacion AS Calificación
FROM universidad.inscripciones i
JOIN universidad.estudiantes e ON i.estudiante_id = e.estudiante_id
JOIN universidad.cursos c ON i.curso_id = c.curso_id
WHERE e.nombre = 'Carlos Mejía';

-- Actualizar la calificación de una inscripción
UPDATE universidad.inscripciones SET calificacion = 8.0 WHERE inscripcion_id = 1;

-- Borrar un estudiante, lo cual eliminará en cascada sus inscripciones si configurado (requiere ON DELETE CASCADE)
ALTER TABLE universidad.inscripciones DROP CONSTRAINT inscripciones_estudiante_id_fkey;
ALTER TABLE universidad.inscripciones ADD CONSTRAINT inscripciones_estudiante_id_fkey FOREIGN KEY (estudiante_id) REFERENCES universidad.estudiantes (estudiante_id) ON DELETE CASCADE;
DELETE FROM universidad.estudiantes WHERE estudiante_id = 2;

-- Crear un índice para acelerar búsquedas en la tabla de cursos
CREATE INDEX idx_curso_nombre ON universidad.cursos (nombre);

-- Crear un usuario con permisos específicos
CREATE USER profesor WITH PASSWORD 'SecurePass2023';

-- Conceder permisos específicos al usuario para leer datos de estudiantes
GRANT SELECT ON universidad.estudiantes TO profesor;

-- Crear un rol para la gestión académica
CREATE ROLE gestion_academica;

-- Conceder privilegios de inserción y actualización a la tabla de inscripciones al rol de gestión
GRANT INSERT, UPDATE ON universidad.inscripciones TO gestion_academica;

-- Eliminar esquema junto con todas las tablas del esquema
DROP SCHEMA IF EXISTS universidad CASCADE;