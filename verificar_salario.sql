DELIMITER $$

create trigger salario_verificar
before insert on empleado
for each row
BEGIN
	DECLARE salario_presidente INT;
    
    select salario into salario_presidente
    from empleado
    where oficio = 'presidente'
    order by salario desc
    limit 1;
    
    IF NEW.salario > salario_presidente then
		signal sqlstate '45000'
        set message_text = 'El nuevo empleado no puede tener un salario mayor al del presidente';
	END IF;
END;
delimiter;

INSERT INTO empleado VALUES ('281-160483-0005F', 'Juan Gabriel Jesus', 30, 'Vendedor', 'León', '1983-05-12', 16000, 0, 40);

