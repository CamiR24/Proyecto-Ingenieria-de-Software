create table empleados(
	id serial primary key,
	nombre varchar(100) not null,
	fecha_nacimiento date not null,
	DPI int not null unique,
	IGGS boolean not null,
	afiliacion_IGSS int null unique,
	NIT varchar(25) null unique,
	cuenta_bancaria varchar(25) not null unique,
	id_empresa int not null references Empresas(id),
	id_departamento int not null references Departamentos(id),
	id_puesto int not null references Puestos(id),
	salario_base numeric(10,2) not null,
	horas_base numeric(10,2) not null default 9,
	metodo_pago varchar(25) not null
);

create table Empresas(
	id serial primary key,
  	nombre varchar(50) not null,
  	descripcion text null
);

create table Sucursales(
  	id serial primary key,
  	id_empresa int not null references Empresas(id),
  	direccion varchar(250) not null unique 
);

create table Departamentos(
  	id serial primary key,
  	nombre varchar(100) not null
);

create table Puestos(
  	id serial primary key,
  	nombre varchar(50) not null
);
	
create table Pagos(
  	id serial primary key,
  	id_empleado int not null references Empleados(id),
  	fecha timestamp not null default current_timestamp,
  	salario_quincena numeric(10,2) not null,
  	salario_total_quincena numeric(10,2) not null,
  	tipo_extra varchar(50) null,
  	monto_extra numeric(10,2) null
);

CREATE TABLE Bitacoras (
    id serial primary key,
    id_empleado int not null references Empleados(id),
    id_mes int not null references Meses(id),
    id_dia int not null references Dias(id),
    hora_ingreso timestamp null,
    hora_salida timestamp null,
    check (hora_ingreso is null or hora_salida is null or hora_ingreso < hora_salida),
    diferencia_horas numeric(10,2) null
);

create table Meses(
	  id serial primary key,
	  nombre varchar(50) not null
);

create table Dias(
	  id serial primary key,
	  nombre varchar(50) not null
);

create table Historico_salarios(
	  id serial primary key,
	  id_empleado int not null references Empleados(id),
	  salario numeric(10,2) not null,
	  fecha timestamp not null default current_timestamp 
);

create table Horario_empleados(
	  id serial primary key,
	  id_empleado int not null references Empleados(id),
	  id_dia int not null references Dias(id),
	  hora_inicio timestamp not null,
	  hora_fin timestamp not null
);

create table Tipo_ausencias(
	  id serial primary key,
	  motivo varchar(250) not null,
	  descuenta boolean 
);

create table Ausencias(
	  id serial primary key,
	  id_tipo_ausencia int not null references Tipo_ausencias(id),
	  salario_descontado numeric(10,2) null,
	  fecha_inicio timestamp not null,
	  fecha_fin timestamp not null
);

create table Permisos(
	  id serial primary key,
	  id_empleado int not null references Empleados(id),
	  id_ausencia int not null references Ausencias(id),
	  aprobado boolean not null,
	  fecha_inicio timestamp not null,
	  fecha_fin timestamp not null,
	  descripcion text null
);
