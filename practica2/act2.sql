-- taules

-- taula per registrar processos

    -- id proces
    -- nom process
    -- descripció


-- taula estadístiques de control

    -- id
    -- dia_i_hora_de_carrega
    -- cap_de_setmana?
    -- nom fixer  
    -- linies_afegides
    
-- taula auxiliar per entrar les dades del fixer    

	-- data 
    -- hora
    -- Nom màquina
    -- process
    -- descripció

	-- taula auxiliar per entrar les dades del fixer simplificant els processos

	-- data 
    -- hora
    -- Nom màquina
    -- id_process

 -- fk
	-- log.process <-> registre_processos.nom_process (n:n) (ja que el mateix process pot tenir varies descripcions)
    

-- Procedures

	-- Procedure per inserir dades
    -- procedure per exportar dades 
    -- procedure per registrar existents o nous processos amb les seves descripcions en la taula processos (un process pot tenir el mateix nom però pot tenir diferentes descripcions) (s'utilitzara en un triger que saltara en inserir dades)

    
    
    
-- database    
  drop database if exists practica2;
create database if not exists practica2 default character set 'utf8' default collate 'utf8_spanish_ci';

-- tables
use practica2;
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
            
			
            

            