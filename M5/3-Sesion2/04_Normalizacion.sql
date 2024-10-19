-- ================================================
-- NORMALIZACIÓN
-- ================================================
-- Este archivo cubre el concepto de normalización, que organiza los datos para minimizar redundancia.

-- Creamos una tabla Productos, asegurando que los datos sean atómicos (1NF)
CREATE TABLE Productos (
    producto_id INT PRIMARY KEY,         -- Identificador único
    nombre VARCHAR(100) NOT NULL,        -- Nombre del producto
    precio DECIMAL(10, 2) NOT NULL       -- Precio del producto
);

-- La tabla Pedidos incluye información independiente, asegurando dependencia total de la clave primaria (2NF)
CREATE TABLE Pedidos (
    pedido_id INT PRIMARY KEY,           -- Identificador único
    cliente_id INT,                      -- Llave foránea para Clientes
    fecha DATE NOT NULL,                 -- Fecha del pedido
    total DECIMAL(10, 2) NOT NULL,       -- Total del pedido
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

-- Ejemplo de inserciones de datos normalizados
INSERT INTO Productos (producto_id, nombre, precio)
VALUES (3, 'Mouse', 25.00);

INSERT INTO Pedidos (pedido_id, cliente_id, fecha, total) 
VALUES (3, 1, '2024-10-19', 25.00);
