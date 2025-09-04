create database SIGH_Allyson;
use SIGH_Allyson;

CREATE TABLE Departamento (
    COD_DEPARTAMENTO INTEGER PRIMARY KEY,
    NOME VARCHAR(200) NOT NULL
);

CREATE TABLE Paciente (
    COD_PACIENTE INTEGER PRIMARY KEY,
    CPF VARCHAR(11) NOT NULL UNIQUE,
    NOME_COMPLETO VARCHAR(255) NOT NULL,
    DATA_NASCIMENTO DATE,
    ENDERECO VARCHAR(255),
    TELEFONE VARCHAR(50),
    TIPO_CONVENIO VARCHAR(50)
);

CREATE TABLE Medico (
    COD_MEDICO INTEGER PRIMARY KEY,
    CRM VARCHAR(20) NOT NULL UNIQUE,
    NOME_COMPLETO VARCHAR(255) NOT NULL,
    ESPECIALIDADE VARCHAR(100),
    COD_DEPARTAMENTO INTEGER NOT NULL
);

CREATE TABLE Consulta (
    COD_CONSULTA INTEGER PRIMARY KEY,
    DATA_HORA TIMESTAMP NOT NULL,
    SALA VARCHAR(50),
    STATUS VARCHAR(50) NOT NULL,
    COD_PACIENTE INTEGER NOT NULL,
    COD_MEDICO INTEGER NOT NULL
);

CREATE TABLE Internacao (
    COD_INTERNACAO INTEGER PRIMARY KEY,
    DATA_ENTRADA TIMESTAMP NOT NULL,
    DATA_ALTA TIMESTAMP NULL DEFAULT NULL,
    QUARTO VARCHAR(20),
    DIAGNOSTICO VARCHAR(255),
    COD_PACIENTE INTEGER NOT NULL,
    COD_MEDICO_RESPONSAVEL INTEGER NOT NULL
);

ALTER TABLE Medico ADD CONSTRAINT FK_Medico_Departamento
    FOREIGN KEY (COD_DEPARTAMENTO)
    REFERENCES Departamento (COD_DEPARTAMENTO)
    ON DELETE RESTRICT;

ALTER TABLE Consulta ADD CONSTRAINT FK_Consulta_Paciente
    FOREIGN KEY (COD_PACIENTE)
    REFERENCES Paciente (COD_PACIENTE)
    ON DELETE CASCADE;

ALTER TABLE Consulta ADD CONSTRAINT FK_Consulta_Medico
    FOREIGN KEY (COD_MEDICO)
    REFERENCES Medico (COD_MEDICO)
    ON DELETE CASCADE;

ALTER TABLE Internacao ADD CONSTRAINT FK_Internacao_Paciente
    FOREIGN KEY (COD_PACIENTE)
    REFERENCES Paciente (COD_PACIENTE)
    ON DELETE CASCADE;

ALTER TABLE Internacao ADD CONSTRAINT FK_Internacao_Medico
    FOREIGN KEY (COD_MEDICO_RESPONSAVEL)
    REFERENCES Medico (COD_MEDICO)
    ON DELETE RESTRICT;
    
-- Inserção de Dados

-- 1. Inserindo Departamentos
INSERT INTO Departamento (COD_DEPARTAMENTO, NOME) VALUES
(1, 'Cardiologia'),
(2, 'Pediatria'),
(3, 'Ortopedia'),
(4, 'Neurologia'),
(5, 'Clínica Médica'),
(6, 'Centro Cirúrgico');

