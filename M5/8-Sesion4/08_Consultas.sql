SELECT * FROM Clientes
WHERE nombre LIKE 'b%';

SELECT * FROM Clientes
WHERE apellido LIKE '%c';

SELECT * FROM Clientes
WHERE correo LIKE '%a%';

SELECT SUM(edad) AS total_edades
FROM Clientes;

SELECT pais, COUNT(cliente_id) AS total_clientes
FROM Clientes
GROUP BY pais;

SELECT AVG(edad) AS edad_promedio
FROM Clientes;

SELECT COUNT(cliente_id) AS total_con_telefono
FROM Clientes
WHERE telefono IS NOT NULL;

-- Ejemplo validacion
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY,                          -- Identificador único de cada cliente
    nombre VARCHAR(100) NOT NULL,                        -- Nombre del cliente, no puede ser nulo
    apellido VARCHAR(100) NOT NULL,                      -- Apellido del cliente, no puede ser nulo
    correo VARCHAR(100) UNIQUE CHECK (correo LIKE '%@%'),-- Correo único y debe contener '@'
    telefono VARCHAR(15) CHECK (telefono LIKE '+%' OR telefono IS NULL),  -- Número de teléfono que empieza con un '+'
    edad INT CHECK (edad >= 18 AND edad <= 120),         -- Restricción de edad (debe ser entre 18 y 120)
    pais VARCHAR(50)                                     -- País del cliente
);
