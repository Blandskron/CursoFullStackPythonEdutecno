-- 1. Crear una tabla llamada "Empleados" con restricciones de validación (DDL)
CREATE TABLE Empleados (
    empleado_id INT PRIMARY KEY,                    -- Identificador único de cada empleado
    nombre VARCHAR(100) NOT NULL,                   -- Nombre del empleado, no puede ser nulo
    apellido VARCHAR(100) NOT NULL,                 -- Apellido del empleado, no puede ser nulo
    correo VARCHAR(100) UNIQUE,                     -- Correo único para cada empleado
    telefono VARCHAR(15) CHECK (telefono LIKE '+%' OR telefono IS NULL),  -- Número de teléfono con prefijo de país
    edad INT CHECK (edad >= 18 AND edad <= 65),     -- Restricción de edad (debe ser entre 18 y 65)
    departamento VARCHAR(50),                       -- Departamento del empleado
    salario DECIMAL(10, 2) CHECK (salario >= 0)     -- Salario debe ser un número positivo
);

-- 2. Insertar registros en la tabla Empleados (DML)
INSERT INTO Empleados (empleado_id, nombre, apellido, correo, telefono, edad, departamento, salario)
VALUES (1, 'Carlos', 'Diaz', 'carlos.diaz@empresa.com', '+123456789', 29, 'Ventas', 3500.50);

INSERT INTO Empleados (empleado_id, nombre, apellido, correo, telefono, edad, departamento, salario)
VALUES (2, 'Ana', 'Martinez', 'ana.martinez@empresa.com', '+987654321', 35, 'Marketing', 4200.75);

INSERT INTO Empleados (empleado_id, nombre, apellido, correo, telefono, edad, departamento, salario)
VALUES (3, 'Luis', 'Garcia', 'luis.garcia@empresa.com', NULL, 42, 'IT', 5000.00);

-- 3. Actualizar un registro en la tabla (DML)
-- Actualizamos el salario del empleado con empleado_id = 1
UPDATE Empleados
SET salario = 3700.00
WHERE empleado_id = 1;

-- 4. Eliminar un registro de la tabla (DML)
-- Eliminamos al empleado cuyo apellido es "Martinez"
DELETE FROM Empleados
WHERE apellido = 'Martinez';

-- 5. Alterar la estructura de la tabla para agregar una nueva columna (DDL)
ALTER TABLE Empleados
ADD fecha_contratacion DATE DEFAULT CURRENT_DATE;  -- Nueva columna para la fecha de contratación

-- 6. Consulta para seleccionar ciertos registros con condicionales
-- Seleccionamos empleados mayores de 30 años y que pertenezcan al departamento "IT"
SELECT * FROM Empleados
WHERE edad > 30 AND departamento = 'IT';

-- 7. Eliminar la tabla Empleados (DDL)
DROP TABLE IF EXISTS Empleados;
