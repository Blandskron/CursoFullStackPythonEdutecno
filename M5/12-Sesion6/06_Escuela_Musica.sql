-- Crear base de datos
CREATE DATABASE escuela_musica;
\c escuela_musica;  -- Conectar a la base de datos escuela_musica

-- Tabla estudiantes
CREATE TABLE estudiantes (
    estudiante_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    edad INT CHECK (edad > 0)
);

-- Tabla instrumentos
CREATE TABLE instrumentos (
    instrumento_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    tipo VARCHAR(50)
);

-- Tabla cursos
CREATE TABLE cursos (
    curso_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    duracion INT CHECK (duracion > 0)  -- Duración en semanas
);

-- Tabla clases (relación muchos a muchos entre estudiantes y cursos)
CREATE TABLE clases (
    clase_id SERIAL PRIMARY KEY,
    estudiante_id INT REFERENCES estudiantes(estudiante_id),
    curso_id INT REFERENCES cursos(curso_id),
    fecha_inicio DATE DEFAULT CURRENT_DATE
);

-- Insertar datos en la tabla estudiantes
INSERT INTO estudiantes (nombre, apellido, edad) VALUES 
    ('Luis', 'Jimenez', 18),
    ('Carla', 'Rojas', 22),
    ('Pedro', 'Hernandez', 25);

-- Insertar datos en la tabla instrumentos
INSERT INTO instrumentos (nombre, tipo) VALUES 
    ('Guitarra', 'Cuerda'),
    ('Piano', 'Tecla'),
    ('Flauta', 'Viento');

-- Insertar datos en la tabla cursos
INSERT INTO cursos (nombre, duracion) VALUES 
    ('Curso de Guitarra', 8),
    ('Curso de Piano', 10),
    ('Curso de Flauta', 6);

-- Insertar datos en la tabla clases
INSERT INTO clases (estudiante_id, curso_id) VALUES 
    (1, 1),
    (1, 2),
    (2, 2),
    (3, 3);

-- EJEMPLOS DE OPERACIONES ENTRE TABLAS

-- 1. Unión: Lista combinada de todos los estudiantes e instrumentos disponibles
SELECT estudiante_id AS id, nombre, 'Estudiante' AS tipo FROM estudiantes
UNION
SELECT instrumento_id AS id, nombre, 'Instrumento' AS tipo FROM instrumentos;

-- 2. Intersección: Estudiantes que están inscritos en el "Curso de Guitarra" y también en otro curso
SELECT e.nombre, e.apellido
FROM estudiantes e
JOIN clases c1 ON e.estudiante_id = c1.estudiante_id
JOIN cursos cr1 ON c1.curso_id = cr1.curso_id AND cr1.nombre = 'Curso de Guitarra'
JOIN clases c2 ON e.estudiante_id = c2.estudiante_id
JOIN cursos cr2 ON c2.curso_id = cr2.curso_id AND cr2.nombre <> 'Curso de Guitarra';

-- 3. Diferencia: Estudiantes que NO están inscritos en el "Curso de Piano"
SELECT nombre, apellido 
FROM estudiantes
WHERE estudiante_id NOT IN (
    SELECT estudiante_id
    FROM clases c
    JOIN cursos cr ON c.curso_id = cr.curso_id
    WHERE cr.nombre = 'Curso de Piano'
);

-- 4. Producto Cartesiano: Combinar cada estudiante con cada curso para ver las posibles combinaciones
SELECT e.nombre AS estudiante, cr.nombre AS curso
FROM estudiantes e, cursos cr;

-- TIPOS DE RELACIONES

-- Relación Uno a Uno: Agregamos una tabla `inscripciones` con relación uno a uno con `estudiantes`
CREATE TABLE inscripciones (
    inscripcion_id SERIAL PRIMARY KEY,
    estudiante_id INT UNIQUE REFERENCES estudiantes(estudiante_id),
    fecha_inscripcion DATE,
    estado VARCHAR(20)
);

-- Insertar datos en la tabla inscripciones
INSERT INTO inscripciones (estudiante_id, fecha_inscripcion, estado) VALUES 
    (1, '2023-01-10', 'Activo'),
    (2, '2023-02-15', 'Inactivo');

-- Relación Uno a Varios: Instrumentos de un mismo tipo
-- Ejemplo de consulta para mostrar todos los instrumentos de tipo "Cuerda"
SELECT nombre AS instrumento, tipo
FROM instrumentos
WHERE tipo = 'Cuerda';

-- Relación Muchos a Muchos: Estudiantes y cursos a través de la tabla `clases`
-- Ejemplo de consulta para mostrar todos los estudiantes con los cursos en los que están inscritos
SELECT e.nombre AS estudiante, cr.nombre AS curso
FROM estudiantes e
JOIN clases c ON e.estudiante_id = c.estudiante_id
JOIN cursos cr ON c.curso_id = cr.curso_id;

-- Relación Indeterminada: Estudiantes sin clases asignadas
SELECT e.nombre AS estudiante, cr.nombre AS curso
FROM estudiantes e
LEFT JOIN clases c ON e.estudiante_id = c.estudiante_id
LEFT JOIN cursos cr ON c.curso_id = cr.curso_id
WHERE c.clase_id IS NULL;
