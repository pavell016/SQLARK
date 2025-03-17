
  -- trigers
		-- On insert
        delimiter $$
        drop trigger OnInsert $$
        create trigger OnInsert after insert on persona
        for each row
        begin
			set @auc = concat('Se ha añadido un nuevo usuario con ID: ', new.id, ' y DNI: ', new.dni);
			insert into log values (null, @auc);
        end $$
        delimiter ;
        -- On Insert END
  
		-- On update
		delimiter $$
        drop trigger OnUpdate $$
        create trigger OnUpdate after update on persona
        for each row
        begin
        
			if new.nombre <> old.nombre then 
				set @auc = concat('Se ha efectuado un cambio al registro con id:  ', new.id, ' n el campo: nombre. El antiguo valor era: ', old.nombre,
                ', el nuevo nombre es: ', new.nombre);
            end if;
            
			if new.apellido <> old.apellido then 
				set @auc = concat('Se ha efectuado un cambio al registro con id:  ', new.id, ' n el campo: apellido. El antiguo valor era: ', old.apellido,
                ', el nuevo apellido es: ', new.apellido);
            end if;
            
            if new.apellido2 <> old.apellido2 then 
				set @auc = concat('Se ha efectuado un cambio al registro con id:  ', new.id, ' n el campo: apellido2. El antiguo valor era: ', old.apellido2,
                ', el nuevo apellido2 es: ', new.apellido2);
            end if;
            
            if new.correo_electronico <> old.correo_electronico then 
				set @auc = concat('Se ha efectuado un cambio al registro con id:  ', new.id, ' n el campo: correo_electronico. El antiguo valor era: ', old.correo_electronico,
                ', el nuevo correo_electronico es: ', new.correo_electronico);
            end if;
            
            if new.dni <> old.dni then 
				set @auc = concat('Se ha efectuado un cambio al registro con id:  ', new.id, ' n el campo: dni. El antiguo valor era: ', old.dni,
                ', el nuevo dni es: ', new.dni);
            end if;
			insert into log values (null, @auc);
        end $$
        delimiter ;
		-- On Update END
        
        -- On delete
        delimiter $$
        drop trigger OnDelete $$
        create trigger OnDelete after delete on persona
        for each row
        begin
            set @auc = concat('Se ha añadido un nuevo usuario con ID: ', old.id, ' y DNI: ', old.dni);
			insert into log values (null, @auc);
        end $$
        delimiter ;
        -- On delete END
        
  -- trigger end
  
  insert into persona(nombre, apellido, apellido2, correo_electronico, dni) values ( 'si', 'no', 'tumpare' , 'haha@lasalle.com', '12345778B');
  update persona set nombre='paquito24' where dni='12345778B';
  delete from persona where dni = '12345678B';
  
SELECT *
FROM persona;

select * from Log;
