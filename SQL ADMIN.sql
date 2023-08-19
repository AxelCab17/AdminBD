--Se crea Repositorio ADMIN BD

-- alter session set "_ORACLE_SCRIPT" = TRUE;

-- CreaciÃ³n de Tablespaces
CREATE TABLESPACE TS_PROCEDIMIENTOS 
DATAFILE 'C:\xampp\htdocs\AdminBD\Procedimientos01.dbf' SIZE 50M AUTOEXTEND ON;

CREATE TABLESPACE TS_DENTISTAS 
DATAFILE 'C:\xampp\htdocs\AdminBD\Dentistas01.dbf' SIZE 50M AUTOEXTEND ON;

CREATE TABLESPACE TS_PACIENTES 
DATAFILE 'C:\xampp\htdocs\AdminBD\Pacientes01.dbf' SIZE 50M AUTOEXTEND ON;

CREATE TABLESPACE TS_CITAS 
DATAFILE 'C:\xampp\htdocs\AdminBD\Citas01.dbf' SIZE 100M AUTOEXTEND ON;

-- CreaciÃ³n de Tablas
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

-- CreaciÃ³n de Ã?ndices
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
VALUES (1, 'Limpieza Dental', 'RemociÃ³n de placa y sarro', 80.00);

INSERT INTO Procedimientos (idProcedimiento, nombre, descripcion, costo)
VALUES (2, 'ExtracciÃ³n de Muela', 'ExtracciÃ³n de muela daÃ±ada', 150.00);

INSERT INTO Procedimientos (idProcedimiento, nombre, descripcion, costo)
VALUES (3, 'Empaste Dental', 'Rellenar cavidades con material restaurador', 120.00);

INSERT INTO Procedimientos (idProcedimiento, nombre, descripcion, costo)
VALUES (4, 'Ortodoncia', 'AlineaciÃ³n de dientes y mandÃ­bula', 2000.00);

INSERT INTO Procedimientos (idProcedimiento, nombre, descripcion, costo)
VALUES (5, 'Blanqueamiento Dental', 'Aclarar el color de los dientes', 250.00);

-- Inserciones en la tabla "Dentistas"
INSERT INTO Dentistas (idDentista, nombre, apellido, email)
VALUES (1, 'MarÃ­a', 'GÃ³mez', 'maria@example.com');

INSERT INTO Dentistas (idDentista, nombre, apellido, email)
VALUES (2, 'Juan', 'RodrÃ­guez', 'juan@example.com');

INSERT INTO Dentistas (idDentista, nombre, apellido, email)
VALUES (3, 'Laura', 'PÃ©rez', 'laura@example.com');

INSERT INTO Dentistas (idDentista, nombre, apellido, email)
VALUES (4, 'Carlos', 'MartÃ­nez', 'carlos@example.com');

INSERT INTO Dentistas (idDentista, nombre, apellido, email)
VALUES (5, 'Ana', 'LÃ³pez', 'ana@example.com');

-- Inserciones en la tabla "Pacientes"
INSERT INTO Pacientes (idPaciente, nombre, apellido, email)
VALUES (1, 'Alejandro', 'HernÃ¡ndez', 'alejandro@example.com');

INSERT INTO Pacientes (idPaciente, nombre, apellido, email)
VALUES (2, 'Isabel', 'SÃ¡nchez', 'isabel@example.com');

INSERT INTO Pacientes (idPaciente, nombre, apellido, email)
VALUES (3, 'Roberto', 'GarcÃ­a', 'roberto@example.com');

INSERT INTO Pacientes (idPaciente, nombre, apellido, email)
VALUES (4, 'Elena', 'DÃ­az', 'elena@example.com');

INSERT INTO Pacientes (idPaciente, nombre, apellido, email)
VALUES (5, 'Javier', 'MartÃ­n', 'javier@example.com');

