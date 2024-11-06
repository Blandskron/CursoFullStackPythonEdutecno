-- 1. Creación de Tablas
-- Para este ejemplo, vamos a crear tres tablas básicas: `Empleado`, `Departamento` y `Proyecto`.

-- Tabla de Empleados
CREATE TABLE Empleado (
    id_empleado INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    id_departamento INT
);

-- Tabla de Departamentos
CREATE TABLE Departamento (
    id_departamento INT PRIMARY KEY,
    nombre_departamento VARCHAR(50)
);

-- Tabla de Proyectos
CREATE TABLE Proyecto (
    id_proyecto INT PRIMARY KEY,
    nombre_proyecto VARCHAR(50),
    id_departamento INT
);

-- 2. Inserción de Datos
-- Vamos a insertar algunos datos básicos en estas tablas.

-- Insertar datos en la tabla Empleado
INSERT INTO Empleado (id_empleado, nombre, apellido, id_departamento) VALUES
(1, 'Juan', 'Pérez', 1),
(2, 'Ana', 'Gómez', 2),
(3, 'Luis', 'Ramírez', NULL),
(4, 'Carlos', 'López', 1);

-- Insertar datos en la tabla Departamento
INSERT INTO Departamento (id_departamento, nombre_departamento) VALUES
(1, 'Recursos Humanos'),
(2, 'Finanzas'),
(3, 'Marketing');

-- Insertar datos en la tabla Proyecto
INSERT INTO Proyecto (id_proyecto, nombre_proyecto, id_departamento) VALUES
(1, 'Proyecto Alpha', 1),
(2, 'Proyecto Beta', 2),
(3, 'Proyecto Gamma', 3),
(4, 'Proyecto Delta', NULL);

-- 3. Ejemplos de Consultas con Diferentes Tipos de JOIN
-- INNER JOIN
-- Combina registros que tienen valores coincidentes en ambas tablas.

SELECT e.nombre, e.apellido, d.nombre_departamento
FROM Empleado e
INNER JOIN Departamento d ON e.id_departamento = d.id_departamento;

-- LEFT JOIN
-- Devuelve todos los registros de la tabla de la izquierda y los registros coincidentes de la tabla de la derecha. Si no hay coincidencia, devuelve `NULL` para los campos de la derecha.

SELECT e.nombre, e.apellido, d.nombre_departamento
FROM Empleado e
LEFT JOIN Departamento d ON e.id_departamento = d.id_departamento;

-- RIGHT JOIN
-- Devuelve todos los registros de la tabla de la derecha y los registros coincidentes de la tabla de la izquierda. Si no hay coincidencia, devuelve `NULL` para los campos de la izquierda.

SELECT e.nombre, e.apellido, d.nombre_departamento
FROM Empleado e
RIGHT JOIN Departamento d ON e.id_departamento = d.id_departamento;

-- FULL OUTER JOIN
-- Devuelve todos los registros cuando hay coincidencias en una de las tablas o en ambas. Los resultados no coincidentes aparecerán con valores `NULL`.

SELECT e.nombre, e.apellido, d.nombre_departamento
FROM Empleado e
FULL OUTER JOIN Departamento d ON e.id_departamento = d.id_departamento;

-- CROSS JOIN
-- Genera el producto cartesiano de ambas tablas.

SELECT e.nombre, p.nombre_proyecto
FROM Empleado e
CROSS JOIN Proyecto p;

-- 4. Consultas Complejas con Subconsultas y Diferentes JOINS
-- Consulta con Subconsulta y `INNER JOIN`
-- Queremos encontrar los nombres de los empleados que están en el departamento con más proyectos asignados.

SELECT e.nombre, e.apellido, d.nombre_departamento
FROM Empleado e
INNER JOIN Departamento d ON e.id_departamento = d.id_departamento
WHERE d.id_departamento = (
    SELECT id_departamento
    FROM Proyecto
    GROUP BY id_departamento
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- `LEFT JOIN` con Subconsulta Anidada
-- Obtener todos los empleados junto con el nombre del proyecto en el que están trabajando. Si no están asignados a ningún proyecto, mostrar `NULL` en el nombre del proyecto.

SELECT e.nombre, e.apellido, p.nombre_proyecto
FROM Empleado e
LEFT JOIN Proyecto p ON e.id_departamento = p.id_departamento
WHERE p.id_proyecto IN (
    SELECT id_proyecto
    FROM Proyecto
    WHERE id_departamento = e.id_departamento
);

-- `FULL OUTER JOIN` con Condición de Filtrado
-- Queremos listar todos los departamentos y todos los empleados, independientemente de si están asociados o no, y mostrar también el proyecto asignado (si aplica).

SELECT e.nombre AS nombre_empleado, d.nombre_departamento, p.nombre_proyecto
FROM Empleado e
FULL OUTER JOIN Departamento d ON e.id_departamento = d.id_departamento
FULL OUTER JOIN Proyecto p ON d.id_departamento = p.id_departamento;

-- Subconsulta Anidada con `RIGHT JOIN`
-- Encontrar todos los proyectos y los nombres de empleados que pertenecen al departamento al que está asignado el proyecto. Si no hay empleados en ese departamento, mostrar solo el proyecto.

SELECT p.nombre_proyecto, e.nombre AS nombre_empleado
FROM Proyecto p
RIGHT JOIN Empleado e ON p.id_departamento = e.id_departamento
WHERE p.id_departamento IN (
    SELECT id_departamento
    FROM Departamento
);

-- `CROSS JOIN` con Condición de Filtrado
-- Combinar todos los empleados con todos los proyectos y mostrar solo aquellos pares en los que el empleado pertenece al departamento asignado al proyecto.


SELECT e.nombre AS nombre_empleado, p.nombre_proyecto
FROM Empleado e
CROSS JOIN Proyecto p
WHERE e.id_departamento = p.id_departamento;
