import pandas as pd
import random as rd

dataframe = pd.read_excel('Datos.xlsx')

estados = dataframe['Estado']
municipios = dataframe['Municipio']


def generarEstados():
    CodigoPostal = rd.randint(10000, 99999)
    nombreEstado = rd.randint(0, len(estados)-1)

    sql_insert = f"('{CodigoPostal}', '{estados[nombreEstado]}','{municipios[nombreEstado]}'),"
    return(sql_insert)


with open('Datos.txt', 'w') as archivo:
    
    for i in range(1000000):
        dato = "".join(generarEstados())
        archivo.write(dato )
