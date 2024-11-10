-- Crear una secuencia personalizada
CREATE SEQUENCE numero_factura_seq
    START 1000       -- Valor inicial
    INCREMENT BY 10  -- Valor de incremento
    MINVALUE 1000    -- Valor mínimo
    MAXVALUE 9999    -- Valor máximo
    CYCLE;           -- Reinicia cuando llega a MAXVALUE

-- Crear tabla ventas
CREATE TABLE ventas (
    venta_id SERIAL PRIMARY KEY,
    numero_factura INT DEFAULT nextval('numero_factura_seq'),  -- Usar la secuencia para esta columna
    cliente VARCHAR(50),
    monto NUMERIC(10, 2)
);

-- Insertar datos en la tabla ventas y generar el número de factura automáticamente
INSERT INTO ventas (cliente, monto) VALUES ('Cliente A', 150.00);
INSERT INTO ventas (cliente, monto) VALUES ('Cliente B', 250.00);

-- Consultar la tabla ventas
SELECT * FROM ventas;
