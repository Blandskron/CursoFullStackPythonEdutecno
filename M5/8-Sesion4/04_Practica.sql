-- EXERCISE 1: CREANDO SENTENCIAS DDL
-- Crear tablas "Cursos" y "Estudiantes" con restricciones y valores por defecto

CREATE TABLE Cursos (
    curso_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    duracion INT CHECK (duracion > 0),  -- Duración en horas, debe ser positiva
    nivel VARCHAR(20) DEFAULT 'Principiante',  -- Nivel por defecto
    costo DECIMAL(10, 2) CHECK (costo >= 0)   -- Costo no negativo
);

CREATE TABLE Estudiantes (
    estudiante_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad INT CHECK (edad >= 18 AND edad <= 65), -- Rango de edad de 18 a 65 años
    email VARCHAR(100) UNIQUE,
    fecha_inscripcion DATE DEFAULT CURRENT_DATE,
    curso_id INT,
    FOREIGN KEY (curso_id) REFERENCES Cursos(curso_id) ON DELETE SET NULL
);

-- Alterar la tabla para agregar una nueva columna "direccion"
ALTER TABLE Estudiantes ADD COLUMN direccion VARCHAR(150);

-- Cambiar el nombre de la tabla "Cursos" a "CatalogoCursos"
ALTER TABLE Cursos RENAME TO CatalogoCursos;

-- Renombrar la columna "nivel" en la tabla "CatalogoCursos" a "nivel_dificultad"
ALTER TABLE CatalogoCursos RENAME COLUMN nivel TO nivel_dificultad;

-- EXERCISE 2: PASANDO DE UN MODELO RELACIONAL A UNO FÍSICO
-- Crear tablas adicionales con relaciones uno a muchos y muchos a uno

CREATE TABLE Profesores (
    profesor_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    salario DECIMAL(10, 2) CHECK (salario >= 0)
);

CREATE TABLE Asignaciones (
    asignacion_id SERIAL PRIMARY KEY,
    profesor_id INT,
    curso_id INT,
    fecha_asignacion DATE NOT NULL DEFAULT CURRENT_DATE,
    FOREIGN KEY (profesor_id) REFERENCES Profesores(profesor_id) ON DELETE CASCADE,
    FOREIGN KEY (curso_id) REFERENCES CatalogoCursos(curso_id) ON DELETE CASCADE
);

-- EXERCISE 3: CREANDO SENTENCIAS DML
-- Insertar datos en las tablas "CatalogoCursos" y "Estudiantes"

INSERT INTO CatalogoCursos (nombre, duracion, nivel_dificultad, costo)
VALUES 
    ('Matemáticas Básicas', 40, 'Principiante', 150.00),
    ('Programación en Python', 60, 'Intermedio', 300.00),
    ('Estadística Avanzada', 80, 'Avanzado', 500.00);

INSERT INTO Estudiantes (nombre, edad, email, curso_id)
VALUES 
    ('Ana López', 22, 'ana.lopez@correo.com', 1),
    ('Miguel Torres', 30, 'miguel.torres@correo.com', 2),
    ('Lucia Gomez', 28, 'lucia.gomez@correo.com', 3);

-- Insertar datos en la tabla "Profesores"
INSERT INTO Profesores (nombre, especialidad, salario)
VALUES 
    ('Carlos Mendoza', 'Matemáticas', 2500),
    ('Laura Sánchez', 'Programación', 3000);

-- Insertar en la tabla "Asignaciones" relacionando profesores y cursos
INSERT INTO Asignaciones (profesor_id, curso_id)
VALUES 
    (1, 1),
    (2, 2),
    (2, 3);

-- Modificar el costo de un curso en "CatalogoCursos" usando UPDATE
UPDATE CatalogoCursos
SET costo = costo * 1.05  -- Incremento de 5% en el costo
WHERE curso_id = 3;

-- Eliminar un curso específico de la tabla "CatalogoCursos"
DELETE FROM CatalogoCursos
WHERE nombre = 'Matemáticas Básicas';

-- Ejemplo de uso de condicional CASE para clasificar cursos por duración
SELECT nombre, duracion,
    CASE 
        WHEN duracion <= 40 THEN 'Corto'
        WHEN duracion BETWEEN 41 AND 70 THEN 'Medio'
        ELSE 'Largo'
    END AS tipo_duracion
FROM CatalogoCursos;

-- Ejemplo de eliminación de una columna de la tabla Estudiantes
ALTER TABLE Estudiantes DROP COLUMN direccion;

-- Desactivar temporalmente una restricción de clave foránea en Asignaciones
ALTER TABLE Asignaciones DISABLE CONSTRAINT asignaciones_profesor_id_fkey;

-- Reactivar la restricción
ALTER TABLE Asignaciones ENABLE CONSTRAINT asignaciones_profesor_id_fkey;

-- Eliminar la tabla Estudiantes para finalizar
DROP TABLE IF EXISTS Estudiantes CASCADE;
