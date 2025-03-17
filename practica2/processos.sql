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

