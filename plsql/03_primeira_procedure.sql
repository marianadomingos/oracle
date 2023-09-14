-- Criando Procedure

/* Modo IN - Modo de passagem padrão (Se for omitido o modo de passagem, sempre será considerado como IN)
E se o parametro é de entrada (IN), ele só estará disponível para leitura. Ou seja, dentro da procedure
ele não pode ser modificado */

CREATE OR REPLACE PROCEDURE INCLUIR_SEGMERCADO (
    P_ID IN NUMBER, 
    P_DESCRICAO IN VARCHAR
)
IS 
BEGIN

    INSERT INTO SEGMERCADO VALUES (P_ID, UPPER(P_DESCRICAO));
    COMMIT;

END;

-- Testando a Procedure

EXECUTE INCLUIR_SEGMERCADO(3, 'Farmaceutico');

-- Otimizando a Procedure
CREATE OR REPLACE PROCEDURE INCLUIR_SEGMERCADO (
    P_ID        IN SEGMERCADO.ID%TYPE, 
    P_DESCRICAO IN SEGMERCADO.DESCRICAO%TYPE
)
IS 
BEGIN

    INSERT INTO SEGMERCADO VALUES (P_ID, UPPER(P_DESCRICAO));
    COMMIT;

END;