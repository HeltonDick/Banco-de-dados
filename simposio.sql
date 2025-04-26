CREATE DATABASE SIMPOSIO;
USE SIMPOSIO;

-- CRIANDO AS TABELAS PRINCIPAIS
CREATE TABLE SIMPOSIO (
	IDsimposio INT AUTO_INCREMENT PRIMARY KEY,
    NMsimposio VARCHAR(100),
    DTsimposio DATE,
    HRsimposio TIME
);

CREATE TABLE PESSOA (
	IDpessoa INT AUTO_INCREMENT PRIMARY KEY,
    NMpessoa VARCHAR(100),
    sexo CHAR(1),
    idade INT
);

CREATE TABLE CARGO (
	IDcargo INT AUTO_INCREMENT PRIMARY KEY,
    NMcargo VARCHAR(100)
);

CREATE TABLE PALESTRA (
	IDpalestra INT AUTO_INCREMENT PRIMARY KEY,
    NMpalestra VARCHAR(100),
    QTDvagas INT,
    DTpalestra DATE,
    HRpalestra TIME
);

CREATE TABLE MINICURSO (
	IDminicurso INT AUTO_INCREMENT PRIMARY KEY,
    NMminicurso VARCHAR(100),
    QTDvagas INT,
    DTminicurso DATE,
    HRminicurso TIME,
    IDministrante INT,
    FOREIGN KEY (IDministrante) REFERENCES PESSOA(IDpessoa)
);

CREATE TABLE TEMA (
	IDtema INT AUTO_INCREMENT PRIMARY KEY,
    NMtema VARCHAR(100)
);

CREATE TABLE COMISSAO (
	IDcomissao INT AUTO_INCREMENT PRIMARY KEY,
    NMcomissao VARCHAR(100),
    DTcomissao DATE,
    IDtema INT,
    FOREIGN KEY (IDtema) REFERENCES TEMA(IDtema)
);

CREATE TABLE PARECER (
    IDparecer INT AUTO_INCREMENT PRIMARY KEY,
    IDcomissao INT,
    IDartigo INT,
    parecer TEXT,
    DTparecer DATE,
    FOREIGN KEY (IDcomissao) REFERENCES COMISSAO(IDcomissao),
    FOREIGN KEY (IDartigo) REFERENCES ARTIGO(IDartigo)
);


CREATE TABLE ARTIGO (
	IDartigo INT AUTO_INCREMENT PRIMARY KEY,
    NMartigo VARCHAR(100),
    DTartigo DATE,
    IDtema INT,
    FOREIGN KEY (IDtema) REFERENCES TEMA(IDtema)
);
--
--
--
--
-- TABELAS DE RELAÇÃO
CREATE TABLE _ORGANIZACAO (
    IDpessoa INT,
	IDsimposio INT,
    PRIMARY KEY (IDsimposio, IDpessoa),
    FOREIGN KEY (IDsimposio) REFERENCES SIMPOSIO(IDsimposio),
    FOREIGN KEY (IDpessoa) REFERENCES PESSOA(IDpessoa)
);
--
--
-- TABELAS EM TORNO DE PALESTRA
CREATE TABLE _PALESTRANTE (
	IDpessoa INT,
    IDpalestra int,
    PRIMARY KEY (IDpalestra, IDpessoa),
    FOREIGN KEY (IDpalestra) REFERENCES PALESTRA(IDpalestra),
    FOREIGN KEY (IDpessoa) REFERENCES PESSOA(IDpessoa)
);

CREATE TABLE _ESPECTADOR_PALESTRA (
    IDpessoa INT,
	IDpalestra INT,
    PRIMARY KEY (IDpalestra, IDpessoa),
    FOREIGN KEY (IDpalestra) REFERENCES PALESTRA(IDpalestra),
    FOREIGN KEY (IDpessoa) REFERENCES PESSOA(IDpessoa)
);

CREATE TABLE _PALESTRA_TEMA (
	IDtema INT,
    IDpalestra INT,
    PRIMARY KEY (IDpalestra, IDtema),
    FOREIGN KEY (IDpalestra) REFERENCES PALESTRA(IDpalestra),
    FOREIGN KEY (IDtema) REFERENCES TEMA(IDtema)
);

