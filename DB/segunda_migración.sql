DROP TABLE IF EXISTS Historico_salarios;
DROP TABLE IF EXISTS Pagos;
DROP TABLE IF EXISTS Ausencias;
DROP TABLE IF EXISTS Tipo_ausencias;
DROP TABLE IF EXISTS Dias;
DROP TABLE IF EXISTS Meses;
DROP TABLE IF EXISTS Sucursales;
DROP TABLE IF EXISTS Empleados;
DROP TABLE IF EXISTS Puestos;
DROP TABLE IF EXISTS Departamentos;
DROP TABLE IF EXISTS Empresas;

CREATE TABLE IF NOT EXISTS Empresas (
    id_empresa SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Departamentos (
    id_departamento SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Puestos (
    id_puesto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Empleados (
    id_empleado SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fecha_nacimiento DATE,
    DPI BIGINT,
    IGGS BOOLEAN,
    afiliacion_IGSS INT,
    NIT VARCHAR(50),
    cuenta_bancaria VARCHAR(50),
    id_empresa INT,
    id_departamento INT,
    id_puesto INT,
    salario_base DECIMAL(10,2),
    metodo_pago VARCHAR(50),
    FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa),
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento),
    FOREIGN KEY (id_puesto) REFERENCES Puestos(id_puesto)
);

CREATE TABLE IF NOT EXISTS Sucursales (
    id_sucursal SERIAL PRIMARY KEY,
    id_empresa INT,
    direccion VARCHAR(255),
    FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa)
);

CREATE TABLE IF NOT EXISTS Meses (
    id_mes SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Dias (
    id_dia SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Tipo_ausencias (
    id_tipo_ausencia SERIAL PRIMARY KEY,
    motivo VARCHAR(255) NOT NULL,
    descuenta BOOLEAN
);

CREATE TABLE IF NOT EXISTS Ausencias (
    id_ausencia SERIAL PRIMARY KEY,
    id_tipo_ausencia INT,
    salario_descontado DECIMAL(10,2),
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (id_tipo_ausencia) REFERENCES Tipo_ausencias(id_tipo_ausencia)
);

CREATE TABLE IF NOT EXISTS Pagos (
    id_pago SERIAL PRIMARY KEY,
    id_empleado INT,
    salario_quincena DECIMAL(10,2),
    salario_total_quincena DECIMAL(10,2),
    tipo_extra VARCHAR(50),
    monto_extra DECIMAL(10,2),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);

CREATE TABLE IF NOT EXISTS Historico_salarios (
    id_historial SERIAL PRIMARY KEY,
    id_empleado INT,
    salario DECIMAL(10,2),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);