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

CREATE TABLE INDERECO (
	IDindereco int auto_increment primary key,
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

CREATE TABLE PESSOA (
	IDmatricula int auto_increment primary key,
    NMpessoa varchar(30),
    DTnascimento date,
    rg varchar(15),
    cpf varchar(15),
    contato varchar(100),
    IDnacionalidade int,
    IDestcivil int,
    IDindereco int,
    IDsexo int,
    foreign key (IDnacionalidade) references NACIONALIDADE(IDnacionalidade),
    foreign key (IDestcivil) references ESTSIVIL(IDestcivil),
    foreign key (IDindereco) references INDERECO(IDindereco),
    foreign key (IDsexo) references SEXO(IDsexo)
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
    IDindereco int,
    IDsexo int,
    foreign key (IDnacionalidade) references NACIONALIDADE(IDnacionalidade),
    foreign key (IDestcivil) references ESTSIVIL(IDestcivil),
    foreign key (IDindereco) references INDERECO(IDindereco),
    foreign key (IDsexo) references SEXO(IDsexo)
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

INSERT INTO NACIONALIDADE (NMnacionalidade) VALUES ("Brasileiro"),("Canadense"),("Argentino"),("Angolano"),("Mexicano");
INSERT INTO ESTSIVIL (NMestcivil) VALUES ("Solteiro"),("Casado"),("Viuvo"),("Noivado");
INSERT INTO BAIRRO (NMbairro) VALUES ("Bairro1"),("Bairro2"),("Bairro3"),("Bairro4"),("Bairro5"),("Bairro6"),("Bairro7"),("Bairro8"),("Bairro9"),("Bairro10");
INSERT INTO RUA (NMrua) VALUES ("Rua1"),("Rua2"),("Rua3"),("Rua4"),("Rua5"),("Rua6"),("Rua7"),("Rua8"),("Rua9"),("Rua10"),("Rua11"),("Rua12"),("Rua13"),("Rua14");

INSERT INTO INDERECO (numero, logradouro, referencia, cep, IDbairro, IDrua) VALUES (37,"Casa de esquina","Mercado", "999-999",1 ,1);
INSERT INTO INDERECO (numero, logradouro, referencia, cep, IDbairro, IDrua) VALUES (5,"Apartamento","Igreja", "113-498",2 ,2);
INSERT INTO INDERECO (numero, logradouro, referencia, cep, IDbairro, IDrua) VALUES (78,"Casa","Ponto de ônibus", "786-456",2 ,2);

INSERT INTO SEXO (NMsexo) VALUES ("Homem"),("Mulher");

INSERT INTO PESSOA (NMpessoa, DTnascimento, rg, cpf, contato, IDnacionalidade, IDestcivil, IDindereco, IDsexo) VALUES (
"Helton", "2025-05-26", "123-123-123", "123.123.123-10", "heltondick123@gmail.com", 1, 1, 1, 1);

INSERT INTO PESSOA (NMpessoa, DTnascimento, rg, cpf, contato, IDnacionalidade, IDestcivil, IDindereco, IDsexo) VALUES (
	"Helton", "2025-05-26", "123-123-123", "123.123.123-10", "heltondick123@gmail.com", 1, 1, 1, 1
);

INSERT INTO DEPENDENTES (NMpessoa, DTnascimento, rg, cpf, contato, IDnacionalidade, IDestcivil, IDindereco, IDsexo) VALUES (
	"Notleh", "2025-01-01", "123.123.123", "123.456.789-10", "heltondick321@gmail.com", 1, 2, 1, 1
);

INSERT INTO CARGOS (NMcargo) VALUES ("Tecnico eletricista"), ("Tecnico informatica"), ("Estagiario"), ("Supervisor"), ("Operador");

INSERT INTO OCUPADOS (IDcargo, IDmatricula, DTinicio) VALUES (2, 5, "2025-02-17");

INSERT INTO DEPARTAMENTO (NMdepartamento) VALUES ("Recursos Humanos"), ("Telefonia"), ("Compras"), ("Diretoria"), ("TFD"), ("Informatica");