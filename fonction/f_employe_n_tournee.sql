create or replace function f_employe_n_tournee(n in number)
return number
as
begin
select e.nom, COUNT(t.idEmploye)
from employe e
         left join tournee t on t.idEmploye = e.idEmploye
group by e.nom
having COUNT(t.idEmploye) <= n
order by COUNT(t.idEmploye) ASC;
return;
END;


declare
begin
    p_employe_n_tournee(2);
end;
