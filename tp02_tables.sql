-------------------
-- Suppression des différents objets
-- ATTENTION : l'ordre est important
-------------------

drop table if exists vol;
drop table if exists avion cascade;
drop table if exists pilote cascade;
drop table if exists ligne cascade;

-------------------
-- La table AVION 
-------------------

create table avion
(
    ano int,
    type text,
    places integer,
    compagnie text,
    constraint pk_avion primary key(ano)
);

-------------------
-- La table PILOTE 
-------------------

create table pilote
(
    pno int,
    nom text,
    prenom text,
    adresse text,
    constraint pk_pilote primary key(pno)
);

-------------------
-- La table LIGNE 
-------------------

create table ligne
(
    lno int,
    depart text,
    arrivee text,
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
    harr time,
    constraint pk_vol primary key(ano,pno,lno),
    constraint fk_avion foreign key(ano) references avion(ano) ,
    constraint fk_pilote foreign key(pno) references pilote(pno) , 
    constraint fk_ligne foreign key(lno) references ligne(lno) 
);
