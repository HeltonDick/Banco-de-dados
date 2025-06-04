CREATE DATABASE FORM;
USE FORM;

CREATE TABLE NACIONALIDADE (
	IDnacionalidade int auto_increment primary key,
    NMnacionalidade varchar(30)
);

CREATE TABLE ESTSIVIL (
	IDestcivil int auto_increment primary key,
    NMestcivil varchar(50)
);

CREATE TABLE BAIRRO (
	IDbairro int auto_increment primary key,
    NMbairro varchar(100)
);

CREATE TABLE RUA (
	IDrua int auto_increment primary key,
    NMrua varchar(100)
);

CREATE TABLE ENDERECO (
	IDendereco int auto_increment primary key,
    numero int,
    logradouro varchar(100),
    referencia varchar(100),
    cep varchar(10),
    IDbairro int,
    IDrua int,
    foreign key (IDbairro) references BAIRRO(IDbairro),
    foreign key (IDrua) references RUA(IDrua)
);

CREATE TABLE SEXO (
	IDsexo int auto_increment primary key,
    NMsexo varchar(30)
);

CREATE TABLE DEPENDENTES (
	IDdependete int auto_increment primary key,
    NMpessoa varchar(30),
    DTnascimento date,
    rg varchar(15),
    cpf varchar(15),
    contato varchar(100), 
    IDnacionalidade int,
    IDestcivil int,
    IDendereco int,
    IDsexo int,
    foreign key (IDnacionalidade) references NACIONALIDADE(IDnacionalidade),
    foreign key (IDestcivil) references ESTSIVIL(IDestcivil),
    foreign key (IDendereco) references ENDERECO(IDendereco),
    foreign key (IDsexo) references SEXO(IDsexo)
);

CREATE TABLE PESSOA (
	IDmatricula int auto_increment primary key,
    NMpessoa varchar(30),
    DTnascimento date,
    rg varchar(15),
    cpf varchar(15),
    contato varchar(100),
    IDnacionalidade int,
    IDestcivil int,
    IDendereco int,
    IDsexo int,
    IDdependete int,
    foreign key (IDnacionalidade) references NACIONALIDADE(IDnacionalidade),
    foreign key (IDestcivil) references ESTSIVIL(IDestcivil),
    foreign key (IDendereco) references ENDERECO(IDendereco),
    foreign key (IDsexo) references SEXO(IDsexo),
    foreign key (IDdependete) references DEPENDENTES(IDdependete)
);

CREATE TABLE CARGOS (
	IDcargo int auto_increment primary key,
    NMcargo varchar(50)
);

CREATE TABLE OCUPADOS (
	IDcargo int,
    IDmatricula int,
    foreign key (IDcargo) references CARGOS(IDcargo),
    foreign key (IDmatricula) references PESSOA(IDmatricula),
    DTinicio date,
    DTfim date
);

CREATE TABLE DEPARTAMENTO (
	IDdepartamento int auto_increment primary key,
    NMdepartamento varchar(50)
);

CREATE TABLE LOTACAO (
	IDdepartamento int,
    IDmatricula int,
	foreign key (IDdepartamento) references DEPARTAMENTO(IDdepartamento),
    foreign key (IDmatricula) references PESSOA(IDmatricula),
	DTinicio date,
    DTfim date
);

INSERT INTO NACIONALIDADE (NMnacionalidade)
VALUES ("Brasileiro"),("Canadense"),("Argentino"),("Angolano"),("Mexicano");

INSERT INTO ESTSIVIL (NMestcivil) 
VALUES ("Solteiro"),("Casado"),("Viuvo"),("Noivado");

INSERT INTO BAIRRO (NMbairro) 
VALUES ("Centro"),("Jardim das Flores"),("Vila Nova"),("São João"),("Morada do Sul"),("Boa vista");

INSERT INTO RUA (NMrua) 
VALUES ("Rua das Palmeiras"),("Avenida Central"),("Alameda dos Ipês"),("Rua das Acácias"),("Avenida Brasil"),("Travessa do Sol");

