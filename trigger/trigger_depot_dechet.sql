CREATE or REPLACE TRIGGER verif_quantite_depot 
BEFORE INSERT OR UPDATE 
ON detail_depot
FOR EACH ROW

declare
quantiteEnleveeTotale number;

BEGIN

    SELECT dd.quantiteenlevee
    into quantiteEnleveeTotale
    FROM detail_depot dp
    inner join type_dechet td on td.idtypedechet = dp.idtypedechet
    inner join detail_demande dd on dd.idtypedechet = td.idtypedechet;
    
    if :new.QUANTITEDEPOSEE < quantiteEnleveeTotale
        then
            raise_application_error(-20000,'La quantit� de d�chets pr�lev�e lors dune tourn�e ne doit pas �tre sup�rieure � la quantit� d�pos�e');
    end if;

END;