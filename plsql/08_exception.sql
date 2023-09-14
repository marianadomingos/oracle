-- lista de exceções https://docs.oracle.com/database/timesten-18.1/TTPLS/exceptions.htm#TTPLS199

-- tratamento de exceções quando o erro apresentado já existe na lista de exceções da oracle
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
    /* O primeiro parametro é o codigo de erro que queremos exibir na tela (-20000 a -20999)
        Segundo parametro é a mensagem que queremos exibir */
        RAISE_APPLICATION_ERROR(-20010, 'CLIENTE JÁ CADASTRADO!');


-- quando o erro não existe na lista de exceções

-- criando componente de trabalho do tipo exception (criada no mesmo bloco de variaveis de trabalho)
E_NULL EXCEPTION;
-- associando a variavel e_null um código de erro
PRAGMA EXCEPTION_INIT (E_NULL, -1400);

-- adicionando a tratativa no bloco de exceções
WHEN DUP_VAL_ON_INDEX THEN
    RAISE_APPLICATION_ERROR(-20010, 'CLIENTE JÁ CADASTRADO!');
WHEN E_NULL THEN
    RAISE_APPLICATION_ERROR(-1400, 'A COLUNA ID TEM PREENCHIMENTO OBRIGATÓRIO!');


/* É possível utilizar o WHEN OTHER para erros não previstos.
Ele deve ser sempre o ultimo tratamento do bloco*/

/* SQLERRM: FUNÇÃO SQL ERROR MESSAGE 

Será exibido a mensagem padrão o Oracle quando um erro for identificado.
Dessa forma, será possível pegar o código do erro e realizar as personalizações */
WHEN DUP_VAL_ON_INDEX THEN
    RAISE_APPLICATION_ERROR(-20010, 'CLIENTE JÁ CADASTRADO!');
WHEN E_NULL THEN
    RAISE_APPLICATION_ERROR(-1400, 'A COLUNA ID TEM PREENCHIMENTO OBRIGATÓRIO!');
WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20020, SQLERRM());
