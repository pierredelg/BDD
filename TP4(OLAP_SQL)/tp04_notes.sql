drop table if exists notes ;
drop table if exists maj ;


CREATE TABLE notes
(
    mat text,
    ncont integer,
    netu integer,
    groupe text,
    note integer,
    primary key(mat,ncont,netu)
);


COPY notes FROM stdin;
bdd	1	10	k	5
bdd	1	11	k	6
bdd	1	12	l	7
bdd	1	13	l	8
bdd	2	10	k	9
bdd	2	12	l	11
bdd	2	13	l	12
sys	1	10	k	10
sys	1	11	k	9
sys	1	12	l	8
sys	1	13	l	7
bdd	2	11	k	20
sys	2	11	k	\N
sys	2	10	k	8
sys	2	12	l	14
sys	2	13	l	17
\.


-- colonnes dans un ordre different : c'est expres ;-)
CREATE TEMP TABLE maj 
(      netu int,
       groupe text,
       mat text,
       numcont int,
       note int);

\copy maj from stdin
10	k	bdd	2	14
11	k	bdd	1	18
12	l	ginsert into notes values('gestion',1,10,'k',5);estion	2	9
13	l	gestion	2	\N
10	k	gestion	2	16
11	k	gestion	2	\N
\.

--1) UPSERT

-- Question 1.1

insert into notes values('gestion',1,10,'k',5);
insert into notes values('gestion',1,11,'k',5);

--Question 1.2

insert into notes values('gestion',1,10,'k',random()*20) on conflict (mat,ncont,netu) do update set note=10;

insert into notes values('gestion',1,11,'k',random()*20) on conflict (mat,ncont,netu) do update set note=10;

insert into notes values('gestion',1,12,'l',random()*20) on conflict (mat,ncont,netu) do update set note=10;

insert into notes values('gestion',1,13,'l',random()*20) on conflict (mat,ncont,netu) do update set note=10;
 
--Question 1.3

insert into notes(netu,groupe,mat,ncont,note) select * from maj on conflict (mat,ncont,netu) do update set (groupe,note) = (excluded.groupe,excluded.note);

-- 2) Valeurs nulles

--Question 2.1

select note from notes where netu = 13;

--5 lignes affichées / 4 notes affichées

--Question 2.2

select avg(note) from notes where netu=11;

--Question 2.3

select avg(coalesce(note,0)) from notes where netu=11;

--Question 2.4

select avg(coalesce(note,20)) from notes where netu=11;

--Question 2.5




