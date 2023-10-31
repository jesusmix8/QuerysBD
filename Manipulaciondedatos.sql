/* Aqui las manipulaciones selects, delete, update, insert */

--Inserts por si quieren probar en lo que queda el algoritmo del millon

-- Insertar datos en la tabla cliente
INSERT INTO cliente (RFC, nombre, apellido, numeroDeTelefono, correo, fechadeNacimiento, genero, usuario, contraseña, direccion_ID)
VALUES
    ('ABC123456DEF', 'Juan', 'Pérez', 1234567890, 'juan.perez@email.com', '1990-05-15', 'M', 'usuario1', 'pass1', 1),
    ('XYZ987654POQ', 'Ana', 'González', 9876543210, 'ana.gonzalez@email.com', '1988-12-10', 'F', 'usuario2', 'pass2', 2),
    ('LMN456789RST', 'Carlos', 'Martínez', 5555555555, 'carlos.martinez@email.com', '1995-03-20', 'M', 'usuario3', 'pass3', 3),
    ('PQR123456STU', 'Luisa', 'Hernández', 9999999999, 'luisa.hernandez@email.com', '1986-07-25', 'F', 'usuario4', 'pass4', 4),
    ('DEF789012GHI', 'Pedro', 'Ramírez', 7777777777, 'pedro.ramirez@email.com', '1998-02-05', 'M', 'usuario5', 'pass5', 5),
    ('JKL345678VWX', 'María', 'López', 8888888888, 'maria.lopez@email.com', '1992-11-30', 'F', 'usuario6', 'pass6', 6),
    ('GHI234567JKL', 'Miguel', 'Sánchez', 1111111111, 'miguel.sanchez@email.com', '1984-09-12', 'M', 'usuario7', 'pass7', 7),
    ('STU456789VWX', 'Laura', 'Díaz', 2222222222, 'laura.diaz@email.com', '1993-04-18', 'F', 'usuario8', 'pass8', 8),
    ('NOP123456QRS', 'Roberto', 'Fernández', 6666666666, 'roberto.fernandez@email.com', '1997-08-08', 'M', 'usuario9', 'pass9', 9),
    ('HJK789012MNO', 'Sofía', 'Gómez', 3333333333, 'sofia.gomez@email.com', '1991-06-03', 'F', 'usuario10', 'pass10', 10);



-- Insertar datos en la tabla empleado
INSERT INTO empleado (RFC, nombre, apellido, numeroDeTelefono, correo, fechadeNacimiento, genero, puesto, fechadecontratacion, fechaDeDespido, direccion_ID)
VALUES
    ('MNO789012PQR', 'Alejandro', 'González', 5556667777, 'alejandro@email.com', '1985-06-10', 'M', 'Gerente de Ventas', '2019-03-15', NULL, 11),
    ('XYZ123456ABC', 'Laura', 'Hernández', 3334445555, 'laura@email.com', '1990-09-22', 'F', 'Analista de Recursos Humanos', '2020-07-28', '2023-02-20', 12),
    ('ABC987654LMN', 'Carlos', 'Martínez', 7778889999, 'carlos@email.com', '1983-12-05', 'M', 'Diseñador Gráfico', '2018-11-20', NULL, 13),
    ('DEF654321JKL', 'María', 'Rodríguez', 9990001111, 'maria@email.com', '1992-04-14', 'F', 'Desarrollador de Software', '2021-05-10', NULL, 14),
    ('PQR456789STU', 'Javier', 'López', 1112223333, 'javier@email.com', '1995-01-08', 'M', 'Contador', '2017-09-05', NULL, 15),
    ('GHI789012JKL', 'Sofía', 'Fernández', 6667778888, 'sofia@email.com', '1989-07-17', 'F', 'Asistente Administrativo', '2020-02-12', '2022-10-30', 16),
    ('JKL987654GHI', 'Roberto', 'Sánchez', 2223334444, 'roberto@email.com', '1980-03-25', 'M', 'Analista de Marketing', '2019-12-08', NULL, 17),
    ('LMN321456DEF', 'Ana', 'Gómez', 8889990000, 'ana@email.com', '1991-11-02', 'F', 'Ingeniero de Proyectos', '2018-06-14', NULL, 18),
    ('STU123456NOP', 'Luis', 'Ramírez', 5556667777, 'luis@email.com', '1997-08-20', 'M', 'Diseñador de Moda', '2022-01-30', NULL, 19),
    ('NOP789012RST', 'Pedro', 'Díaz', 1112223333, 'pedro@email.com', '1993-05-18', 'M', 'Asistente de Recursos Humanos', '2020-09-15', '2023-03-10', 20);



-- Insertar datos en la tabla cuenta con cliente_ID desde 13 hasta 22
INSERT INTO cuenta (cliente_ID)
VALUES
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (8),
    (9),
    (10);


