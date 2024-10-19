-- ================================================
-- MODELO ENTIDAD-RELACIÓN (ER)
-- ================================================
-- Modelo que relaciona Clientes, Facturas, Productos y DetallesFacturas.

-- Creamos la entidad Clientes
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY,          -- Llave primaria única para identificar al cliente
    nombre VARCHAR(100) NOT NULL,        -- Nombre del cliente
    direccion VARCHAR(200) NOT NULL      -- Dirección del cliente
);

-- Creamos la entidad Facturas
CREATE TABLE Facturas (
    factura_id INT PRIMARY KEY,          -- Llave primaria única para identificar la factura
    cliente_id INT,                      -- Llave foránea que referencia a la entidad Clientes
    fecha DATE NOT NULL,                 -- Fecha de la factura
    total DECIMAL(10, 2) NOT NULL,       -- Total de la factura
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

-- Creamos la entidad Productos
CREATE TABLE Productos (
    producto_id INT PRIMARY KEY,         -- Llave primaria única para identificar el producto
    nombre VARCHAR(100) NOT NULL,        -- Nombre del producto
    stock INT NOT NULL,                  -- Cantidad en inventario
    precio DECIMAL(10, 2) NOT NULL       -- Precio del producto
);

-- Creamos la entidad DetallesFacturas para asociar productos con facturas
CREATE TABLE DetallesFacturas (
    detalle_id INT PRIMARY KEY,          -- Llave primaria única para cada detalle de factura
    factura_id INT,                      -- Llave foránea que referencia a Facturas
    producto_id INT,                     -- Llave foránea que referencia a Productos
    cantidad INT NOT NULL,               -- Cantidad de productos en la factura
    subtotal DECIMAL(10, 2) NOT NULL,    -- Subtotal calculado para cada línea de la factura
    FOREIGN KEY (factura_id) REFERENCES Facturas(factura_id),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);

-- Ejemplo de inserciones en las tablas diseñadas
INSERT INTO Clientes (cliente_id, nombre, direccion) 
VALUES (1, 'Ana Gomez', 'Calle 123, Ciudad A');

INSERT INTO Productos (producto_id, nombre, stock, precio)
VALUES (1, 'Laptop', 15, 1200.00);

INSERT INTO Facturas (factura_id, cliente_id, fecha, total) 
VALUES (1, 1, '2024-10-19', 2400.00);

INSERT INTO DetallesFacturas (detalle_id, factura_id, producto_id, cantidad, subtotal)
VALUES (1, 1, 1, 2, 2400.00);
