BEGIN;

-- Insertar datos
INSERT INTO clientes (nombre, apellido, correo) VALUES ('Carlos', 'Lopez', 'carlos.lopez@example.com');

-- Confirma los cambios realizados
COMMIT;

-- Si hay algún error y necesitamos deshacer los cambios desde el último COMMIT
ROLLBACK;
