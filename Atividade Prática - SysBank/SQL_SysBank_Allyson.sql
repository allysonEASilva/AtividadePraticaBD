create database SysBank_Allyson;
use SysBank_Allyson;

CREATE TABLE Agencias (
	numAgencia INTEGER PRIMARY KEY,
    Nome VARCHAR(50),
    Endereco VARCHAR(200)
);
CREATE TABLE Funcionarios (
    id_funcionario INTEGER PRIMARY KEY,
    Cpf VARCHAR(11),
    Nome_Completo VARCHAR(200),
    Cargo VARCHAR(50),
    fk_Agencias_numAgencia INTEGER
);

CREATE TABLE Clientes (
    Id_Cliente INTEGER PRIMARY KEY,
    Cpf VARCHAR(11),
    Nome_Completo VARCHAR(200),
    Data_Nascimento DATE,
    Endereco VARCHAR(200),
    Email VARCHAR(100),
    Telefone VARCHAR(11)
);

CREATE TABLE Contas (
    Num_Conta VARCHAR(7) PRIMARY KEY,
    Tipo VARCHAR(50),
    Saldo_Atual DECIMAL,
    Data_Abertura DATE,
    Status VARCHAR(10),
    fk_Agencias_numAgencia INTEGER,
    fk_Funcionarios_id_funcionario INTEGER,
    fk_Clientes_Id_Cliente INTEGER
);

CREATE TABLE Cartoes (
    Num_Cartao VARCHAR(16) PRIMARY KEY,
    Tipo VARCHAR(20),
    Data_Validade DATE,
    Limite DECIMAL,
    Status VARCHAR(10),
    fk_Contas_Num_Conta VARCHAR(7)
);

CREATE TABLE Faturas (
    Id_Fatura INTEGER PRIMARY KEY,
    Data_Vencimento DATE,
    Valor_Total DECIMAL,
    Status VARCHAR(10),    
    fk_Cartoes_Num_Cartao VARCHAR (16)
);

CREATE TABLE Transacoes (
    Id_Transacao VARCHAR (20) PRIMARY KEY,
    Tipo VARCHAR(20),
    Valor DECIMAL,
    Data_Hora TIMESTAMP,        
    fk_Contas_Num_Conta VARCHAR(7)
);

CREATE TABLE Favorecidos (
    Id_Favorecido INTEGER PRIMARY KEY,
    Nome_Favorecido VARCHAR(200),
    Cpf_Cnpj_Favorecido VARCHAR(14),
    Dados_Bancarios VARCHAR (20),
    Id_Cliente_FK_ VARCHAR(14),
    fk_Clientes_Id_Cliente INTEGER
);

CREATE TABLE Emprestimos (
    Id_Emprestimo INTEGER PRIMARY KEY,
    Valor_Total DECIMAL,
    Taxa_Juros DECIMAL,
    Num_Parcelas INTEGER,
    Data_Solicitacao DATE,
    Status VARCHAR(10),
    Id_Cliente_FK_ VARCHAR(14),
    fk_Clientes_Id_Cliente INTEGER
);

CREATE TABLE ParcelasEmprestimo (
    Id_Emprestimo_FK_ INTEGER,
    Num_Parcela INTEGER,
    Valor DECIMAL,
    Data_Vencimento DATE,
    Data_Pagamento DATE,
    fk_Emprestimos_Id_Emprestimo INTEGER,
    PRIMARY KEY (Id_Emprestimo_FK_, Num_Parcela)
);

CREATE TABLE Investimentos (
    Id_Investimento INTEGER PRIMARY KEY,
    Tipo_Produto VARCHAR(20),
    Valor_Aplicado DECIMAL,
    Data_Aplicacao DATE,
    Rentabilidade DECIMAL,
    Id_Cliente_FK_ VARCHAR(14)
);

CREATE TABLE RECEBE (
    FK_Transacoes_Id_Transacao VARCHAR(20),
    FK_Contas_Num_Conta VARCHAR(20)
);

CREATE TABLE REALIZA (
    FK_Clientes_Id_Cliente INTEGER,
    FK_Investimentos_Id_Investimento INTEGER
);
 
ALTER TABLE Funcionarios ADD CONSTRAINT FK_Funcionarios_2
    FOREIGN KEY (fk_Agencias_numAgencia)
    REFERENCES Agencias (numAgencia)
    ON DELETE RESTRICT;
 
ALTER TABLE Contas ADD CONSTRAINT FK_Contas_2
    FOREIGN KEY (fk_Agencias_numAgencia)
    REFERENCES Agencias (numAgencia)
    ON DELETE RESTRICT;
 
