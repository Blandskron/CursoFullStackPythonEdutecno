-- ================================================
-- FORMAS NORMALES
-- ================================================
-- Aplicación de las formas normales en la base de datos.

-- 1NF: Cada valor en la tabla debe ser atómico (no repetición de grupos).
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY,          -- Llave primaria
    nombre VARCHAR(100) NOT NULL,        -- Nombre del cliente
    telefono VARCHAR(15) NOT NULL        -- Teléfono del cliente
);

-- 2NF: Aseguramos la dependencia total de las llaves primarias.
CREATE TABLE Pedidos (
    pedido_id INT PRIMARY KEY,           -- Llave primaria
    cliente_id INT,                      -- Llave foránea para Clientes
    fecha DATE NOT NULL,                 -- Fecha del pedido
    total DECIMAL(10, 2) NOT NULL,       -- Total del pedido
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

-- 3NF: Eliminamos dependencias transitivas.
CREATE TABLE Productos (
    producto_id INT PRIMARY KEY,         -- Llave primaria
    nombre VARCHAR(100) NOT NULL,        -- Nombre del producto
    precio DECIMAL(10, 2) NOT NULL       -- Precio del producto
);

-- Ejemplo de datos en formas normales
INSERT INTO Clientes (cliente_id, nombre, telefono) 
VALUES (2, 'Juan Perez', '987654321');

INSERT INTO Pedidos (pedido_id, cliente_id, fecha, total) 
VALUES (1, 2, '2024-10-19', 150.00);

INSERT INTO Productos (producto_id, nombre, precio)
VALUES (1, 'Smartphone', 300.00);
