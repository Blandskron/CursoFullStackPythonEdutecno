-- 1. Crear una tabla llamada "Clientes" con restricciones de validación (DDL)
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY,                  -- Identificador único de cada cliente
    nombre VARCHAR(100) NOT NULL,                -- Nombre del cliente, no puede ser nulo
    apellido VARCHAR(100) NOT NULL,              -- Apellido del cliente, no puede ser nulo
    correo VARCHAR(100) UNIQUE,                  -- Correo único para cada cliente
    telefono VARCHAR(15) CHECK (telefono LIKE '+%' OR telefono IS NULL),  -- Número de teléfono que empieza con un '+'
    edad INT CHECK (edad >= 18 AND edad <= 120), -- Restricción de edad (debe ser entre 18 y 120)
    pais VARCHAR(50)                             -- País del cliente
);

-- 2. Insertar algunos registros en la tabla Clientes (DML)
INSERT INTO Clientes (cliente_id, nombre, apellido, correo, telefono, edad, pais)
VALUES (1, 'Ana', 'Gomez', 'ana.gomez@email.com', '+123456789', 25, 'Chile');

INSERT INTO Clientes (cliente_id, nombre, apellido, correo, telefono, edad, pais)
VALUES (2, 'Luis', 'Martinez', 'luis.martinez@email.com', '+987654321', 30, 'Peru');

INSERT INTO Clientes (cliente_id, nombre, apellido, correo, telefono, edad, pais)
VALUES (3, 'Marta', 'Perez', 'marta.perez@email.com', NULL, 45, 'Argentina');

-- 3. Actualizar un registro en la tabla (DML)
-- Actualizamos el teléfono del cliente con cliente_id = 3
UPDATE Clientes
SET telefono = '+543216789'
WHERE cliente_id = 3;

-- 4. Eliminar un registro de la tabla (DML)
-- Eliminamos al cliente cuyo nombre es "Luis"
DELETE FROM Clientes
WHERE nombre = 'Luis';

-- 5. Alterar la estructura de la tabla para agregar una nueva columna (DDL)
ALTER TABLE Clientes
ADD fecha_registro DATE DEFAULT CURRENT_DATE;  -- Agregamos una columna para la fecha de registro

-- 6. Consulta para seleccionar ciertos registros con condicionales
-- Seleccionamos clientes mayores de 20 años y que sean de "Chile"
SELECT * FROM Clientes
WHERE edad > 20 AND pais = 'Chile';

-- 7. Eliminar la tabla Clientes (DDL)
DROP TABLE IF EXISTS Clientes;