-- Insertar datos en la tabla transaccion con cuenta_ID desde 21 hasta 30
INSERT INTO transaccion (fechaDeTransaccion, tipoDeMovimiento, cuentaOrigen, cuentaDestino, monto, concepto, cuenta_ID)
VALUES
    ('2023-10-01', 'Transferencia', 'Cuenta1', 'Cuenta2', 100.00, 'Pago de factura', 1),
    ('2023-10-02', 'Depósito', 'Cuenta3', '', 500.00, 'Ingreso mensual', 2),
    ('2023-10-03', 'Retiro', 'Cuenta4', '', 50.00, 'Retiro de efectivo', 3),
    ('2023-10-04', 'Transferencia', 'Cuenta5', 'Cuenta6', 200.00, 'Pago de deuda', 4),
    ('2023-10-05', 'Compra', 'Cuenta7', '', 75.00, 'Compras en línea', 5),
    ('2023-10-06', 'Depósito', 'Cuenta8', '', 300.00, 'Ingreso adicional', 6),
    ('2023-10-07', 'Transferencia', 'Cuenta9', 'Cuenta10', 150.00, 'Pago de factura', 7),
    ('2023-10-08', 'Compra', 'Cuenta11', '', 45.00, 'Comida rápida', 8),
    ('2023-10-09', 'Retiro', 'Cuenta12', '', 30.00, 'Retiro de efectivo', 9),
    ('2023-10-10', 'Depósito', 'Cuenta13', '', 250.00, 'Ingreso mensual', 10);


-- Insertar datos en la tabla direccion
INSERT INTO direccion (calle, codigoPostal, numero, colonia)
VALUES
    ('Calle  1', '01000', '123', 'Colonia A'),
    ('Calle  2', '02000', '456', 'Colonia B'),
    ('Calle  3', '03000', '789', 'Colonia C'),
    ('Calle  4', '04000', '101', 'Colonia D'),
    ('Calle  5', '05000', '202', 'Colonia E'),
    ('Calle  6', '06000', '303', 'Colonia F'),
    ('Calle  7', '07000', '404', 'Colonia G'),
    ('Calle  8', '08000', '505', 'Colonia H'),
    ('Calle  9', '09000', '606', 'Colonia I'),
    ('Calle  10', '10000', '707', 'Colonia J');


-- Insertar datos en la tabla sucursal
INSERT INTO sucursal (nomSucursal, horario, telefonoDeContacto, direccion_ID, cliente_ID, empleado_ID)
VALUES
    ('Sucursal A', '10:00 AM - 20:00 PM', 5551112233, 1, 1, 1),
    ('Sucursal B', '10:00 AM - 20:00 PM', 5554446677, 2, 2, 2),
    ('Sucursal C', '10:00 AM - 20:00 PM', 5557779900, 3, 3, 3),
    ('Sucursal D', '10:00 AM - 20:00 PM', 5552224455, 4, 4, 4),
    ('Sucursal E', '10:00 AM - 20:00 PM', 5558881133, 5, 5, 5),
    ('Sucursal F', '10:00 AM - 20:00 PM', 5553337766, 6, 6, 6),
    ('Sucursal G', '10:00 AM - 20:00 PM', 5556669999, 7, 7, 7),
    ('Sucursal H', '10:00 AM - 20:00 PM', 5551110044, 8, 8, 8),
    ('Sucursal I', '10:00 AM - 20:00 PM', 5554441177, 9, 9, 9),
    ('Sucursal J', '10:00 AM - 20:00 PM', 5557773300, 10, 10, 10);


INSERT INTO catalogoEstado (codigoPostal, nombreEstado, nombreMunicipio)
VALUES
    (01000, 'Aguascalientes', 'Aguascalientes'),
    (02000, 'Baja California', 'Mexicali'),
    (03000, 'Baja California', 'Tijuana'),
    (04000, 'Baja California Sur', 'La Paz'),
    (05000, 'Campeche', 'Campeche'),
    (06000, 'Chiapas', 'Tuxtla Gutiérrez'),
    (07000, 'Chihuahua', 'Chihuahua'),
    (08000, 'Coahuila', 'Saltillo'),
    (09000, 'Colima', 'Colima'),
    (10000, 'Durango', 'Durango');


