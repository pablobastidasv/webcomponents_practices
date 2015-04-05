create SCHEMA if not exists prueba_seguridad;
create SCHEMA if not exists prueba_parametros;

create table prueba_parametros.tipo_documento(
  id varchar(2) primary key,
  descripcion varchar(50) not null
);

create table prueba_seguridad.usuario(
  id int primary key auto_increment,
  tipo_documento varchar(2) not null,
  numero_documento varchar(20) not null,
  nombres varchar(100) not null,
  apellidos varchar(100) not null,
  email varchar(200) not null,
  direccion varchar(300) not null,
  telefono varchar(20) not null,
  username varchar(20) not null,
  password varchar(100) not null
);

alter table prueba_seguridad.usuario add CONSTRAINT fk_usuario_tipo_documento FOREIGN KEY (tipo_documento) REFERENCES prueba_parametros.tipo_documento(id);
ALTER TABLE prueba_seguridad.usuario ADD CONSTRAINT uq_usuario_username UNIQUE (username);

create table prueba_seguridad.rol(
  id varchar(10) PRIMARY KEY ,
  descripcion VARCHAR(50) not null
);

create table prueba_seguridad.usuario_x_rol(
  id_usuario int not null,
  id_rol varchar(10) not null
);

alter table prueba_seguridad.usuario_x_rol ADD CONSTRAINT pk_usuario_x_rol PRIMARY KEY (id_usuario, id_rol);
alter table prueba_seguridad.usuario_x_rol ADD CONSTRAINT fk_usuario_x_rol_usuario FOREIGN KEY (id_usuario) REFERENCES prueba_seguridad.usuario(id);
alter table prueba_seguridad.usuario_x_rol ADD CONSTRAINT fk_usuario_x_rol_rol FOREIGN KEY (id_rol) REFERENCES prueba_seguridad.rol(id);

insert into prueba_parametros.tipo_documento(id, descripcion) VALUES ('CC', 'Cédula de ciudadanía');
insert into prueba_parametros.tipo_documento(id, descripcion) VALUES ('CE', 'Cédula de extrangería');
insert into prueba_parametros.tipo_documento(id, descripcion) VALUES ('TI', 'Tarjeta de identidad');

insert into prueba_seguridad.rol(id, descripcion) VALUES ('ADMIN', 'Administrador del sistema');
insert into prueba_seguridad.rol(id, descripcion) VALUES ('USUARIO', 'Usuario básico del sistema');
insert into prueba_seguridad.rol(id, descripcion) VALUES ('CONTADOR', 'Usuario que utiliza modulos de contabilidad');

insert into prueba_seguridad.usuario(tipo_documento, numero_documento, nombres, apellidos, email, direccion, telefono, username, password)
  VALUES ('CC', '123456789', 'Pablo', 'Bastidas V.', 'pablobastidasv@gmail.com', 'Av Siempre Viva 123', '3454345687', 'pbastidas', '123');

insert into prueba_seguridad.usuario_x_rol(id_usuario, id_rol) VALUES (LAST_INSERT_ID(), 'ADMIN');
