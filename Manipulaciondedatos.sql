/* Aqui las manipulaciones selects, delete, update, insert */

/*
Inserts del Daniel
*/
INSERT INTO Persona (RFC, nombre, apellido, numeroDeTelefono, correo, fechadeNacimiento)
VALUES (); 


INSERT INTO cliente (usuario, contraseña)
VALUES ();  


INSERT INTO empleado (RFC, nombre, apellido, numeroDeTelefono, correo, fechadeNacimiento, puesto, fechadecontratacion)
VALUES (); 

INSERT INTO cuenta DEFAULT VALUES;
 
INSERT INTO transaccion (fechaDeTransaccion, tipoDeMovimiento, cuentaDestino, monto, concepto, cuenta_id)
VALUES (); 

INSERT INTO Servicio (nombreDeServicio, cuenta_id)
VALUES ();

INSERT INTO direccion (calle, codigoPostal, numero, colonia)
VALUES (); 

INSERT INTO sucursal (nomSucursal, horario, telefonoDeContacto)
VALUES ();

INSERT INTO CaracteristicasServicios (concepto, cveInterbancaria, noTarjeta, lineaDeCredito, fechaDeCorte, fechaDeExpiracion, cvv, nip, fechaDeApertura, pagoMinimo, pagoParaNoGenerarIntereses, promociones, fechaDePago, interes, saldo)
VALUES ();
