-- Consulta de estudiantes y los cursos en los que están matriculados
SELECT e.nombre AS estudiante, c.nombre AS curso
FROM estudiantes e
JOIN matriculas m ON e.estudiante_id = m.estudiante_id
JOIN cursos c ON m.curso_id = c.curso_id;
