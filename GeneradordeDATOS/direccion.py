import pandas as pd 
import random as rd



        
# Se lee el archivo excel con pandas para extraer los datos
dataframe = pd.read_excel('Datos.xlsx')

# Se apuntan los datos de las columnas de excel a las variables
calles = dataframe['Calle']
colonia = dataframe['Colonia']


# Se crea una funcion para generar los datos aleatorios
def generarDatos(id_incremental):
    nombreCalle = rd.randint(0, 199)
    cp = str(rd.randint(1, 10000))
    numeroCasa = rd.randint(1,10000)
    nombreColonia = rd.randint(0, len(colonia)-1)
    

    #sql_insert = f"INSERT INTO direccion (direccion_id, calle, codigopostal, numero, colonia,nombreestado,nombremunicipio) VALUES ({id_incremental}, '{calles[nombreCalle]}', '{numeroCasa}' , '{colonia[nombreColonia]}', {cp} );"
    sql_insert = f"('{id_incremental}', '{calles[nombreCalle]}', '{numeroCasa}' , '{colonia[nombreColonia]}', {cp} );"
    
    return(sql_insert)

    
 
# Se crea un archivo txt para guardar los datos generados 
# Se genera un ciclo for para generar n datos aleatorios y guardarlos en un archivo txt
with open('Datos.txt', 'w') as archivo:
    
    String = "INSERT INTO direccion values "
    for i in range(10):
        
        Query = String + generarDatos(i)
        print(Query)
        
        
        # archivo.write(Query + dato + "\n")
        
        # Se genera una cadena con los datos generados
        # dato = "".join(generarDatos(i))
        # # Se guarda la cadena en el archivo txt
        # archivo.write(dato + "\n")


