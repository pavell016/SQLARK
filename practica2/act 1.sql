-- database
drop database if exists practica2;
create database if not exists practica2 default character set 'utf8' default collate 'utf8_spanish_ci';

-- tables
use practica2;
drop table if exists logs;
create table if not exists logs(
    data_log date,
    hora_log time,
    nom_maquina varchar(255),
    procedure_log varchar(255),
    error_log varchar(255)
);

-- procedure to enter data into table

-- Proves
  --  set @insertdata = concat('load data infile "', nom_fixer, '2023-03-02.csv into practica2.aux fields terminated by ";"  enclosed by ''"'' lines terminated by "\n";');
  --  set @insertdata = concat('load data infile "', nom_fixer,today, '.csv" into practica2.aux fields terminated by ";"  enclosed by ''"'' lines terminated by "\n";');

-- Proves end
delimiter $$
drop procedure if exists metadata $$
create procedure metadata()
SQL SECURITY DEFINER
begin
    declare nom_fixer varchar(255) default 'syslog.';
    declare today date default current_date();
    set @insertdata = concat('load data infile "', nom_fixer,today, '.csv" into table aux fields terminated by ";"  enclosed by ''""'' lines terminated by "\n" (data_log, hora_log, nom_maquina, procedure_log, error_log);');
    select @insertdata;
     prepare stmt1 from @insertdata;
     execute stmt1;
     deallocate prepare stmt1;
end $$
delimiter ;
select @insertdata;
call metadata();
select current_date();
load data infile "syslog.2023-03-02.csv" into table aux fields terminated by ";"  enclosed by "" lines terminated by "\n" (data_log, hora_log, nom_maquina, procedure_log, error_log);
select * from logs;
select * from processos;
select * from aux;
select * from estadistiques;


