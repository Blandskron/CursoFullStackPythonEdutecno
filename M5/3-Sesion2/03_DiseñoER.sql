-- ================================================
-- DISEÑO DEL MODELO ENTIDAD-RELACIÓN (ER)
-- ================================================
-- Este archivo explica el diseño de un modelo ER. Relaciona entidades usando llaves foráneas.

-- La tabla Clientes representa a los usuarios que hacen pedidos.
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY,          -- Identificador único
    nombre VARCHAR(100) NOT NULL,        -- Nombre del cliente
    email VARCHAR(100) UNIQUE NOT NULL   -- Email único
);

-- La tabla Productos almacena los productos ofrecidos.
CREATE TABLE Productos (
    producto_id INT PRIMARY KEY,         -- Identificador único
    nombre VARCHAR(100) NOT NULL,        -- Nombre del producto
    precio DECIMAL(10, 2) NOT NULL       -- Precio del producto
);

-- La tabla Pedidos almacena la información de los pedidos realizados por los clientes.
CREATE TABLE Pedidos (
    pedido_id INT PRIMARY KEY,           -- Identificador único
    cliente_id INT,                      -- Llave foránea para Clientes
    fecha DATE NOT NULL,                 -- Fecha del pedido
    total DECIMAL(10, 2) NOT NULL,       -- Total del pedido
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

-- La tabla DetallesPedidos describe cada producto en cada pedido.
CREATE TABLE DetallesPedidos (
    detalle_id INT PRIMARY KEY,          -- Identificador único
    pedido_id INT,                       -- Llave foránea para Pedidos
    producto_id INT,                     -- Llave foránea para Productos
    cantidad INT NOT NULL,               -- Cantidad del producto en el pedido
    subtotal DECIMAL(10, 2) NOT NULL,    -- Subtotal para esa línea de productos
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);

-- Ejemplo de inserción de datos
INSERT INTO Clientes (cliente_id, nombre, email) 
VALUES (2, 'Carlos', 'carlos@email.com');

INSERT INTO Productos (producto_id, nombre, precio)
VALUES (2, 'Teclado', 50.00);

INSERT INTO Pedidos (pedido_id, cliente_id, fecha, total) 
VALUES (2, 2, '2024-10-19', 50.00);

INSERT INTO DetallesPedidos (detalle_id, pedido_id, producto_id, cantidad, subtotal)
VALUES (2, 2, 2, 1, 50.00);
