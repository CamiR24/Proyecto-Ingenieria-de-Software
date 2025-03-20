-- 1. En la tabla Empleados: se agregan restricciones para asegurar que la fecha de nacimiento sea anterior a la fecha actual y que el salario y horas base sean positivos.
ALTER TABLE Empleados
    ADD CONSTRAINT chk_fecha_nacimiento CHECK (fecha_nacimiento < current_date),
    ADD CONSTRAINT chk_salario_base CHECK (salario_base > 0),
    ADD CONSTRAINT chk_horas_base CHECK (horas_base > 0);

-- 2. En la tabla Pagos: se renombra la columna salario_quincena y se agregan restricciones para asegurar que el salario total quincenal no sea inferior al salario base quincenal, y que el monto extra sea no negativo.
ALTER TABLE Pagos RENAME COLUMN salario_quincena TO salario_base_quincena;

ALTER TABLE Pagos
    ADD CONSTRAINT chk_salario_total_quincena CHECK (salario_total_quincena >= salario_base_quincena),
    ADD CONSTRAINT chk_monto_extra CHECK (monto_extra >= 0);

-- 3. En la tabla Bitacoras: se añade una restricción para que la diferencia de horas, cuando se registre, sea mayor o igual a cero.
ALTER TABLE Bitacoras
    ADD CONSTRAINT chk_diferencia_horas CHECK (diferencia_horas >= 0);

-- 4. En la tabla Horario_empleados: se agrega una restricción para garantizar que la hora de inicio sea menor que la hora de fin.
ALTER TABLE Horario_empleados
    ADD CONSTRAINT chk_horario CHECK (hora_inicio < hora_fin);

-- 5. En la tabla Ausencias: se agrega una restricción para asegurar que la fecha de inicio sea anterior a la fecha de fin y que el salario descontado (si se aplica) sea no negativo.
ALTER TABLE Ausencias
    ADD CONSTRAINT chk_ausencias_fechas CHECK (fecha_inicio < fecha_fin),
    ADD CONSTRAINT chk_salario_descontado CHECK (salario_descontado >= 0);

-- 6. En la tabla Permisos: se añade una restricción para garantizar que la fecha de inicio sea menor que la fecha de fin.
ALTER TABLE Permisos
    ADD CONSTRAINT chk_permisos_fechas CHECK (fecha_inicio < fecha_fin);
