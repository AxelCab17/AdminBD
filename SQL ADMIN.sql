--Se crea Repositorio ADMIN BD

-- alter session set "_ORACLE_SCRIPT" = TRUE;

-- CreaciÃƒÂ³n de Tablespaces
CREATE TABLESPACE TS_PROCEDIMIENTOS 
DATAFILE 'C:\AdminDB\Procedimientos01.dbf' SIZE 50M AUTOEXTEND ON;

CREATE TABLESPACE TS_DENTISTAS 
DATAFILE 'C:\AdminDB\Dentistas01.dbf' SIZE 50M AUTOEXTEND ON;

CREATE TABLESPACE TS_PACIENTES 
DATAFILE 'C:\AdminDB\Pacientes01.dbf' SIZE 50M AUTOEXTEND ON;

CREATE TABLESPACE TS_CITAS 
DATAFILE 'C:\AdminDB\Citas01.dbf' SIZE 100M AUTOEXTEND ON;

-- CreaciÃƒÂ³n de Tablas
CREATE TABLE Procedimientos (
   idProcedimiento INTEGER PRIMARY KEY,
   nombre VARCHAR2(50) NOT NULL,
   descripcion VARCHAR2(200),
   costo NUMBER(10, 2) NOT NULL
) TABLESPACE TS_PROCEDIMIENTOS;

CREATE TABLE Dentistas (
   idDentista INTEGER PRIMARY KEY,
   nombre VARCHAR2(50) NOT NULL,
   apellido VARCHAR2(50) NOT NULL,
   email VARCHAR2(100) UNIQUE
) TABLESPACE TS_DENTISTAS;

CREATE TABLE Pacientes (
   idPaciente INTEGER PRIMARY KEY,
   nombre VARCHAR2(50) NOT NULL,
   apellido VARCHAR2(50) NOT NULL,
   email VARCHAR2(100) UNIQUE
) TABLESPACE TS_PACIENTES;

CREATE TABLE Citas (
   idCita INTEGER PRIMARY KEY,
   idPaciente INTEGER,
   idDentista INTEGER,
   idProcedimiento INTEGER,
   fechaCita DATE,
   motivo VARCHAR2(200),
   costo NUMBER(10, 2),
   FOREIGN KEY (idPaciente) REFERENCES Pacientes(idPaciente),
   FOREIGN KEY (idDentista) REFERENCES Dentistas(idDentista),
   FOREIGN KEY (idProcedimiento) REFERENCES Procedimientos(idProcedimiento)
) TABLESPACE TS_CITAS;

-- CreaciÃƒÂ³n de Ãƒ?ndices
CREATE INDEX IDX_NOMBRE_PROCEDIMIENTO ON Procedimientos(nombre) TABLESPACE TS_PROCEDIMIENTOS;
CREATE INDEX IDX_NOMBRE_DENTISTA ON Dentistas(nombre) TABLESPACE TS_DENTISTAS;
CREATE INDEX IDX_NOMBRE_PACIENTE ON Pacientes(nombre) TABLESPACE TS_PACIENTES;
CREATE INDEX IDX_FECHA_CITA ON Citas(fechaCita) TABLESPACE TS_CITAS;

-- Consultas
SELECT * FROM Procedimientos;
SELECT * FROM Dentistas;
SELECT * FROM Pacientes;
SELECT * FROM Citas;

-- Inserciones en la tabla "Procedimientos"
INSERT INTO Procedimientos (idProcedimiento, nombre, descripcion, costo)
VALUES (1, 'Limpieza Dental', 'RemociÃƒÂ³n de placa y sarro', 80.00);

INSERT INTO Procedimientos (idProcedimiento, nombre, descripcion, costo)
VALUES (2, 'ExtracciÃƒÂ³n de Muela', 'ExtracciÃƒÂ³n de muela daÃƒÂ±ada', 150.00);

INSERT INTO Procedimientos (idProcedimiento, nombre, descripcion, costo)
VALUES (3, 'Empaste Dental', 'Rellenar cavidades con material restaurador', 120.00);

INSERT INTO Procedimientos (idProcedimiento, nombre, descripcion, costo)
VALUES (4, 'Ortodoncia', 'AlineaciÃƒÂ³n de dientes y mandÃƒÂ­bula', 2000.00);

