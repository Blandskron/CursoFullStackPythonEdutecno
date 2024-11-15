import psycopg2
from psycopg2 import sql

def actualizar_precio_producto(producto_id, nuevo_precio):
    try:
        # Conexión a la base de datos
        conexion = psycopg2.connect(
            dbname="Tienda",
            user="postgres",
            password="admin1234",
            host="localhost",
            port="5432"
        )
        cursor = conexion.cursor()

        # Comando SQL con placeholders
        query = sql.SQL("""
            UPDATE productos 
            SET precio = %s 
            WHERE producto_id = %s
        """)
        # UPDATE productos SET stock = 50 WHERE producto_id = 1;
        # Ejecutar el comando con los valores proporcionados
        cursor.execute(query, (nuevo_precio, producto_id))
        
        # Confirmar los cambios
        conexion.commit()

        print(f"El precio del producto con ID {producto_id} ha sido actualizado a {nuevo_precio:.2f}")
    
    except Exception as e:
        print("Ocurrió un error al actualizar el precio:", e)
    
    finally:
        # Cerrar la conexión
        if conexion:
            cursor.close()
            conexion.close()

# Ejemplo de ejecución
if __name__ == "__main__":
    print("Venta de productos")
    producto_id = int(input("Ingrese el ID del producto: "))
    nuevo_precio = float(input("Ingrese el nuevo precio (descuento aplicado si corresponde): "))
    
    actualizar_precio_producto(producto_id, nuevo_precio)
