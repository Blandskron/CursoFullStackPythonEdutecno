-- Consulta de un curso y sus estudiantes
SELECT c.nombre AS curso, e.nombre AS estudiante
FROM cursos c
JOIN matriculas m ON c.curso_id = m.curso_id
JOIN estudiantes e ON m.estudiante_id = e.estudiante_id
WHERE c.nombre = 'Matemáticas';