INSERT INTO Procedimientos (idProcedimiento, nombre, descripcion, costo)
VALUES (5, 'Blanqueamiento Dental', 'Aclarar el color de los dientes', 250.00);

-- Inserciones en la tabla "Dentistas"
INSERT INTO Dentistas (idDentista, nombre, apellido, email)
VALUES (1, 'MarÃƒÂ­a', 'GÃƒÂ³mez', 'maria@example.com');

INSERT INTO Dentistas (idDentista, nombre, apellido, email)
VALUES (2, 'Juan', 'RodrÃƒÂ­guez', 'juan@example.com');

INSERT INTO Dentistas (idDentista, nombre, apellido, email)
VALUES (3, 'Laura', 'PÃƒÂ©rez', 'laura@example.com');

INSERT INTO Dentistas (idDentista, nombre, apellido, email)
VALUES (4, 'Carlos', 'MartÃƒÂ­nez', 'carlos@example.com');

INSERT INTO Dentistas (idDentista, nombre, apellido, email)
VALUES (5, 'Ana', 'LÃƒÂ³pez', 'ana@example.com');

-- Inserciones en la tabla "Pacientes"
INSERT INTO Pacientes (idPaciente, nombre, apellido, email)
VALUES (1, 'Alejandro', 'HernÃƒÂ¡ndez', 'alejandro@example.com');

INSERT INTO Pacientes (idPaciente, nombre, apellido, email)
VALUES (2, 'Isabel', 'SÃƒÂ¡nchez', 'isabel@example.com');

INSERT INTO Pacientes (idPaciente, nombre, apellido, email)
VALUES (3, 'Roberto', 'GarcÃƒÂ­a', 'roberto@example.com');

INSERT INTO Pacientes (idPaciente, nombre, apellido, email)
VALUES (4, 'Elena', 'DÃƒÂ­az', 'elena@example.com');

INSERT INTO Pacientes (idPaciente, nombre, apellido, email)
VALUES (5, 'Javier', 'MartÃƒÂ­n', 'javier@example.com');

-- Inserciones en la tabla "Citas"
INSERT INTO Citas (idCita, idPaciente, idDentista, idProcedimiento, fechaCita, motivo, costo)
VALUES (1, 1, 1, 1, TO_DATE('2023-08-15', 'YYYY-MM-DD'), 'Limpieza de rutina', 80.00);

INSERT INTO Citas (idCita, idPaciente, idDentista, idProcedimiento, fechaCita, motivo, costo)
VALUES (2, 2, 2, 3, TO_DATE('2023-08-18', 'YYYY-MM-DD'), 'Empaste dental', 120.00);

INSERT INTO Citas (idCita, idPaciente, idDentista, idProcedimiento, fechaCita, motivo, costo)
VALUES (3, 3, 3, 2, TO_DATE('2023-08-20', 'YYYY-MM-DD'), 'ExtracciÃƒÂ³n de muela', 150.00);

INSERT INTO Citas (idCita, idPaciente, idDentista, idProcedimiento, fechaCita, motivo, costo)
VALUES (4, 4, 4, 5, TO_DATE('2023-08-22', 'YYYY-MM-DD'), 'Blanqueamiento dental', 250.00);

INSERT INTO Citas (idCita, idPaciente, idDentista, idProcedimiento, fechaCita, motivo, costo)
VALUES (5, 5, 5, 4, TO_DATE('2023-08-25', 'YYYY-MM-DD'), 'Consulta de ortodoncia', 2000.00);


-- Recuperar todos los procedimientos
SELECT * FROM Procedimientos;

-- Recuperar todos los dentistas
SELECT * FROM Dentistas;

-- Recuperar todos los pacientes
SELECT * FROM Pacientes;

-- Recuperar todas las citas
SELECT * FROM Citas;

-- Recuperar citas para un paciente especÃ­fico
SELECT * FROM Citas WHERE idPaciente = <id_paciente>;

-- Recuperar citas para un dentista especÃ­fico
SELECT * FROM Citas WHERE idDentista = <id_dentista>;

-- Recuperar citas para un procedimiento especÃ­fico
SELECT * FROM Citas WHERE idProcedimiento = <id_procedimiento>;

-- Recuperar citas dentro de un rango de fechas
SELECT * FROM Citas WHERE fechaCita BETWEEN TO_DATE('<fecha_inicio>', 'YYYY-MM-DD') AND TO_DATE('<fecha_fin>', 'YYYY-MM-DD');

