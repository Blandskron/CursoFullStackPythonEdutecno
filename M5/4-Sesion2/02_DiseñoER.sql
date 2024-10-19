-- ================================================
-- DISEÑO DEL MODELO ENTIDAD-RELACIÓN (ER)
-- ================================================
-- Diseño del modelo ER que relaciona Empleados, Departamentos y Proyectos.

-- La tabla Empleados contiene información sobre los empleados
CREATE TABLE Empleados (
    empleado_id INT PRIMARY KEY,         -- Identificador único
    nombre VARCHAR(100) NOT NULL,        -- Nombre del empleado
    puesto VARCHAR(100) NOT NULL,        -- Puesto del empleado
    salario DECIMAL(10, 2) NOT NULL      -- Salario del empleado
);

-- La tabla Departamentos almacena los departamentos de la empresa
CREATE TABLE Departamentos (
    departamento_id INT PRIMARY KEY,     -- Identificador único
    nombre VARCHAR(100) NOT NULL         -- Nombre del departamento
);

-- La tabla Proyectos relaciona los proyectos asignados a los departamentos
CREATE TABLE Proyectos (
    proyecto_id INT PRIMARY KEY,         -- Identificador único
    departamento_id INT,                 -- Llave foránea para Departamentos
    nombre VARCHAR(100) NOT NULL,        -- Nombre del proyecto
    presupuesto DECIMAL(10, 2) NOT NULL, -- Presupuesto asignado al proyecto
    FOREIGN KEY (departamento_id) REFERENCES Departamentos(departamento_id)
);

-- La tabla Asignaciones relaciona empleados con proyectos
CREATE TABLE Asignaciones (
    asignacion_id INT PRIMARY KEY,       -- Identificador único
    empleado_id INT,                     -- Llave foránea para Empleados
    proyecto_id INT,                     -- Llave foránea para Proyectos
    horas_trabajadas INT NOT NULL,       -- Horas trabajadas en el proyecto
    FOREIGN KEY (empleado_id) REFERENCES Empleados(empleado_id),
    FOREIGN KEY (proyecto_id) REFERENCES Proyectos(proyecto_id)
);

-- Ejemplo de inserción de datos
INSERT INTO Empleados (empleado_id, nombre, puesto, salario) 
VALUES (1, 'Pedro Hernandez', 'Ingeniero', 3000.00);

INSERT INTO Departamentos (departamento_id, nombre)
VALUES (1, 'Ingeniería');

INSERT INTO Proyectos (proyecto_id, departamento_id, nombre, presupuesto)
VALUES (1, 1, 'Sistema de Gestión', 50000.00);

INSERT INTO Asignaciones (asignacion_id, empleado_id, proyecto_id, horas_trabajadas)
VALUES (1, 1, 1, 40);
