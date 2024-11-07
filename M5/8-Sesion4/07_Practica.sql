-- EXERCISE 1: CREANDO SENTENCIAS DDL
-- Crear tablas "Menus" y "Platos" con restricciones y valores por defecto

CREATE TABLE Menus (
    menu_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    activo BOOLEAN DEFAULT TRUE
);

CREATE TABLE Platos (
    plato_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) CHECK (precio > 0),
    menu_id INT,
    FOREIGN KEY (menu_id) REFERENCES Menus(menu_id) ON DELETE SET NULL
);

-- Crear tablas adicionales para Clientes y Empleados
CREATE TABLE Clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) UNIQUE,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Empleados (
    empleado_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    posicion VARCHAR(50) NOT NULL,
    salario DECIMAL(10, 2) CHECK (salario > 0),
    fecha_contratacion DATE DEFAULT CURRENT_DATE
);

-- Crear tabla Pedidos que relacione clientes y empleados
CREATE TABLE Pedidos (
    pedido_id SERIAL PRIMARY KEY,
    cliente_id INT,
    empleado_id INT,
    fecha_pedido DATE DEFAULT CURRENT_DATE,
    hora_pedido TIME NOT NULL,
    total DECIMAL(10, 2) CHECK (total >= 0),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id) ON DELETE CASCADE,
    FOREIGN KEY (empleado_id) REFERENCES Empleados(empleado_id) ON DELETE SET NULL
);

-- Crear tabla Detalle_Pedidos para registrar platos pedidos
CREATE TABLE Detalle_Pedidos (
    detalle_id SERIAL PRIMARY KEY,
    pedido_id INT,
    plato_id INT,
    cantidad INT CHECK (cantidad > 0),
    subtotal DECIMAL(10, 2) CHECK (subtotal >= 0),
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id) ON DELETE CASCADE,
    FOREIGN KEY (plato_id) REFERENCES Platos(plato_id) ON DELETE CASCADE
);

-- Alterar la tabla Empleados para agregar una columna de turno
ALTER TABLE Empleados ADD COLUMN turno VARCHAR(10) DEFAULT 'Diurno';

-- Renombrar la columna "turno" a "horario" en la tabla Empleados
ALTER TABLE Empleados RENAME COLUMN turno TO horario;

-- EXERCISE 2: PASANDO DE UN MODELO RELACIONAL A UNO FÍSICO
-- Crear relaciones adicionales y añadir restricciones en las tablas de Pedidos y Detalle_Pedidos

-- Asegurar que cada cliente pueda tener solo un pedido activo en el mismo día
ALTER TABLE Pedidos
ADD CONSTRAINT pedido_unico_por_dia UNIQUE (cliente_id, fecha_pedido);

-- Limitar el número máximo de platos en un solo pedido a 10
ALTER TABLE Detalle_Pedidos
ADD CONSTRAINT max_platos_por_pedido CHECK (
    (SELECT COUNT(*) FROM Detalle_Pedidos WHERE pedido_id = Detalle_Pedidos.pedido_id) <= 10
);

-- Desactivar temporalmente la restricción de unicidad en pedidos
ALTER TABLE Pedidos DISABLE CONSTRAINT pedido_unico_por_dia;

-- Reactivar la restricción
ALTER TABLE Pedidos ENABLE CONSTRAINT pedido_unico_por_dia;

-- EXERCISE 3: CREANDO SENTENCIAS DML
-- Insertar datos en las tablas Menus, Platos, y Clientes

INSERT INTO Menus (nombre, descripcion, fecha_inicio, fecha_fin)
VALUES 
    ('Menu Desayuno', 'Opciones de desayuno disponibles', '2024-01-01', '2024-12-31'),
    ('Menu Cena', 'Opciones de cena disponibles', '2024-01-01', '2024-12-31');

INSERT INTO Platos (nombre, precio, menu_id)
VALUES 
    ('Tostadas con Aguacate', 5.50, 1),
    ('Panqueques con Miel', 6.00, 1),
    ('Pasta Alfredo', 12.50, 2),
    ('Salmón a la Parrilla', 20.00, 2);

INSERT INTO Clientes (nombre, telefono, email)
VALUES 
    ('Carlos Rodríguez', '+123456789', 'carlos.rod@example.com'),
    ('Lucia Fernández', '+987654321', 'lucia.fern@example.com');

-- Insertar datos en la tabla Empleados
INSERT INTO Empleados (nombre, posicion, salario)
VALUES 
    ('María López', 'Camarera', 1800),
    ('Juan Martínez', 'Chef', 2500);

-- Registrar pedidos de clientes
INSERT INTO Pedidos (cliente_id, empleado_id, hora_pedido, total)
VALUES 
    (1, 1, '08:30:00', 11.50),
    (2, 2, '20:00:00', 32.50);

-- Insertar detalles de platos en los pedidos
INSERT INTO Detalle_Pedidos (pedido_id, plato_id, cantidad, subtotal)
VALUES 
    (1, 1, 2, 11.00),  -- 2 Tostadas con Aguacate
    (2, 3, 1, 12.50),  -- 1 Pasta Alfredo
    (2, 4, 1, 20.00);  -- 1 Salmón a la Parrilla

-- Modificar el salario de un empleado en la tabla Empleados
UPDATE Empleados
SET salario = salario * 1.10  -- Aumento de 10%
WHERE nombre = 'María López';

-- Eliminar un plato específico de la tabla Platos
DELETE FROM Platos
WHERE nombre = 'Panqueques con Miel';

-- Ejemplo de uso de condicional CASE para clasificar platos según su precio
SELECT nombre, precio,
    CASE 
        WHEN precio < 10 THEN 'Económico'
        WHEN precio BETWEEN 10 AND 20 THEN 'Moderado'
        ELSE 'Costoso'
    END AS categoria_precio
FROM Platos;

-- Crear una vista para mostrar el historial de pedidos y detalles de cada cliente
CREATE VIEW Historial_Pedidos AS
SELECT c.nombre AS cliente, e.nombre AS empleado, p.fecha_pedido, p.hora_pedido, pl.nombre AS plato, dp.cantidad, dp.subtotal
FROM Clientes c
JOIN Pedidos p ON c.cliente_id = p.cliente_id
JOIN Empleados e ON p.empleado_id = e.empleado_id
JOIN Detalle_Pedidos dp ON p.pedido_id = dp.pedido_id
JOIN Platos pl ON dp.plato_id = pl.plato_id;

-- Consultar la vista Historial_Pedidos
SELECT * FROM Historial_Pedidos;

-- Ejemplo de eliminación de la tabla Detalle_Pedidos para finalizar
DROP TABLE IF EXISTS Detalle_Pedidos CASCADE;