CREATE TABLE _PALESTRA_SIMPOSIO (
	IDsimposio INT,
    IDpalestra INT,
	PRIMARY KEY (IDsimposio, IDpalestra),
    FOREIGN KEY (IDsimposio) REFERENCES SIMPOSIO(IDsimposio),
    FOREIGN KEY (IDpalestra) REFERENCES PALESTRA(IDpalestra)
);
--
--
--
CREATE TABLE _PESSOA_CARGO (
	IDpessoa INT,
    IDcargo INT,
    PRIMARY KEY (IDpessoa, IDcargo),
    FOREIGN KEY (IDpessoa) REFERENCES PESSOA(IDpessoa),
    FOREIGN KEY (IDcargo) REFERENCES CARGO(IDcargo)
);
--
--
-- TABELAS EM TORNO DE MINICURSO
CREATE TABLE _ESPECTADOR_MINICURSO(
	IDpessoa INT,
    IDminicurso INT,
    PRIMARY KEY (IDpessoa, IDminicurso),
    FOREIGN KEY (IDpessoa) REFERENCES PESSOA(IDpessoa),
    FOREIGN KEY (IDminicurso) REFERENCES MINICURSO(IDminicurso)
);

CREATE TABLE _MINICURSO_TEMA (
	IDtema INT,
    IDminicurso INT,
    PRIMARY KEY (IDminicurso, IDtema),
    FOREIGN KEY (IDminicurso) REFERENCES MINICURSO(IDminicurso),
    FOREIGN KEY (IDtema) REFERENCES TEMA(IDtema)
);

CREATE TABLE _MINICURSO_SIMPOSIO (
	IDsimposio INT,
    IDminicurso INT,
	PRIMARY KEY (IDsimposio, IDminicurso),
    FOREIGN KEY (IDsimposio) REFERENCES SIMPOSIO(IDsimposio),
    FOREIGN KEY (IDminicurso) REFERENCES MINICURSO(IDminicurso)
);
--
--
-- TABELAS EM TORNO DE COMISSAO
CREATE TABLE _COMISSAO_PESSOA (
	IDcomissao INT,
    IDpessoa INT,
	PRIMARY KEY (IDcomissao, IDpessoa),
    FOREIGN KEY (IDcomissao) REFERENCES COMISSAO(IDcomissao),
    FOREIGN KEY (IDpessoa) REFERENCES PESSOA(IDpessoa)
);
--
--
-- TABELAS EM TORNO DE ARTIGO
CREATE TABLE _AUTORES (
	IDpessoa INT,
    IDartigo INT,
    PRIMARY KEY (IDpessoa, IDartigo),
    FOREIGN KEY (IDpessoa) REFERENCES PESSOA(IDpessoa),
    FOREIGN KEY (IDartigo) REFERENCES ARTIGO(IDartigo)
);

INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("AMANDA FERREIRA", "F", 19);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("ARTHUR CESAR", "M", 19);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("ENRIQUE GABRIEL", "M", 19);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("FABIANE COSTA", "F", 19);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("GABRIEL BOLZAN", "M", 20);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("GABRIELI CAROLINA", "F", 19);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("HELTON DICK", "M", 19);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("JOÃO VITOR", "M", 20);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("LAURA DREHER", "F", 19);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("MAYSA CERONI", "F", 19);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("VÍTOR ANTÔNIO", "M", 19);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("ANITA BORGES", "F", 19);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("BRENDA CRISTINE", "F", 19);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("ERICK GABRIEL", "M", 18);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("FELIPPE ANGREVSKI", "M", 20);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("GABRIEL CORSO", "M", 19);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("GILBERTO RIBEIRO", "M", 19);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("JACKSON DEBASTIANI", "M", 18);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("JULIA DICK", "F", 19);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("MARIANA BRESSAN", "F", 19);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("RUAN PEDRO", "M", 19);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("VIVIANE COSTA", "F", 19);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("DANIEL", "M", 19);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("FABIO", "M", 200);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("DANIEL", "M", 19);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("MAURICIO GONZATTO", "M", 35);
INSERT INTO PESSOA (NMpessoa, sexo, idade) VALUES ("CLOVIS BARROS", "M", 58);

INSERT INTO SIMPOSIO (NMsimposio, DTsimposio, HRsimposio) 
VALUES ("Simpósio de Tecnologia 2025", "2025-09-10", "09:00:00");
INSERT INTO SIMPOSIO (NMsimposio, DTsimposio, HRsimposio) 
VALUES ("Simpósio de Atividades Fisicas", "2025-09-11", "15:00:00");