-- Insertar datos en la tabla catalogo_servicio
INSERT INTO catalogo_servicio (nombreDeServicio, concepto, cveInterbancaria, noTarjeta, lineaDeCredito, fechaDeCredito, fechaDeExpiracion, cvv, nip, fechaDeApertura, pagoMinimo, pagoParaNoGenerarIntereses, promociones, fechaDePago, intereses, saldo, cuenta_ID)
VALUES
    ('Cuenta de Ahorro', 'Cuenta de ahorro básica', 123456789012345678, 1234567890123456, 1000.00, '2023-01-01', '2025-01-01', 123, 9876, '2022-01-01', 10.00, 0.00, 'Promo1', '2023-02-01', 5.00, 1000.00, 1),
    ('Tarjeta de Crédito', 'Tarjeta de crédito estándar', 987654321098765432, 9876543210987654, 5000.00, '2023-03-01', '2025-03-01', 456, 3210, '2022-03-01', 50.00, 0.00, 'Promo2', '2023-04-01', 20.00, 5000.00, 2),
    ('Préstamo Personal', 'Préstamo a corto plazo', 246813579024681357, 2468135790246813, 20000.00, '2023-05-01', '2025-05-01', 789, 5678, '2022-05-01', 100.00, 0.00, 'Promo3', '2023-06-01', 50.00, 20000.00, 3),
    ('Hipoteca', 'Préstamo hipotecario', 135792468013579246, 1357924680135792, 100000.00, '2023-07-01', '2030-07-01', 987, 4321, '2022-07-01', 500.00, 300.00, 'Promo4', '2023-08-01', 200.00, 100000.00, 4),
    ('Transferencia Bancaria', 'Transferencia en línea', 864209875486420987, 8642098754864209, 5000.00, '2023-09-01', '2025-09-01', 123, 7890, '2022-09-01', 50.00, 0.00, 'Promo5', '2023-10-01', 10.00, 5000.00, 5),
    ('Cuenta Corriente', 'Cuenta corriente estándar', 357901234635790123, 3579012346357901, 8000.00, '2023-11-01', '2025-11-01', 345, 6789, '2022-11-01', 30.00, 0.00, 'Promo6', '2023-12-01', 15.00, 8000.00, 6),
    ('Inversión a Plazo Fijo', 'Inversión de bajo riesgo', 246801357924680135, 2468013579246801, 15000.00, '2024-01-01', '2026-01-01', 678, 2345, '2023-01-01', 100.00, 0.00, 'Promo7', '2024-02-01', 60.00, 15000.00, 7),
    ('Banca en Línea', 'Servicios de banca en línea', 135792468013579246, 1357924680135792, 0.00, '2024-03-01', '2026-03-01', 345, 6789, '2023-03-01', 0.00, 0.00, 'Promo8', '2024-04-01', 0.00, 0.00, 8),
    ('Seguros de Vida', 'Seguro de vida a largo plazo', 987654321098765432, 9876543210987654, 0.00, '2024-05-01', '2026-05-01', 123, 4567, '2023-05-01', 0.00, 0.00, 'Promo9', '2024-06-01', 0.00, 0.00, 9),
    ('Plan de Jubilación', 'Plan de jubilación personalizado', 864209875486420987, 8642098754864209, 0.00, '2024-07-01', '2026-07-01', 456, 7890, '2023-07-01', 0.00, 0.00, 'Promo10', '2024-08-01', 0.00, 0.00, 10);

--Insert para tabla fact
INSERT INTO fact_transferencia (transaccion_ID, nombreDeServicio, fechaDeTransaccion, tipoDeMovimiento, monto, nombre, apellido, nomSucursal, codigoPostal, nombreEstado, nombreMunicipio, cuenta_ID)
SELECT
    t.transaccion_ID,
    cs.nombreDeServicio,
    t.fechaDeTransaccion,
    t.tipoDeMovimiento,
    t.monto,
    p.nombre,
    p.apellido,
    s.nomSucursal,
    ce.codigoPostal,
    ce.nombreEstado,
    ce.nombreMunicipio,
    t.cuenta_ID
FROM transaccion t
JOIN catalogo_servicio cs ON t.cuenta_ID = cs.cuenta_ID
JOIN cuenta c ON t.cuenta_ID = c.cuenta_ID
JOIN cliente cl ON c.cliente_ID = cl.cliente_ID
JOIN persona p ON cl.RFC = p.RFC
JOIN sucursal s ON c.cliente_ID = s.cliente_ID
JOIN direccion d ON s.direccion_ID = d.direccion_ID
JOIN catalogoEstado ce ON d.codigoPostal = ce.codigoPostal;


--*********************************************************************************************************************************************************************************************************************
--ALGUNAS CONSULTAS PARA LOS DE BACK Y FRONT
-- Y LAS OPERACIONES DE RANK, DENSE_RANK, ROLLUP Y CUBE

