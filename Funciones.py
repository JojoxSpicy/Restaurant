import mysql.connector
# coneccion con la base de datos
conn = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="Siempresemeolvida1",
    database="Restaurant"
)

cursor = conn.cursor()

# Función para agregar un nuevo pedido


def agregar_pedido():
    # Solicitar información del pedido
    id_cliente = int(input("Ingrese el ID del cliente: "))
    fecha = input("Ingrese la fecha del pedido (YYYY-MM-DD): ")
    total = float(input("Ingrese el total del pedido: "))

    # Insertar los datos en la tabla "pedidos"
    consulta = "INSERT INTO pedidos (id_cliente, fecha, total) VALUES (%s, %s, %s)"
    datos = (id_cliente, fecha, total)
    cursor.execute(consulta, datos)

    print("Pedido agregado correctamente")

# Función para agregar un nuevo cliente


def agregar_cliente():
    # Solicitar información del cliente
    nombre = input("Ingrese el nombre del cliente: ")
    telefono = input("Ingrese el teléfono del cliente: ")
    email = input("Ingrese el correo electrónico del cliente: ")

    # Insertar los datos en la tabla "clientes"
    consulta = "INSERT INTO clientes (nombre, telefono, email) VALUES (%s, %s, %s)"
    datos = (nombre, telefono, email)
    cursor.execute(consulta, datos)

    print("Cliente agregado correctamente")
