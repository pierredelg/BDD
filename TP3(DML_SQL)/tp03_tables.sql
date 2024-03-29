-------------------
-- Suppression des différents objets
-- ATTENTION : l'ordre est important
-------------------

drop table if exists vol;
drop table if exists avion cascade;
drop table if exists pilote cascade;
drop table if exists ligne cascade;
drop table if exists copievol cascade;
drop table if exists aeroport cascade;

-------------------
-- La table AVION 
-------------------

create table avion
(
    ano serial,
    type varchar(50),
    places integer constraint limitePlaces_avion check(places > 100 and places < 500),
    compagnie varchar(50),
    constraint pk_avion primary key(ano)
);

-------------------
-- La table PILOTE 
-------------------

create table pilote
(
    pno serial,
    nom varchar(50),
    prenom varchar(50),
    adresse varchar(100) default 'Lille',
    constraint pk_pilote primary key(pno)
);

-------------------
-- La table LIGNE 
-------------------

create table ligne
(
    lno serial,
    depart varchar(50) not null,
    arrivee varchar(50) constraint arriveeDifferentDepart_ligne not null check(arrivee<>depart),
    constraint pk_ligne primary key(lno)
);

-------------------
-- La table VOL 
-------------------

create table vol
(
    ano integer, 
    pno integer,
    lno integer,
    hdep time,
    harr time constraint heureArrDep30_vol check ( harr > hdep + '00:30:00'),
    constraint pk_vol primary key(ano,pno,lno),
    constraint fk_avion foreign key(ano) references avion(ano) on update cascade,
    constraint fk_pilote foreign key(pno) references pilote(pno) on update cascade, 
    constraint fk_ligne foreign key(lno) references ligne(lno) on update cascade 
);

--insert into pilote (nom,prenom) values ('Karaouzene', 'Nagi');
insert into avion (type, places, compagnie) values ('A357',250,'Airbus');
insert into ligne (depart,arrivee) values ('Lille','Marseille');
--insert into vol (ano,pno,lno,hdep,harr) values (1,1,1,'12:00:00','13:00:00');

insert into pilote (nom,prenom) values ('Lahousse', 'Ludo');

--update pilote set pno = 25 where nom = 'Karaouzene';
--la valeur d'une clé dupliquée rompt la contrainte unique « pk_pilote »
--DETAIL:  La clé « (pno)=(25) » existe déjà.


--delete from avion;
--ERREUR:  UPDATE ou DELETE sur la table « avion » viole la contrainte de clé étrangère
--« fk_avion » de la table « vol »

create temp table copievol as select * from vol;

delete from vol;

insert into pilote (nom,prenom) values ('Mathieu', 'Philippe');
insert into avion (type, places, compagnie) values ('A757',150,'Airbus');
insert into ligne (depart,arrivee) values ('Marseille','Lille');

insert into pilote (nom,prenom) values ('Carle', 'Jean');
insert into avion (type, places, compagnie) values ('A385',300,'Airbus');
insert into ligne (depart,arrivee) values ('Paris','Lyon');

insert into vol (ano,pno,lno,hdep,harr) select ano, pno, lno , '12:00:00','14:00:00' from avion,pilote,ligne;

--select * from vol order by random();

--select * from vol where random() < 0.2;

alter table avion add couleur varchar(50);

update avion set couleur='blanc';

alter table pilote add email varchar(50);

alter table avion drop couleur;

create table aeroport (
       ano serial,
       ville varchar(50),
       IATA char(3)
);

insert into aeroport (ville) select depart from ligne union select arrivee from ligne;


create temp table ville ( depart varchar(50),arrivee varchar(50));
insert into ville select depart, arrivee from ligne;
alter table ligne modify depart integer;
alter table ligne modify arrivee integer;
insert into ligne(depart,arrivee) select ano from aeroport as a inner join villeas v;   


