create or replace function f_plus_de_demande_entreprise (nom_entreprise in VARCHAR2)
    return NUMBER
    is nbr_de_demande NUMBER :=0;
begin
select e.raisonSociale, COUNT(idDemande) as nbr_de_demande
from entreprise e
         left join demande d on d.siret = e.siret
where e.raisonSociale = nom_entreprise
group by e.raisonSociale;

return nbr_de_demande;
end;



--test
declare
begin
    f_plus_de_demande_entreprise('Formalys');
end
