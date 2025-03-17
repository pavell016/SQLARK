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

select current_date();