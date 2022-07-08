CREATE OR REPLACE TYPE quantite_totale_type
AS OBJECT
(
    nomDechet NUMBER(6),
    quantité NUMBER
);

CREATE OR REPLACE TYPE quantite_totale_table_type
AS TABLE OF quantite_totale_type;

CREATE OR REPLACE FUNCTION fnc_quantité_totale_pipelined (Param1 in varchar2)
RETURN quantite_totale_table_type
PIPELINED
AS
BEGIN
    FOR v_Rec in (SELECT dd.idtypedechet, td.nomtypedechet, COUNT(dd.quantiteenlevee) FROM detail_demande dd 
    JOIN type_dechet td on dd.idtypedechet = td.idtypedechet 
    GROUP BY dd.idtypedechet, dd.quantiteenlevee, td.nomtypedechet) LOOP
        PIPE ROW (quantité_totale_type(v_Rec.nomtypedechet, v_Rec.dateDemande));
    END LOOP;
RETURN;
END;
    
SELECT * FROM TABLE(fnc_demande_depuis_le_pipelined('20/08/2018'));
    