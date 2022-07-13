DROP role PDG;
DROP role RH;
DROP role DIRECTEUR_LOC;
DROP role AGENT;
DROP role RESPONSABLE_LOC;
DROP role EMPLOYE;
DROP PROFILE utilisateur CASCADE; 
DROP PROFILE dirigeant CASCADE; 

CREATE PROFILE utilisateur
    FAILED_LOGIN_ATTEMPTS 3
    PASSWORD_LIFE_TIME 60
    PASSWORD_REUSE_TIME UNLIMITED
    PASSWORD_REUSE_MAX 1
    PASSWORD_LOCK_TIME UNLIMITED
    PASSWORD_GRACE_TIME 1
    SESSIONS_PER_USER 1;

CREATE PROFILE dirigeant
    FAILED_LOGIN_ATTEMPTS 3
    PASSWORD_LIFE_TIME 60
    PASSWORD_REUSE_TIME UNLIMITED
    PASSWORD_REUSE_MAX 1
    PASSWORD_LOCK_TIME UNLIMITED
    PASSWORD_GRACE_TIME 1
    SESSIONS_PER_USER 2;

Create role PDG;
declare
cursor c1 is select table_name from user_tables;
cmd varchar2(200);
begin
for c in c1 loop
cmd := 'GRANT SELECT ON '||c.table_name||' TO PDG';
execute immediate cmd;
end loop;
end;


Create role RH;
GRANT ALL PRIVILEGES on employe to RH;
Grant create session to RH;

Create role DIRECTEUR_LOC;
GRANT ALL PRIVILEGES on centre to DIRECTEUR_LOC; 

Create role AGENT;
GRANT SELECT ON entreprise to AGENT;
GRANT SELECT ON adresse to AGENT;
GRANT CREATE ON entreprise to AGENT;
GRANT CREATE ON adresse to AGENT;
GRANT UPDATE ON entreprise to AGENT;
GRANT UPDATE ON adresse to AGENT;
GRANT SELECT ON tournee to AGENT;
GRANT CREATE ON tournee to AGENT;
GRANT UPDATE ON tournee to AGENT;

Create role RESPONSABLE_LOC;
GRANT SELECT ON site to RESPONSABLE_LOC;

Create role EMPLOYE;
GRANT SELECT on employe to employe;
GRANT SELECT on centre to employe;
GRANT SELECT on tournee to employe;

