--------- INSERT ---------
DECLARE
    
    V_ID SER := 1;
    V_DESCRICAO VARCHAR2(100) := 'varejo';

BEGIN

   INSERT INTO SEGMERCADO VALUES (V_ID, V_DESCRICAO);
   COMMIT;

END;

----------- INSERT  ---------
DECLARE
    
    -- definindo que o tipo da variável seja sempre compatível com definição da coluna
    V_ID SEGMERCADO.ID%TYPE := 3;
    V_DESCRICAO SEgMERCADO.DESCRICAO%TYPE := 'atacado';

BEGIN
    
   -- padronizando a inserção da descrição sempre em maiuscula
   INSERT INTO SEGMERCADO VALUES (V_ID, UPPER(V_DESCRICAO));
   COMMIT;

END;

-------- UPDATE ---------
DECLARE
    
    -- definindo que o tipo da variável seja sempre compatível com definição da coluna
    V_ID SEGMERCADO.ID%TYPE := 1;
    V_DESCRICAO SEgMERCADO.DESCRICAO%TYPE := 'varejista';

BEGIN

    UPDATE SEGMERCADO
        SET DESCRICAO = UPPER(V_DESCRICAO)
        WHERE ID = V_ID;
    
    V_ID := 2;
    V_DESCRICAO := 'atacadista';
    
    UPDATE SEGMERCADO
        SET DESCRICAO = UPPER(V_DESCRICAO)
        WHERE ID = V_ID;

    COMMIT;

END;

--------- DELETE ---------
DECLARE
    
    -- definindo que o tipo da variável seja sempre compatível com definição da coluna
    V_ID SEGMERCADO.ID%TYPE := 3;

BEGIN

    DELETE FROM SEGMERCADO WHERE ID = V_ID;
    COMMIT;

END;