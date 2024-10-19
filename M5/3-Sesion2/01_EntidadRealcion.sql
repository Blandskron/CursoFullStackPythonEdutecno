-- ================================================
-- MODELO ENTIDAD-RELACIÓN (ER)
-- ================================================
-- Un modelo ER describe la estructura lógica de la base de datos usando entidades, relaciones y atributos.
-- Definimos entidades como "Clientes", "Productos" y "Pedidos", y sus relaciones.

-- Creamos la entidad Clientes
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY,          -- Llave primaria, identificador único para cada cliente
    nombre VARCHAR(100) NOT NULL,        -- Nombre del cliente
    apellido VARCHAR(100) NOT NULL,      -- Apellido del cliente
    email VARCHAR(100) UNIQUE NOT NULL   -- Correo electrónico del cliente, único
);

-- Creamos la entidad Productos
CREATE TABLE Productos (
    producto_id INT PRIMARY KEY,         -- Llave primaria, identificador único para cada producto
    nombre VARCHAR(100) NOT NULL,        -- Nombre del producto
    precio DECIMAL(10, 2) NOT NULL       -- Precio del producto
);

-- Creamos la entidad Pedidos, que tiene una relación con Clientes y Productos
CREATE TABLE Pedidos (
    pedido_id INT PRIMARY KEY,           -- Llave primaria, identificador único para cada pedido
    fecha DATE NOT NULL,                 -- Fecha del pedido
    cliente_id INT,                      -- Llave foránea que referencia a la entidad Clientes
    total DECIMAL(10, 2) NOT NULL,       -- Total del pedido
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

-- Creamos la entidad DetallesPedidos para la relación entre Pedidos y Productos
CREATE TABLE DetallesPedidos (
    detalle_id INT PRIMARY KEY,          -- Llave primaria, identificador único para cada detalle de pedido
    pedido_id INT,                       -- Llave foránea que referencia a Pedidos
    producto_id INT,                     -- Llave foránea que referencia a Productos
    cantidad INT NOT NULL,               -- Cantidad de productos en el pedido
    subtotal DECIMAL(10, 2) NOT NULL,    -- Subtotal para esa línea del pedido
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);

-- ================================================
-- DISEÑO DEL MODELO ENTIDAD-RELACIÓN (ER)
-- ================================================
-- El diseño anterior refleja la relación de uno a muchos entre Clientes y Pedidos, y muchos a muchos entre Pedidos y Productos.

-- Ejemplo de inserciones de datos en las tablas diseñadas.
INSERT INTO Clientes (cliente_id, nombre, apellido, email) 
VALUES (1, 'Juan', 'Perez', 'juan.perez@email.com'),
       (2, 'Ana', 'Gomez', 'ana.gomez@email.com');

INSERT INTO Productos (producto_id, nombre, precio)
VALUES (1, 'Laptop', 1000.00),
       (2, 'Mouse', 25.50),
       (3, 'Teclado', 45.00);

INSERT INTO Pedidos (pedido_id, fecha, cliente_id, total) 
VALUES (1, '2024-10-19', 1, 1070.50);

INSERT INTO DetallesPedidos (detalle_id, pedido_id, producto_id, cantidad, subtotal)
VALUES (1, 1, 1, 1, 1000.00),
       (2, 1, 2, 2, 51.00),
       (3, 1, 3, 1, 45.00);

-- ================================================
-- NORMALIZACIÓN
-- ================================================
-- Proceso de organizar los datos para minimizar la redundancia y asegurar la integridad de los datos.

-- A continuación aplicamos la normalización en las tablas Clientes y Productos.
-- Se asegura que no haya redundancia de datos innecesaria y se elimina la duplicación en las relaciones.

-- ================================================
-- FORMAS NORMALES
-- ================================================
-- Primer Forma Normal (1NF): Cada campo contiene un único valor atómico.
-- Ejemplo: tabla Clientes, donde cada campo como nombre y apellido contiene valores atómicos, no repetidos.

-- Segunda Forma Normal (2NF): Todos los atributos no clave dependen completamente de la clave primaria.
-- Ejemplo: en la tabla DetallesPedidos, la cantidad y subtotal dependen completamente de pedido_id y producto_id.

-- Tercera Forma Normal (3NF): Todos los atributos no clave son independientes entre sí, y solo dependen de la clave primaria.
-- Ejemplo: en la tabla Pedidos, total es dependiente solo de pedido_id, no de cliente_id o cualquier otro atributo.

-- ================================================
-- OPTIMIZACIÓN DEL MODELO
-- ================================================
-- Agregar índices para mejorar el rendimiento de consultas en tablas grandes.
-- Los índices aceleran las búsquedas, aunque pueden ralentizar las inserciones o actualizaciones.

-- Crear un índice en el campo email de la tabla Clientes, ya que las búsquedas por email pueden ser frecuentes.
CREATE INDEX idx_email_clientes ON Clientes(email);

-- Crear un índice compuesto en la tabla DetallesPedidos para mejorar las consultas sobre pedido_id y producto_id
CREATE INDEX idx_pedidos_productos ON DetallesPedidos(pedido_id, producto_id);

-- ================================================
-- CONSULTAS DE OPTIMIZACIÓN
-- ================================================
-- Consultar el total de pedidos realizados por cada cliente, optimizado con el índice en email.
SELECT C.nombre, C.apellido, COUNT(P.pedido_id) AS total_pedidos
FROM Clientes C
JOIN Pedidos P ON C.cliente_id = P.cliente_id
GROUP BY C.nombre, C.apellido;

-- Consultar todos los detalles de un pedido utilizando el índice compuesto
SELECT P.pedido_id, PR.nombre, DP.cantidad, DP.subtotal
FROM DetallesPedidos DP
JOIN Productos PR ON DP.producto_id = PR.producto_id
JOIN Pedidos P ON DP.pedido_id = P.pedido_id
WHERE P.pedido_id = 1;