-- Inserciones en la tabla "Citas"
INSERT INTO Citas (idCita, idPaciente, idDentista, idProcedimiento, fechaCita, motivo, costo)
VALUES (1, 1, 1, 1, TO_DATE('2023-08-15', 'YYYY-MM-DD'), 'Limpieza de rutina', 80.00);

INSERT INTO Citas (idCita, idPaciente, idDentista, idProcedimiento, fechaCita, motivo, costo)
VALUES (2, 2, 2, 3, TO_DATE('2023-08-18', 'YYYY-MM-DD'), 'Empaste dental', 120.00);

INSERT INTO Citas (idCita, idPaciente, idDentista, idProcedimiento, fechaCita, motivo, costo)
VALUES (3, 3, 3, 2, TO_DATE('2023-08-20', 'YYYY-MM-DD'), 'ExtracciÃ³n de muela', 150.00);

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

-- Recuperar citas para un paciente específico
SELECT * FROM Citas WHERE idPaciente = 1;

-- Recuperar citas para un dentista específico
SELECT * FROM Citas WHERE idDentista = 2;

-- Recuperar citas para un procedimiento específico
SELECT * FROM Citas WHERE idProcedimiento = 4;

-- Recuperar citas dentro de un rango de fechas
SELECT * FROM Citas WHERE fechaCita BETWEEN TO_DATE('2023-08-15', 'YYYY-MM-DD') AND TO_DATE('2023-08-20', 'YYYY-MM-DD');

-- Recuperar el costo total de procedimientos para un paciente específico
SELECT idPaciente, SUM(costo) AS costo_total
FROM Citas
WHERE idPaciente = 2
GROUP BY idPaciente;

-- Recuperar el procedimiento más costoso
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
SELECT username FROM dba_users; -- O tambi�n puedes usar all_users


-- Visualizar todos los usuarios de la BD:
SET SERVEROUTPUT ON;
DECLARE
  v_username VARCHAR2(30);
BEGIN
  FOR user_rec IN (SELECT username FROM all_users) LOOP
    v_username := user_rec.username;
    DBMS_OUTPUT.PUT_LINE('Usuario: ' || v_username);
  END LOOP;
END;
/

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- RESPALDOS:

/*El usuario admin tiene roles CONNECT, RESOURCE y DBA, lo que le da acceso completo a la base de datos y privilegios de administración.
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
SQL>CREATE DIRECTORY BACKUPPROYECTO AS  ‘C:\RESPALDO’;
SQL>GRANT WRITE ON DIRECTORY BACKUPPROYECTO TO SYSTEM;
SQL>EXIT

--En SqlDeveloper con el siguiente comando damos permisos para poder hacer una exportacion o importacion completa:
GRANT EXP_FULL_DATABASE TO SYSTEM;
GRANT IMP_FULL_DATABASE TO SYSTEM;
CREATE TABLE COPIA AS SELECT * FROM Procedimientos;

--Exportamos la tabla  con el siguiente comando:
C:\> EXPDP SYSTEM/root directory=BACKUPPROYECTO dumpfile=COPIAS.DMP tables=SYSTEM.Procedimientos
--Ó tambien podemos exportamos la base con el siguiente comando:
C:\> EXPDP SYSTEM/root directory=BACKUPPROYECTO dumpfile=SYSTEM.DMP SCHEMAS=SYSTEM
--Borramos la tabla en SqlDeveloper con el siguiente comando:
drop table Procedimientos;
--Importamos la tabla  con el siguiente comando:
C:\> IMPDP SYSTEM/root directory=BACKUPPROYECTO dumpfile=COPIAS.DMP tables=SYSTEM.Procedimientos
--Ó importamos la base con el siguiente comando:
C:\> IMPDP SYSTEM/root directory=BACKUPPROYECTO dumpfile=SYSTEM.DMP SCHEMAS=SYSTEM
-- RESPALDOS EN CALIENTE

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Seguridad (roles y otros permisos) Ignacio:

-- Crear roles
CREATE ROLE admin_role2;
CREATE ROLE doctor_role;
CREATE ROLE client_role;

-- Visualizar los roles:
SET SERVEROUTPUT ON;
DECLARE
  v_role_name VARCHAR2(30);
BEGIN
  FOR role_rec IN (SELECT role FROM dba_roles) LOOP
    v_role_name := role_rec.role;
    DBMS_OUTPUT.PUT_LINE('Rol: ' || v_role_name);
  END LOOP;
END;
/

-- Conceder los privilegios de cada rol:
-- Para admin_role
GRANT CONNECT, RESOURCE, DBA TO admin_role2;

-- Para doctor_role
GRANT CONNECT, RESOURCE TO doctor_role;

-- Para client_role
GRANT CONNECT TO client_role;

--Visualizar los permisos de cada rol:
DECLARE
  v_role_name VARCHAR2(30);
  v_privilege VARCHAR2(100);
BEGIN
  FOR role_rec IN (SELECT grantee, granted_role FROM dba_role_privs) LOOP
    v_role_name := role_rec.granted_role;
    v_privilege := role_rec.grantee;
    DBMS_OUTPUT.PUT_LINE('Rol: ' || v_role_name || ', Otorgado a: ' || v_privilege);
  END LOOP;
END;
/
/*
Rol: DOCTOR_ROLE, Otorgado a: ADMINISTRACION
Rol: ADMIN_ROLE2, Otorgado a: ADMINISTRACION
*/


