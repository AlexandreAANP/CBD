CREATE OR REPLACE PROCEDURE "DELETE_PAIS" (nPAIS NUMBER)

BEGIN
    DELETE FROM pais WHERE n_pais = nPAIS;

END DELETE_PAIS;