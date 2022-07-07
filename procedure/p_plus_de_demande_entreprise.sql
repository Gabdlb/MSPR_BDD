create or replace procedure p_plus_de_demande_entreprise (nom_entreprise in string)
    as
    begin
        select e.raisonSociale, COUNT(idDemande) as nbr_de_demande
        from entreprise e
        left join demande d on d.siret = e.siret
        where e.raisonSociale = non_entreprise
        group by e.raisonSociale
    end

--test
declare
begin
    p_plus_de_demande_entreprise('Formalys');
end