INSERT INTO ENDERECO (numero, logradouro, referencia, cep, IDbairro, IDrua) VALUES (37, "Apartamento 101", "Próximo ao mercado", "12345-678", 1, 1);
INSERT INTO ENDERECO (numero, logradouro, referencia, cep, IDbairro, IDrua) VALUES (70, "Casa térrea", "Em frente à escola", "23456-789", 2, 2);
INSERT INTO ENDERECO (numero, logradouro, referencia, cep, IDbairro, IDrua) VALUES (32, "Bloco B", "Ao lado da farmácia", "34567-890", 5, 5);

INSERT INTO SEXO (NMsexo) VALUES ("Homem"),("Mulher");

INSERT INTO PESSOA (NMpessoa, DTnascimento, rg, cpf, contato, IDnacionalidade, IDestcivil, IDendereco, IDsexo) VALUES ("João Silva", "1985-04-12", "1234567", "111.111.111-11", "joao@email.com", 1, 2, 1, 1);
INSERT INTO PESSOA (NMpessoa, DTnascimento, rg, cpf, contato, IDnacionalidade, IDestcivil, IDendereco, IDsexo) VALUES ("Felippe Angrevisk", "2004-05-05", "2345678", "222.222.222-22", "felippegamescanal@gmail.com", 1, 1, 2, 2);
INSERT INTO PESSOA (NMpessoa, DTnascimento, rg, cpf, contato, IDnacionalidade, IDestcivil, IDendereco, IDsexo) VALUES ("Carlos Pereira", "1975-12-05", "3456789", "333.333.333-33", "carlos@email.com", 2, 3, 3, 1);
INSERT INTO PESSOA (NMpessoa, DTnascimento, rg, cpf, contato, IDnacionalidade, IDestcivil, IDendereco, IDsexo) VALUES ("Helton Dick", "2005-05-26", "9145377", "465.798.700-48", "heltondick123@gmail.com", 1, 1, 1, 1);

INSERT INTO DEPENDENTES (NMpessoa, DTnascimento, rg, cpf, contato, IDnacionalidade, IDestcivil, IDendereco, IDsexo) VALUES ("Ana Silva", "2010-03-10", "9876543", "444.444.444-44", "ana@email.com", 1, 1, 1, 2);
INSERT INTO DEPENDENTES (NMpessoa, DTnascimento, rg, cpf, contato, IDnacionalidade, IDestcivil, IDendereco, IDsexo) VALUES ("Lucas Oliveira", "2012-07-15", "8765432", "555.555.555-55", "lucas@email.com", 1, 1, 2, 1);

INSERT INTO CARGOS (NMcargo) VALUES ("Tecnico eletricista"), ("Tecnico informatica"), ("Estagiario"), ("Supervisor"), ("Operador");

INSERT INTO OCUPADOS (IDcargo, IDmatricula, DTinicio) VALUES (4, 2, "2025-12-01");
INSERT INTO OCUPADOS (IDcargo, IDmatricula, DTinicio) VALUES (2, 4, "2024-12-01");
INSERT INTO OCUPADOS (IDcargo, IDmatricula, DTinicio) VALUES (1, 1, "2023-05-01");
INSERT INTO OCUPADOS (IDcargo, IDmatricula, DTinicio) VALUES (3, 3, "2025-05-26");

INSERT INTO DEPARTAMENTO (NMdepartamento) VALUES ("Recursos Humanos"), ("Telefonia"), ("Compras"), ("Diretoria"), ("TFD"), ("Informatica");

INSERT INTO LOTACAO (IDdepartamento, IDmatricula, DTinicio, DTfim) VALUES (6, 4, "2025-02-17", "2025-06-03");
INSERT INTO LOTACAO (IDdepartamento, IDmatricula, DTinicio, DTfim) VALUES (4, 2, "2025-02-17", null);
INSERT INTO LOTACAO (IDdepartamento, IDmatricula, DTinicio, DTfim) VALUES (5, 3, "2025-02-17", null);
