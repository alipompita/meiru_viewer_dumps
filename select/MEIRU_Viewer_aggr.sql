create database if not exists meiru_viewer_aggr;

use meiru_viewer_aggr;

create table if not exists sites(
	id int not null primary key,
    name varchar(16) not null unique,
    is_urban boolean
);
insert into sites values (1, 'Karonga', false),(2, 'Lilongwe', true);

create table if not exists dss_members(
	ident varchar(8) not null primary key,
    sex int,
    dob date,
    age int,
    site int,
		foreign key (site) references sites (id)
);
 
create table if not exists study_screen_points(
	code varchar(8) not null primary key,
    study varchar(4),
    description text
);

create table if not exists screens(
	id int not null primary key auto_increment,
    source varchar(8) not null,
		foreign key (source) references study_screen_points (code),
	ident varchar(8) not null,
		foreign key (ident) references dss_members(ident),
	stid varchar(8),
    intdate date,
    phq9tot int,
    gad7tot int
);

create table if not exists mhc_stages(
	id int not null primary key,
    name varchar(32),
    description text
);

insert into mhc_stages values ('1', 'Initial Stage', null);

create table if not exists mhc_visits(
	id int not null primary key auto_increment,
    ident varchar(8),
		foreign key (ident) references dss_members(ident),
	stid varchar(8),
    stage int,
		foreign key (stage) references mhc_stages(id),
	visit_date date,
    site int,
		foreign key (site) references sites (id),
	appointment_type int
);

create table if not exists mhc_discharges(
	id int not null primary key auto_increment,
    ident varchar(8),
		foreign key (ident) references dss_members(ident),
	stid varchar(8),
    discharged int,
    site int,
		foreign key (site) references sites (id),
	discharge_date date,
    entry_date date
);