-- 2. Inserindo Pacientes (20 registros)
INSERT INTO Paciente (COD_PACIENTE, CPF, NOME_COMPLETO, DATA_NASCIMENTO, ENDERECO, TELEFONE, TIPO_CONVENIO) VALUES
(1, '11122233344', 'João da Silva', '1985-05-20', 'Rua das Flores, 123, Recife', '(81) 98877-6655', 'Unimed'),
(2, '22233344455', 'Maria Oliveira', '1992-11-15', 'Avenida Boa Viagem, 456, Recife', '(81) 99988-7766', 'Bradesco Saúde'),
(3, '33344455566', 'Carlos Pereira', '1978-01-30', 'Rua da Aurora, 789, Recife', '(81) 98123-4567', 'SUS'),
(4, '44455566677', 'Ana Costa', '2005-07-10', 'Rua do Sol, 101, Olinda', '(81) 99234-5678', 'Amil'),
(5, '55566677788', 'Pedro Martins', '1960-03-25', 'Estrada dos Remédios, 202, Recife', '(81) 98345-6789', 'Particular'),
(6, '66677788899', 'Juliana Santos', '1988-09-05', 'Rua da Moeda, 303, Recife', '(81) 99456-7890', 'Unimed'),
(7, '77788899900', 'Lucas Souza', '2018-12-01', 'Avenida Caxangá, 404, Recife', '(81) 98567-8901', 'SUS'),
(8, '88899900011', 'Beatriz Lima', '1995-02-18', 'Rua do Hospício, 505, Recife', '(81) 99678-9012', 'Bradesco Saúde'),
(9, '99900011122', 'Marcos Ferreira', '1980-06-22', 'Avenida Conde da Boa Vista, 606, Recife', '(81) 98789-0123', 'Amil'),
(10, '00011122233', 'Fernanda Alves', '1975-10-12', 'Rua Sete de Setembro, 707, Recife', '(81) 99890-1234', 'Particular'),
(11, '12312312345', 'Ricardo Gomes', '1999-04-14', 'Rua Gervásio Pires, 808, Recife', '(81) 98111-2233', 'Unimed'),
(12, '23423423456', 'Camila Rocha', '2001-08-30', 'Avenida Norte, 909, Recife', '(81) 99222-3344', 'SUS'),
(13, '34534534567', 'Fábio Azevedo', '1955-11-28', 'Praça de Casa Forte, 110, Recife', '(81) 98333-4455', 'Bradesco Saúde'),
(14, '45645645678', 'Patrícia Nogueira', '1982-07-07', 'Rua da Harmonia, 121, Recife', '(81) 99444-5566', 'Amil'),
(15, '56756756789', 'Bruno Carvalho', '2022-01-19', 'Rua do Futuro, 132, Recife', '(81) 98555-6677', 'Unimed'),
(16, '67867867890', 'Larissa Barbosa', '1993-05-03', 'Rua Amélia, 143, Recife', '(81) 99666-7788', 'Particular'),
(17, '78978978901', 'Thiago Monteiro', '1987-03-17', 'Avenida 17 de Agosto, 154, Recife', '(81) 98777-8899', 'SUS'),
(18, '89089089012', 'Vanessa Dias', '1968-09-21', 'Rua Visconde de Suassuna, 165, Recife', '(81) 99888-9900', 'Bradesco Saúde'),
(19, '90190190123', 'Rodrigo Mendes', '1979-12-25', 'Estrada do Arraial, 176, Recife', '(81) 98100-1122', 'Amil'),
(20, '01201201234', 'Sandra Melo', '2000-10-02', 'Rua Dom Bosco, 187, Recife', '(81) 99211-2233', 'Unimed');

-- 3. Inserindo Médicos (12 registros)
INSERT INTO Medico (COD_MEDICO, CRM, NOME_COMPLETO, ESPECIALIDADE, COD_DEPARTAMENTO) VALUES
(1, '12345/PE', 'Dr. Arthur Mendes', 'Cardiologista', 1),
(2, '23456/PE', 'Dra. Helena Costa', 'Cardiologista', 1),
(3, '34567/PE', 'Dr. Bernardo Lima', 'Pediatra', 2),
(4, '45678/PE', 'Dra. Laura Peixoto', 'Pediatra', 2),
(5, '56789/PE', 'Dr. Heitor Farias', 'Ortopedista', 3),
(6, '67890/PE', 'Dra. Alice Neves', 'Ortopedista', 3),
(7, '78901/PE', 'Dr. Davi Correia', 'Neurologista', 4),
(8, '89012/PE', 'Dra. Valentina Barros', 'Neurologista', 4),
(9, '90123/PE', 'Dra. Isadora Pinto', 'Clínica Geral', 5),
(10, '01234/PE', 'Dr. Matheus Galvão', 'Clínico Geral', 5),
(11, '11223/PE', 'Dr. Theo Rezende', 'Cirurgião Geral', 6),
(12, '22334/PE', 'Dra. Sophia Andrade', 'Anestesista', 6);