-- Recuperar el costo total de procedimientos para un paciente especÃ­fico
SELECT idPaciente, SUM(costo) AS costo_total
FROM Citas
WHERE idPaciente = <id_paciente>
GROUP BY idPaciente;

-- Recuperar el procedimiento mÃ¡s costoso
SELECT MAX(costo) AS max_costo
FROM Procedimientos;

-- Crear el usuario administrador
CREATE USER admin IDENTIFIED BY admin_password;
GRANT CONNECT, RESOURCE, DBA TO admin;

-- Crear el usuario doctor
CREATE USER doctor IDENTIFIED BY doctor_password;
GRANT CONNECT, RESOURCE TO doctor;

-- Crear el usuario cliente
CREATE USER cliente IDENTIFIED BY cliente_password;
GRANT CONNECT TO cliente;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- RESPALDOS:

/*El usuario admin tiene roles CONNECT, RESOURCE y DBA, lo que le da acceso completo a la base de datos y privilegios de administraciÃ³n.
El usuario doctor tiene roles CONNECT y RESOURCE, lo que le proporciona un acceso general a la base de datos y la capacidad de trabajar con recursos.
El usuario cliente solo tiene el rol CONNECT, lo que le permite conectarse a la base de datos.*/

-- RESPALDOS FECHA 12/08/2023;
-- RESPALDOS EN FRIO(CMD)
C:\Users\kenne>SQL PLUS /NOLOG
SQL> CONNECT /AS SYSDBA;
SQL> SHUTDOWN IMMEDIATE
SQL> EXIT
C:\Users\kenne>CD \
C:\>CD martes223
C:\>CD martes223>DIR   
C:\martes223>COPY *.DBF C:\BACKUP
C:\martes223>SQL PLUS /NOLOG
SQL> CONNECT /AS SYSDBA;   
SQL> STARTUP
SQL> EXIT
-- RESPALDOS CON EXPDP E IMPDP
-- En el CMD
C:\Users\kenne>SQL PLUS /NOLOG
SQL> CONNECT /AS SYSDBA;
SQL>CREATE DIRECTORY BACKUPPROYECTO AS  â€˜C:\RESPALDOâ€™;
SQL>GRANT WRITE ON DIRECTORY BACKUPPROYECTO TO SYSTEM;
SQL>EXIT
--En SqlDeveloper con el siguiente comando damos permisos para poder hacer una exportacion o importacion completa:
GRANT EXP_FULL_DATABASE TO SYSTEM;
GRANT IMP_FULL_DATABASE TO SYSTEM;
CREATE TABLE COPIA AS SELECT * FROM Procedimientos;
--Exportamos la tabla  con el siguiente comando:
C:\> EXPDP SYSTEM/root directory=BACKUPPROYECTO dumpfile=COPIAS.DMP tables=SYSTEM.Procedimientos
--Ã“ tambien podemos exportamos la base con el siguiente comando:
C:\> EXPDP SYSTEM/root directory=BACKUPPROYECTO dumpfile=SYSTEM.DMP SCHEMAS=SYSTEM
--Borramos la tabla en SqlDeveloper con el siguiente comando:
drop table Procedimientos;
--Importamos la tabla  con el siguiente comando:
C:\> IMPDP SYSTEM/root directory=BACKUPPROYECTO dumpfile=COPIAS.DMP tables=SYSTEM.Procedimientos
--Ã“ importamos la base con el siguiente comando:
C:\> IMPDP SYSTEM/root directory=BACKUPPROYECTO dumpfile=SYSTEM.DMP SCHEMAS=SYSTEM
-- RESPALDOS EN CALIENTE

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Seguridad (roles y otros permisos) Ignacio:


-- Crear roles
CREATE ROLE admin_role;
CREATE ROLE doctor_role;
CREATE ROLE client_role;

-- Conceder los privilegios de cada rol
-- Para admin_role
GRANT CONNECT, RESOURCE, DBA TO admin_role;

-- Para doctor_role
GRANT CONNECT, RESOURCE TO doctor_role;

-- Para client_role
GRANT CONNECT TO client_role;

-- Asignar roles a usuarios
ALTER USER admin IDENTIFIED BY admin_password;
GRANT admin_role TO admin;

