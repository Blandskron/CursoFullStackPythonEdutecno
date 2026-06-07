# Módulo 5: Bases de Datos Relacionales y SQL

Este módulo introduce a los estudiantes en el diseño, administración y consumo de bases de datos relacionales robustas utilizando SQL. Cubre desde el modelado lógico de datos (diagramación y normalización) hasta técnicas avanzadas como triggers, transacciones seguras y el consumo de bases de datos desde scripts backend de Python.

---

## 📌 Temario y Contenido Clave

### 1. Modelado de Datos y Normalización (Sesiones 1 - 3)
- **Modelado Entidad-Relación (DER)**: Definición de Entidades, Atributos, Claves Primarias (PK) y Foráneas (FK) y relaciones (1:1, 1:N, N:M).
- **Normalización**: Proceso sistemático para minimizar la redundancia de datos y prevenir anomalías de inserción, actualización y borrado:
  - **Primera Forma Normal (1FN)**: Datos atómicos y ausencia de grupos repetidos.
  - **Segunda Forma Normal (2FN)**: Cumple 1FN y todos los atributos no-clave tienen dependencia funcional completa de la PK.
  - **Tercera Forma Normal (3FN)**: Cumple 2FN y no existen dependencias transitivas entre columnas no-clave.

### 2. Lenguaje de Definición y Manipulación (DDL y DML) (Sesiones 4 - 6)
- **DDL (Data Definition Language)**:
  - `CREATE TABLE`: Definición de tablas y sus restricciones (`NOT NULL`, `UNIQUE`, `CHECK`, `DEFAULT`).
  - `ALTER TABLE`: Modificación de la estructura existente de tablas.
- **DML (Data Manipulation Language)**:
  - `INSERT INTO`: Registro de datos.
  - `UPDATE ... SET`: Modificación de registros existentes.
  - `DELETE FROM`: Eliminación de registros.
- **Consultas Avanzadas y JOINs**: Extracción inteligente de datos uniendo múltiples tablas:
  - `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `CROSS JOIN`.
  - Operaciones de conjuntos: `UNION`, `INTERSECT`, `EXCEPT`.

### 3. Transacciones y Control de Acceso (Sesión 5)
- **Propiedades ACID**: Atomicidad, Consistencia, Aislamiento (Isolation) y Durabilidad.
- **Sentencias**:
  - `BEGIN TRANSACTION`: Inicia una transacción.
  - `COMMIT`: Guarda de forma permanente los cambios realizados.
  - `ROLLBACK`: Revierte todos los cambios de la transacción actual en caso de error.
  - `SAVEPOINT`: Define puntos de restauración intermedios dentro de una misma transacción.

### 4. Funciones de Agregación y Secuencias (Sesiones 5 - 6)
- **Agrupamientos**: Uso de `SUM()`, `AVG()`, `COUNT()`, `MIN()` y `MAX()` junto a la cláusula `GROUP BY`.
- Cláusula `HAVING` para filtrar los resultados de las funciones de agregación agrupadas (equivalente al `WHERE` pero para grupos).

### 5. Disparadores (Triggers) y Auditoría (Sesión 7)
- Creación de funciones disparadoras que ejecutan lógica automática antes o después de operaciones `INSERT`, `UPDATE` o `DELETE`.
- Implementación de **tablas de auditoría** para guardar logs históricos de modificaciones de precios, stock, accesos de usuarios, etc.

---

## 🔌 Conexión Python-PostgreSQL (psycopg2)

El curso demuestra cómo integrar el backend en Python con una base de datos relacional PostgreSQL. En el archivo `M5/13-Sesion7/tienda.py` se ilustra la estructura típica:

```python
import psycopg2
from psycopg2 import sql

def actualizar_precio_producto(producto_id, nuevo_precio):
    conexion = None
    try:
        # 1. Establecer la conexión con el servidor de Base de Datos
        conexion = psycopg2.connect(
            dbname="Tienda",
            user="postgres",
            password="tu_password",
            host="localhost",
            port="5432"
        )
        cursor = conexion.cursor()

        # 2. Definir y ejecutar la consulta usando placeholders para evitar inyección SQL
        query = sql.SQL("""
            UPDATE productos 
            SET precio = %s 
            WHERE producto_id = %s
        """)
        cursor.execute(query, (nuevo_precio, producto_id))
        
        # 3. Confirmar la transacción (COMMIT)
        conexion.commit()
        print("El precio del producto ha sido actualizado de forma segura.")
    
    except Exception as e:
        print("Ocurrió un error en la transacción:", e)
        # En caso de error, el conector revierte cambios si no se confirmó.
    
    finally:
        # 4. Liberar recursos cerrando cursor y conexión
        if conexion:
            cursor.close()
            conexion.close()
```