ALTER TABLE Contas ADD CONSTRAINT FK_Contas_3
    FOREIGN KEY (fk_Funcionarios_id_funcionario)
    REFERENCES Funcionarios (id_funcionario)
    ON DELETE SET NULL;
 
ALTER TABLE Contas ADD CONSTRAINT FK_Contas_4
    FOREIGN KEY (fk_Clientes_Id_Cliente)
    REFERENCES Clientes (Id_Cliente)
    ON DELETE CASCADE;
 
ALTER TABLE Cartoes ADD CONSTRAINT FK_Cartoes_2
    FOREIGN KEY (fk_Contas_Num_Conta)
    REFERENCES Contas (Num_Conta)
    ON DELETE RESTRICT;
 
ALTER TABLE Faturas ADD CONSTRAINT FK_Faturas_2
    FOREIGN KEY (fk_Cartoes_Num_Cartao)
    REFERENCES Cartoes (Num_Cartao)
    ON DELETE CASCADE;
 
ALTER TABLE Transacoes ADD CONSTRAINT FK_Transacoes_2
    FOREIGN KEY (fk_Contas_Num_Conta)
    REFERENCES Contas (Num_Conta)
    ON DELETE SET NULL;
 
ALTER TABLE Favorecidos ADD CONSTRAINT FK_Favorecidos_2
    FOREIGN KEY (fk_Clientes_Id_Cliente)
    REFERENCES Clientes (Id_Cliente)
    ON DELETE CASCADE;
 
ALTER TABLE Emprestimos ADD CONSTRAINT FK_Emprestimos_2
    FOREIGN KEY (fk_Clientes_Id_Cliente)
    REFERENCES Clientes (Id_Cliente)
    ON DELETE CASCADE;
 
ALTER TABLE ParcelasEmprestimo ADD CONSTRAINT FK_ParcelasEmprestimo_2
    FOREIGN KEY (fk_Emprestimos_Id_Emprestimo)
    REFERENCES Emprestimos (Id_Emprestimo)
    ON DELETE RESTRICT;
 
ALTER TABLE RECEBE ADD CONSTRAINT FK_RECEBE_1
    FOREIGN KEY (FK_Transacoes_Id_Transacao)
    REFERENCES Transacoes (Id_Transacao)
    ON DELETE SET NULL;
 
ALTER TABLE RECEBE ADD CONSTRAINT FK_RECEBE_2
    FOREIGN KEY (FK_Contas_Num_Conta)
    REFERENCES Contas (Num_Conta)
    ON DELETE SET NULL;
 
ALTER TABLE REALIZA ADD CONSTRAINT FK_REALIZA_1
    FOREIGN KEY (FK_Clientes_Id_Cliente)
    REFERENCES Clientes (Id_Cliente)
    ON DELETE SET NULL;
 
ALTER TABLE REALIZA ADD CONSTRAINT FK_REALIZA_2
    FOREIGN KEY (FK_Investimentos_Id_Investimento)
    REFERENCES Investimentos (Id_Investimento)
    ON DELETE SET NULL;
    
-- Correção para colunas que armazenam valores monetários (Ex: 99999999.99)
ALTER TABLE Contas MODIFY Saldo_Atual DECIMAL(10, 2);
ALTER TABLE Faturas MODIFY Valor_Total DECIMAL(10, 2);
ALTER TABLE Transacoes MODIFY Valor DECIMAL(10, 2);
ALTER TABLE Emprestimos MODIFY Valor_Total DECIMAL(10, 2);
ALTER TABLE ParcelasEmprestimo MODIFY Valor DECIMAL(10, 2);
ALTER TABLE Investimentos MODIFY Valor_Aplicado DECIMAL(10, 2);

-- Correção para colunas que armazenam taxas e percentuais (Ex: 0.1234)
ALTER TABLE Emprestimos MODIFY Taxa_Juros DECIMAL(5, 4);
ALTER TABLE Investimentos MODIFY Rentabilidade DECIMAL(5, 4);

-- 1. Agencias
INSERT INTO Agencias (numAgencia, Nome, Endereco) VALUES
(101, 'Agência Boa Viagem', 'Av. Conselheiro Aguiar, 1500, Recife - PE'),
(102, 'Agência Centro', 'Rua da Aurora, 235, Recife - PE'),
(201, 'Agência Olinda', 'Av. Gov. Carlos de Lima Cavalcanti, 399, Olinda - PE'),
(301, 'Agência Digital PE', 'Online');