ALTER USER doctor IDENTIFIED BY doctor_password;
GRANT doctor_role TO doctor;

ALTER USER cliente IDENTIFIED BY cliente_password;
GRANT client_role TO cliente;

-- Privilegio SELECT en la tabla Procedimientos al rol doctor_role
GRANT SELECT ON Procedimientos TO doctor_role;

-- Activar la auditor?a para actividades espec?ficas
AUDIT SELECT TABLE, UPDATE TABLE BY admin_role;
AUDIT INSERT TABLE, DELETE TABLE BY doctor_role;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- AUDITORIAS:


--Autorias que registre cuando se crea una tabla.
CREATE TABLE Tablas_Creadas_Auditoria (
   tabla_nombre VARCHAR2(100),
   fecha_creacion TIMESTAMP,
   usuario_creacion VARCHAR2(30)
);

CREATE OR REPLACE TRIGGER Trigger_Tabla_Creada
AFTER CREATE ON SCHEMA
DECLARE
   tabla_nombre VARCHAR2(100);
   usuario_creacion VARCHAR2(30);
BEGIN
   -- Obtener el nombre de la tabla creada
   tabla_nombre := ora_dict_obj_name;
   -- Obtener el usuario que creó la tabla
   usuario_creacion := ora_login_user;
   
   -- Insertar el registro en la tabla de auditoría
   INSERT INTO Tablas_Creadas_Auditoria (tabla_nombre, fecha_creacion, usuario_creacion)
   VALUES (tabla_nombre, CURRENT_TIMESTAMP, usuario_creacion);
   
   COMMIT;
EXCEPTION
   WHEN OTHERS THEN
      NULL; -- Manejar excepciones si es necesario
END;
/

-- Crear una nueva tabla de ejemplo
CREATE TABLE EjemploTabla (
   id NUMBER,
   nombre VARCHAR2(50)
);

-- Consultar la tabla de auditoría
SELECT * FROM Tablas_Creadas_Auditoria;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- Auditoria de usuarios creados:

--Creamos la tabla para registrar la auditoria
CREATE TABLE Usuarios_Creados_Auditoria (
   usuario_nombre VARCHAR2(30),
   fecha_creacion TIMESTAMP,
   usuario_admin VARCHAR2(30)
);

--Creamos el trigger
CREATE OR REPLACE TRIGGER Trigger_Usuario_Creado
AFTER CREATE ON SCHEMA
DECLARE
   usuario_nombre VARCHAR2(30);
   usuario_admin VARCHAR2(30);
BEGIN
   -- Obtener el nombre de usuario creado
   usuario_nombre := ora_dict_obj_name;
   -- Obtener el usuario administrador que creó el usuario
   usuario_admin := ora_login_user;
   -- Insertar el registro en la tabla de auditoría
   INSERT INTO Usuarios_Creados_Auditoria (usuario_nombre, fecha_creacion, usuario_admin)
   VALUES (usuario_nombre, CURRENT_TIMESTAMP, usuario_admin);
   
   COMMIT;
EXCEPTION
   WHEN OTHERS THEN
      NULL; -- Manejar excepciones si es necesario
END;
/
-- Crear un nuevo usuario de ejemplo
CREATE USER NuevoUsuario IDENTIFIED BY password;

-- Consultar la tabla de auditoría de usuarios creados
SELECT * FROM Usuarios_Creados_Auditoria;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--Auditoria de sesion a la base de datos:

--Creamos la tabla donde se almacena la auditoria de sesion

CREATE TABLE Sesiones_Iniciadas_Auditoria (
   usuario_nombre VARCHAR2(30),
   fecha_inicio TIMESTAMP,
   direccion_ip VARCHAR2(50)
);

--Trigger para la auditoria de sesion:

CREATE OR REPLACE TRIGGER Trigger_Sesion_Iniciada
AFTER LOGON ON DATABASE
DECLARE
   usuario_nombre VARCHAR2(30);
   direccion_ip VARCHAR2(50);
BEGIN
   -- Obtener el nombre de usuario que inició sesión
   usuario_nombre := ora_login_user;
   -- Obtener la dirección IP del cliente
   direccion_ip := SYS_CONTEXT('USERENV', 'IP_ADDRESS');
   
   -- Insertar el registro en la tabla de auditoría
   INSERT INTO Sesiones_Iniciadas_Auditoria (usuario_nombre, fecha_inicio, direccion_ip)
   VALUES (usuario_nombre, CURRENT_TIMESTAMP, direccion_ip);
   
   COMMIT;
