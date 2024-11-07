-- EXERCISE 1: CREANDO SENTENCIAS DDL
-- Crear tablas "Proyectos" y "Empleados" con restricciones y valores por defecto

CREATE TABLE Proyectos (
    proyecto_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_inicio DATE DEFAULT CURRENT_DATE,
    fecha_fin DATE,
    presupuesto DECIMAL(10, 2) CHECK (presupuesto >= 0)  -- Aseguramos un presupuesto no negativo
);

CREATE TABLE Empleados (
    empleado_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    puesto VARCHAR(50),
    salario DECIMAL(10, 2) CHECK (salario > 0),  -- Salario positivo obligatorio
    fecha_contratacion DATE DEFAULT CURRENT_DATE,
    proyecto_id INT,
    FOREIGN KEY (proyecto_id) REFERENCES Proyectos(proyecto_id) ON DELETE SET NULL
);

-- Alterar la tabla para agregar una nueva columna
ALTER TABLE Empleados ADD COLUMN ubicacion VARCHAR(100) DEFAULT 'Oficina Principal';

-- Cambiar el nombre de la tabla "Proyectos" a "ProyectoAsignado"
ALTER TABLE Proyectos RENAME TO ProyectoAsignado;

-- Renombrar una columna de la tabla Empleados
ALTER TABLE Empleados RENAME COLUMN puesto TO cargo;

-- EXERCISE 2: PASANDO DE UN MODELO RELACIONAL A UNO FÍSICO
-- Crear tablas adicionales con relaciones uno a muchos y muchos a uno

CREATE TABLE Departamentos (
    dept_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    ubicacion VARCHAR(100)
);

CREATE TABLE Asignaciones (
    asignacion_id SERIAL PRIMARY KEY,
    empleado_id INT,
    dept_id INT,
    fecha_asignacion DATE NOT NULL DEFAULT CURRENT_DATE,
    FOREIGN KEY (empleado_id) REFERENCES Empleados(empleado_id) ON DELETE CASCADE,
    FOREIGN KEY (dept_id) REFERENCES Departamentos(dept_id) ON DELETE CASCADE
);

-- EXERCISE 3: CREANDO SENTENCIAS DML
-- Insertar datos en las tablas "ProyectoAsignado" y "Empleados"

INSERT INTO ProyectoAsignado (nombre, fecha_fin, presupuesto)
VALUES 
    ('Proyecto Alfa', '2024-12-31', 50000),
    ('Proyecto Beta', '2025-06-30', 75000);

INSERT INTO Empleados (nombre, cargo, salario, proyecto_id)
VALUES 
    ('Laura Perez', 'Ingeniera', 3000, 1),
    ('Carlos Martinez', 'Analista', 2500, 1),
    ('Marta Ramirez', 'Gerente', 4000, 2);

-- Insertar datos en la tabla "Departamentos"
INSERT INTO Departamentos (nombre, ubicacion)
VALUES 
    ('Recursos Humanos', 'Edificio Principal'),
    ('Desarrollo', 'Edificio A'),
    ('Marketing', 'Edificio B');

-- Insertar en la tabla "Asignaciones" relacionando empleados y departamentos
INSERT INTO Asignaciones (empleado_id, dept_id)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3);

-- Modificar el salario de un empleado usando UPDATE
UPDATE Empleados
SET salario = salario * 1.10  -- Aumento del 10% en salario
WHERE empleado_id = 1;

-- Eliminar un departamento específico con DELETE
DELETE FROM Departamentos
WHERE nombre = 'Marketing';

-- Ejemplo de uso de condicional CASE para clasificar proyectos por presupuesto
SELECT nombre, presupuesto,
    CASE 
        WHEN presupuesto < 30000 THEN 'Bajo'
        WHEN presupuesto BETWEEN 30000 AND 60000 THEN 'Medio'
        ELSE 'Alto'
    END AS clasificacion_presupuesto
FROM ProyectoAsignado;

-- Ejemplo de eliminación de una columna de la tabla Empleados
ALTER TABLE Empleados DROP COLUMN ubicacion;

-- Desactivar temporalmente una restricción de clave foránea
ALTER TABLE Asignaciones DISABLE CONSTRAINT asignaciones_empleado_id_fkey;

-- Reactivar la restricción
ALTER TABLE Asignaciones ENABLE CONSTRAINT asignaciones_empleado_id_fkey;

-- Eliminar la tabla Empleados para finalizar
DROP TABLE IF EXISTS Empleados CASCADE;