-- 2. Funcionarios
INSERT INTO Funcionarios (id_funcionario, Cpf, Nome_Completo, Cargo, fk_Agencias_numAgencia) VALUES
(1, '11122233344', 'Carlos Silva', 'Gerente Geral', 101),
(2, '22233344455', 'Ana Pereira', 'Gerente de Contas', 101),
(3, '33344455566', 'Beatriz Costa', 'Caixa', 101),
(4, '44455566677', 'Marcos Almeida', 'Gerente de Contas', 102),
(5, '55566677788', 'Juliana Santos', 'Caixa', 102),
(6, '66677788899', 'Ricardo Oliveira', 'Gerente de Contas', 201),
(7, '77788899900', 'Fernanda Lima', 'Gerente Digital', 301);

-- 3. Clientes
INSERT INTO Clientes (Id_Cliente, Cpf, Nome_Completo, Data_Nascimento, Endereco, Email, Telefone) VALUES
(1, '12345678901', 'João da Silva Sauro', '1985-05-20', 'Rua dos Bobos, 0, Recife - PE', 'joao.sauro@email.com', '81988776655'),
(2, '23456789012', 'Maria Oliveira', '1990-11-15', 'Av. Boa Viagem, 321, Recife - PE', 'maria.oliveira@email.com', '81999887766'),
(3, '34567890123', 'Pedro Souza', '1978-01-30', 'Rua da Moeda, 123, Recife - PE', 'pedro.souza@email.com', '81987654321'),
(4, '45678901234', 'Ana Clara Medeiros', '2001-07-10', 'Rua do Futuro, 987, Recife - PE', 'ana.medeiros@email.com', '81912345678'),
(5, '56789012345', 'Lucas Fernandes', '1995-03-25', 'Av. 17 de Agosto, 456, Recife - PE', 'lucas.fernandes@email.com', '81955554444'),
(6, '67890123456', 'Laura Azevedo', '1998-09-02', 'Estrada do Arraial, 789, Recife - PE', 'laura.azevedo@email.com', '81988889999'),
(7, '78901234567', 'Gabriel Rocha', '1982-12-12', 'Av. Caxangá, 1000, Recife - PE', 'gabriel.rocha@email.com', '81977771111'),
(8, '89012345678', 'Sofia Cavalcanti', '2003-02-08', 'Rua da Harmonia, 321, Recife - PE', 'sofia.cavalcanti@email.com', '81965432109'),
(9, '90123456789', 'Matheus Correia', '1999-06-30', 'Rua das Ninfas, 50, Olinda - PE', 'matheus.correia@email.com', '81987878787'),
(10, '01234567890', 'Isabela Gomes', '1988-08-18', 'Av. Beberibe, 1234, Recife - PE', 'isabela.gomes@email.com', '81991919191');

-- 4. Contas
INSERT INTO Contas (Num_Conta, Tipo, Saldo_Atual, Data_Abertura, Status, fk_Agencias_numAgencia, fk_Funcionarios_id_funcionario, fk_Clientes_Id_Cliente) VALUES
('11111-2', 'Corrente', 5250.75, '2020-01-15', 'Ativa', 101, 2, 1),
('22222-3', 'Poupança', 15300.00, '2019-11-20', 'Ativa', 101, 2, 1),
('33333-4', 'Corrente', 8120.50, '2021-03-10', 'Ativa', 102, 4, 2),
('44444-5', 'Corrente', 2500.00, '2022-08-01', 'Ativa', 101, 2, 3),
('55555-6', 'Poupança', 32750.40, '2018-05-12', 'Ativa', 301, 7, 4),
('66666-7', 'Corrente', 1230.25, '2023-01-20', 'Ativa', 201, 6, 5),
('77777-8', 'Corrente', 950.80, '2023-02-14', 'Bloqueada', 301, 7, 6),
('88888-9', 'Corrente', 4200.00, '2021-06-05', 'Ativa', 102, 4, 7),
('99999-0', 'Poupança', 21500.00, '2022-11-30', 'Ativa', 301, 7, 8),
('12121-3', 'Corrente', 310.00, '2024-02-28', 'Ativa', 201, 6, 9),
('23232-4', 'Corrente', 18900.60, '2019-09-09', 'Ativa', 101, 2, 10);

-- 5. Cartoes
INSERT INTO Cartoes (Num_Cartao, Tipo, Data_Validade, Limite, Status, fk_Contas_Num_Conta) VALUES
('4242424242420001', 'Crédito', '2028-12-31', 5000.00, 'Ativo', '11111-2'),
('5151515151510002', 'Débito', '2029-10-31', NULL, 'Ativo', '11111-2'),
('4242424242420003', 'Débito', '2028-08-31', NULL, 'Ativo', '33333-4'),
('5151515151510004', 'Crédito', '2027-11-30', 8000.00, 'Ativo', '33333-4'),
('4242424242420005', 'Crédito', '2029-01-31', 2000.00, 'Bloqueado', '44444-5'),
('5151515151510006', 'Débito', '2030-05-31', NULL, 'Ativo', '66666-7'),
('4242424242420007', 'Crédito', '2026-06-30', 10000.00, 'Ativo', '88888-9'),
('5151515151510008', 'Débito', '2028-04-30', NULL, 'Ativo', '88888-9');