-- 4. Inserindo Consultas (30 registros)
INSERT INTO Consulta (COD_CONSULTA, DATA_HORA, SALA, STATUS, COD_PACIENTE, COD_MEDICO) VALUES
-- Consultas Realizadas
(1, '2025-08-25 10:00:00', 'Consultório 1A', 'Realizada', 1, 1),
(2, '2025-08-25 14:30:00', 'Consultório 3B', 'Realizada', 5, 5),
(3, '2025-08-26 09:00:00', 'Consultório 2A', 'Realizada', 7, 3),
(4, '2025-08-26 11:15:00', 'Consultório 4C', 'Realizada', 8, 8),
(5, '2025-08-27 16:00:00', 'Consultório 5A', 'Realizada', 9, 10),
(6, '2025-08-28 08:30:00', 'Consultório 1B', 'Realizada', 13, 1),
(7, '2025-08-28 13:00:00', 'Consultório 3A', 'Realizada', 4, 6),
(8, '2025-08-29 15:45:00', 'Consultório 2B', 'Realizada', 15, 4),
(9, '2025-09-01 09:30:00', 'Consultório 5B', 'Realizada', 18, 9),
(10, '2025-09-01 10:45:00', 'Consultório 4A', 'Realizada', 17, 7),
(11, '2025-09-02 14:00:00', 'Consultório 1A', 'Realizada', 2, 2),
(12, '2025-09-02 17:00:00', 'Consultório 3B', 'Realizada', 6, 5),
(13, '2025-09-03 08:00:00', 'Consultório 2A', 'Realizada', 11, 3),
(14, '2025-09-03 11:30:00', 'Consultório 4C', 'Realizada', 14, 8),
(15, '2025-09-04 09:15:00', 'Consultório 5A', 'Realizada', 20, 10),
-- Consultas Agendadas
(16, '2025-09-08 10:00:00', 'Consultório 1A', 'Agendada', 1, 1),
(17, '2025-09-08 15:00:00', 'Consultório 5B', 'Agendada', 10, 9),
(18, '2025-09-09 11:00:00', 'Consultório 2B', 'Agendada', 12, 4),
(19, '2025-09-10 14:30:00', 'Consultório 3A', 'Agendada', 19, 6),
(20, '2025-09-11 09:45:00', 'Consultório 4A', 'Agendada', 16, 7),
(21, '2025-09-12 16:15:00', 'Consultório 1B', 'Agendada', 13, 2),
(22, '2025-09-15 08:45:00', 'Consultório 5A', 'Agendada', 3, 10),
(23, '2025-09-16 13:30:00', 'Consultório 3B', 'Agendada', 14, 5),
(24, '2025-09-17 10:30:00', 'Consultório 4C', 'Agendada', 8, 8),
(25, '2025-09-18 17:00:00', 'Consultório 2A', 'Agendada', 7, 3),
-- Consultas Canceladas
(26, '2025-08-20 10:00:00', 'Consultório 1A', 'Cancelada', 1, 1),
(27, '2025-08-21 14:30:00', 'Consultório 3B', 'Cancelada', 5, 5),
(28, '2025-08-22 09:00:00', 'Consultório 2A', 'Cancelada', 7, 3),
(29, '2025-08-23 11:15:00', 'Consultório 4C', 'Cancelada', 8, 8),
(30, '2025-08-24 16:00:00', 'Consultório 5A', 'Cancelada', 9, 10);


-- 5. Inserindo Internações (10 registros)
INSERT INTO Internacao (COD_INTERNACAO, DATA_ENTRADA, DATA_ALTA, QUARTO, DIAGNOSTICO, COD_PACIENTE, COD_MEDICO_RESPONSAVEL) VALUES
-- Internações com alta
(1, '2025-07-10 14:00:00', '2025-07-15 11:00:00', 'Quarto 201 A', 'Pneumonia Comunitária', 3, 9),
(2, '2025-07-22 09:30:00', '2025-07-28 15:00:00', 'Quarto 302 B', 'Fratura de fêmur', 19, 5),
(3, '2025-08-01 20:15:00', '2025-08-05 10:30:00', 'UTI Leito 5', 'Infarto Agudo do Miocárdio', 13, 1),
(4, '2025-08-05 18:00:00', '2025-08-07 12:00:00', 'Quarto 205 A', 'Apendicite aguda', 6, 11),
(5, '2025-08-12 11:00:00', '2025-08-22 14:00:00', 'Quarto 401 C', 'AVC Isquêmico', 18, 7),
(6, '2025-08-15 16:45:00', '2025-08-19 13:00:00', 'Quarto 101 P', 'Bronquiolite Viral Aguda', 15, 3),
-- Internações em andamento (sem data de alta)
(7, '2025-08-30 22:00:00', NULL, 'Quarto 303 B', 'Traumatismo craniano leve', 9, 7),
(8, '2025-09-01 19:10:00', NULL, 'Quarto 208 A', 'Crise hipertensiva', 5, 2),
(9, '2025-09-02 12:00:00', NULL, 'Quarto 102 P', 'Crise asmática grave', 7, 4),
(10, '2025-09-03 23:30:00', NULL, 'UTI Leito 2', 'Insuficiência respiratória', 17, 10);