-- Definición de base de datos: Creamos una base de datos para gestionar una tienda.
CREATE DATABASE TiendaDB;

-- Usamos la base de datos creada
USE TiendaDB;

-- Modelos de bases de datos: En este caso, estamos usando un modelo relacional.
-- Creamos tablas que están relacionadas entre sí.

-- Bases de Datos Relacionales: Creamos una tabla de productos, clientes y pedidos.
-- Las relaciones serán definidas por claves primarias y foráneas.

-- Tabla de productos
CREATE TABLE Productos (
    producto_id INT PRIMARY KEY,         -- Clave primaria, identifica de manera única cada producto.
    nombre VARCHAR(100) NOT NULL,        -- Nombre del producto.
    precio DECIMAL(10, 2) NOT NULL,      -- Precio del producto con dos decimales.
    stock INT NOT NULL                   -- Cantidad de productos en inventario.
);

-- Tabla de clientes
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY,          -- Clave primaria, identifica de manera única cada cliente.
    nombre VARCHAR(100) NOT NULL,        -- Nombre del cliente.
    email VARCHAR(100) UNIQUE NOT NULL   -- El email debe ser único para cada cliente.
);

-- Tabla de pedidos
CREATE TABLE Pedidos (
    pedido_id INT PRIMARY KEY,           -- Clave primaria, identifica de manera única cada pedido.
    cliente_id INT,                      -- Clave foránea que relaciona un cliente con el pedido.
    fecha DATE NOT NULL,                 -- Fecha en la que se hizo el pedido.
    total DECIMAL(10, 2) NOT NULL,       -- Total del pedido.
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id) -- Relación con la tabla Clientes.
);

-- Componentes de una base de datos relacional:
-- - Tablas (creadas arriba)
-- - Claves primarias (producto_id, cliente_id, pedido_id)
-- - Claves foráneas (cliente_id en la tabla Pedidos)
-- - Restricciones (NOT NULL, UNIQUE)
-- - Relación entre tablas (mediante claves foráneas)

-- RDBMS (Relational Database Management System): 
-- Un RDBMS es un sistema que gestiona bases de datos relacionales.
-- Ejemplos de RDBMS incluyen MySQL, PostgreSQL, SQL Server. Este código está diseñado para un RDBMS.

-- SQL (Structured Query Language): 
-- SQL es el lenguaje usado para interactuar con bases de datos relacionales.
-- A continuación, mostramos ejemplos de consultas SQL.

-- Insertamos datos en la tabla Productos
INSERT INTO Productos (producto_id, nombre, precio, stock)
VALUES (1, 'Laptop', 1200.50, 10),
       (2, 'Mouse', 25.75, 50),
       (3, 'Teclado', 45.90, 30);

-- Insertamos datos en la tabla Clientes
INSERT INTO Clientes (cliente_id, nombre, email)
VALUES (1, 'Juan Pérez', 'juan.perez@mail.com'),
       (2, 'Ana López', 'ana.lopez@mail.com');

-- Insertamos un pedido
INSERT INTO Pedidos (pedido_id, cliente_id, fecha, total)
VALUES (1, 1, '2024-10-19', 1226.25);  -- Pedido de Juan Pérez, compró Laptop y Mouse.

-- Consultas SQL
-- Seleccionamos todos los productos
SELECT * FROM Productos;

-- Seleccionamos todos los clientes
SELECT * FROM Clientes;

-- Obtenemos los pedidos realizados junto con el nombre del cliente
SELECT P.pedido_id, C.nombre, P.fecha, P.total
FROM Pedidos P
JOIN Clientes C ON P.cliente_id = C.cliente_id;

-- Actualizamos el stock de un producto
UPDATE Productos
SET stock = stock - 1
WHERE producto_id = 1; -- Reducimos en 1 el stock de la Laptop.

-- Eliminamos un producto
DELETE FROM Productos
WHERE producto_id = 3; -- Eliminamos el teclado.

-- Borramos toda la base de datos (¡Cuidado al ejecutar esta consulta!)
-- DROP DATABASE TiendaDB;
