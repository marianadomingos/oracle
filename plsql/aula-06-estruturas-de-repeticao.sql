-- Procure para atualizar o campo segmercado_id na tabela de cliente
CREATE OR REPLACE PROCEDURE ATUALIZAR_CLI_SEG_MERCADO(
    P_ID IN CLIENTE.ID%TYPE,
    P_SEGMERCADO_ID IN CLIENTE.SEGMERCADO_ID%TYPE

)
    IS
BEGIN 
    UPDATE CLIENTE
        SET SEGMERCADO_ID = P_SEGMERCADO_ID
        WHERE ID = P_ID;
    COMMIT;
END;

-- Loop Básico 
/* Recomendado usar quando sabemos exatamente quantos valores iremos percorrer */
DECLARE
    V_SEGMERCADO_ID CLIENTE.SEGMERCADO_ID%TYPE := 1;  -- atribui o valor 1 para a variavel v_segmercado_id
    V_ID NUMBER(3);
BEGIN   
        -- variavel de controle iniciado em 1
        V_I := 1;
    LOOP 
        -- chamada da procedure
        /* v_i = variavel de controle do id do cliente */
        ATUALIZAR_CLI_SEG_MERCADO(V_I, V_SEGMERCADO_ID);

        -- 1 execução: i = 1 / v_segmercado_id = 1
        -- 2 execução: i = 2 / v_segmercado_id = 1
        -- 3 execução: i = 3 / v_segmercado_id = 1 
        V_I := V_I + 1;
        
        -- condição de saída
        -- o loop se encerra quando o i > 3
        EXIT WHEN V_I > 3;
    END LOOP;
END;

-- For Loop
/* Recomendado quando sabemos quantos valores iremos percorrer.
Consideramos também que os valores estejam sempre sequencialmente */
DECLARE 
    V_SEGMERCADO_ID CLIENTE.SEGMERCADO_ID%TYPE := 2; -- atribui o valor 2 para a variavel v_segmercado_id
BEGIN
    /* 
    O i é o indexador do laço de repetição
    Nesse tipo de estrutura, não é necessário declarar o i como variável de controle
    */

    -- definido que o laço de repetição se encerra após a terceira repetição
    -- a cada execução do laço, é acrescentado o valor 1 ao indexador i
    FOR I IN 1..3 LOOP

        -- chamada da procedure
        ATUALIZAR_CLI_SEG_MERCADO(I, V_SEGMERCADO_ID);
        END LOOP;
        COMMIT;
END;