INSERT INTO _ORGANIZACAO (IDsimposio, IDpessoa) VALUES (1, 1);
INSERT INTO _ORGANIZACAO (IDsimposio, IDpessoa) VALUES (1, 6);
INSERT INTO _ORGANIZACAO (IDsimposio, IDpessoa) VALUES (1, 2);
INSERT INTO _ORGANIZACAO (IDsimposio, IDpessoa) VALUES (1, 8);
INSERT INTO _ORGANIZACAO (IDsimposio, IDpessoa) VALUES (2, 7);
INSERT INTO _ORGANIZACAO (IDsimposio, IDpessoa) VALUES (2, 15);
INSERT INTO _ORGANIZACAO (IDsimposio, IDpessoa) VALUES (2, 14);
INSERT INTO _ORGANIZACAO (IDsimposio, IDpessoa) VALUES (2, 18);
SELECT * FROM _ORGANIZACAO
WHERE IDsimposio = 1;

INSERT INTO MINICURSO (NMminicurso, QTDvagas, HRminicurso, DTminicurso)
VALUES ('Hardware Básico', 25, '14:00:00', '2025-09-10');
INSERT INTO MINICURSO (NMminicurso, QTDvagas, HRminicurso, DTminicurso) 
VALUES ('Redes', 30, '15:00:00', '2025-09-10');
INSERT INTO MINICURSO (NMminicurso, QTDvagas, HRminicurso, DTminicurso) 
VALUES ('Banco de dados com BRmodelo', 15, '16:00:00', '2025-09-10');
INSERT INTO MINICURSO (NMminicurso, QTDvagas, HRminicurso, DTminicurso) 
VALUES ('Matemática e Tecnologia', 20, '17:00:00', '2025-09-10');
INSERT INTO MINICURSO (NMminicurso, QTDvagas, HRminicurso, DTminicurso)
VALUES ('POO com Java', 30, '18:00:00', '2025-09-10');
INSERT INTO MINICURSO (NMminicurso, QTDvagas, HRminicurso, DTminicurso, IDministrante)
VALUES ('Como arrumar impressoras', 4, '19:00:00', '2025-09-10', 15);

UPDATE MINICURSO
SET IDministrante = 25
WHERE IDminicurso = 3;
UPDATE MINICURSO
SET IDministrante = 17
WHERE IDminicurso = 1;
UPDATE MINICURSO
SET IDministrante = 1
WHERE IDminicurso = 4;
UPDATE MINICURSO
SET IDministrante = 7
WHERE IDminicurso = 2;

INSERT INTO PALESTRA (NMpalestra, QTDvagas, DTpalestra, HRpalestra)
VALUES ("Saude Mental de quem trabalha com texnologia", 100, "2025-09-10", "09:20:00");
INSERT INTO PALESTRA (NMpalestra, QTDvagas, DTpalestra, HRpalestra)
VALUES ("O que é a imspiração", 150, "2025-09-10", "10:00:00");
INSERT INTO PALESTRA (NMpalestra, QTDvagas, DTpalestra, HRpalestra)
VALUES ("As grandes mentes da tecnologia", 200, "2025-09-10", "10:30:00");
INSERT INTO PALESTRA (NMpalestra, QTDvagas, DTpalestra, HRpalestra)
VALUES ("Clovis de Barros", 120, "2025-09-10", "11:00:00");

INSERT INTO CARGO (NMcargo)
VALUES ("Academico"),("Professor"),("Cidadao"),("Outro");

INSERT INTO TEMA (NMtema)
VALUES ("Banco de dados"),("Redes"),("Programacao"),("Realidade Aumentada"),
("Realidade Virtual"),("Hardware"),("Exatas"),("Software"),("Social"),("Inteligencia Artificial");
INSERT INTO TEMA (NMtema)
VALUES ("Tecnologias");

INSERT INTO COMISSAO (NMcomissao, DTcomissao)
VALUES ("Comissao de hardware","2024-09-10"),("Matematicas","2024-04-05"),("Sociologias","2024-09-10")
,("Tecnologias","2020-02-10"),("Programacao","2021-03-12");

UPDATE COMISSAO
SET IDtema = 6
WHERE IDcomissao = 1;
UPDATE COMISSAO
SET IDtema = 7
WHERE IDcomissao = 2;
UPDATE COMISSAO
SET IDtema = 9
WHERE IDcomissao = 3;
UPDATE COMISSAO
SET IDtema = 11
WHERE IDcomissao = 4;
UPDATE COMISSAO
SET IDtema = 3
WHERE IDcomissao = 5;

INSERT INTO ARTIGO (NMartigo, DTartigo)
VALUES ("Processardores Quanticos","2019-01-01"),("Redes Neurais em Ambientes Móveis","2018-12-12"),
("For Java Starters","2020-03-12"),("Internet e seus Servidores","2024-09-01");

