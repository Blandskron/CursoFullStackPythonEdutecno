-- Crear la tabla de estudiantes
CREATE TABLE estudiantes (
    estudiante_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    edad INT CHECK (edad > 0)
);

-- Crear la tabla de cursos
CREATE TABLE cursos (
    curso_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos INT CHECK (creditos > 0)
);

-- Crear la tabla de matrículas (relación muchos a muchos entre estudiantes y cursos)
CREATE TABLE matriculas (
    matricula_id SERIAL PRIMARY KEY,
    estudiante_id INT REFERENCES estudiantes(estudiante_id),
    curso_id INT REFERENCES cursos(curso_id),
    fecha_matricula DATE DEFAULT CURRENT_DATE
);
