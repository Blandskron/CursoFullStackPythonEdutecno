-- ================================================
-- DEFINICIÓN DE BASE DE DATOS
-- ================================================
-- Creamos una base de datos llamada "EmpresaDB" para gestionar la información de una empresa.
CREATE DATABASE EmpresaDB;

-- Usamos la base de datos recién creada
USE EmpresaDB;

-- ================================================
-- MODELOS DE BASES DE DATOS (Relacional)
-- ================================================
-- Creación de tablas para gestionar información sobre empleados, departamentos y proyectos.

-- Tabla para almacenar información de los empleados
CREATE TABLE Empleados (
    empleado_id INT PRIMARY KEY,        -- Llave primaria única para identificar a cada empleado
    nombre VARCHAR(100) NOT NULL,       -- Nombre del empleado
    apellido VARCHAR(100) NOT NULL,     -- Apellido del empleado
    fecha_contratacion DATE NOT NULL,   -- Fecha en que el empleado fue contratado
    salario DECIMAL(10, 2) NOT NULL,    -- Salario del empleado
    departamento_id INT                 -- Llave foránea que referencia al departamento
);

-- Tabla para almacenar información de los departamentos
CREATE TABLE Departamentos (
    departamento_id INT PRIMARY KEY,    -- Llave primaria única para identificar a cada departamento
    nombre VARCHAR(100) NOT NULL        -- Nombre del departamento
);

-- Tabla para almacenar información de los proyectos
CREATE TABLE Proyectos (
    proyecto_id INT PRIMARY KEY,        -- Llave primaria única para identificar a cada proyecto
    nombre VARCHAR(100) NOT NULL,       -- Nombre del proyecto
    fecha_inicio DATE NOT NULL,         -- Fecha de inicio del proyecto
    fecha_fin DATE                      -- Fecha de finalización del proyecto (puede ser nulo)
);

-- Relación entre empleados y proyectos: un empleado puede trabajar en varios proyectos y un proyecto puede tener varios empleados.
CREATE TABLE Empleados_Proyectos (
    empleado_id INT,                    -- Llave foránea que referencia al empleado
    proyecto_id INT,                    -- Llave foránea que referencia al proyecto
    horas_asignadas DECIMAL(5, 2),      -- Horas asignadas del empleado al proyecto
    PRIMARY KEY (empleado_id, proyecto_id),   -- Llave primaria compuesta por empleado_id y proyecto_id
    FOREIGN KEY (empleado_id) REFERENCES Empleados(empleado_id),
    FOREIGN KEY (proyecto_id) REFERENCES Proyectos(proyecto_id)
);

-- ================================================
-- BASES DE DATOS RELACIONALES
-- ================================================
-- Un sistema de bases de datos relacional utiliza tablas relacionadas por llaves foráneas para organizar los datos.
-- En este caso, las tablas Empleados, Departamentos, Proyectos y Empleados_Proyectos están relacionadas.

-- Relación entre empleados y departamentos
ALTER TABLE Empleados
ADD CONSTRAINT fk_departamento
FOREIGN KEY (departamento_id) REFERENCES Departamentos(departamento_id);

-- ================================================
-- COMPONENTES DE UNA BASE DE DATOS RELACIONAL
-- ================================================
-- Llaves primarias, llaves foráneas, índices y restricciones.

-- Llave primaria: identificador único de cada fila en una tabla.
-- Ejemplo: empleado_id en la tabla Empleados.

-- Llave foránea: referencia a la llave primaria de otra tabla.
-- Ejemplo: departamento_id en la tabla Empleados es una llave foránea que referencia a la tabla Departamentos.

-- Restricciones: garantizan la integridad de los datos.
-- Ejemplo: NOT NULL en nombre y apellido de los empleados para asegurar que esos campos siempre tengan datos.

-- ================================================
-- RDBMS (RELATIONAL DATABASE MANAGEMENT SYSTEM)
-- ================================================
-- El sistema de gestión de bases de datos relacional (RDBMS) permite realizar operaciones sobre las tablas y gestionar los datos.

-- ================================================
-- SQL (Structured Query Language)
-- ================================================
-- Consultas básicas para trabajar con datos.

-- Insertar datos en la tabla Departamentos
INSERT INTO Departamentos (departamento_id, nombre)
VALUES (1, 'Recursos Humanos'),
       (2, 'Tecnología'),
       (3, 'Finanzas');

-- Insertar datos en la tabla Empleados
INSERT INTO Empleados (empleado_id, nombre, apellido, fecha_contratacion, salario, departamento_id)
VALUES (1, 'Ana', 'Perez', '2020-01-15', 50000, 2),
       (2, 'Carlos', 'Gomez', '2019-11-01', 60000, 1),
       (3, 'Lucia', 'Martinez', '2021-05-23', 55000, 3);

-- Insertar datos en la tabla Proyectos
INSERT INTO Proyectos (proyecto_id, nombre, fecha_inicio, fecha_fin)
VALUES (1, 'Proyecto A', '2023-01-01', NULL),
       (2, 'Proyecto B', '2022-03-15', '2023-06-30');

-- Insertar datos en la tabla Empleados_Proyectos
INSERT INTO Empleados_Proyectos (empleado_id, proyecto_id, horas_asignadas)
VALUES (1, 1, 20),
       (2, 1, 30),
       (3, 2, 25);

-- Consultar todos los empleados
SELECT * FROM Empleados;

-- Consultar empleados y sus departamentos usando una unión de tablas
SELECT E.nombre, E.apellido, D.nombre AS departamento
FROM Empleados E
JOIN Departamentos D ON E.departamento_id = D.departamento_id;

-- Consultar proyectos y los empleados asignados a cada uno
SELECT P.nombre AS proyecto, E.nombre, E.apellido, EP.horas_asignadas
FROM Empleados_Proyectos EP
JOIN Empleados E ON EP.empleado_id = E.empleado_id
JOIN Proyectos P ON EP.proyecto_id = P.proyecto_id;

-- Actualizar el salario de un empleado
UPDATE Empleados
SET salario = 58000
WHERE empleado_id = 1;

-- Eliminar un empleado (y en cascada sus asignaciones en Empleados_Proyectos)
DELETE FROM Empleados WHERE empleado_id = 2;

-- Eliminar un proyecto (y en cascada sus relaciones con empleados)
DELETE FROM Proyectos WHERE proyecto_id = 2;