INSERT INTO _PESSOA_CARGO VALUES (20, 2), (23, 2), (24, 2), (25, 2); -- PROFESSORES
INSERT INTO _PESSOA_CARGO VALUES (1, 1), (2, 1), (3, 1), (4, 1), (5, 1), -- ALUNOS
(6, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1); -- ALUNOS
INSERT INTO _PESSOA_CARGO VALUES (15, 3), (16, 3), (17, 3); -- CIDADAO
INSERT INTO _PESSOA_CARGO VALUES (26, 3); -- CIDADAO
INSERT INTO _PESSOA_CARGO VALUES (17, 4), (19, 4), (21, 4), (22, 4); -- OUTROS

INSERT INTO _PALESTRANTE VALUES (26, 4);
INSERT INTO _PALESTRANTE VALUES (25, 3), (23, 3), (18, 2), (7, 1);

INSERT INTO _PALESTRA_TEMA VALUES
(9, 1), (9, 2), (9, 4), (11, 3);

INSERT INTO _PALESTRA_SIMPOSIO
VALUES (1, 1), (1, 2), (1, 3), (1, 4);

INSERT INTO _MINICURSO_TEMA 
VALUES (6, 1), (2, 2), (1, 3), (7, 4), (11, 4);
INSERT INTO _MINICURSO_TEMA
VALUES (8, 5), (6, 5), (2, 5);

INSERT INTO _MINICURSO_SIMPOSIO
VALUES (1, 1), (1, 2), (1, 3), (1, 4);

INSERT INTO _ESPECTADOR_PALESTRA
VALUES (1, 3), (2, 3), (3, 3), (4, 3), (5, 3);
INSERT INTO _ESPECTADOR_PALESTRA
VALUES (6, 4), (7, 4), (8, 4), (9, 4), (10, 4);
INSERT INTO _ESPECTADOR_PALESTRA
VALUES (11, 1), (12, 1), (13, 1), (14, 1), (15, 1);
INSERT INTO _ESPECTADOR_PALESTRA
VALUES (20, 2), (23, 2), (24, 2), (25, 2);

INSERT INTO _ESPECTADOR_MINICURSO
VALUES (1, 3), (2, 3), (3, 3), (4, 3), (5, 3);
INSERT INTO _ESPECTADOR_MINICURSO
VALUES (6, 4), (7, 4), (8, 4), (9, 4), (10, 4);
INSERT INTO _ESPECTADOR_MINICURSO
VALUES (11, 1), (12, 1), (13, 1), (14, 1), (15, 1);
INSERT INTO _ESPECTADOR_MINICURSO
VALUES (20, 2), (23, 2), (24, 2), (25, 2);

INSERT INTO _COMISSAO_PESSOA
VALUES (5, 24), (5, 15), (5, 5), (5, 25);
INSERT INTO _COMISSAO_PESSOA
VALUES (1, 7), (1, 4), (1, 17);
INSERT INTO _COMISSAO_PESSOA
VALUES (2, 14), (2, 18), (2, 11);
INSERT INTO _COMISSAO_PESSOA
VALUES (3, 26), (3, 20), (3, 23);
INSERT INTO _COMISSAO_PESSOA
VALUES (4, 1), (4, 2), (4, 3);

UPDATE ARTIGO
SET IDtema = 6
WHERE IDartigo = 1;
UPDATE ARTIGO
SET IDtema = 2
WHERE IDartigo = 2;
UPDATE ARTIGO
SET IDtema = 3
WHERE IDartigo = 3;
UPDATE ARTIGO
SET IDtema = 2
WHERE IDartigo = 4;

INSERT INTO _AUTORES
VALUES (24, 3), (7, 4), (15, 1), (13, 2);

CALL InscreverEmPalestra (3, 19)
CALL InscreverEmMinicurso (3, 13)
CALL InscreverEmMinicurso (4, 13)
CALL InscreverEmMinicurso (5, 26)
CALL InscreverEmMinicurso (5, 25)
CALL InscreverEmMinicurso (5, 24)

