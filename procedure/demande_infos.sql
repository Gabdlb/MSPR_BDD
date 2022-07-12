CREATE or REPLACE PROCEDURE infos_demande(numDemande in number) as 
BEGIN

    SELECT e.raisonSociale, t.idtournee, dd.quantiteenlevee 
    FROM demande d
    
    JOIN entreprise e on d.siret = e.siret
    JOIN detail_demande dd on dd.iddemande = d.iddemande
    JOIN tournee t on d.idtournee = t.idtournee
        
    WHERE d.iddemande = numdemande;

END;