CREATE or REPLACE procedure type_dechet_total_natio (date_debut in date, date_fin in date, nom_type in VARCHAR2) as 
BEGIN

    SELECT
        SUM("DP"."QUANTITEDEPOSEE") "QUANTITETOTALE"
    FROM
        DETAIL_DEPOT DP
    
    JOIN tournee t on  t.idtournee = dp.idTournee
    JOIN type_dechet td on td.idTypeDechet = dp.idtypedechet
    JOIN camion c on t.immatriculation = c.immatriculation
    WHERE t.datetournee < date_fin AND datetournee > date_debut AND td.nom = nom_type;
    
END;


