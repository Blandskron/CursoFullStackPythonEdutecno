-- Crear un esquema para la base de datos
CREATE SCHEMA IF NOT EXISTS escuela;

-- Crear una tabla de estudiantes con varios tipos de datos
CREATE TABLE IF NOT EXISTS escuela.estudiantes (
    estudiante_id SERIAL PRIMARY KEY, -- Clave primaria
    nombre VARCHAR(100) NOT NULL,
    edad INT CHECK (edad > 0), -- Asegura que la edad sea un valor positivo
    fecha_nacimiento DATE
);

-- Crear una tabla de cursos
CREATE TABLE IF NOT EXISTS escuela.cursos (
    curso_id SERIAL PRIMARY KEY, -- Clave primaria
    nombre VARCHAR(100) NOT NULL UNIQUE -- Nombre del curso debe ser único
);

-- Crear una tabla de inscripciones que vincula estudiantes y cursos
CREATE TABLE IF NOT EXISTS escuela.inscripciones (
    inscripcion_id SERIAL PRIMARY KEY, -- Clave primaria
    estudiante_id INT NOT NULL, -- Clave foránea
    curso_id INT NOT NULL, -- Clave foránea
    FOREIGN KEY (estudiante_id) REFERENCES escuela.estudiantes (estudiante_id) ON DELETE CASCADE,
    FOREIGN KEY (curso_id) REFERENCES escuela.cursos (curso_id) ON DELETE CASCADE
);

-- Insertar registros en la tabla de estudiantes
INSERT INTO escuela.estudiantes (nombre, edad, fecha_nacimiento) VALUES
('Juan Perez', 20, '2003-02-15'),
('Maria Gomez', 22, '2001-07-01')
ON CONFLICT DO NOTHING; -- Evita duplicados en inserciones

-- Insertar registros en la tabla de cursos
INSERT INTO escuela.cursos (nombre) VALUES
('Matemáticas'),
('Historia')
ON CONFLICT DO NOTHING; -- Evita duplicados en inserciones

-- Insertar registros en la tabla de inscripciones
INSERT INTO escuela.inscripciones (estudiante_id, curso_id) VALUES
(1, 1),
(2, 2);

-- Consultar datos de estudiantes inscritos en cada curso
SELECT e.nombre AS Estudiante, c.nombre AS Curso
FROM escuela.inscripciones i
JOIN escuela.estudiantes e ON i.estudiante_id = e.estudiante_id
JOIN escuela.cursos c ON i.curso_id = c.curso_id;

-- Cambiar el nombre de un curso utilizando una transacción
BEGIN;
UPDATE escuela.cursos SET nombre = 'Matemáticas Avanzadas' WHERE curso_id = 1;
COMMIT;

-- Borrar inscripciones de estudiantes mayores de 21 años
DELETE FROM escuela.inscripciones
WHERE estudiante_id IN (
    SELECT estudiante_id FROM escuela.estudiantes WHERE edad > 21
);

-- Crear un índice para mejorar la velocidad de las consultas sobre los estudiantes
CREATE INDEX IF NOT EXISTS idx_nombre_estudiante ON escuela.estudiantes (nombre);

-- Controlar el acceso a la base de datos
CREATE USER IF NOT EXISTS profesor WITH PASSWORD 'StrongPass123';

-- Conceder permisos de solo lectura al usuario profesor en la tabla de estudiantes
GRANT SELECT ON ALL TABLES IN SCHEMA escuela TO profesor;

-- Gestionar bases de datos con un ejemplo de rol
CREATE ROLE IF NOT EXISTS admin_role;

-- Asignar el rol administrative a un usuario
GRANT admin_role TO profesor;

-- Conceder permisos completos a admin_role en todas las tablas de la base de datos
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA escuela TO admin_role;

-- Garantizar consistencia al borrar la tabla de inscripciones
BEGIN;
DROP TABLE IF EXISTS escuela.inscripciones;
COMMIT;

-- Completa eliminación de un curso
DROP TABLE IF EXISTS escuela.cursos;

-- Completar modificación de la estructura de la tabla estudiantes
ALTER TABLE escuela.estudiantes ADD COLUMN IF NOT EXISTS direccion VARCHAR(255);
