-- Affichez les informations des demandes qui ne sont pas encore inscrites dans une tournée.

CREATE VIEW v_demandes_non_inscrites_tournee
as
SELECT idDemande, dateDemande, dateEnlevement, siret, idSite
FROM demande
WHERE idTournee IS NULL

select * from v_demandes_non_inscrites_tournee
