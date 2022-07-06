DROP TABLE entreprise;
DROP TABLE centre_traitement;
DROP TABLE employe;
DROP TABLE demande;
DROP TABLE tournee;
DROP TABLE camion;
DROP TABLE type_dechet;
DROP TABLE fonction;
DROP TABLE detail_demande;
DROP TABLE detail_depot;
DROP TABLE site;
DROP TABLE adresse;

CREATE TABLE entreprise (
    Siret		 number(15) not null,
    RaisonSociale	 char(50) not null,
    adresse         number(10),
    NoTel		 char(10),
    Contact		 char(50),
    constraint PK_entreprise primary key(Siret),
    constraint FK_entreprise_adresse foreign key (adresse) reference adresse(idAdresse)
);

CREATE TABLE centre_traitement (
    NoCentre	 number(3) not null,
    NomCentre	 varchar(100),
    adresse         number(10),
    constraint PK_centretraitement primary key(Nocentre),
    constraint FK_centre_adresse foreign key (adresse) reference adresse(idAdresse)
);

CREATE TABLE employe (
    NoEmploye	 number(5) not null,
    Nom		 varchar(50),
    Prenom		 varchar(50),
    dateNaiss	 date,
    dateEmbauche	 date,
    Salaire		 number(8,2),
    NoFonction	 number(3),
    NoSite       number(10),
    constraint PK_employe primary key(Noemploye),
    constraint FK_employe_fonction foreign key (nofonction) references fonction(nofonction),
    constraint FK_site_employe foreign key (noSite) references site(idSite)
);

CREATE TABLE type_dechet (
    NoTypeDechet	 number(3) not null,
    NomTypeDechet	 varchar(50),
    Niv_danger	 number(1),
    constraint PK_typedechet primary key(NoTypeDechet)
);

CREATE TABLE camion (
    NoImmatric	 char(10) not null,
    DateAchat	 date,
    Modele 		 varchar(50) not null,
    Marque		 varchar(50) not null,
    NoSite       varchar(10),
    constraint PK_camion primary key(NoImmatric),
    constraint FK_site_camion foreign key (NoSite) references site(idSite )
);


CREATE TABLE tournee (
    NoTournee	 number(6) not null,
    DateTournee	 date,
    NoImmatric	 char(10) not null,
    NoEmploye	 number(5) not null,
    constraint PK_tournee primary key(NoTournee),
    constraint FK_tournee_camion foreign key (NoImmatric) references camion(noImmatric),
    constraint FK_tournee_employe foreign key (noEmploye) references employe(noemploye),
);

CREATE TABLE demande (
    NoDemande	 number(6) not null,
    DateDemande	 date,
    DateEnlevement	 date,
    Siret		 number(15) not null,
    NoTournee	 number(6) null,
    NoSite	 number(10),
    constraint PK_demande primary key(Nodemande),
    constraint FK_demande_entreprise foreign key (Siret) references entreprise(Siret),
    constraint FK_demande_tournee foreign key (NoTournee) references tournee(notournee),
    constraint FK_demande_site foreign key (NoSite) references site(idSite )
);

CREATE TABLE fonction (
    NoFonction	 number(3) not null,
    NomFonction	 varchar(50) not null,
    constraint PK_Fonction primary key(NoFonction)
);


CREATE TABLE detail_depot (
    QuantiteDeposee	 number(3) not null,
    NoTournee		 number(6) not null,
    NoTypeDechet		 number(3) not null,
    NoCentre		 number(3) not null,
    constraint PK_detaildepot primary key(Notournee, notypedechet, nocentre),
    constraint FK_detaildep_tournee foreign key (NoTournee) references tournee(NoTournee),
    constraint FK_detaildep_typedech foreign key (notypedechet) references typedechet(notypedechet),
    constraint FK_detaildep_centre foreign key (NoCentre) references centretraitement(NoCentre)
);

CREATE TABLE detail_demande (
    QuantiteEnlevee	 number(3) not null,
    Remarque		 varchar(100),
    NoDemande		 number(6) not null,
    NoTypeDechet		 number(3) not null,
    constraint PK_detaildemande primary key(Nodemande, notypedechet),
    constraint FK_detaildem_demande foreign key (NoDemande) references demande(NoDemande),
    constraint FK_detaildem_typedech foreign key (notypedechet) references typedechet(notypedechet)
);

CREATE TABLE adresse (
    idAdresse                  NUMBER(10),
    rue                 VARCHAR(100) NOT NULL,
    cp                  CHAR(5)      NOT NULL,
    ville               VARCHAR(50)  NOT NULL,
    constraint PK_adresse PRIMARY KEY (idAdresse)
);

CREATE TABLE site (
    idSite                  NUMBER(10),
    nom                 VARCHAR(50) NOT NULL
    constraint PK_site PRIMARY KEY (idSite)
);