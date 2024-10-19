-- ================================================
-- MODELO ENTIDAD-RELACIÓN (ER)
-- ================================================
-- Este archivo cubre el concepto de un Modelo ER con entidades Clientes, Productos y Pedidos.

-- Creamos la entidad Clientes
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY,          -- Llave primaria única para identificar al cliente
    nombre VARCHAR(100) NOT NULL,        -- Nombre del cliente
    apellido VARCHAR(100) NOT NULL,      -- Apellido del cliente
    email VARCHAR(100) UNIQUE NOT NULL   -- Email del cliente, debe ser único
);

-- Creamos la entidad Productos
CREATE TABLE Productos (
    producto_id INT PRIMARY KEY,         -- Llave primaria única para identificar el producto
    nombre VARCHAR(100) NOT NULL,        -- Nombre del producto
    precio DECIMAL(10, 2) NOT NULL       -- Precio del producto
);

-- Creamos la entidad Pedidos
CREATE TABLE Pedidos (
    pedido_id INT PRIMARY KEY,           -- Llave primaria única para identificar el pedido
    cliente_id INT,                      -- Llave foránea que referencia a la entidad Clientes
    fecha DATE NOT NULL,                 -- Fecha del pedido
    total DECIMAL(10, 2) NOT NULL,       -- Total del pedido
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)  -- Llave foránea para clientes
);

-- Creamos la entidad DetallesPedidos para asociar productos con pedidos
CREATE TABLE DetallesPedidos (
    detalle_id INT PRIMARY KEY,          -- Llave primaria única para cada detalle de pedido
    pedido_id INT,                       -- Llave foránea que referencia a Pedidos
    producto_id INT,                     -- Llave foránea que referencia a Productos
    cantidad INT NOT NULL,               -- Cantidad de productos en el pedido
    subtotal DECIMAL(10, 2) NOT NULL,    -- Subtotal calculado para cada línea del pedido
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);

-- Ejemplo de inserciones en las tablas diseñadas
INSERT INTO Clientes (cliente_id, nombre, apellido, email) 
VALUES (1, 'Maria', 'Santos', 'maria.santos@email.com');

INSERT INTO Productos (producto_id, nombre, precio)
VALUES (1, 'Monitor', 200.00);

INSERT INTO Pedidos (pedido_id, cliente_id, fecha, total) 
VALUES (1, 1, '2024-10-19', 200.00);

INSERT INTO DetallesPedidos (detalle_id, pedido_id, producto_id, cantidad, subtotal)
VALUES (1, 1, 1, 1, 200.00);
