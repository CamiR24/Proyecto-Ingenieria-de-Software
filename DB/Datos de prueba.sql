-- Empresas
INSERT INTO Empresas (nombre, descripcion) VALUES
('Tech Solutions', 'Empresa de software'),
('Innova Corp', 'Consultoría en negocios'),
('Salud Vida', 'Clínica de especialidades'),
('EcoMarket', 'Supermercado ecológico'),
('RedCom', 'Empresa de telecomunicaciones'),
('AutoParts', 'Venta de autopartes'),
('Constructora Alfa', 'Construcción de edificios'),
('ElectroHogar', 'Electrodomésticos y muebles'),
('Fashion Trend', 'Ropa y accesorios de moda'),
('Green Energy', 'Energías renovables');

-- Sucursales
INSERT INTO Sucursales (id_empresa, direccion) VALUES
(1, 'Av. Reforma 123'),
(2, 'Zona 10, Edificio Central'),
(3, 'Boulevard Los Próceres'),
(4, 'Calzada Roosevelt 25-50'),
(5, 'Zona 1, Centro Histórico'),
(6, 'Km 15 Carretera al Atlántico'),
(7, 'Zona 12, Calzada Atanasio'),
(8, 'Centro Comercial MegaPlaza'),
(9, 'Plaza Fashion Mall'),
(10, 'Zona 14, Edificio Verde');

-- Departamentos
INSERT INTO Departamentos (nombre) VALUES
('Recursos Humanos'),
('TI'),
('Finanzas'),
('Ventas'),
('Atención al Cliente'),
('Producción'),
('Logística'),
('Marketing'),
('Investigación y Desarrollo'),
('Legal');

-- Puestos
INSERT INTO Puestos (nombre) VALUES
('Gerente'),
('Analista'),
('Técnico'),
('Asesor de Ventas'),
('Atención al Cliente'),
('Operario'),
('Supervisor'),
('Investigador'),
('Diseñador Gráfico'),
('Abogado');

-- Empleados
INSERT INTO empleados (nombre, fecha_nacimiento, DPI, IGGS, afiliacion_IGSS, NIT, cuenta_bancaria, id_empresa, id_departamento, id_puesto, salario_base, metodo_pago) VALUES
('Juan Pérez', '1990-05-15', 1234567890123, TRUE, 56789, '1234-567890-123-4', '00123456789', 1, 2, 1, 8000.00, 'Transferencia'),
('María López', '1985-07-10', 9876543210123, TRUE, 67890, '9876-543210-123-4', '00234567890', 2, 3, 2, 7500.00, 'Cheque'),
('Carlos Gómez', '1992-03-25', 1122334455667, FALSE, NULL, '1122-334455-123-4', '00345678901', 3, 4, 3, 6500.00, 'Efectivo'),
('Ana Martínez', '1995-09-18', 2233445566778, TRUE, 34567, '2233-445566-123-4', '00456789012', 4, 5, 4, 5000.00, 'Transferencia'),
('Luis Rodríguez', '1988-12-05', 3344556677889, TRUE, 45678, '3344-556677-123-4', '00567890123', 5, 6, 5, 7000.00, 'Cheque'),
('Sofía Castro', '1993-08-20', 4455667788990, FALSE, NULL, '4455-667788-123-4', '00678901234', 6, 7, 6, 6200.00, 'Efectivo'),
('Javier Morales', '1991-11-11', 5566778899001, TRUE, 56789, '5566-778899-123-4', '00789012345', 7, 8, 7, 9000.00, 'Transferencia'),
('Gabriela Ruiz', '1987-06-30', 6677889900112, TRUE, 67890, '6677-889900-123-4', '00890123456', 8, 9, 8, 5500.00, 'Cheque'),
('Diego Fernández', '1996-04-22', 7788990011223, FALSE, NULL, '7788-990011-123-4', '00901234567', 9, 10, 9, 5800.00, 'Efectivo'),
('Andrea Herrera', '1994-02-14', 8899001122334, TRUE, 78901, '8899-001122-123-4', '01012345678', 10, 1, 10, 8100.00, 'Transferencia');
select * from empleados;

-- Meses
INSERT INTO Meses (nombre) VALUES
('Enero'), ('Febrero'), ('Marzo'), ('Abril'), ('Mayo'), ('Junio'),
('Julio'), ('Agosto'), ('Septiembre'), ('Octubre'), ('Noviembre'), ('Diciembre');

-- Días
INSERT INTO Dias (nombre) VALUES
('Lunes'), ('Martes'), ('Miércoles'), ('Jueves'), ('Viernes'), ('Sábado'), ('Domingo');

-- Pagos
INSERT INTO Pagos (id_empleado, salario_quincena, salario_total_quincena, tipo_extra, monto_extra) VALUES
(1, 4000.00, 4200.00, 'Bono', 200.00),
(2, 3750.00, 3750.00, NULL, NULL),
(3, 3250.00, 3400.00, 'Horas Extra', 150.00),
(4, 2500.00, 2500.00, NULL, NULL),
(5, 3500.00, 3650.00, 'Comisión', 150.00),
(6, 3100.00, 3100.00, NULL, NULL),
(7, 4500.00, 4800.00, 'Bono', 300.00),
(8, 2750.00, 2750.00, NULL, NULL),
(9, 2900.00, 3050.00, 'Horas Extra', 150.00),
(10, 4050.00, 4050.00, NULL, NULL);

-- Histórico de salarios
INSERT INTO Historico_salarios (id_empleado, salario) VALUES
(1, 8000.00), (2, 7500.00), (3, 6500.00), (4, 5000.00), (5, 7000.00),
(6, 6200.00), (7, 9000.00), (8, 5500.00), (9, 5800.00), (10, 8100.00);

-- Tipo de Ausencias
INSERT INTO Tipo_ausencias (motivo, descuenta) VALUES
('Enfermedad', TRUE),
('Vacaciones', FALSE),
('Permiso personal', TRUE),
('Asuntos familiares', TRUE),
('Estudio', FALSE),
('Reposo médico', TRUE),
('Maternidad/Paternidad', FALSE),
('Citación judicial', FALSE),
('Emergencia', TRUE),
('Día libre', FALSE);

-- Ausencias
INSERT INTO Ausencias (id_tipo_ausencia, salario_descontado, fecha_inicio, fecha_fin) VALUES
(1, 200.00, '2025-03-01', '2025-03-02'),
(2, NULL, '2025-03-10', '2025-03-20'),
(3, 150.00, '2025-04-05', '2025-04-05'),
(4, 100.00, '2025-05-15', '2025-05-16'),
(5, NULL, '2025-06-01', '2025-06-07'),
(6, 300.00, '2025-07-01', '2025-07-03'),
(7, NULL, '2025-08-01', '2025-08-30'),
(8, NULL, '2025-09-15', '2025-09-15'),
(9, 250.00, '2025-10-05', '2025-10-06'),
(10, NULL, '2025-11-20', '2025-11-20');

