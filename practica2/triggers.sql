delimiter $$

drop trigger if exists loadData $$
create trigger loadData after insert on aux
for each row
begin
    
    
   -- inserir dades a la taula logs
    insert into logs (data_log, hora_log, nom_maquina, ID_process)
		values(new.data_log, new.hora_log, new.nom_maquina, (select processos.id from processos where new.procedure_log = processos.nom and new.error_log = processos.descripcio));

end $$
delimiter ;

delimiter $$
drop trigger if exists loadDataFull $$
create trigger loadDataFull after insert on processos
for each row
begin
    
paco:loop
	if (select ID_process from logs where id = @counter) is null then
		update logs set ID_process = (select processos.id from processos, aux logs where aux.procedure_log = nom and aux.error_log = descripcio) where logs.id = @counter;
        set @counter = @counter +1;
    elseif @stopper < @counter then
		leave paco;
    end if;
end loop paco;    
    
	
end $$
delimiter ;


delimiter $$

drop trigger if exists UpdateControl $$
create trigger UpdateControl before update on logs
for each row
begin
	if old.data_log <> new.data_log then
		insert into mods(val_nou, val_vell,Hora_event,user_responsable, descripcio) values (new.data_log, old.data_log, now(), user(), "s'ha modificat la data");
    elseif old.hora_log <> new.hora_log then
		insert into mods(val_nou, val_vell,Hora_event,user_responsable, descripcio) values (new.hora_log, old.hora_log, now(), user(), "s'ha modificat la hora");
    elseif old.nom_maquina <> new.nom_maquina then    
		insert into mods(val_nou, val_vell,Hora_event,user_responsable, descripcio) values (new.nom_maquina, old.nom_maquina, now(), user(), "s'ha modificat el nom de la màquina");
     elseif old.ID_process <> new.ID_process then    
		insert into mods(val_nou, val_vell,Hora_event,user_responsable, descripcio) values (new.ID_process, old.ID_process, now(), user(), "s'ha modificat el ID dels processos");   
	end if;
end $$
delimiter ;

delimiter $$

drop trigger if exists DeleteControl $$
create trigger DeleteControl after delete on logs
for each row
begin
INSERT INTO mods (Hora_event, user_responsable, descripcio)
    VALUES (NOW(), USER(), concat("s'ha esborrat la fila amb id: ", old.id, ', la hora: ', old.hora_log, ', el nom de la màquina: ', old.nom_maquina, ' i el process: ', old.ID_process));	
end $$
delimiter ;








