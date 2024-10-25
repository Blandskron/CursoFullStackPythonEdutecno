CREATE TABLE Trabajadores (
    trabajador_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    sueldo DECIMAL(10, 2),
    cargo VARCHAR(100)
);

CREATE TABLE Menu (
    menu_id INT PRIMARY KEY,
    nombre_menu VARCHAR(200) UNIQUE,
    precio DECIMAL(10, 2)
);

CREATE TABLE Cliente (
    cliente_id INT PRIMARY KEY,
    nombre_cliente VARCHAR(100),
    apellido_cliente VARCHAR(100)
);

CREATE TABLE Pedido (
    pedido_id INT PRIMARY KEY,
    cliente_id INT,
    trabajador_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id),
    FOREIGN KEY (trabajador_id) REFERENCES Trabajadores(trabajador_id)
);

CREATE TABLE DetallePedido (
    detalle_pedido_id INT PRIMARY KEY,
    pedido_id INT,
    menu_id INT,
    cantidad INT,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id),
    FOREIGN KEY (menu_id) REFERENCES Menu(menu_id)
);

INSERT INTO Trabajadores (trabajador_id, nombre, apellido, sueldo, cargo) VALUES
(1, 'Juan', 'Pérez', 1500, 'Camarero'),
(2, 'Ana', 'García', 1800, 'Chef'),
(3, 'Luis', 'Rodríguez', 1600, 'Bartender');

INSERT INTO Menu (menu_id, nombre_menu, precio) VALUES
(1, 'Hamburguesa', 500),
(2, 'Pizza', 700),
(3, 'Ensalada', 450);

INSERT INTO Cliente (cliente_id, nombre_cliente, apellido_cliente) VALUES
(1, 'Carlos', 'Lopez'),
(2, 'Marta', 'Fernandez'),
(3, 'Jose', 'Martinez');

INSERT INTO Pedido (pedido_id, cliente_id, trabajador_id) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3);

INSERT INTO DetallePedido (detalle_pedido_id, pedido_id, menu_id, cantidad) VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 1),
(4, 3, 1, 1);



SELECT CL.nombre_cliente, MN.nombre_menu
FROM pedido PD
JOIN cliente CL ON PD.cliente_id = CL.cliente_id
JOIN detallepedido DP ON PD.cliente_id = DP.menu_id
JOIN menu MN ON DP.menu_id = MN.menu_id

SELECT * FROM cliente
SELECT * FROM detallepedido
SELECT * FROM menu
SELECT * FROM pedido