-- Asignar roles a usuarios:
ALTER USER admin IDENTIFIED BY admin_password;
GRANT admin_role2 TO admin;

ALTER USER doctor IDENTIFIED BY doctor_password;
GRANT doctor_role TO doctor;

ALTER USER cliente IDENTIFIED BY cliente_password;
GRANT client_role TO cliente;

-- Visualizar el usuario y su rol asignado:
DECLARE
  v_user_name VARCHAR2(30);
  v_role_name VARCHAR2(30);
BEGIN
  FOR user_role_rec IN (SELECT grantee AS username, granted_role FROM dba_role_privs) LOOP
    v_user_name := user_role_rec.username;
    v_role_name := user_role_rec.granted_role;
    DBMS_OUTPUT.PUT_LINE('Usuario: ' || v_user_name || ', Rol: ' || v_role_name);
  END LOOP;
END;
/

-- Privilegio SELECT en la tabla Procedimientos al rol doctor_role
GRANT SELECT ON Procedimientos TO doctor_role;

-- Activar la auditor�a para actividades espec?ficas:
-- Para el usuario admin_role2
AUDIT SELECT TABLE, UPDATE TABLE BY admin;
AUDIT INSERT TABLE, DELETE TABLE BY admin;

-- Para el usuario doctor_role
AUDIT SELECT TABLE, UPDATE TABLE BY doctor;
AUDIT INSERT TABLE, DELETE TABLE BY doctor;


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
   -- Obtener el usuario que cre� la tabla
   usuario_creacion := ora_login_user;
   
   -- Insertar el registro en la tabla de auditor�a
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
-- Consultar la tabla de auditor�a
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
   -- Obtener el usuario administrador que cre� el usuario
   usuario_admin := ora_login_user;
   -- Insertar el registro en la tabla de auditor�a
   INSERT INTO Usuarios_Creados_Auditoria (usuario_nombre, fecha_creacion, usuario_admin)
   VALUES (usuario_nombre, CURRENT_TIMESTAMP, usuario_admin);
   
   COMMIT;
EXCEPTION
   WHEN OTHERS THEN
      NULL; -- Manejar excepciones si es necesario
END;
/
-- Crear un nuevo usuario de ejemplo
CREATE USER Nuevo123USUARIO IDENTIFIED BY password;
--DROP USER Nuevo123USUARIO CASCADE;

