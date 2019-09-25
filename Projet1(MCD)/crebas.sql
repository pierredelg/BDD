/*==============================================================*/
/* Nom de SGBD :  Microsoft Access 2000                         */
/* Date de création :  16/09/2019 11:26:42                      */
/*==============================================================*/


alter table DONNE_LE_PRIX
   drop constraint FK_DONNE_LE_DONNE_LE__TYPE_DE_;

alter table DONNE_LE_PRIX
   drop constraint FK_DONNE_LE_DONNE_LE__CODIF_DE;

alter table EST_PLACE
   drop constraint FK_EST_PLAC_EST_PLACE_STAND;

alter table EST_PLACE
   drop constraint FK_EST_PLAC_EST_PLACE_ALEE;

alter table EST_PLACE
   drop constraint FK_EST_PLAC_EST_PLACE_PLACE;

alter table EXPOSANT
   drop constraint FK_EXPOSANT_EST_CODIF_DE;

alter table STAND
   drop constraint FK_STAND_EST_UN_TYPE_DE_;

alter table STAND
   drop constraint FK_STAND_OBTIENT_EXPOSANT;

drop table ALEE;

drop table CODIF_DES_EXPOSANTS;

drop table DONNE_LE_PRIX;

drop table EST_PLACE;

drop table EXPOSANT;

drop table PLACE;

drop table STAND;

drop table TYPE_DE_STAND;

/*==============================================================*/
/* Table : ALEE                                                 */
/*==============================================================*/
create table ALEE
(
    NUMERO_ALLEE         INTEGER         not null,
constraint PK_ALEE primary key (NUMERO_ALLEE)
);

/*==============================================================*/
/* Table : CODIF_DES_EXPOSANTS                                  */
/*==============================================================*/
create table CODIF_DES_EXPOSANTS
(
    TYPE_EXPOSANT        NOTE            not null,
    DESCRIPTION_EXPOSANT NOTE,
constraint PK_CODIF_DES_EXPOSANTS primary key (TYPE_EXPOSANT)
);

/*==============================================================*/
/* Table : DONNE_LE_PRIX                                        */
/*==============================================================*/
create table DONNE_LE_PRIX
(
    TYPE_DU_STAND        NOTE            not null,
    TYPE_EXPOSANT        NOTE            not null,
    PRIX                 INTEGER,
constraint PK_DONNE_LE_PRIX primary key (TYPE_DU_STAND, TYPE_EXPOSANT)
);

/*==============================================================*/
/* Table : EST_PLACE                                            */
/*==============================================================*/
create table EST_PLACE
(
    NUM                  INTEGER         not null,
    NUMERO_ALLEE         INTEGER         not null,
    CNO                  INTEGER         not null,
constraint PK_EST_PLACE primary key (NUM, NUMERO_ALLEE, CNO)
);

/*==============================================================*/
/* Table : EXPOSANT                                             */
/*==============================================================*/
create table EXPOSANT
(
    NUM_EXPOSANT         INTEGER         not null,
    TYPE_EXPOSANT        NOTE            not null,
    NOM_EXPOSANT         NOTE,
    CIVILITE             NOTE,
    ADRESSE              NOTE,
    CODE_POSTAL          INTEGER,
constraint PK_EXPOSANT primary key (NUM_EXPOSANT)
);

/*==============================================================*/
/* Table : PLACE                                                */
/*==============================================================*/
create table PLACE
(
    CNO                  INTEGER         not null,
constraint PK_PLACE primary key (CNO)
);

/*==============================================================*/
/* Table : STAND                                                */
/*==============================================================*/
create table STAND
(
    NUM                  INTEGER         not null,
    NUM_EXPOSANT         INTEGER         not null,
    TYPE_DU_STAND        NOTE            not null,
constraint PK_STAND primary key (NUM)
);

/*==============================================================*/
/* Table : TYPE_DE_STAND                                        */
/*==============================================================*/
create table TYPE_DE_STAND
(
    TYPE_DU_STAND        NOTE            not null,
    DESCRIPTION_DU_STAND NOTE,
constraint PK_TYPE_DE_STAND primary key (TYPE_DU_STAND)
);

alter table DONNE_LE_PRIX
   add constraint FK_DONNE_LE_DONNE_LE__TYPE_DE_ foreign key (TYPE_DU_STAND)
      references TYPE_DE_STAND (TYPE_DU_STAND);

alter table DONNE_LE_PRIX
   add constraint FK_DONNE_LE_DONNE_LE__CODIF_DE foreign key (TYPE_EXPOSANT)
      references CODIF_DES_EXPOSANTS (TYPE_EXPOSANT);

alter table EST_PLACE
   add constraint FK_EST_PLAC_EST_PLACE_STAND foreign key (NUM)
      references STAND (NUM);

alter table EST_PLACE
   add constraint FK_EST_PLAC_EST_PLACE_ALEE foreign key (NUMERO_ALLEE)
      references ALEE (NUMERO_ALLEE);

alter table EST_PLACE
   add constraint FK_EST_PLAC_EST_PLACE_PLACE foreign key (CNO)
      references PLACE (CNO);

alter table EXPOSANT
   add constraint FK_EXPOSANT_EST_CODIF_DE foreign key (TYPE_EXPOSANT)
      references CODIF_DES_EXPOSANTS (TYPE_EXPOSANT);

alter table STAND
   add constraint FK_STAND_EST_UN_TYPE_DE_ foreign key (TYPE_DU_STAND)
      references TYPE_DE_STAND (TYPE_DU_STAND);

alter table STAND
   add constraint FK_STAND_OBTIENT_EXPOSANT foreign key (NUM_EXPOSANT)
      references EXPOSANT (NUM_EXPOSANT);

