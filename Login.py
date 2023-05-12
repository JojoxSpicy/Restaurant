import os
import mysql.connector
import Interfaz

# coneccion con la base de datos
conn = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="Siempresemeolvida1",
    database="Restaurant"
)

cursor = conn.cursor()


def login_personal():
    print("Ingresar como Personal")
    usuario = input("Nombre de usuario: ")
    contrasena = input("Contraseña: ")
    ID_Personal = input("ID_Personal: ")
    # Comprobar si el usuario y contraseña coinciden en la base de datos
    cursor.execute(
        "SELECT * FROM Personal WHERE Nombre = %s AND Contrasena = %s And ID_Personal = %s", (usuario, contrasena, ID_Personal))
    result = cursor.fetchone()
    if result:
        print("Inicio de sesión exitoso como Personal")
        # Aquí puedes agregar la lógica adicional para el Personal
        resultado = Interfaz.interfazdepersonal()
    else:
        print("Credenciales inválidas")
        os.system('cls')
