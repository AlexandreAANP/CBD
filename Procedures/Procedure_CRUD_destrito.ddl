CREATE OR REPLACE PROCEDURE "CRUD_DESTRITO" (vCOD_DESTRITO number,
  vNOME       VARCHAR2,
  vOPR        CHAR)
IS
  vEXCEPTION EXCEPTION;
BEGIN
  IF (vOPR = 'I') THEN
    INSERT INTO DESTRITO( n_destrito, v_destrito) VALUES (default, vNOME);
  ELSE
  IF(vOPR = 'A') THEN
    UPDATE DESTRITO SET v_destrito = vNOME WHERE N_DESTRITO = vCOD_DESTRITO;
  ELSE
  IF(vOPR = 'D')THEN
    DELETE FROM DESTRITO WHERE N_DESTRITO = vCOD_DESTRITO;
  ELSE
    RAISE vEXCEPTION;
  END IF;
  END IF;
  END IF;
  EXCEPTION
    WHEN vEXCEPTION THEN
      RAISE_APPLICATION_ERROR(-20999,'ATENÇÃO! Operação diferente de I, D, A.', FALSE);
END CRUD_DESTRITO;