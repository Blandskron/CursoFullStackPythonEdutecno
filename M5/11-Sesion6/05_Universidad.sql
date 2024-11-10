-- Crear base de datos
CREATE DATABASE universidad;
\c universidad;  -- Conectar a la base de datos universidad

-- Tabla alumnos
CREATE TABLE alumnos (
    alumno_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    edad INT CHECK (edad > 0)
);

-- Tabla asignaturas
CREATE TABLE asignaturas (
    asignatura_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos INT CHECK (creditos > 0)
);

-- Tabla matrículas para relacionar alumnos con asignaturas (relación muchos a muchos)
CREATE TABLE matriculas (
    matricula_id SERIAL PRIMARY KEY,
    alumno_id INT REFERENCES alumnos(alumno_id),
    asignatura_id INT REFERENCES asignaturas(asignatura_id),
    semestre VARCHAR(20) NOT NULL
);

-- Insertar datos en la tabla alumnos
INSERT INTO alumnos (nombre, apellido, edad) VALUES 
    ('Juan', 'Pérez', 20),
    ('Ana', 'García', 22),
    ('Luis', 'Ramírez', 21);

-- Insertar datos en la tabla asignaturas
INSERT INTO asignaturas (nombre, creditos) VALUES 
    ('Matemáticas', 5),
    ('Literatura', 3),
    ('Física', 4);

-- Insertar datos en la tabla matrículas
INSERT INTO matriculas (alumno_id, asignatura_id, semestre) VALUES 
    (1, 1, '2023-I'),
    (1, 2, '2023-I'),
    (2, 1, '2023-I'),
    (3, 3, '2023-I');

-- EJEMPLOS DE OPERACIONES ENTRE TABLAS

-- 1. Unión: Obtener una lista combinada de todos los alumnos y asignaturas (simulación de unión de información)
SELECT alumno_id AS id, nombre, 'Alumno' AS tipo FROM alumnos
UNION
SELECT asignatura_id AS id, nombre, 'Asignatura' AS tipo FROM asignaturas;

-- 2. Intersección: Alumnos que están inscritos en Matemáticas y otra asignatura
SELECT a.nombre, a.apellido
FROM alumnos a
JOIN matriculas m1 ON a.alumno_id = m1.alumno_id
JOIN asignaturas s1 ON m1.asignatura_id = s1.asignatura_id AND s1.nombre = 'Matemáticas'
JOIN matriculas m2 ON a.alumno_id = m2.alumno_id
JOIN asignaturas s2 ON m2.asignatura_id = s2.asignatura_id AND s2.nombre <> 'Matemáticas';

-- 3. Diferencia: Alumnos que NO están inscritos en la asignatura de Física
SELECT nombre, apellido 
FROM alumnos
WHERE alumno_id NOT IN (
    SELECT alumno_id
    FROM matriculas m
    JOIN asignaturas s ON m.asignatura_id = s.asignatura_id
    WHERE s.nombre = 'Física'
);

-- 4. Producto Cartesiano: Combinar cada alumno con cada asignatura para ver posibles inscripciones
SELECT a.nombre AS alumno, s.nombre AS asignatura
FROM alumnos a, asignaturas s;

-- TIPOS DE RELACIONES

-- Relación Uno a Uno: Agregaremos una tabla `perfiles` que tenga una relación uno a uno con `alumnos`
CREATE TABLE perfiles (
    perfil_id SERIAL PRIMARY KEY,
    alumno_id INT UNIQUE REFERENCES alumnos(alumno_id),
    direccion VARCHAR(100),
    telefono VARCHAR(15)
);

-- Insertar datos en la tabla perfiles
INSERT INTO perfiles (alumno_id, direccion, telefono) VALUES 
    (1, 'Calle Falsa 123', '123456789'),
    (2, 'Avenida Siempre Viva 456', '987654321');

-- Relación Uno a Varios: Alumnos inscritos en una misma asignatura
-- Ejemplo de consulta para mostrar los alumnos inscritos en "Matemáticas"
SELECT a.nombre, a.apellido, s.nombre AS asignatura
FROM alumnos a
JOIN matriculas m ON a.alumno_id = m.alumno_id
JOIN asignaturas s ON m.asignatura_id = s.asignatura_id
WHERE s.nombre = 'Matemáticas';

-- Relación Muchos a Muchos: Alumnos y asignaturas mediante la tabla `matriculas`
-- Ejemplo de consulta para mostrar todos los alumnos con sus asignaturas
SELECT a.nombre AS alumno, s.nombre AS asignatura
FROM alumnos a
JOIN matriculas m ON a.alumno_id = m.alumno_id
JOIN asignaturas s ON m.asignatura_id = s.asignatura_id;

-- Relación Indeterminada (Indefinida o Inconsistente)
-- Ejemplo de consulta con un LEFT JOIN que permite ver los alumnos sin asignaturas inscritas
SELECT a.nombre AS alumno, s.nombre AS asignatura
FROM alumnos a
LEFT JOIN matriculas m ON a.alumno_id = m.alumno_id
LEFT JOIN asignaturas s ON m.asignatura_id = s.asignatura_id
WHERE s.asignatura_id IS NULL;
