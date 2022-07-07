create or replace procedure p_employe_n_tournee (n in number)
    as
    begin
        select e.name, COUNT(t.idEmploye) as nbr_de_tournee
        from employe e
        left join tournee t on t.idEmploye = e.idEmploye
        where n <= COUNT(t.idEploye)
        group by e.name
        order by COUNT(t.idEploye) ASC
    end

--test
declare
begin
    p_employe_n_tournee(3);
end
