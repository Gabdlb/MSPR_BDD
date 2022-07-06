create or replace procedure demande_depuis_le (param1 in date) as
begin
    select * from demande
    where datedemande > param1;
end;