TRUNCATE TABLE detail_demande;
TRUNCATE TABLE detail_depot;
TRUNCATE TABLE demande;
TRUNCATE TABLE tournee;
TRUNCATE TABLE camion;
TRUNCATE TABLE modele;
TRUNCATE TABLE type_dechet;
TRUNCATE TABLE employe;
TRUNCATE TABLE fonction;
TRUNCATE TABLE centre;
TRUNCATE TABLE entreprise;
TRUNCATE TABLE site;
TRUNCATE TABLE adresse;

INSERT INTO adresse (idAdresse,numero,rue,cp,ville)
          select 1,1,'rue','44000','Lille' from dual
union all select 2,2,'avenue','75000','Paris' from dual
union all select 3,25,'Avenue Watrelos','59650','Villeneuve' from dual
union all select 4,15,'Rue des plages','59175','Templemars' from dual
union all select 5,23,'rue des champs','59800','Lille' from dual
union all select 6,14,'Chemin de la frontière','59800','Lille' from dual
;

INSERT INTO site (idSite,nom,idadresse)
          select 1,'site Nantes',1 from dual
union all select 2,'site Paris',2 from dual
;

INSERT INTO entreprise (siret,raisonSociale,noTel,contact,idadresse)
          select 123451320010012,'Decathlon','0339275236','M Vanderelst',3 from dual
union all select 024565590120057,'Castorama','0336215879','M Didire',4 from dual
;

INSERT INTO centre (idCentre,nomCentre,adresse)
          select 1,'Centre Mercan',5 from dual
union all select 2,'Prorecycle',6 from dual
;

INSERT INTO fonction (idFonction,nomFonction)
          select 1,'chauffeur' from dual
union all select 2,'secrétaire' from dual
;

INSERT INTO employe (idEmploye,nom,prenom,dateNaiss,dateEmbauche,salaire,idFonction,idSite)
          select 1,'Brila','Danny',TO_DATE('20/03/1970','DD/MM/YYYY'),TO_DATE('25/11/2004','DD/MM/YYYY'),1350,1,1 from dual
union all select 2,'Decuyper','Liesbeth',TO_DATE('25/09/1980','DD/MM/YYYY'),TO_DATE('30/06/1999','DD/MM/YYYY'),2100,2,1 from dual
;

INSERT INTO type_dechet (idTypeDechet,nomTypeDechet,niv_danger)
          select 1,'Papier',0 from dual
union all select 2,'Verre',1 from dual
;

INSERT INTO modele (idmodele,nomModele,marque)
          select 1,'EXPERT TEPEE LONG','Peugeot' from dual
union all select 2,'EXPERT TEPEE COURT','Peugeot' from dual
;

INSERT INTO camion (immatriculation,dateAchat,idSite,idModele)
          select '125ABC59',TO_DATE('12/01/1999','DD/MM/YYYY'),1,1 from dual
union all select '658DEC59',TO_DATE('16/11/1998','DD/MM/YYYY'),1,2 from dual
;

INSERT INTO tournee (idTournee,dateTournee,immatriculation,idEmploye)
          select 1,TO_DATE('10/09/2018','DD/MM/YYYY'),'125ABC59',1 from dual
union all select 2,TO_DATE('10/09/2018','DD/MM/YYYY'),'658DEC59',1 from dual
;

INSERT INTO demande (idDemande,dateDemande,dateEnlevement,siret,idTournee,idSite)
          select 1,TO_DATE('24/08/2018','DD/MM/YYYY'),TO_DATE('01/09/2018','DD/MM/YYYY'),123451320010012,1,1 from dual
union all select 2,TO_DATE('22/08/2018','DD/MM/YYYY'),TO_DATE('01/09/2018','DD/MM/YYYY'),024565590120057,1,1 from dual
;

INSERT INTO detail_depot (idTournee,idTypeDechet,idCentre,quantiteDeposee)
          select 1,1,1,100 from dual
union all select 1,2,1,290 from dual
;

INSERT INTO detail_demande (idDemande,idTypeDechet,quantiteEnlevee,remarque)
          select 1,1,100,'' from dual
union all select 1,2,50,'' from dual
;