--RANK para mostrar las transferencias por ESTADO
WITH TransferenciasPorEstado AS (
    SELECT
        ce.nombreEstado AS Estado,
        EXTRACT(YEAR FROM t.fechaDeTransaccion) AS Año,
        COUNT(*) AS NumeroDeTransferencias
    FROM
        fact_transferencia ft
    JOIN
        catalogoEstado ce ON ft.codigoPostal = ce.codigoPostal
    JOIN
        transaccion t ON ft.transaccion_ID = t.transaccion_ID
    WHERE
        EXTRACT(YEAR FROM t.fechaDeTransaccion) = EXTRACT(YEAR FROM CURRENT_DATE)  -- Filtrar por el año actual
    GROUP BY
        ce.nombreEstado, Año
)
SELECT
    Estado,
    NumeroDeTransferencias,
    RANK() OVER (ORDER BY NumeroDeTransferencias DESC) AS Ranking
FROM
    TransferenciasPorEstado
ORDER BY
    NumeroDeTransferencias DESC;


--DENSE_RANK para mostrar las transferencias por ESTADO
WITH TransferenciasPorEstado AS (
    SELECT
        ce.nombreEstado AS Estado,
        EXTRACT(YEAR FROM t.fechaDeTransaccion) AS Año,
        COUNT(*) AS NumeroDeTransferencias
    FROM
        fact_transferencia ft
    JOIN
        catalogoEstado ce ON ft.codigoPostal = ce.codigoPostal
    JOIN
        transaccion t ON ft.transaccion_ID = t.transaccion_ID
    WHERE
        EXTRACT(YEAR FROM t.fechaDeTransaccion) = EXTRACT(YEAR FROM CURRENT_DATE)  -- Filtrar por el año actual
    GROUP BY
        ce.nombreEstado, Año
)
SELECT
    Estado,
    NumeroDeTransferencias,
    DENSE_RANK() OVER (ORDER BY NumeroDeTransferencias DESC) AS RankingDense
FROM
    TransferenciasPorEstado
ORDER BY
    NumeroDeTransferencias DESC;


--ROLLUP para mostrar totales de transferencias por sucursal
SELECT
    CASE
        WHEN s.nomSucursal IS NULL THEN 'Total General'
        ELSE s.nomSucursal
    END AS Sucursal,
    COUNT(*) AS NumeroDeTransferencias
FROM fact_transferencia ft
LEFT JOIN sucursal s ON ft.nomSucursal = s.nomSucursal
GROUP BY ROLLUP (s.nomSucursal);


--CUBE para generar totales de transferencias por mes por sucursal
SELECT
    s.nomSucursal AS Sucursal,
    TO_CHAR(t.fechaDeTransaccion, 'YYYY-MM') AS Mes,
    COUNT(*) AS NumeroDeTransferencias
FROM fact_transferencia ft
JOIN sucursal s ON ft.nomSucursal = s.nomSucursal
JOIN transaccion t ON ft.transaccion_ID = t.transaccion_ID
GROUP BY CUBE (s.nomSucursal, TO_CHAR(t.fechaDeTransaccion, 'YYYY-MM'))
ORDER BY Sucursal, Mes;

--*********************************************************************************+
--MAS CONSULTAS

--Consultar el Usuario**
SELECT usuario
FROM cliente
WHERE cliente_ID = 'ID_del_Cliente';

--Consultar la Contraseña
SELECT contraseña
FROM cliente
WHERE usuario = 'nombre_de_usuario';

--Datos de la Tarjeta
SELECT
    noTarjeta AS numero_de_tarjeta,
    saldo,
    cuenta_ID AS id_cuenta
FROM
    catalogo_servicio;

--Consultar monto de la cuenta**
SELECT saldo
FROM catalogo_servicio
WHERE cuenta_ID = 'id de la cuenta';

--Datos para transferencias del Cliente (grafica de los de front)
SELECT
    t.transaccion_ID AS id_transaccion,
    t.fechaDeTransaccion AS fecha_de_transaccion,
    t.tipoDeMovimiento,
    t.monto,
    t.concepto,
    t.cuenta_ID AS id_cuenta,
    c.cliente_ID AS id_cliente
FROM
    transaccion t
JOIN
    cuenta c ON t.cuenta_ID = c.cuenta_ID;

--Consultar nombre**
SELECT nombre
FROM cliente
WHERE usuario = 'usuario';

--Consultar apellido**
SELECT apellido
FROM cliente
WHERE usuario = 'usuario';

--Consultar los movimientos de un cliente, quien es?, su cuenta y la fecha
SELECT
    c.cuenta_ID AS id_cuenta,
    c.cliente_ID AS id_cliente,
    p.nombre,
    p.apellido,
    t.transaccion_ID AS id_transaccion,
    t.monto,
    t.fechaDeTransaccion AS fecha
FROM
    cuenta c
JOIN
    cliente cl ON c.cliente_ID = cl.cliente_ID
JOIN
    persona p ON cl.RFC = p.RFC
LEFT JOIN
    transaccion t ON c.cuenta_ID = t.cuenta_ID
ORDER BY
    c.cuenta_ID, t.fechaDeTransaccion;
