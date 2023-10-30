Para crear un trigger que registre los cambios en la tabla persona:

-- Crear una función trigger que inserte una fila en la tabla persona_log:

CREATE  OR REPLACE FUNCTION log_persona() RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO persona_log (RFC, nombre, apellido, accion, fecha) 
  VALUES (NEW.RFC, NEW.nombre, NEW.apellido, TG_OP, now());
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear un trigger que se ejecute después de cada inserción, actualización o eliminación en la tabla persona
CREATE TRIGGER persona_trigger
AFTER INSERT OR UPDATE OR DELETE ON persona
FOR EACH ROW EXECUTE PROCEDURE log_persona();


Para crear un trigger que valide el correo electrónico de los clientes antes de insertarlos o actualizarlos en la tabla cliente:

-- Crear una función trigger que verifique si el correo tiene el formato correcto
CREATE OR REPLACE  FUNCTION validar_correo() RETURNS TRIGGER AS $$
BEGIN
  IF NEW.correo NOT LIKE '%@%.%' THEN
    RAISE EXCEPTION 'Correo inválido: %', NEW.correo;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear un trigger que se ejecute antes de cada inserción o actualización en la tabla cliente
CREATE TRIGGER cliente_trigger
BEFORE INSERT OR UPDATE ON cliente
FOR EACH ROW EXECUTE PROCEDURE validar_correo();

Para crear un trigger que actualice el saldo de las cuentas después de cada transacción:

-- Crear una función trigger que actualice el saldo de las cuentas origen y destino
CREATE OR REPLACE  FUNCTION actualizar_saldo() RETURNS TRIGGER AS $$
BEGIN
  -- Restar el monto de la cuenta origen
  UPDATE cuenta SET saldo = saldo - NEW.monto 
  WHERE cuenta_ID = NEW.cuentaOrigen;

  -- Sumar el monto a la cuenta destino
  UPDATE cuenta SET saldo = saldo + NEW.monto 
  WHERE cuenta_ID = NEW.cuentaDestino;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear un trigger que se ejecute después de cada inserción en la tabla transaccion
CREATE TRIGGER transaccion_trigger
AFTER INSERT ON transaccion
FOR EACH ROW EXECUTE PROCEDURE actualizar_saldo();


Para crear un trigger que asigne un nombre de sucursal por defecto si no se especifica uno al insertar una nueva fila en la tabla sucursal:

-- Crear una función trigger que asigne el nombre 'Sucursal sin nombre' si el campo nomSucursal es nulo
CREATE OR REPLACE  FUNCTION asignar_nombre_sucursal() RETURNS TRIGGER AS $$
BEGIN
  IF NEW.nomSucursal IS NULL THEN
    NEW.nomSucursal := 'Sucursal sin nombre';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear un trigger que se ejecute antes de cada inserción en la tabla sucursal
CREATE TRIGGER sucursal_trigger
BEFORE INSERT ON sucursal
FOR EACH ROW EXECUTE PROCEDURE asignar_nombre_sucursal();

Para crear un trigger que registre el historial de cambios en la tabla catalogo_servicio:

-- Crear una función trigger que inserte una fila en la tabla catalogo_servicio_log
CREATE OR REPLACE FUNCTION log_catalogo_servicio() RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO catalogo_servicio_log (servicio_ID, nombreDeServicio, accion, fecha) 
    VALUES (NEW.servicio_ID, NEW.nombreDeServicio, 'INSERT', now());
  ELSIF TG_OP = 'UPDATE' THEN
    INSERT INTO catalogo_servicio_log (servicio_ID, nombreDeServicio, accion, fecha) 
    VALUES (NEW.servicio_ID, NEW.nombreDeServicio, 'UPDATE', now());
  ELSIF TG_OP = 'DELETE' THEN
    INSERT INTO catalogo_servicio_log (servicio_ID, nombreDeServicio, accion, fecha) 
    VALUES (OLD.servicio_ID, OLD.nombreDeServicio, 'DELETE', now());
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear un trigger que se ejecute después de cada inserción, actualización o eliminación en la tabla catalogo_servicio
CREATE TRIGGER catalogo_servicio_trigger
AFTER INSERT OR UPDATE OR DELETE ON catalogo_servicio
FOR EACH ROW EXECUTE PROCEDURE log_catalogo_servicio();

Para crear un trigger que envíe un correo electrónico al cliente cuando se crea una nueva cuenta:

-- Crear una función trigger que envíe un correo electrónico usando la función pg_sendmail
CREATE OR REPLACE FUNCTION enviar_correo() RETURNS TRIGGER AS $$
DECLARE
  cliente_email VARCHAR(50);
BEGIN
  -- Obtener el correo del cliente usando su ID
  SELECT correo INTO cliente_email FROM cliente WHERE cliente_ID = NEW.cliente_ID;

  -- Enviar el correo usando la función pg_sendmail (requiere instalar la extensión pg_mail)
  PERFORM pg_sendmail(cliente_email, 'noreply@banco.com', 'Nueva cuenta creada', 
  'Estimado cliente, le informamos que se ha creado una nueva cuenta con el ID ' || NEW.cuenta_ID || '. Gracias por su preferencia.');

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear un trigger que se ejecute después de cada inserción en la tabla cuenta
CREATE TRIGGER cuenta_trigger
AFTER INSERT ON cuenta
FOR EACH ROW EXECUTE PROCEDURE enviar_correo();