-- Consultar la tabla de auditor�a de usuarios creados
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
   -- Obtener el nombre de usuario que inici� sesi�n
   usuario_nombre := ora_login_user;
   -- Obtener la direcci�n IP del cliente
   direccion_ip := SYS_CONTEXT('USERENV', 'IP_ADDRESS');
   -- Insertar el registro en la tabla de auditor�a
   INSERT INTO Sesiones_Iniciadas_Auditoria (usuario_nombre, fecha_inicio, direccion_ip)
   VALUES (usuario_nombre, CURRENT_TIMESTAMP, direccion_ip);
   COMMIT;
EXCEPTION
   WHEN OTHERS THEN
      NULL; -- Manejar excepciones si es necesario
END;
/

-- Consultar la tabla de auditor�a de sesiones iniciadas
SELECT * FROM Sesiones_Iniciadas_Auditoria;



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- Auditoria con trigger sobre una accion de una tabla:
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
   -- Obtener el usuario que ejecut� la acci�n
   usuario_ejecutor := ora_login_user;
   
   -- Insertar el registro en la tabla de auditor�a
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

-- Consultar la tabla de auditor�a de acciones
SELECT * FROM Acciones_Auditoria;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


--Configuraci�n y Auditor�a de Sesiones:

-- Ver todas las opciones de auditorias habilitadas en la Base de Datos:
SELECT * FROM DBA_PRIV_AUDIT_OPTS;

-- Habilitar la auditor�a de todas las sesiones a la Base de Datos:
AUDIT CREATE SESSION;

-- Reiniciar la base de datos para aplicar los cambios.

-- Consultar la vista de auditor�a sobre iniciar sesi�n:
SELECT * FROM DBA_AUDIT_TRAIL WHERE ACTION_NAME = 'LOGON';


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- Auditoria sin Triggers para registrar la creacion de Roles:

-- 1. Habilitar la auditor�a de creaci�n de roles
AUDIT CREATE ROLE;

-- 2. Habilitar la auditor�a de uso de roles para capturar el cambio de roles
AUDIT ROLE;

--3. habilitar o deshabilitar la auditor�a de operaciones del sistema en Oracle
ALTER SYSTEM SET AUDIT_SYS_OPERATIONS=TRUE SCOPE=SPFILE;

-- 4: Reiniciar la base de datos.

-- Crear un nuevo rol
CREATE ROLE MiNuevoRol;
--DROP ROLE MiNuevoRol;

--Crear usuario para asignarle el nuevo rol, al nuevo usuario
CREATE USER MiNuevoUsuario IDENTIFIED BY contrase�a;
--DROP USER MiNuevoUsuario CASCADE;

-- Asignar el nuevo rol a un usuario
GRANT MiNuevoRol TO MiNuevoUsuario;

-- 7. Visualizar la informaci�n de la auditor�a para ver los roles creados.
SELECT * FROM DBA_AUDIT_TRAIL WHERE ACTION_NAME = 'CREATE ROLE' OR ACTION_NAME = 'GRANT ROLE';


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- Auditoria sin Triggers para registrar la creacion de Usuarios:

-- Habilitar la auditor�a de creaci�n de usuarios
AUDIT CREATE USER;

-- Habilitar la auditor�a de asignaci�n de roles
AUDIT ROLE;

-- Habilitar las pol�ticas de auditor�a en el nivel del sistema
ALTER SYSTEM SET AUDIT_SYS_OPERATIONS=TRUE SCOPE=SPFILE;

-- Crear un nuevo usuario
CREATE USER PRUEBAFINAL IDENTIFIED BY contrase�a;
--DROP USER MiNuevoUsuario CASCADE; 

-- Asignar un nuevo rol a un usuario
GRANT MiNuevoRol TO PRUEBAFINAL;

-- Visualizar la informaci�n de la auditor�a para ver los usuarios creados y asignaciones de roles
SELECT * FROM DBA_AUDIT_TRAIL WHERE ACTION_NAME = 'CREATE USER' OR ACTION_NAME = 'GRANT ROLE';