CALL InscreverEmMinicurso (23, 5)
CALL DefinirParecer (1, 1, "O artigo apresenta uma proposta relevante e bem estruturada dentro do tema abordado. 
    A introdução...", "2020-01-01")
CALL DefinirParecer (4, 3, "O artigo contribui significativamente para a discussão sobre sustentabilidade urbana, apresentando dados atualizados e uma abordagem metodológica adequada. A revisão de literatura está bem estruturada e fundamenta as escolhas metodológicas dos autores. 
    A redação é clara e objetiva, com bo...", "2025-09-10")

DELIMITER //
CREATE PROCEDURE InscreverEmPalestra (
    IN pessoa_IDpalestra INT,
    IN pessoa_IDpessoa INT
)
BEGIN
    DECLARE vagas_restantes INT;

    -- Calcula vagas restantes
    SELECT PA.QTDvagas - COUNT(P.IDpessoa)
    INTO vagas_restantes
    FROM PALESTRA PA
    LEFT JOIN _ESPECTADOR_PALESTRA P ON PA.IDpalestra = P.IDpalestra
    WHERE PA.IDpalestra = pessoa_IDpalestra
    GROUP BY PA.QTDvagas;

    -- Verifica se ainda tem vaga
    IF vagas_restantes > 0 THEN
        INSERT INTO _ESPECTADOR_PALESTRA (IDpalestra, IDpessoa)
        VALUES (pessoa_IDpalestra, pessoa_IDpessoa);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Não há mais vagas disponíveis nesta palestra.';
    END IF;
END //



DELIMITER //
CREATE PROCEDURE InscreverEmMinicurso (
	IN pessoa_IDminicurso INT,
    IN pessoa_IDpessoa INT
)
BEGIN
	DECLARE vagas_restantes INT;
    
    SELECT MINICURSO.QTDvagas - count(_ESPECTADOR_MINICURSO.IDpessoa)
    INTO vagas_restantes
    FROM MINICURSO
    LEFT JOIN _ESPECTADOR_MINICURSO ON MINICURSO.IDminicurso = _ESPECTADOR_MINICURSO.IDminicurso
    WHERE MINICURSO.IDminicurso = pessoa_IDminicurso
    GROUP BY MINICURSO.QTDvagas;
    
    IF vagas_restantes > 0 THEN
		INSERT INTO _ESPECTADOR_MINICURSO (IDpessoa, IDminicurso)
        VALUES (pessoa_IDpessoa, pessoa_IDminicurso);
	ELSE
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Não há mais vagas disponíveis neste minicurso.';
	END IF;
END //

DELIMITER //
CREATE PROCEDURE DefinirParecer (
    IN p_IDcomissao INT,
    IN p_IDartigo INT,
    IN p_DSparecer TEXT,
    IN p_DTparecer DATE
)
BEGIN
    DECLARE IDtema_comissao INT;
    DECLARE IDtema_artigo INT;

    -- atribuindo os valores de tema da tabela comissao e atigo as variaveis
    SELECT IDtema INTO IDtema_comissao
    FROM COMISSAO
    WHERE IDcomissao = p_IDcomissao;

    SELECT IDtema INTO IDtema_artigo
    FROM ARTIGO
    WHERE IDartigo = p_IDartigo;

    -- Verificar se os temas são iguais
    IF IDtema_comissao = IDtema_artigo THEN
        -- Inserir parecer
        INSERT INTO PARECER (IDcomissao, IDartigo, parecer, DTparecer)
        VALUES (p_IDcomissao, p_IDartigo, p_DSparecer, p_DTparecer);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: Comissão e Artigo possuem temas diferentes.';
    END IF;
END //

-- QUANTAS PESSOA
SELECT COUNT(*)
FROM PESSOA;
-- MEDIA DE IDADES
SELECT AVG(idade)
FROM PESSOA;
-- WHERE e AND
SELECT * FROM PESSOA
WHERE sexo = "M" AND idade >= 20;

-- RELAÇÃO DE NOMES COM OS CARGOS
SELECT 
  PESSOA.NMpessoa, 
  CARGO.NMcargo AS CARGO
FROM 
  PESSOA
INNER JOIN _PESSOA_CARGO ON PESSOA.IDpessoa = _PESSOA_CARGO.IDpessoa
INNER JOIN CARGO ON _PESSOA_CARGO.IDcargo = CARGO.IDcargo;

-- AUTORES E SEUS ARTIGOS
SELECT 
  a.NMartigo,
  p.NMpessoa
FROM 
  _AUTORES aut
INNER JOIN ARTIGO a ON aut.IDartigo = a.IDartigo
INNER JOIN PESSOA p ON aut.IDpessoa = p.IDpessoa;

-- POR DATA DE CRIAÇÃO DE SIMPOSIO
SELECT NMsimposio, DTsimposio 
FROM SIMPOSIO 
ORDER BY DTsimposio;

-- TODOS OS MINICURSO COM MAIS DE 20 VAGAS
SELECT NMminicurso, QTDvagas 
FROM MINICURSO 
WHERE QTDvagas > 20;

-- NOME DOS MINISTRANTES DO MONICURSO
SELECT M.NMminicurso, P.NMpessoa AS Ministrante
FROM MINICURSO M
JOIN PESSOA P ON M.IDministrante = P.IDpessoa;