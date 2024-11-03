-- Crear un esquema para gestionar una base de datos de una agencia de viajes
CREATE SCHEMA agencia_viajes;

-- Crear una tabla de clientes con diferentes tipos de datos y configurar la clave primaria
CREATE TABLE agencia_viajes.clientes (
    cliente_id SERIAL PRIMARY KEY, -- Identificador único y automático para cada cliente
    nombre VARCHAR(100) NOT NULL, -- Nombre del cliente
    correo VARCHAR(100) UNIQUE NOT NULL, -- Correo único para cada cliente
    telefono CHAR(10), -- Teléfono con longitud fija de 10 caracteres
    direccion TEXT -- Dirección del cliente
);

-- Crear una tabla de destinos con información detallada
CREATE TABLE agencia_viajes.destinos (
    destino_id SERIAL PRIMARY KEY, -- Identificador único y automático para cada destino
    ciudad VARCHAR(100) NOT NULL, -- Nombre de la ciudad destino
    pais VARCHAR(100) NOT NULL, -- País del destino
    descripcion TEXT -- Descripción detallada del destino
);

-- Crear una tabla de reservas que vincula clientes y destinos, incluye fecha de salida y regreso
CREATE TABLE agencia_viajes.reservas (
    reserva_id SERIAL PRIMARY KEY, -- Identificador único para cada reserva
    cliente_id INT NOT NULL, -- Clave foránea referenciando al cliente
    destino_id INT NOT NULL, -- Clave foránea para referenciar al destino
    fecha_salida DATE NOT NULL, -- Fecha de salida
    fecha_regreso DATE NOT NULL, -- Fecha de regreso
    FOREIGN KEY (cliente_id) REFERENCES agencia_viajes.clientes (cliente_id), -- Relación con tabla clientes
    FOREIGN KEY (destino_id) REFERENCES agencia_viajes.destinos (destino_id) -- Relación con tabla destinos
);

-- Insertar algunos clientes en la tabla de clientes
INSERT INTO agencia_viajes.clientes (nombre, correo, telefono, direccion) VALUES
('Mariana López', 'mariana.lopez@correo.com', '1234567890', '356 Avenida del Sol'),
('Carlos Pérez', 'carlos.perez@correo.com', '0987654321', '789 Calle Luna');

-- Insertar destinos en la tabla de destinos
INSERT INTO agencia_viajes.destinos (ciudad, pais, descripcion) VALUES
('París', 'Francia', 'La ciudad de la luz y el amor, conocida por la Torre Eiffel'),
('Tokio', 'Japón', 'Un vibrante destino en Asia, conocido por su tecnología avanzada y rica cultura');

-- Registrar una reserva, vinculando clientes y destinos
INSERT INTO agencia_viajes.reservas (cliente_id, destino_id, fecha_salida, fecha_regreso) VALUES
(1, 1, '2023-12-01', '2023-12-10');

-- Consultar los detalles de reservas por cliente específico
SELECT c.nombre AS Cliente, d.ciudad AS Destino, r.fecha_salida AS FechaSalida, r.fecha_regreso AS FechaRegreso
FROM agencia_viajes.reservas r
JOIN agencia_viajes.clientes c ON r.cliente_id = c.cliente_id
JOIN agencia_viajes.destinos d ON r.destino_id = d.destino_id
WHERE c.nombre = 'Mariana López';

-- Actualizar las fechas de una reserva
UPDATE agencia_viajes.reservas SET fecha_salida = '2023-12-05', fecha_regreso = '2023-12-15' WHERE reserva_id = 1;

-- Borrar un destino, lo cual eliminará en cascada las reservas si configurado (requiere ON DELETE CASCADE)
ALTER TABLE agencia_viajes.reservas DROP CONSTRAINT reservas_destino_id_fkey;
ALTER TABLE agencia_viajes.reservas ADD CONSTRAINT reservas_destino_id_fkey FOREIGN KEY (destino_id) REFERENCES agencia_viajes.destinos (destino_id) ON DELETE CASCADE;
DELETE FROM agencia_viajes.destinos WHERE destino_id = 2;

-- Crear un índice para acelerar búsquedas en la tabla de destinos
CREATE INDEX idx_destino_ciudad ON agencia_viajes.destinos (ciudad);

-- Crear un usuario con permisos específicos
CREATE USER agente WITH PASSWORD 'SecurePass2023';

-- Conceder permisos específicos al usuario para leer datos de clientes y destinos
GRANT SELECT ON agencia_viajes.clientes TO agente;
GRANT SELECT ON agencia_viajes.destinos TO agente;

-- Crear un rol para la gestión de reservas
CREATE ROLE gestion_reservas;

-- Conceder privilegios de inserción y actualización a la tabla de reservas al rol de gestión
GRANT INSERT, UPDATE ON agencia_viajes.reservas TO gestion_reservas;

-- Eliminar esquema junto con todas las tablas del esquema
DROP SCHEMA IF EXISTS agencia_viajes CASCADE;