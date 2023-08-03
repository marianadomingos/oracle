Cenário: Sistema de Gerenciamento de Vendas

Descrição:
Imagine que você foi contratado por uma empresa de varejo chamada "SuperShop" para melhorar seu sistema de gerenciamento de vendas. A empresa possui várias lojas espalhadas por diferentes localidades e deseja ter um sistema mais eficiente para rastrear as vendas, gerenciar estoques e recompensar clientes fiéis.

*** Entidades Principais ***

Tabela "Produtos":
Colunas: ID_Produto, Nome, Preço_Unitário, Estoque_Disponível.

Tabela "Clientes":
Colunas: ID_Cliente, Nome, Email, Pontos_Fidelidade.

Tabela "Vendas":
Colunas: ID_Venda, ID_Cliente, Data_Venda, Valor_Total.

*** Regras de Negócio ***

1. Cálculo de Pontos Fidelidade:
Para cada compra, o cliente acumula pontos de fidelidade com base no valor total da compra. Cada R$ 1,00 gasto equivale a 1 ponto.
Caso o cliente já possua um saldo de pontos de fidelidade anterior, os pontos da nova compra devem ser adicionados aos pontos existentes.

2. Atualização de Estoque:
Ao realizar uma venda, o estoque disponível dos produtos deve ser atualizado, subtraindo a quantidade vendida do estoque atual.

3. Relatório de Vendas Mensais:
A empresa deseja um relatório mensal das vendas, mostrando o total de vendas e a média de pontos de fidelidade acumulados pelos clientes durante o mês.

4. Classificação de Clientes:
A empresa deseja identificar os clientes mais fiéis, classificando-os em categorias de acordo com o total de pontos de fidelidade acumulados.
As categorias podem ser: "Bronze" (até 1000 pontos), "Prata" (de 1001 a 3000 pontos), "Ouro" (de 3001 a 5000 pontos) e "Platina" (acima de 5000 pontos).

5. Descontos Especiais:
Clientes da categoria "Platina" recebem um desconto especial de 10% em todas as compras subsequentes.

*** Tarefas para Treinamento em PL/SQL ***

1. Criar as tabelas necessárias e popular com dados de exemplo.
2. Escrever procedimentos ou funções para calcular os pontos de fidelidade, atualizar o estoque e gerar o relatório de vendas mensais.
3. Criar uma função para classificar os clientes de acordo com o total de pontos de fidelidade.
4. Implementar um gatilho (trigger) para aplicar o desconto especial automaticamente aos clientes da categoria "Platina" durante uma venda.
5. Realizar consultas complexas para extrair informações específicas do banco de dados, como clientes que mais compraram, produtos mais vendidos, etc.