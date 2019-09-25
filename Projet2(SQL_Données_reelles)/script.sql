--DELGRANGE Pierre

--Fichier de données des demandes de valeurs foncières en 2018 diffusée par la DGFiP (La direction générale des Finances publiques)

--Lien de téléchargement du fichier csv:
--https://cadastre.data.gouv.fr/data/etalab-dvf/latest/csv/2018/full.csv.gz

drop table if exists reception; 

--On crée la table de réception des données:

create table reception(
       id_mutation varchar(50),
       date_mutation varchar(50),
       numero_disposition integer,
       nature_mutation varchar(50),
       valeur_fonciere numeric,
       adresse_numero numeric,
       adresse_suffixe varchar(10),
       adresse_nom_voie varchar(50),
       adresse_code_voie varchar(20),
       code_postal integer,
       code_commune varchar(10),
       nom_commune varchar(50),
       code_departement varchar(10),
       ancien_code_commune integer,
       ancien_nom_commune varchar(50),
       id_parcelle varchar(15),
       ancien_id_parcelle varchar(15),
       numero_volume varchar(10),
       lot1_numero varchar(10),
       lot1_surface_carrez numeric,
       lot2_numero varchar(10),
       lot2_surface_carrez numeric,
       lot3_numero varchar(10),
       lot3_surface_carrez numeric,
       lot4_numero varchar(10),
       lot4_surface_carrez numeric,
       lot5_numero varchar(10),
       lot5_surface_carrez numeric,
       nombre_lots integer,
       code_type_local integer,
       type_local varchar(40),
       surface_reelle_bat integer,
       nombre_pieces_principales integer,
       code_nature_culture varchar(20),
       nature_culture varchar(20),
       code_nature_culure_speciale varchar(20),
       nature_culture_special varchar(50),
       surface_terrain integer,
       longitude numeric,
       latitude numeric
);

--copie du fichier:

\copy reception from 'full.csv' delimiter ',' csv header;



--                   REQUETES :



-- 1) Quelle est la valeur foncière moyenne des biens?

select avg(valeur_fonciere) as Moyenne from reception;

-- 2) Quelle est la surface moyenne des biens de type 'appartement'?

select avg(surface_terrain) as "Moyenne terrain" from reception;

-- 3) Combien de biens ont changés de nom de ville ?

select count(*) as "nombre de biens" from reception where nom_commune=ancien_nom_commune;

-- 4) Combien y a t'il de biens le jour de Noel ? 

select count(*) as "nombre" from reception where date_mutation = '2018-12-25';

-- 5) Quelle est la ville ou il y a eu le plus de vente?

select nom_commune from reception group by nom_commune having count(*) >= all(select count(*) from reception group by nom_commune);

-- 6) Quelle est la ville qui possèdent les maisons avec la surface moyenne la plus élevé ?

select  nom_commune from reception where type_local = 'Maison' group by nom_commune order by avg(surface_reelle_bat) desc limit 1;

-- 7) Quel(s) est(sont) le(les) bien(s) le(les) plus cher(s) (tyde de bien, numero, adresse, code_postal, ville, valeur fonciere, surface) ?

select type_local, adresse_numero, adresse_nom_voie , code_postal, nom_commune, valeur_fonciere, surface_reelle_bat from reception where valeur_fonciere = (select max(valeur_fonciere) from reception);

-- 8) Quel est le type de terrain(non null) le plus petit à 'Lille'?

select type_local from reception where surface_reelle_bat = (select min(surface_reelle_bat) from reception where nom_commune = 'Lille' and type_local <> '') and type_local <> '' and nom_commune = 'Lille' limit 1;

-- 9) Quelle est la ville dont la somme des ventes est de plus de 10000 ?

select nom_commune,count(*) from reception group by nom_commune having count(*) >= 10000 ;


-- 10) Combien y a t-il de ville différentes?

select count(distinct nom_commune) as "nombre de villes" from reception;


