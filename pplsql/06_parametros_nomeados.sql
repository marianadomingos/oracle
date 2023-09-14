-- execução da procedure comumente utilizada
/* Desvantagem: dessa forma não é possivel identificar referente a quais parametros são os valores informados*/
EXECUTE ATUALIZAR_CLI_SEG_MERCADO(1,2)

/* execução da procedure com parametros nomeados permite saber exatamente referente a quais 
parametros os valores informados se referem */
DECLARE
    V_ID    NUMBER;
    V_SEGMERCADO_ID NUMBER;
BEGIN
    V_ID :=1;
    V_SEGMERCADO_ID :=2;
    ATUALIZAR_CLI_SEG_MERCADO(P_ID => V_ID, P_SEGMERCADO_ID => V_SEGMERCADO_ID);
END;
