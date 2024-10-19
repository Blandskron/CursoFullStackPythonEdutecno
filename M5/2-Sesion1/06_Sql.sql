-- Ejemplo 1: SQL para gestionar una base de datos de inventario de una tienda de ropa.
INSERT INTO Ropa (ropa_id, descripcion, precio, stock)
VALUES (1, 'Camiseta', 15.99, 100),
       (2, 'Pantalones', 29.99, 50);

-- Actualizamos el stock de un artículo
UPDATE Ropa
SET stock = stock - 10
WHERE ropa_id = 1;

-- Eliminamos un artículo
DELETE FROM Ropa
WHERE ropa_id = 2;

-- Ejemplo 2: SQL para gestionar una base de datos de clientes de una empresa de telecomunicaciones.
INSERT INTO Clientes (cliente_id, nombre, telefono)
VALUES (1, 'Pedro López', '555-1234'),
       (2, 'Laura García', '555-5678');

-- Consultamos todos los clientes
SELECT * FROM Clientes;

-- Actualizamos el número de teléfono de un cliente
UPDATE Clientes
SET telefono = '555-9999'
WHERE cliente_id = 1;

-- Eliminamos un cliente
DELETE FROM Clientes
WHERE cliente_id = 2;
