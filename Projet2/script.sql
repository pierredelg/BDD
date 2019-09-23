--DELGRANGE Pierre

--Fichier de données des demandes de valeurs foncières diffusée par la DGFiP

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
       adresse_code_voie integer,
       code_postal integer,
       code_commune integer,
       nom_commune varchar(50),
       code_departement integer,
       ancien_code_commune integer,
       id_parcelle varchar(15),
       ancien_id_parcelle varchar(15),
       numero_volume integer,
       lot1_numero integer,
       lot1_surface_carrez integer,
       lot2_numero integer,
       lot2_surface_carrez integer,
       lot3_numero integer,
       lot3_surface_carrez integer,
       lot4_numero integer,
       lot4_surface_carrez integer,
       lot5_numero integer,
       lot5_surface_carrez integer,
       nombre_lots integer,
       code_type_local integer,
       type_local varchar(20),
       surface_reelle_bat integer,
       nombre_pieces_principales integer,
       code_nature_culture integer,
       nature_culture varchar(20),
       code_nature_culure_speciale varchar(20),
       nature_culture_special varchar(50),
       surface_terrain integer,
       longitude integer,
       latitude integer
);

--copie du fichier:

\copy reception from '/home/infoetu/delgranp/BDD/Projet2/full.csv' delimiter ',' csv header;

