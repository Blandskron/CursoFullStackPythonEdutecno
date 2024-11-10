SELECT e.nombre AS estudiante, c.nombre AS curso
FROM estudiantes e
CROSS JOIN cursos c;
