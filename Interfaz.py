import os
import sys
import Funciones


def interfazdepersonal():
    while True:
        print("Seleccione una opción:")
        print("1. Agregar cliente")
        print("2. Agregar pedido")
        print("0. Salir")

        opcion = input()

        if opcion == "1":
            Resultado = Funciones.agregar_cliente()
        elif opcion == "2":
            Resultado = Funciones.agregar_pedido()

        elif opcion == "0":
            os.system('cls')
            print("saliendo del programa")
            print("\U0001F47A")
            sys.exit(0)
        else:
            print("Opción inválida")
