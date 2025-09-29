USE newdatabase;
create table person (driver_id varchar(10),
name varchar(20), address varchar(30), primary key(driver_id));
desc person;
insert into person value ('A01','Richard','Srinivas nagar');
insert into person value ('A02','Pradeep','Rajaji nagar');
insert into person value ('A03','Smith','Ashok nagar');
insert into person value ('A04','Venu','N R Colony');
insert into person value ('A05','Jhon','Hanumanth nagar');
select * FROM person;


create table car(reg_num varchar(10),model varchar(10),year int, primary key(reg_num));
desc car;
insert into car values ('KA052250','Indica','1990');
insert into car values ('KA031181','Lancer','1957');
insert into car values ('KA095477','Toyota','1998');
insert into car values ('KA053408','Honda','2008');
insert into car values ('KA041702','Audi','2005');
select* from car;

create table accident(report_num int, accident_date date, location varchar(20),primary key(report_num));