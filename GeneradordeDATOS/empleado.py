import pandas as pd 
import random as rd


## Este codigo es capaz de generar datos aleatorios tomando datos de un archivo excel y guardarlos en un archivo txt
# Inicialmente se importan las librerias necesarias para el funcionamiento del programa
# Pandas para la lectura del archivo excel
# Random para la generacion de datos aleatorios



## Empezando con el codigo un algoritmo para generar telefonos aleatorios

# Una lista con las ladas de los telefonos de mexico
# Una lista con los numeros del 0 al 9
# Una lista vacia para guardar los telefonos generados

lada = ["722", 
        "55",
        "33",
        "81",
        "656",
        "664",
        "686",
        "223",
        "229"]
numbers = ["1","2","3","4","5","6","7","8","9","0"]
numeroDetel = []



#Funcion para generar telefonos aleatorios
def generarTelefono():
    # Selecciona una lada aleatoria
    ladaSeleccionada = rd.choice(lada)
    # Crea un string con la lada seleccionada
    telefono = ladaSeleccionada + "" 
    # Si la lada seleccionada tiene 2 digitos se agregan 8 numeros aleatorios a la cadena del numero junto con la lada
    if len(ladaSeleccionada) == 2:
                numeroDetel.append(ladaSeleccionada)
                for i in range(8):
                    number = rd.choice(numbers)
                    telefono += number

    # Si la lada seleccionada tiene 3 digitos se agregan 7 numeros aleatorios a la cadena del numero junto con la lada
    elif len(ladaSeleccionada) == 3:
                numeroDetel.append(ladaSeleccionada)
                for i in range(7):
                    number = rd.choice(numbers)
                    telefono += number
    # Se regresa el numero generado
    return telefono 
        
# Se lee el archivo excel con pandas para extraer los datos
dataframe = pd.read_excel('Datos.xlsx')

# Se apuntan los datos de las columnas de excel a las variables
nombres = dataframe['Nombre']
apellidoPat = dataframe['Apellido']
apellidoMat = dataframe['Apellido']
ciudades = dataframe['Ciudad']
calle = dataframe['Calle']
empleo = dataframe['Empleos']

# Se crea una funcion para generar los datos aleatorios
def generarDatos():
    # Se generan numeros aleatorios para seleccionar un dato de la columna nombre 
    numero = rd.randint(0, len(nombres)-1)
    # Se generan numeros aleatorios para seleccionar un dato de la columna apellido
    numero2 = rd.randint(0, len(apellidoMat)-1)
    # Se generan numeros aleatorios para seleccionar un dato de la columna apellido
    numero6 = rd.randint(0, len(apellidoPat)-1)
    # Se generan numeros aleatorios para seleccionar un dato de la columna ciudad
    numero3 = rd.randint(0, len(ciudades)-1)

    numero4 = rd.randint(0, len(calle)-1)

    numero5 = rd.randint(0, len(empleo)-1)
    # Se llama a la funcion para generar un numero de telefono aleatorio
    numeroDetel = generarTelefono()
    # Se genera un numero aleatorio para la edad
    edad = rd.randint(18, 80)
    # Se regresan los datos generados
    return nombres[numero],apellidoPat[numero2], apellidoMat[numero6], ciudades[numero3], calle[numero4],  empleo[numero5], numeroDetel , str(edad)
 
# Se crea un archivo txt para guardar los datos generados 
# Se genera un ciclo for para generar n datos aleatorios y guardarlos en un archivo txt
with open('Datos.txt', 'w') as archivo:
    
    for i in range(1000000):
        # Se genera una cadena con los datos generados
        dato = " ".join(generarDatos())
        # Se guarda la cadena en el archivo txt
        archivo.write(dato + "\n")



