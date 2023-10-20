/* Creacion de los triggers  para cada tabla*/ 

/*Triggers tabla persona*/


/*
 1.- Definir los triggers de que van a hacer
*/

CREATE OR REPLACE FUNCTION validar_correo()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
	IF NEW.correo LIKE '%@%.%' THEN
		 RETURN NEW;
	END IF;

	RETURN NULL;
END;
$$

;;;

CREATE TRIGGER TG_CHECK_EMAIL_ON_INSERT BEFORE INSERT ON PERSONA FOR EACH ROW EXECUTE FUNCTION validar_correo();
CREATE TRIGGER TG_CHECK_EMAIL_ON_UPDATE BEFORE UPDATE ON PERSONA FOR EACH ROW EXECUTE FUNCTION validar_correo();

/*
Tabla Persona
	Un trigger para que los usuarios sean mayores
*/
/*************************************/




/*************************************/
/*
Tabla Cliente

*/
/*************************************/




/*************************************/
/*
Tabla Empleado
	
*/
/*************************************/




/*************************************/
/*
Tabla Cuenta
	
*/
/*************************************/




/*************************************/
/*
Tabla Transaccion
	
*/
/*************************************/




/*************************************/
/*
Tabla Servicio
	
*/
/*************************************/




/*************************************/
/*
Tabla Direccion
	
*/
/*************************************/




/*************************************/
/*
Tabla Sucursal
	
*/
/*************************************/




/*************************************/
/*
Tabla Estado
	
*/
/*************************************/




/*************************************/
/*
Tabla Municipio

*/
/*************************************/




/*************************************/
/*
Tabla caracteristica_servicio

*/
/*************************************/




/*************************************/