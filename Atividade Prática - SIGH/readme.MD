
# Sistema de Gestão Hospitalar (SIGH)


Um hospital de médio porte precisa modernizar seus processos e contratou você para desenvolver o banco de dados
de um novo sistema de gestão. O objetivo é centralizar as informações de pacientes, médicos, agendamentos de
consultas e registros de internações.
O sistema precisa armazenar:
### 1. Pacientes
Dados necessários: Código do paciente, CPF, nome completo, data de nascimento, endereço, telefone e tipo de
convênio.
### 2. Médicos
Dados necessários: Código do médico, CRM, nome completo e especialidade.
Cada médico pertence a um único departamento do hospital.
### 3. Departamentos
Dados necessários: Código do departamento e nome (ex: Pediatria, Centro Cirúrgico).
### 4. Consultas
É preciso registrar qual paciente foi atendido, por qual médico, a data e hora, a sala e o status (Agendada, Realizada,
Cancelada).
### 5. Internações
Cada internação deve registrar o paciente, o médico responsável, o quarto, a data de entrada, a data de alta e o
diagnóstico.
### 6. Prontuário Eletrônico
Cada paciente possui um prontuário que armazena o histórico de eventos (consultas, exames, etc.), registrando cada
um com data, hora e descrição.
## DESAFIO PROPOSTO

## 1. Modelagem
Identificar as entidades, atributos e chaves do sistema SIGH. Desenhar as cardinalidades entre as entidades.
c. Criar o DER (Diagrama Entidade-Relacionamento) completo.

## 2. Implementação
a. Escrever o script SQL para criar as tabelas no MySQL.

b. Inserir dados fictícios e coerentes para simular o funcionamento do hospital.
