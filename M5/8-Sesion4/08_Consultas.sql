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
    cliente_id INT PRIMARY KEY,                          
    nombre VARCHAR(100) NOT NULL,                       
    apellido VARCHAR(100) NOT NULL,                     
    correo VARCHAR(100) UNIQUE CHECK (correo LIKE '%@%'),
    telefono VARCHAR(15) CHECK (telefono LIKE '+%' OR telefono IS NULL), 
    edad INT CHECK (edad >= 18 AND edad <= 120),        
    pais VARCHAR(50)                                     
);

INSERT INTO Clientes (cliente_id, nombre, apellido, correo, telefono, edad, pais) VALUES 
(1, 'Juan', 'Pérez', 'juan.perez@gmail.com', '+56912345678', 25, 'Chile'),
(2, 'María', 'González', 'maria.gonzalez@yahoo.com', '+522331234567', 32, 'México'),
(3, 'Luis', 'Rodríguez', 'luis.rodriguez@hotmail.com', '+541112345678', 40, 'Argentina'),
(4, 'Ana', 'López', 'ana.lopez@outlook.com', '+34912345678', 28, 'España'),
(5, 'Pedro', 'Martínez', 'pedro.martinez@gmail.com', '+59891234567', 30, 'Uruguay'),
(6, 'Lucía', 'Gómez', 'lucia.gomez@correo.com', '+51987654321', 35, 'Perú'),
(7, 'Carlos', 'Hernández', 'carlos.hernandez@gmail.com', '+56912398765', 26, 'Chile'),
(8, 'Laura', 'Díaz', 'laura.diaz@hotmail.com', '+521234567890', 45, 'México'),
(9, 'Jorge', 'Torres', 'jorge.torres@empresa.com', NULL, 50, 'Argentina'),
(10, 'Marta', 'Ramírez', 'marta.ramirez@gmail.com', '+551112345678', 55, 'Brasil'),
(11, 'David', 'Flores', 'david.flores@proyecto.com', '+441234567890', 29, 'Reino Unido'),
(12, 'Sara', 'Vargas', 'sara.vargas@gmail.com', '+61234567890', 33, 'Australia'),
(13, 'Raúl', 'Castillo', 'raul.castillo@hotmail.com', '+56998765432', 60, 'Chile'),
(14, 'Clara', 'Romero', 'clara.romero@yahoo.com', '+81312345678', 21, 'Japón'),
(15, 'Antonio', 'Silva', 'antonio.silva@gmail.com', NULL, 42, 'Portugal'),
(16, 'Elena', 'Méndez', 'elena.mendez@correo.com', '+551199876543', 30, 'Brasil'),
(17, 'José', 'Morales', 'jose.morales@hotmail.com', '+521234987654', 38, 'México'),
(18, 'Valeria', 'Reyes', 'valeria.reyes@outlook.com', '+34123456789', 47, 'España'),
(19, 'Fernando', 'Ortega', 'fernando.ortega@gmail.com', '+541123456789', 36, 'Argentina'),
(20, 'Patricia', 'Cruz', 'patricia.cruz@gmail.com', NULL, 50, 'Colombia');
