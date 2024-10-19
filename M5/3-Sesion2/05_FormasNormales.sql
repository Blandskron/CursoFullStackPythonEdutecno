-- ================================================
-- FORMAS NORMALES
-- ================================================
-- Este archivo cubre las diferentes formas normales para asegurar la integridad de los datos.

-- Primer Forma Normal (1NF): Cada valor en la tabla es atómico.
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY,          -- Llave primaria
    nombre VARCHAR(100) NOT NULL,        -- Nombre del cliente
    email VARCHAR(100) UNIQUE NOT NULL   -- Email único, valor atómico
);

-- Segunda Forma Normal (2NF): Todos los atributos no clave dependen completamente de la clave primaria.
CREATE TABLE DetallesPedidos (
    detalle_id INT PRIMARY KEY,          -- Llave primaria
    pedido_id INT,                       -- Llave foránea para Pedidos
    producto_id INT,                     -- Llave foránea para Productos
    cantidad INT NOT NULL,               -- Depende totalmente de la combinación de pedido_id y producto_id
    subtotal DECIMAL(10, 2) NOT NULL,    -- Subtotal depende de cantidad y producto
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);

-- Ejemplo de datos que cumplen 1NF y 2NF
INSERT INTO Clientes (cliente_id, nombre, email) 
VALUES (3, 'Luis', 'luis@email.com');

INSERT INTO DetallesPedidos (detalle_id, pedido_id, producto_id, cantidad, subtotal)
VALUES (3, 1, 2, 2, 50.00);