-- 6. Faturas
INSERT INTO Faturas (Id_Fatura, Data_Vencimento, Valor_Total, Status, fk_Cartoes_Num_Cartao) VALUES
(1, '2025-09-10', 1250.30, 'Aberta', '4242424242420001'),
(2, '2025-08-10', 980.50, 'Paga', '4242424242420001'),
(3, '2025-07-10', 1100.00, 'Paga', '4242424242420001'),
(4, '2025-09-15', 2100.75, 'Aberta', '5151515151510004'),
(5, '2025-08-15', 1850.20, 'Paga', '5151515151510004'),
(6, '2025-09-20', 450.00, 'Aberta', '4242424242420007');

-- 7. Transacoes
INSERT INTO Transacoes (Id_Transacao, Tipo, Valor, Data_Hora, fk_Contas_Num_Conta) VALUES
('TRN001', 'Depósito', 500.00, '2025-09-01 10:00:00', '11111-2'),
('TRN002', 'Transferência', 250.00, '2025-09-02 11:30:00', '33333-4'),
('TRN003', 'Saque', 100.00, '2025-09-02 15:45:00', '11111-2'),
('TRN004', 'Pagamento', 980.50, '2025-08-12 08:00:00', '11111-2'),
('TRN005', 'PIX', 50.00, '2025-09-03 20:00:00', '44444-5'),
('TRN006', 'Depósito', 1000.00, '2025-09-04 09:15:00', '88888-9');

-- 8. RECEBE
INSERT INTO RECEBE (FK_Transacoes_Id_Transacao, FK_Contas_Num_Conta) VALUES
('TRN002', '11111-2'),
('TRN005', '66666-7');

-- 9. Favorecidos
INSERT INTO Favorecidos (Id_Favorecido, Nome_Favorecido, Cpf_Cnpj_Favorecido, Dados_Bancarios, fk_Clientes_Id_Cliente) VALUES
(1, 'Empresa de Luz S.A.', '12345678000199', 'Banco XYZ, Ag 0001', 1),
(2, 'Pedro Souza', '34567890123', 'Banco Z, Ag 1234', 2),
(3, 'Ana Clara Medeiros', '45678901234', 'Banco W, Ag 5566', 1),
(4, 'Aluguel Imobiliária', '98765432000111', 'Banco K, Ag 1000', 7);

-- 10. Emprestimos
INSERT INTO Emprestimos (Id_Emprestimo, Valor_Total, Taxa_Juros, Num_Parcelas, Data_Solicitacao, Status, fk_Clientes_Id_Cliente) VALUES
(1, 20000.00, 0.03, 24, '2023-01-10', 'Aprovado', 1),
(2, 5000.00, 0.05, 12, '2024-05-20', 'Aprovado', 5),
(3, 50000.00, 0.02, 48, '2022-07-01', 'Quitado', 7);

-- 11. ParcelasEmprestimo
INSERT INTO ParcelasEmprestimo (Id_Emprestimo_FK_, Num_Parcela, Valor, Data_Vencimento, Data_Pagamento, fk_Emprestimos_Id_Emprestimo) VALUES
(1, 1, 941.50, '2023-02-10', '2023-02-10', 1),
(1, 2, 941.50, '2023-03-10', '2023-03-09', 1),
(1, 20, 941.50, '2024-09-10', '2024-09-10', 1),
(1, 21, 941.50, '2024-10-10', NULL, 1),
(2, 1, 450.25, '2024-06-20', '2024-06-20', 2),
(2, 2, 450.25, '2024-07-20', '2024-07-19', 2),
(2, 3, 450.25, '2024-08-20', '2024-08-20', 2),
(2, 4, 450.25, '2024-09-20', NULL, 2);

-- 12. Investimentos
INSERT INTO Investimentos (Id_Investimento, Tipo_Produto, Valor_Aplicado, Data_Aplicacao, Rentabilidade, Id_Cliente_FK_) VALUES
(1, 'CDB', 10000.00, '2022-01-15', 0.11, '1'),
(2, 'Ações PETR4', 5000.00, '2023-05-20', 0.25, '2'),
(3, 'Tesouro Selic', 25000.00, '2021-03-10', 0.13, '4'),
(4, 'Fundo Imobiliário', 15000.00, '2023-11-01', 0.15, '10');

-- 13. REALIZA
INSERT INTO REALIZA (FK_Clientes_Id_Cliente, FK_Investimentos_Id_Investimento) VALUES
(1, 1),
(2, 2),
(4, 3),
(10, 4);