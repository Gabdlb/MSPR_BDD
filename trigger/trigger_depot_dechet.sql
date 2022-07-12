CREATE or REPLACE TRIGGER verif_quantite_depot 
BEFORE INSERT OR UPDATE 
ON detail_depot
FOR EACH ROW

declare
quantiteEnleveeTotale number;

BEGIN

    SELECT COUNT(dd.quantiteenlevee)
    into quantiteEnleveeTotale
    FROM detail_demande dd
    inner join type_dechet td on dd.idtypedechet = td.idtypedechet
    inner join demande d on d.iddemande = dd.iddemande
    where :new.idtypedechet = dd.idtypedechet and :new.idtournee = d.idtournee;
    
    if :new.QUANTITEDEPOSEE > quantiteEnleveeTotale
        then
            raise_application_error(-20000,'La quantit� de d�chets pr�lev�e lors dune tourn�e ne doit pas �tre sup�rieure � la quantit� d�pos�e');
    end if;

END;