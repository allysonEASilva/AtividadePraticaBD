
# SysBank - Sistema de Gestão Bancária (Versão Completa)


Um banco digital está expandindo suas operações e precisa de um novo sistema de back-end para gerenciar de forma
integrada as informações de seus clientes e suas atividades financeiras. O sistema deve ser seguro, confiável e capaz
de registrar todas as operações, desde transações diárias até a gestão de produtos financeiros como empréstimos,
cartões e investimentos.

O sistema precisa armazenar:
### 1. Agências
• Descrição: Armazena as informações das agências físicas ou digitais do banco.

• Dados necessários: Número da agência (identificador único), nome (ex: Agência Central) e endereço.

### 2. Funcionários
• Descrição: Gerencia os dados dos colaboradores do banco. Um gerente pode ser responsável por diversas contas de clientes.

• Relacionamentos: Um funcionário pertence a uma Agência.

• Dados necessários: Identificador do funcionário, CPF, nome completo, cargo (ex: Gerente de Contas, Caixa) e a Agência onde trabalha.

### 3. Clientes
• Descrição: Mantém o cadastro central de todos os clientes do banco.

• Dados necessários: Identificador do cliente, CPF (único), nome completo, data de nascimento, endereço, e-
mail e telefone.

#### 4. Contas
• Descrição: Representa as contas bancárias dos clientes.

• Relacionamentos: Um Cliente pode ter múltiplas Contas, mas uma conta pertence a um único Cliente. Cada
conta está vinculada a uma Agência e pode ter um Funcionário (gerente) associado.

• Dados necessários: Número da conta (único), tipo (Corrente ou Poupança), saldo atual, data de abertura e
status (Ativa, Inativa, Bloqueada).
#### 5. Cartões
• Descrição: Armazena os dados dos cartões de débito e crédito associados a uma conta.

• Relacionamentos: Uma Conta pode ter um ou mais Cartões.

• Dados necessários: Número do cartão (único), a Conta vinculada, tipo (Crédito ou Débito), data de validade,
limite (para crédito) e status (Ativo, Bloqueado).
#### 6. Faturas
• Descrição: Consolida as despesas de um cartão de crédito em um período mensal.

• Relacionamentos: Um Cartão de crédito terá várias Faturas ao longo do tempo.

• Dados necessários: Identificador da fatura, o Cartão associado, data de vencimento, valor total e status
(Aberta, Paga, Vencida).
#### 7. Transações
• Descrição: Registra toda e qualquer movimentação financeira (depósito, saque, transferência, pagamento com
cartão).

• Relacionamentos: Envolve uma Conta de origem e/ou destino.

• Dados necessários: Identificador da transação, conta de origem, conta de destino, tipo, valor, data e hora.
#### 8. Beneficiários / Favorecidos
• Descrição: Agenda de contatos para facilitar transferências recorrentes.

• Relacionamentos: Um Cliente pode cadastrar vários Beneficiários.

• Dados necessários: Identificador do beneficiário, o Cliente que o cadastrou, nome do favorecido, CPF/CNPJ,
e os dados bancários do favorecido (banco, agência, conta).

#### 9. Empréstimos
• Descrição: Gerencia os contratos de empréstimos solicitados pelos clientes.

• Relacionamentos: Um Cliente pode solicitar múltiplos Empréstimos.

• Dados necessários: Identificador do empréstimo, o Cliente solicitante, valor total, taxa de juros, número de
parcelas, data da solicitação e status (Em análise, Aprovado, Quitado).
#### 10. Parcelas do Empréstimo
• Descrição: Detalha cada uma das parcelas de um contrato de empréstimo.

• Relacionamentos: Um Empréstimo é composto por várias Parcelas.

• Dados necessários: O Empréstimo ao qual pertence, número da parcela, valor, data de vencimento e data de
pagamento.
#### 11. Investimentos
• Descrição: Permite aos clientes aplicarem seu dinheiro em produtos financeiros.

• Relacionamentos: Um Cliente pode ter múltiplos Investimentos.

• Dados necessários: Identificador do investimento, o Cliente, tipo de produto (CDB, Ações, etc.), valor aplicado,
data da aplicação e rentabilidade.

## DESAFIO PROPOSTO
### 1. Modelagem

    1. Identificar todas as entidades, atributos e chaves para o sistema SysBank completo.

    2. Definir e representar as cardinalidades de todos os relacionamentos entre as 11 entidades.

    3. Criar o DER (Diagrama Entidade-Relacionamento) que represente a estrutura completa do banco de dados.

### 2. Implementação
    1. Escrever o código SQL para criar todas as 11 tabelas no MySQL, definindo chaves primárias, estrangeiras e outras restrições importantes. 

    2. Popular o banco de dados com dados fictícios que demonstrem os principais fluxos do sistema (ex: um cliente com duas contas, um cartão de crédito com uma fatura, um empréstimo com suas parcelas, etc.).
