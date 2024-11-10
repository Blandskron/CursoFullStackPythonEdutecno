-- Insertar estudiantes
INSERT INTO estudiantes (nombre, apellido, edad) VALUES
('Laura', 'García', 20),
('Carlos', 'Martínez', 22),
('Sofía', 'López', 19),
('Miguel', 'Hernández', 21);

-- Insertar cursos
INSERT INTO cursos (nombre, creditos) VALUES
('Matemáticas', 5),
('Historia', 4),
('Biología', 3),
('Literatura', 2);

-- Insertar matrículas
INSERT INTO matriculas (estudiante_id, curso_id, fecha_matricula) VALUES
(1, 1, '2023-09-01'),
(1, 2, '2023-09-01'),
(2, 1, '2023-09-02'),
(2, 3, '2023-09-02'),
(3, 2, '2023-09-03'),
(4, 4, '2023-09-04');
