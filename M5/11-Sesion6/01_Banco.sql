-- Archivo: banco_transacciones.sql
-- Base de datos: Banco

-- Crear base de datos
CREATE DATABASE banco;
\c banco;  -- Conectar a la base de datos banco

-- Tabla clientes
CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(50) UNIQUE
);

-- Tabla cuentas
CREATE TABLE cuentas (
    cuenta_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(cliente_id),
    tipo_cuenta VARCHAR(20) CHECK (tipo_cuenta IN ('Ahorro', 'Corriente')),
    saldo NUMERIC(12, 2) DEFAULT 0 CHECK (saldo >= 0)
);

-- Tabla transacciones
CREATE TABLE transacciones (
    transaccion_id SERIAL PRIMARY KEY,
    cuenta_id INT REFERENCES cuentas(cuenta_id),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    monto NUMERIC(10, 2) CHECK (monto <> 0),
    tipo_transaccion VARCHAR(20) CHECK (tipo_transaccion IN ('Depósito', 'Retiro'))
);

-- Insertar datos de ejemplo
INSERT INTO clientes (nombre, apellido, correo) VALUES 
    ('Juan', 'Pérez', 'juan.perez@example.com'),
    ('Ana', 'García', 'ana.garcia@example.com');

INSERT INTO cuentas (cliente_id, tipo_cuenta, saldo) VALUES 
    (1, 'Ahorro', 5000.00),
    (2, 'Corriente', 10000.00);

-- Transacción para realizar un depósito
BEGIN;  -- Inicia la transacción

-- Inserta una transacción de depósito
INSERT INTO transacciones (cuenta_id, monto, tipo_transaccion) VALUES (1, 1000.00, 'Depósito');

-- Actualiza el saldo de la cuenta
UPDATE cuentas
SET saldo = saldo + 1000.00
WHERE cuenta_id = 1;

COMMIT;  -- Confirma la transacción para aplicar los cambios

-- Transacción para realizar un retiro
BEGIN;

-- Retirar solo si hay suficiente saldo
UPDATE cuentas
SET saldo = saldo - 500.00
WHERE cuenta_id = 2 AND saldo >= 500.00;

-- Registrar la transacción de retiro solo si el saldo era suficiente
INSERT INTO transacciones (cuenta_id, monto, tipo_transaccion)
SELECT 2, -500.00, 'Retiro'
FROM cuentas
WHERE cuenta_id = 2 AND saldo >= 0;

-- Verificar si se registró la transacción (si no, revertir)
ROLLBACK WHEN NOT EXISTS (
    SELECT 1
    FROM transacciones
    WHERE cuenta_id = 2 AND monto = -500.00
);

COMMIT;

-- Usando SAVEPOINT para un punto de retorno en caso de error
BEGIN;

-- Crear un cliente y un punto de retorno
INSERT INTO clientes (nombre, apellido, correo) VALUES ('Carlos', 'Lopez', 'carlos.lopez@example.com');
SAVEPOINT sp_cliente;

-- Intentar agregar una cuenta con un saldo inicial inválido
INSERT INTO cuentas (cliente_id, tipo_cuenta, saldo) 
SELECT cliente_id, 'Corriente', -100.00
FROM clientes
WHERE correo = 'carlos.lopez@example.com';

-- Si ocurre un error, revertir al último SAVEPOINT
ROLLBACK TO sp_cliente;

COMMIT;

-- CONTROL DE ACCESO CON DCL

-- Crear rol para gerente con permisos completos
CREATE ROLE gerente;

-- Otorgar permisos para administrar clientes y cuentas
GRANT SELECT, INSERT, UPDATE, DELETE ON clientes TO gerente;
GRANT SELECT, INSERT, UPDATE, DELETE ON cuentas TO gerente;

-- Crear rol para cajero con permisos limitados
CREATE ROLE cajero;

-- Otorgar permisos de solo lectura para clientes y solo insertar transacciones
GRANT SELECT ON clientes TO cajero;
GRANT SELECT, INSERT ON transacciones TO cajero;

-- Ejemplo de revocar permisos
REVOKE INSERT ON cuentas FROM cajero;

-- Transacción para transferir fondos entre cuentas
BEGIN;

-- Retirar de la cuenta origen (solo si hay suficiente saldo)
UPDATE cuentas
SET saldo = saldo - 200.00
WHERE cuenta_id = 1 AND saldo >= 200.00;

-- Registrar la transacción de retiro
INSERT INTO transacciones (cuenta_id, monto, tipo_transaccion)
SELECT 1, -200.00, 'Retiro'
FROM cuentas
WHERE cuenta_id = 1 AND saldo >= 0;

-- Depositar en la cuenta destino
UPDATE cuentas
SET saldo = saldo + 200.00
WHERE cuenta_id = 2;

-- Registrar la transacción de depósito
INSERT INTO transacciones (cuenta_id, monto, tipo_transaccion)
SELECT 2, 200.00, 'Depósito'
FROM cuentas
WHERE cuenta_id = 1 AND saldo >= 0;

COMMIT;

-- INTEGRIDAD REFERENCIAL

-- Asegurar que cada cuenta está vinculada a un cliente existente
ALTER TABLE cuentas
ADD CONSTRAINT fk_cliente
FOREIGN KEY (cliente_id)
REFERENCES clientes(cliente_id)
ON DELETE CASCADE;

-- CONSULTAS ADICIONALES PARA GESTION DE DATOS

-- Consultar el saldo total de todas las cuentas
SELECT SUM(saldo) AS saldo_total FROM cuentas;

-- Consultar el historial de transacciones por cuenta
SELECT c.cuenta_id, t.fecha, t.monto, t.tipo_transaccion
FROM cuentas c
JOIN transacciones t ON c.cuenta_id = t.cuenta_id
ORDER BY t.fecha DESC;

-- Consultar el número de transacciones por cliente
SELECT cl.nombre, cl.apellido, COUNT(t.transaccion_id) AS total_transacciones
FROM clientes cl
JOIN cuentas c ON cl.cliente_id = c.cliente_id
JOIN transacciones t ON c.cuenta_id = t.cuenta_id
GROUP BY cl.nombre, cl.apellido;

-- Final del archivo SQL para banco