EXCEPTION
   WHEN OTHERS THEN
      NULL; -- Manejar excepciones si es necesario
END;
/

-- Consultar la tabla de auditoría de sesiones iniciadas
SELECT * FROM Sesiones_Iniciadas_Auditoria;



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

CREATE TABLE Acciones_Auditoria (
   accion_nombre VARCHAR2(100),
   fecha_accion TIMESTAMP,
   usuario_ejecutor VARCHAR2(30)
);


CREATE OR REPLACE TRIGGER Trigger_Eliminacion_Tabla
AFTER DROP ON SCHEMA
DECLARE
   tabla_eliminada VARCHAR2(100);
   usuario_ejecutor VARCHAR2(30);
BEGIN
   -- Obtener el nombre de la tabla eliminada
   tabla_eliminada := ora_dict_obj_name;
   -- Obtener el usuario que ejecutó la acción
   usuario_ejecutor := ora_login_user;
   
   -- Insertar el registro en la tabla de auditoría
   INSERT INTO Acciones_Auditoria (accion_nombre, fecha_accion, usuario_ejecutor)
   VALUES ('Tabla eliminada: ' || tabla_eliminada, CURRENT_TIMESTAMP, usuario_ejecutor);
   
   COMMIT;
EXCEPTION
   WHEN OTHERS THEN
      NULL; -- Manejar excepciones si es necesario
END;
/
--Crear tabla de ejemplo:
CREATE TABLE PRUEBA_AUDITORIA_BORRAR (
   accion_nombre VARCHAR2(100),
   fecha_accion TIMESTAMP,
   usuario_ejecutor VARCHAR2(30)
);

-- Eliminar una tabla de ejemplo:
DROP TABLE PRUEBA_AUDITORIA_BORRAR;

-- Consultar la tabla de auditoría de acciones
SELECT * FROM Acciones_Auditoria;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- Consultar las opciones de auditoría habilitadas
SELECT * FROM DBA_PRIV_AUDIT_OPTS;

--

-- 1. Habilitar la auditoría de creación de sesión para capturar la creación de usuarios
AUDIT CREATE SESSION;
-- 2. Crear una política de auditoría para filtrar eventos de creación de usuarios
AUDIT POLICY Create_User_Policy;
-- 3. Habilitar la política de auditoría de creación de usuario
ALTER SYSTEM SET AUDIT_SYS_OPERATIONS=TRUE SCOPE=SPFILE;
-- 4. Reiniciar la base de datos para aplicar los cambios
SHUTDOWN IMMEDIATE
STARTUP
-- 5. Consultar la vista de auditoría para obtener información sobre la creación de usuarios
SELECT * FROM DBA_AUDIT_TRAIL WHERE ACTION_NAME = 'LOGON';


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- Auditoria sin Triggers para auditar la creacion de roles:

-- 1. Habilitar la auditoría de creación de roles
AUDIT CREATE ROLE;

-- 2. Habilitar la auditoría de uso de roles para capturar el cambio de roles
AUDIT ROLE;

-- 3. Habilitar la auditoría de políticas para capturar los cambios de roles
AUDIT POLICY Roles_Policy;

-- 4. Habilitar la auditoría de políticas para capturar el uso de roles
AUDIT POLICY Roles_Usage_Policy;

-- 5. Habilitar las políticas de auditoría en el nivel del sistema
ALTER SYSTEM SET AUDIT_SYS_OPERATIONS=TRUE SCOPE=SPFILE;

-- 6: Reiniciar la base de datos.

-- Crear un nuevo rol
CREATE ROLE MiNuevoRol;

--Crear usuario para asignarle el nuevo rol, al nuevo usuario
CREATE USER MiNuevoUsuario IDENTIFIED BY contraseña;

-- Asignar el nuevo rol a un usuario
GRANT MiNuevoRol TO MiNuevoUsuario;

-- 7. Consultar la vista de auditoría para obtener información sobre la creación y el uso de roles
SELECT * FROM DBA_AUDIT_TRAIL WHERE ACTION_NAME = 'CREATE ROLE' OR ACTION_NAME = 'GRANT ROLE';




