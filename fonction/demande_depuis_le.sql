CREATE OR REPLACE TYPE demande_type
AS OBJECT
(
    idDemande NUMBER(6),
    dateDemande date
);

CREATE OR REPLACE TYPE demande_table_type
AS TABLE OF demande_type;

CREATE OR REPLACE FUNCTION fnc_demande_depuis_le_pipelined (Param1 in varchar2)
RETURN demande_table_type
PIPELINED
AS
BEGIN
    FOR v_Rec in (SELECT * FROM demande WHERE dateDemande > TO_DATE(param1,'DD/MM/YYYY')) LOOP
        PIPE ROW (demande_type(v_Rec.idDemande, v_Rec.dateDemande));
    END LOOP;
RETURN;
END;
    
SELECT * FROM TABLE(fnc_demande_depuis_le_pipelined('20/08/2018'));