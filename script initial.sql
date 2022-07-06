DROP TABLE detail_demande;
DROP TABLE detail_depot;
DROP TABLE demande;
DROP TABLE tournee;
DROP TABLE camion;
DROP TABLE type_dechet;
DROP TABLE employe;
DROP TABLE fonction;
DROP TABLE centre;
DROP TABLE entreprise;
DROP TABLE site;
DROP TABLE adresse;


CREATE TABLE adresse (
    idAdresse                  NUMBER(10),
    numero             NUMBER(10) NOT NULL,
    rue                 VARCHAR(100) NOT NULL,
    cp                  CHAR(5)      NOT NULL,
    ville               VARCHAR(50)  NOT NULL,
    constraint PK_adresse PRIMARY KEY (idAdresse)
);

CREATE TABLE site (
    idSite                  NUMBER(10),
    nom                 VARCHAR(50) NOT NULL,
    constraint PK_site PRIMARY KEY (idSite)
);

CREATE TABLE entreprise (
    siret		 number(15) not null,
    raisonSociale	 char(50) not null,
    noTel		 char(10),
    contact		 char(50),
    idadresse         number(10),
    constraint PK_entreprise primary key(siret),
    constraint FK_entreprise_adresse foreign key (idadresse) references adresse(idAdresse)
);

CREATE TABLE centre (
    idCentre	 number(3) not null,
    nomCentre	 varchar(100),
    adresse      number(10),
    constraint PK_centre primary key(idcentre),
    constraint FK_centre_adresse foreign key (adresse) references adresse(idAdresse)
);

CREATE TABLE fonction (
    idFonction	 number(3) not null,
    nomFonction	 varchar(50) not null,
    constraint PK_Fonction primary key(idFonction)
);

CREATE TABLE employe (
    idEmploye	 number(5) not null,
    nom		 varchar(50),
    prenom		 varchar(50),
    dateNaiss	 date,
    dateEmbauche	 date,
    salaire		 number(8,2),
    idFonction	 number(3),
    idSite       number(10),
    constraint PK_employe primary key(idEmploye),
    constraint FK_employe_fonction foreign key (idFonction) references fonction(idFonction),
    constraint FK_site_employe foreign key (idSite) references site(idSite)
);

CREATE TABLE type_dechet (
    idTypeDechet	 number(3) not null,
    nomTypeDechet	 varchar(50),
    niv_danger	 number(1),
    constraint PK_type_dechet primary key(idTypeDechet)
);

CREATE TABLE camion (
    immatriculation	 char(10) not null,
    dateAchat	 date,
    modele 		 varchar(50) not null,
    marque		 varchar(50) not null,
    idSite       NUMBER(10),
    constraint PK_camion primary key(immatriculation),
    constraint FK_site_camion foreign key (idSite) references site(idSite )
);


CREATE TABLE tournee (
    idTournee	 number(6) not null,
    dateTournee	 date,
    immatriculation	 char(10) not null,
    idEmploye	 number(5) not null,
    constraint PK_tournee primary key(idTournee),
    constraint FK_tournee_camion foreign key (immatriculation) references camion(immatriculation),
    constraint FK_tournee_employe foreign key (idEmploye) references employe(idEmploye)
);

CREATE TABLE demande (
    idDemande	 number(6) not null,
    dateDemande	 date,
    dateEnlevement	 date,
    siret		 number(15) not null,
    idTournee	 number(6) null,
    idSite	 number(10),
    constraint PK_demande primary key(idDemande),
    constraint FK_demande_entreprise foreign key (siret) references entreprise(siret),
    constraint FK_demande_tournee foreign key (idTournee) references tournee(idTournee),
    constraint FK_demande_site foreign key (idSite) references site(idSite)
);




CREATE TABLE detail_depot (
    idTournee		 number(6) not null,
    idTypeDechet		 number(3) not null,
    idCentre		 number(3) not null,
    quantiteDeposee	 number(3) not null,
    constraint PK_detaildepot primary key(idTournee, idTypeDechet, idCentre),
    constraint FK_detaildep_tournee foreign key (idTournee) references tournee(idTournee),
    constraint FK_detaildep_typedech foreign key (idTypeDechet) references type_dechet(idTypeDechet),
    constraint FK_detaildep_centre foreign key (idCentre) references centre(idCentre)
);

CREATE TABLE detail_demande (
    idDemande		 number(6) not null,
    idTypeDechet     number(3) not null,
    quantiteEnlevee	 number(3) not null,
    remarque		 varchar(100),
    constraint PK_detaildemande primary key(idDemande, idTypeDechet),
    constraint FK_detaildem_demande foreign key (idDemande) references demande(idDemande),
    constraint FK_detaildem_typedech foreign key (idTypeDechet) references type_dechet(idTypeDechet)
);

