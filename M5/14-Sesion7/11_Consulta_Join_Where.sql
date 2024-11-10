SELECT e.nombre, e.apellido
FROM estudiantes e
LEFT JOIN matriculas m ON e.estudiante_id = m.estudiante_id
WHERE m.matricula_id IS NULL;

SELECT c.nombre
FROM cursos c
LEFT JOIN matriculas m ON c.curso_id = m.curso_id
WHERE m.matricula_id IS NULL;

-- Contar el número total de cursos
SELECT COUNT(*) FROM cursos;

-- Contar el número de cursos por estudiante
SELECT e.nombre, COUNT(m.curso_id) AS cursos_matriculados
FROM estudiantes e
JOIN matriculas m ON e.estudiante_id = m.estudiante_id
GROUP BY e.estudiante_id;

-- Estudiantes matriculados en todos los cursos (suponiendo que hay 5 cursos)
SELECT e.nombre
FROM estudiantes e
JOIN matriculas m ON e.estudiante_id = m.estudiante_id
GROUP BY e.estudiante_id
HAVING COUNT(m.curso_id) = (SELECT COUNT(*) FROM cursos);
