-- insercions sql
use damtest;

drop table if exists usuari;
create table if not exists usuari(
	ID int auto_increment,
    nom varchar(255),
    cognom varchar(255),
    cognom2 varchar(255),
    primary key(ID)
);

insert into usuari (nom, cognom, cognom2) values ("Ioan Pavel", "Lupan", "Trifan");
select * from usuari;