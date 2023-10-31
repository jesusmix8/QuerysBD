import pandas as pd 
import random as rd



        
# Se lee el archivo excel con pandas para extraer los datos
dataframe = pd.read_excel('Datos.xlsx')

# Se apuntan los datos de las columnas de excel a las variables

ciudad = dataframe['Ciudad']
colonia = dataframe['Colonia']
municipio = dataframe['Municipio']
calles = dataframe['Calle']

# Se crea una funcion para generar los datos aleatorios
def generarDatos(id_incremental):
    numeronombreCalle = rd.randint(0, 199)
    cp = str(rd.randint(1, 10000))
    numeroCalle = rd.randint(1,10000)
    numeroMunicipio = rd.randint(0, len(municipio)-1)
    

    sql_insert = f"INSERT INTO direccion (direccion_id, calle, codigopostal, numero, colonia,nombreestado,nombremunicipio) VALUES ({id_incremental}, '{calles[numeronombreCalle]}', {cp} , '{numeroCalle}' , '{colonia[numeroMunicipio]}', '{ciudad[numeroMunicipio]}', '{municipio[numeroMunicipio]}');"
    
    return(sql_insert)

    
 
# Se crea un archivo txt para guardar los datos generados 
# Se genera un ciclo for para generar n datos aleatorios y guardarlos en un archivo txt
with open('Datos.txt', 'w') as archivo:
    
    for i in range(1000000):
        # Se genera una cadena con los datos generados
        dato = "".join(generarDatos(i))
        # Se guarda la cadena en el archivo txt
        archivo.write(dato + "\n")


