-- Cursores
/* Ideal para quando não sabemos quantos valores iremos percorrer e quando
esses valores não estão de forma sequencial na tabela */
DECLARE
    V_ID CLIENTE.ID%TYPE;
    V_SEGMERCADO_ID CLIENTE.SEGMERCADO_ID%TYPE :=1; -- atribuindo valor 1 a variavel v_segmercado_id

    -- declaração do cursor que irá percorrer a tabela de cliente selecionado o id
    CURSOR C_CLIENTE IS
        SELECT ID
         FROM CLIENTE;
BEGIN 

    -- abre o cursor
    OPEN C_CLIENTE;

    LOOP
        -- fetch: comando de leitura
        /* a cada vez que ele é executado, ele lê uma nova linha e atribui o id do
        cliente (retornado no cursor) na variavel v_id */
        FETCH C_CLIENTE INTO V_ID;

        /*  condição de saída é quando não for mais localizado registro na tabela.
        Sem mais retornos para serem armazenados na variavel v_id */

        /* %NOTFOUND recebe valor verdadeiro quando o fetch falhar, ou seja, quando chegou ao final dos valores
        a serem percorridos. Enquanto houver linhas na tabela, o %NOTFOUND recebe falso e o processamento continua */
        EXIT WHEN C_CLIENTE%NOTFOUND;

        -- chamada da procedure
        ATUALIZAR_CLI_SEG_MERCADO(V_ID, V_SEGMERCADO_ID);
    END LOOP;

    -- fecha o cursor
    CLOSE C_CLIENTE;

    -- confirmando/garantindo a atualização no banco de dados
    -- fechamento da transação
    COMMIT;

END;



-- otimizando o cursor
DECLARE
    V_SEGMERCADO_ID CLIENTE.SEGMERCADO_ID%TYPE :=2; -- atribuindo valor 2 a variavel v_segmercado_id
    CURSOR C_CLIENTE IS
        SELECT ID
         FROM CLIENTE;
BEGIN 

    /* Dessa forma os comandos OPEN, FETCH e CLOSE estão sendo executados de maneiras implicita.

    O recurso definido como "RX" recebe os valores retornados no cursor.
    Se o cursor retornar 5 registros, o RX terá esses 5 registros armazenados */

    FOR RX IN C_CLIENTE LOOP
        -- passa como parametro o campo do registro (RX) e o campo que ele está referenciando (retorno do cursor)
        ATUALIZAR_CLI_SEG_MERCADO(RX.ID, V_SEGMERCADO_ID);
    END LOOP;

    -- confirmando/garantindo a atualização no banco de dados
    -- fechamento da transação
    COMMIT;

END;
