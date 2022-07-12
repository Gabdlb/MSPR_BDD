CREATE OR REPLACE TYPE quantite_totale_type
AS OBJECT
(
    nomDechet VARCHAR2(100),
    quantité NUMBER
);

CREATE OR REPLACE TYPE quantite_totale_table_type
AS TABLE OF quantite_totale_type;


CREATE OR REPLACE FUNCTION fnc_quantité_totale_pipelined (Param1 in varchar2)
RETURN quantite_totale_table_type
PIPELINED
AS
BEGIN
    FOR v_Rec in (SELECT dd.idtypedechet, td.nomtypedechet, SUM(dd.quantitedeposee) as quantite FROM detail_depot dd
JOIN type_dechet td on td.idtypedechet = dd.idtypedechet
JOIN tournee t on t.idtournee = dd.idtournee
WHERE TO_CHAR(t.datetournee, 'MM/YYYY') = Param1
GROUP BY dd.idtypedechet, td.nomtypedechet) LOOP
        PIPE ROW (quantite_totale_type(v_Rec.nomtypedechet, v_Rec.quantite));
    END LOOP;
RETURN;
END;
    
--Donnez un mois et une année suivant le format suivant : MM/AAAA    
SELECT * FROM TABLE(FNC_QUANTITÉ_TOTALE_PIPELINED('09/2018'));
SELECT * FROM TABLE(FNC_QUANTITÉ_TOTALE_PIPELINED('10/2018'));

    