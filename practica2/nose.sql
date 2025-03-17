-- trigers LSGCloud

delimiter $$
drop trigger if exists tumpa $$
create trigger tumpa after update on servidorstatus
for each row
begin 
	if old.is_broken = 0 and new.is_broken = 1 then
		insert into alertas values (null, 'Prioritario', concat('El servidor ', new.id_servidor, ' ta trencat'), 'Nose', now());
    end if ;
    
    if old.ram_upgrade = 0 and new.ram_upgrade = 1 then
        update servidor set ram=ram+256 where id_servidor = new.id_servidor ;
		insert into alertas values (null, 'Mantenimiento', concat('RAM del servidor ', new.id_servidor, ' augmentada'), 'Nose', now());
    end if ;
    
    if old.ram_downgrade = 0 and new.ram_downgrade = 1 then
        update servidor set ram=ram-256 where id_servidor = new.id_servidor;
        if servidor.ram <= 256 then
			insert into alertas values (null, 'Mantenimiento', concat('RAM del servidor ', new.id_servidor, ' reduida'), 'Nose', now());
        end if;
		
    end if ;
    
end $$
delimiter ;


select * from servidorstatus;
update servidorstatus set is_broken = 1 where id_servidor = 2;
select * from alertas;
select * from servidor;
update servidorstatus set ram_upgrade = 1 where id_servidor = 2;
update servidorstatus set ram_downgrade = 1 where id_servidor = 2;