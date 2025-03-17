use ASIX_GRUP_6;

-- TABLES START
drop table if exists logs;
create table if not exists logs(
	id int auto_increment,
    data_log date,
    hora_log time,
    nom_maquina varchar(255),
    ID_process int,
    constraint PK_logs primary key(id)
) ;

drop table if exists estadistiques;
create table if not exists estadistiques(
	id int auto_increment,
    data_hora_carrega datetime,
    cap_de_setmana boolean,
    nom_fixer varchar (50),
    linies_afegides int,
    constraint PK_estadistiques primary key(id)
);

drop table if exists processos;
create table if not exists processos(
	id int auto_increment,
    nom varchar(255),
    descripcio varchar(255),
    constraint PK_processos primary key(id)
);
-- Per a que no hi hagui duplicats amb el trigger es crearan index unics per els campa nom i descripció
-- d'aquesta manera s'ignoraran les dades que estan repetides (combinacio del mateix nom i descripció)
create unique index Index_unic_processos on processos (nom, descripcio);


drop table if exists aux;
create table if not exists aux(
	id int auto_increment,
    data_log date,
    hora_log time,
    nom_maquina varchar(255),
    procedure_log varchar(255),
    error_log varchar(255),
    constraint PK_logs primary key(id)
) ;

drop table if exists mods;
create table if not exists mods(
	id int auto_increment,
    val_Nou varchar(255),
    val_Vell varchar(255),
    Hora_event datetime,
    user_responsable varchar(255),
    descripcio varchar(800),
    constraint PK_logs primary key(id)
) ;


-- FK

			alter table logs add constraint FK_id_process foreign key(ID_process) references processos (id) on update cascade on delete cascade;


-- TABLES END


-- Processos START
delimiter $$
drop procedure backup_BBDD $$
create procedure backup_BBDD ()
begin
	-- taules
	set @today = DATE_FORMAT(NOW(), '%Y%m%d');
    set @BKPaux = concat('create table aux',@today,' like practica2.aux;');
    prepare stmt1 from @BKPaux;
	execute stmt1;
	set @BKPEstadistiques = concat('create table estadistiques',@today,' like practica2.estadistiques;');
    prepare stmt2 from @BKPEstadistiques;
	execute stmt2;
    set @BKPlogs = concat('create table logs',@today,' like practica2.logs;');
    prepare stmt3 from @BKPlogs;
	execute stmt3;
    set @BKPprocessos = concat('create table processos',@today,' like practica2.processos;');
    prepare stmt4 from @BKPprocessos;
	execute stmt4;
    
    -- insercio de dades en taules
    set @BKPaux = concat('insert into aux',@today,' select * from aux;');
    prepare stmt5 from @BKPaux;
	execute stmt5;
    set @BKPaux = concat('insert into estadistiques',@today,' select * from practica2.estadistiques;');
    prepare stmt6 from @BKPaux;
	execute stmt6;
    set @BKPaux = concat('insert into logs',@today,' select * from practica2.logs;');
    prepare stmt7 from @BKPaux;
	execute stmt7;
    set @BKPaux = concat('insert into processos',@today,' select * from practica2.processos;');
    prepare stmt8 from @BKPaux;
	execute stmt8;
    
    
end $$
delimiter ;

call backup_BBDD();

delimiter $$
drop procedure if  exists ExtractStatics $$
create procedure ExtractStatics ()
begin
	set @today = DATE_FORMAT(NOW(), '%Y%m%d');
    set @aux = concat("select * into outfile 'rsyslogStatics.", @today,".csv' fields terminated by ';' optionally enclosed by '""' lines terminated by '\\n' from estadistiques;");
    prepare stmt1 from @aux;
    execute stmt1;
	
end $$
delimiter ;

call ExtractStatics();


delimiter $$
drop procedure if  exists InsertProcedureStatics $$
create procedure InsertProcedureStatics()
begin
	declare finde boolean;
    declare dateCarrega datetime;
    declare yesterday date;
    declare filename varchar(30);
    declare addedLines int;
    set yesterday = (SELECT DATE_SUB(CURDATE(), INTERVAL 1 DAY));
    set filename = concat("rsyslog.",yesterday,".csv");
    set addedLines = (select count(*) from aux where new.data_log = yesterday);
    set dateCarrega = current_timestamp();
    set finde = (SELECT 
    CASE 
        WHEN DAYOFWEEK(CURDATE()) IN (1, 7) 
        THEN true
        ELSE false 
    END
);
insert ignore into estadistiques (data_hora_carrega, cap_de_setmana, nom_fixer, linies_afegides) values (dateCarrega,finde,filename,addedLines);
end $$
delimiter ;


delimiter $$
drop procedure if  exists InsertToProcessos $$
create procedure InsertToProcessos()
begin
	set @counter=1;
    set @tot = (select count(*) from aux);
	paco: loop
		if @counter < @tot then
		insert ignore into processos (nom, descripcio) values ((select procedure_log from aux where aux.id = @counter), (select error_log from aux where aux.id = @counter));
        set @counter = @counter +1;
        else
			leave paco;
        end if;
    end loop paco;
end $$
delimiter ;


-- PRocessos END 

-- EVENTOS START
SET GLOBAL event_scheduler = ON;
delimiter $$
drop event if exists bakuper $$
create event bakuper
on schedule every 7 day
starts "2023-04-23 23:00:00"
ends "2023-06-1 00:00:00"
do begin
	call backup_BBDD(); 
end $$
delimiter ;
delimiter $$
drop event if exists EnterStatics $$
create event EnterStatics
on schedule every 1 day
starts "2023-04-23 00:00:00"
ends "2023-06-1 00:00:00"
do begin
	call InsertProcedureStatics(); 
end $$
delimiter ;
-- EVENTOS END


-- TRIGGERS START
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
-- TRIGGERS END


-- user START
CREATE USER 'paco'@'192.168.180.9' IDENTIFIED BY 'exacte';
GRANT SELECT ON practica2.* TO 'paco'@'localhost';

SHOW GRANTS FOR 'paco'@'localhost';
-- user END