Para crear un trigger que genere un código postal aleatorio si no se especifica uno al insertar una nueva fila en la tabla catalogo_estado:

-- Crear una función trigger que genere un código postal aleatorio entre 10000 y 99999 si el campo codigoPostal es nulo
CREATE OR REPLACE FUNCTION generar_codigo_postal() RETURNS TRIGGER AS $$
BEGIN
  IF NEW.codigoPostal IS NULL THEN
    NEW.codigoPostal := floor(random() * (99999 - 10000 + 1) + 10000)::int;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear un trigger que se ejecute antes de cada inserción en la tabla catalogo_estado
CREATE TRIGGER catalogo_estado_trigger
BEFORE INSERT ON catalogo_estado
FOR EACH ROW EXECUTE PROCEDURE generar_codigo_postal();

Para crear un trigger que calcule el pago mínimo y el pago para no generar intereses de una tarjeta de crédito cuando se crea o actualiza una fila en la tabla catalogo_servicio:

-- Crear una función trigger que calcule el pago mínimo y el pago para no generar intereses usando la línea de crédito, el saldo y los intereses
CREATE OR REPLACE FUNCTION calcular_pagos() RETURNS TRIGGER AS $$
BEGIN
  -- Calcular el pago mínimo como el 10% del saldo o 100 pesos, lo que sea mayor
  NEW.pagoMinimo := GREATEST(NEW.saldo * 0.1, 100);

  -- Calcular el pago para no generar intereses como el saldo más los intereses del mes
  NEW.pagoParaNoGenerarIntereses := NEW.saldo + (NEW.saldo * NEW.intereses / 12);

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear un trigger que se ejecute después de cada inserción o actualización en la tabla catalogo_servicio
CREATE TRIGGER catalogo_servicio_trigger
AFTER INSERT OR UPDATE ON catalogo_servicio
FOR EACH ROW EXECUTE PROCEDURE calcular_pagos();

Para crear un trigger que verifique si la fecha de expiración de una tarjeta de crédito es válida antes de insertar o actualizar una fila en la tabla catalogo_servicio:

-- Crear una función trigger que verifique si la fecha de expiración es mayor que la fecha actual
CREATE OR REPLACE  FUNCTION validar_fecha_expiracion() RETURNS TRIGGER AS $$
BEGIN
  IF NEW.fechaDeExpiracion <= CURRENT_DATE THEN
    RAISE EXCEPTION 'Fecha de expiración inválida: %', NEW.fechaDeExpiracion;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear un trigger que se ejecute antes de cada inserción o actualización en la tabla catalogo_servicio
CREATE TRIGGER validar_fecha_trigger
BEFORE INSERT OR UPDATE ON catalogo_servicio
FOR EACH ROW EXECUTE PROCEDURE validar_fecha_expiracion();

Para crear un trigger que aumente el salario de los empleados cada año según su fecha de contratación:

-- Crear una función trigger que aumente el salario de los empleados en un 5% cada año
CREATE OR REPLACE FUNCTION aumentar_salario() RETURNS TRIGGER AS $$
BEGIN
  -- Calcular el número de años desde la fecha de contratación
  DECLARE años INTEGER := EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM NEW.fechadecontratacion);

  -- Aumentar el salario en un 5% por cada año
  NEW.salario := NEW.salario * (1 + 0.05 * años);

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear un trigger que se ejecute antes de cada inserción o actualización en la tabla empleado
CREATE TRIGGER empleado_trigger
BEFORE INSERT OR UPDATE ON empleado
FOR EACH ROW EXECUTE PROCEDURE aumentar_salario();

Para crear un trigger que verifique si el RFC de una persona es válido antes de insertarla o actualizarla en la tabla persona:

-- Crear una función trigger que verifique si el RFC tiene el formato correcto
CREATE OR REPLACE  FUNCTION validar_rfc() RETURNS TRIGGER AS $$
BEGIN
  -- El RFC debe tener 13 caracteres y seguir el patrón: cuatro letras, seis dígitos y tres letras
  IF NEW.RFC NOT SIMILAR TO '[A-Z]{4}[0-9]{6}[A-Z]{3}' THEN
    RAISE EXCEPTION 'RFC inválido: %', NEW.RFC;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear un trigger que se ejecute antes de cada inserción o actualización en la tabla persona
CREATE TRIGGER persona_trigger
BEFORE INSERT OR UPDATE ON persona
FOR EACH ROW EXECUTE PROCEDURE validar_rfc();

Para crear un trigger que borre las cuentas inactivas después de un año sin transacciones:

-- Crear una función trigger que borre las cuentas inactivas
CREATE OR REPLACE FUNCTION borrar_cuentas_inactivas() RETURNS TRIGGER AS $$
BEGIN
  -- Borrar las cuentas que no tengan transacciones en el último año
  DELETE FROM cuenta 
  WHERE cuenta_ID NOT IN (
    SELECT DISTINCT cuenta_ID FROM transaccion 
    WHERE fechaDeTransaccion >= CURRENT_DATE - INTERVAL '1 year'
  );
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Crear un trigger que se ejecute después de cada inserción, actualización o eliminación en la tabla transaccion
CREATE TRIGGER transaccion_trigger
AFTER INSERT OR UPDATE OR DELETE ON transaccion
FOR EACH STATEMENT EXECUTE PROCEDURE borrar_cuentas_inactivas();
