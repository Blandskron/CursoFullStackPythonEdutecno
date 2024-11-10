-- Añadir un curso con nombre "Laura"
INSERT INTO cursos (nombre, creditos) VALUES ('Laura', 3);

-- Realizar la intersección
SELECT nombre FROM estudiantes
INTERSECT
SELECT nombre FROM cursos;
