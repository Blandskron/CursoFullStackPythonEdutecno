-- Archivo: banco_auditoria.sql
-- Base de datos: Banco con Trigger de Auditoría para Cambios en el Balance

-- Crear la base de datos
CREATE DATABASE banco;
\c banco;  -- Conectar a la base de datos banco

-- Tabla cuentas para gestionar los balances de cada cuenta en el banco
CREATE TABLE cuentas (
    cuenta_id SERIAL PRIMARY KEY,
    titular VARCHAR(100) NOT NULL,
    balance NUMERIC(15, 2) CHECK (balance >= 0)
);

-- Tabla auditoria_cuentas para registrar cambios en los balances
CREATE TABLE auditoria_cuentas (
    auditoria_id SERIAL PRIMARY KEY,
    cuenta_id INT NOT NULL,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    balance_anterior NUMERIC(15, 2),
    balance_nuevo NUMERIC(15, 2)
);

-- Insertar algunas cuentas en la tabla cuentas
INSERT INTO cuentas (titular, balance) VALUES
('Juan Perez', 1000.00),
('Maria Lopez', 2500.00),
('Carlos Sanchez', 1500.00);

-- Crear la función para registrar cambios en el balance de cuentas
CREATE OR REPLACE FUNCTION registrar_cambio_balance()
RETURNS TRIGGER AS $$
BEGIN
    -- Insertar un registro en auditoría cuando el balance cambia
    INSERT INTO auditoria_cuentas (cuenta_id, balance_anterior, balance_nuevo)
    VALUES (OLD.cuenta_id, OLD.balance, NEW.balance);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear el trigger para activar la función antes de actualizar el balance en la tabla cuentas
CREATE TRIGGER trigger_cambio_balance
BEFORE UPDATE OF balance ON cuentas
FOR EACH ROW
EXECUTE FUNCTION registrar_cambio_balance();

-- Prueba del trigger: actualizar el balance de una cuenta
UPDATE cuentas SET balance = 1200.00 WHERE cuenta_id = 1;

-- Verificar la tabla de auditoría para confirmar el registro del cambio
SELECT * FROM auditoria_cuentas;
