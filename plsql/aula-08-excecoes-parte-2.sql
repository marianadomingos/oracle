-- tratando erros provocados pelo programador

-- criando componente de trabalho do tipo exception (criada no mesmo bloco de variaveis de trabalho)
E_CLIENTE_ID_INEXISTENTE EXCEPTION;


-- testar comando executado

/* %NOTFOUND retorna verdadeiro se o comando não realizou ação nenhuma na tabela.
 Se houve qualquer inclusão/atualização/exclusão retorna falso */
IF SQL%NOTFOUND THEN
    -- comando raise força o erro de execução e desvia o código para o bloco de exceção
    RAISE E_CLIENTE_ID_INEXISTENTE;
END IF;

-- bloco de exceção
/* Se o SQL%NOTFOUND retornar verdadeiro, a execução do script será interrompida
e será apresentado o código e erro declardo na função raise_application_error */
EXCEPTION
 WHEN E_CLIENTE_ID_INEXISTENTE THEN
    RAISE_APPLICATION_ERROR(-20100, 'CLIENTE INEXISTENTE!');
END;


/* COMANDO RAISE x PROCEDURE RAISE_APPLICATION_ERROR

Raise: Comando que força com que sua exceção seja disparada;
raise_application_error: Procedure que aceita valores de erros definidos pelo usuário, seguido pela mensagem de erro a ser exibida

*/