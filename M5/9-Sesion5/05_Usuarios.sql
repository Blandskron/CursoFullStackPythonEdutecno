-- Creación de un rol para el usuario de solo lectura
CREATE ROLE usuario_lectura;

-- Concede permiso de solo lectura en la tabla 'clientes'
GRANT SELECT ON clientes TO usuario_lectura;

-- Retira el permiso de acceso
REVOKE SELECT ON clientes FROM usuario_lectura;
