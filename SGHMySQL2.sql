CREATE DATABASE SGH;
USE SGH;

CREATE TABLE CLIENTE (
     CPF NUMERIC(11) NOT NULL,
     Nome VARCHAR(50) NOT NULL,
     Sobrenome VARCHAR(50) NOT NULL,
     Num_pessoas NUMERIC(5) NOT NULL,
     Categoria NUMERIC(1) NOT NULL,
     Custo_Categoria NUMERIC(50) NOT NULL,
     Sexo VARCHAR(1) NOT NULL,
     CONSTRAINT ID_CLIENTE_ID PRIMARY KEY (CPF));

CREATE TABLE DEPENDENCIA (
     Tipo VARCHAR(50) NOT NULL,
     Status_de_Limpeza BOOLEAN NOT NULL,
     Nome VARCHAR(50) NOT NULL,
     Custo_de_Uso_Diario_Std NUMERIC(5) NOT NULL,
     Custo_de_Uso_Diario_Premium NUMERIC(5) NOT NULL,
     Custo_de_Uso_Diario_VIP NUMERIC(5) NOT NULL,
     Custo_de_Manutencao NUMERIC(10) NOT NULL,
     Numero_Registro_Imobiliario NUMERIC(15) NOT NULL,
     CONSTRAINT ID_DEPENDENCIA_ID PRIMARY KEY (Nome));

CREATE TABLE ESTACIONAMENTO (
     ID NUMERIC(3) NOT NULL,
     Total_de_vagas NUMERIC(4) NOT NULL,
     Coberto BOOLEAN NOT NULL,
     Custo_Diario NUMERIC(4) NOT NULL,
     Custo_Manutenção NUMERIC(6) NOT NULL,
     Numero_Registro_Imobiliario NUMERIC(15) NOT NULL,
     CONSTRAINT ID_ESTACIONAMENTO_ID PRIMARY KEY (ID));

CREATE TABLE FUNCIONARIO (
     CPF NUMERIC(11) NOT NULL,
     Nome VARCHAR(50) NOT NULL,
     Sobrenome VARCHAR(50) NOT NULL,
     Tipo_de_Contrato VARCHAR(50) NOT NULL,
     Data_de_admissao date NOT NULL,
     Funcao VARCHAR(50) NOT NULL,
     Salario NUMERIC(6) NOT NULL,
     Numero_Registro_Imobiliario NUMERIC(15) NOT NULL,
     CONSTRAINT ID_FUNCIONARIO_ID PRIMARY KEY (CPF));

CREATE TABLE EXECUTIVO (
     CPF NUMERIC(11) NOT NULL,
     Nome VARCHAR(50) NOT NULL,
     Sobrenome VARCHAR(50) NOT NULL,
     Cargo VARCHAR(50) NOT NULL,
     Salário NUMERIC(10) NOT NULL,
     Registro_da_rede NUMERIC(15) NOT NULL,
     CONSTRAINT ID_EXECUTIVO_ID PRIMARY KEY (CPF));

CREATE TABLE TEMATICA (
     Nome VARCHAR(50) NOT NULL,
     Data_Inicio date NOT NULL,
     Data_Termino date NOT NULL,
     Custo NUMERIC(6) NOT NULL,
     Numero_Registro_Imobiliario NUMERIC(15) NOT NULL,
     CONSTRAINT ID_TEMATICA_ID PRIMARY KEY (Nome));

CREATE TABLE GERENTE (
     CPF NUMERIC(11) NOT NULL,
     Numero_Registro_Imobiliario NUMERIC(15) NOT NULL,
     Data_de_inicio_de_gerencia date NOT NULL,
     CONSTRAINT FKFUN_GER_ID PRIMARY KEY (CPF),
     CONSTRAINT FKGERENCIA_ID UNIQUE (Numero_Registro_Imobiliario));

CREATE TABLE HOTEL (
     Numero_Registro_Imobiliario NUMERIC(15) NOT NULL,
     Nome_Fantasia VARCHAR(50) NOT NULL,
     Tamanho_m2 NUMERIC(10) NOT NULL,
     Categoria VARCHAR(50) NOT NULL,
     Loc_Logradouro VARCHAR(50) NOT NULL,
     Loc_Bairro VARCHAR(50) NOT NULL,
     Loc_Numero NUMERIC(10) NOT NULL,
     Loc_Cidade VARCHAR(50) NOT NULL,
     Loc_CEP NUMERIC(8) NOT NULL,
     Loc_Estado VARCHAR(50) NOT NULL,
     Registro_da_rede NUMERIC(15) NOT NULL,
     CONSTRAINT ID_HOTEL_ID PRIMARY KEY (Numero_Registro_Imobiliario));

CREATE TABLE ITEM (
     Nome VARCHAR(50) NOT NULL,
     Tipo VARCHAR(50) NOT NULL,
     Quantidade NUMERIC(2) NOT NULL,
     Custo NUMERIC(5) NOT NULL,
     Numero_do_Quarto NUMERIC(5) NOT NULL,
     CONSTRAINT ID_ITEM_ID PRIMARY KEY (Nome));

CREATE TABLE LOBBY (
     ID NUMERIC(5) NOT NULL,
     Tipo VARCHAR(50) NOT NULL,
     Valor_do_Aluguel NUMERIC(10) NOT NULL,
     Tipo_de_Contrato VARCHAR(50) NOT NULL,
     Data_de_Agregacao_ao_Lobby date NOT NULL,
     Numero_Registro_Imobiliario NUMERIC(15) NOT NULL,
     CONSTRAINT ID_LOBBY_ID PRIMARY KEY (ID));

CREATE TABLE BENEFICIO (
     CPF NUMERIC(11) NOT NULL,
     Origem VARCHAR(50) NOT NULL,
     Nome VARCHAR(50) NOT NULL,
     Metodo_de_recebimento VARCHAR(50) NOT NULL,
     Data_Inicio date NOT NULL,
     Data_Termino date,
     Custo NUMERIC(10) NOT NULL,
     CONSTRAINT ID_BENEFICIO_ID PRIMARY KEY (CPF, Nome));

CREATE TABLE ESTOQUE (
     Tipo VARCHAR(50) NOT NULL,
     Nome VARCHAR(50) NOT NULL,
     Data_de_Validade date NOT NULL,
     Quantidade NUMERIC(10) NOT NULL,
     Custo_Unitario NUMERIC(10) NOT NULL,
     Numero_Registro_Imobiliario NUMERIC(15) NOT NULL,
     CONSTRAINT ID_ESTOQUE_ID PRIMARY KEY (Nome));

CREATE TABLE ACOMODACAO (
     Numero_do_Quarto NUMERIC(5) NOT NULL,
     Limite_de_Ocupacao NUMERIC(2) NOT NULL,
     Quantidade_Banheiros NUMERIC(2) NOT NULL,
     Status_de_Reserva BOOLEAN NOT NULL,
     Acomodacao_de_Luxo BOOLEAN NOT NULL,
     Custo_de_Uso_Diario NUMERIC(6) NOT NULL,
     Numero_Registro_Imobiliario NUMERIC(15) NOT NULL,
     CONSTRAINT ID_ACOMODACAO_ID PRIMARY KEY (Numero_do_Quarto));

CREATE TABLE CONTRATA (
     Numero_Registro_Imobiliario NUMERIC(15) NOT NULL,
     Nome_Empresa VARCHAR(50) NOT NULL,
     Servico_Prestado VARCHAR(50) NOT NULL,
     CONSTRAINT ID_CONTRATA_ID PRIMARY KEY (Nome_Empresa, Servico_Prestado, Numero_Registro_Imobiliario));

CREATE TABLE SERVICOS_TERCEIRIZADOS (
     Nome_Empresa VARCHAR(50) NOT NULL,
     Servico_Prestado VARCHAR(50) NOT NULL,
     Data_Inicio date NOT NULL,
     Custo_Mensal NUMERIC(6) NOT NULL,
     CONSTRAINT ID_SERVICOS_TERCEIRIZADOS_ID PRIMARY KEY (Nome_Empresa, Servico_Prestado));

CREATE TABLE REDE_DE_HOTELARIA (
     Registro_da_rede NUMERIC(15) NOT NULL,
     Data_de_cadastro_da_rede date NOT NULL,
     Loc_Logradouro VARCHAR(50) NOT NULL,
     Loc_Numero NUMERIC(10) NOT NULL,
     Loc_Bairro VARCHAR(50) NOT NULL,
     Loc_CEP NUMERIC(8) NOT NULL,
     Loc_Estado VARCHAR(50) NOT NULL,
     Loc_Cidade VARCHAR(50) NOT NULL,
     Nome_do_Escritorio_Central VARCHAR(50) NOT NULL,
     CNPJ NUMERIC(14) NOT NULL,
     Telefone_Comercial NUMERIC(20) NOT NULL,
     E_mail VARCHAR(50) NOT NULL,
     CONSTRAINT ID_REDE_DE_HOTELARIA_ID PRIMARY KEY (Registro_da_rede));

CREATE TABLE RESERVA (
     ID_da_Reserva NUMERIC(10) NOT NULL,
     Numero_do_Quarto NUMERIC(5) NOT NULL,
     Data_de_compra date NOT NULL,
     Data_de_entrada date NOT NULL,
     Data_de_saida date NOT NULL,
     Metodo_de_pagamento VARCHAR(50) NOT NULL,
     CPF NUMERIC(11) NOT NULL,
     CONSTRAINT ID_RESERVA_ID PRIMARY KEY (ID_da_Reserva),
     CONSTRAINT FKRES_ACO_ID UNIQUE (Numero_do_Quarto));

CREATE TABLE SETORES (
     Numero_Registro_Imobiliario NUMERIC(15) NOT NULL,
     Setores VARCHAR(50) NOT NULL,
     CONSTRAINT ID_Setores_ID PRIMARY KEY (Numero_Registro_Imobiliario, Setores));

CREATE TABLE UTILIZA (
     Placa_Carro VARCHAR(10) NOT NULL,
     CPF NUMERIC(15) NOT NULL,
     Modelo_Carro VARCHAR(50) NOT NULL,
     Cor_Carro VARCHAR(50) NOT NULL,
     ID NUMERIC(3) NOT NULL,
     CONSTRAINT ID_UTILIZA_ID PRIMARY KEY (Placa_Carro),
     CONSTRAINT FKUTI_CLI_ID UNIQUE (CPF));
     
create table CAMPANHAS_MARKETING (
     Nome VARCHAR(50) not null,
     Data_Inicio date not null,
     Categoria VARCHAR(50) not null,
     Custo NUMERIC(10) not null,
     Registro_da_rede NUMERIC(15) not null,
     constraint ID_CAMPANHAS_MARKETING_ID primary key (Nome));
     
create table DEPENDENTES (
     CPF NUMERIC(11) not null,
     Nome VARCHAR(50) not null,
     Sobrenome VARCHAR(50) not null,
     Parentesco VARCHAR(50) not null,
     Data_Nascimento date not null,
     constraint ID_DEPENDENTES_ID primary key (CPF, Nome));
     
create table INVESTIDORES (
     Nome_Investidor VARCHAR(50) not null,
     CPF NUMERIC(11) not null,
     Porcentagem_Lucros NUMERIC(2) not null,
     Data_Inicio date not null,
     constraint ID_INVESTIDORES_ID primary key (CPF));
     
create table LISTA_DE_OCORRENCIAS (
     Tipo_do_processo VARCHAR(50) not null,
     Nome_do_processo VARCHAR(50) not null,
     Numero_do_processo NUMERIC(10) not null,
     Status BOOLEAN not null,
     Data_ocorrencia date not null,
     Valor NUMERIC(10) not null,
     Registro_da_rede NUMERIC(15) not null,
     constraint ID_LISTA_DE_OCORRENCIAS_ID primary key (Numero_do_processo));
     
create table PATROCINADORES (
     Nome VARCHAR(50) not null,
     Tipo_de_patrocinio VARCHAR(50) not null,
     Data_de_Inicio date not null,
     CNPJ NUMERIC(14) not null,
     constraint ID_PATROCINADORES_ID primary key (CNPJ));
     
create table PATROCINAM (
     Numero_Registro_Imobiliario NUMERIC(15) not null,
     CNPJ NUMERIC(14) not null,
     constraint ID_PATROCINAM_ID primary key (Numero_Registro_Imobiliario, CNPJ));
     
create table TEM (
     CPF NUMERIC(11) not null,
     Registro_da_rede NUMERIC(15) not null,
     constraint ID_TEM_ID primary key (Registro_da_rede, CPF));


ALTER TABLE DEPENDENCIA ADD CONSTRAINT FKCONTA_COM_FK
     FOREIGN KEY (Numero_Registro_Imobiliario)
     REFERENCES HOTEL (Numero_Registro_Imobiliario)
     ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE ESTACIONAMENTO ADD CONSTRAINT FKOFERECE_FK
     FOREIGN KEY (Numero_Registro_Imobiliario)
     REFERENCES HOTEL (Numero_Registro_Imobiliario)
     ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE FUNCIONARIO ADD CONSTRAINT FKTRABALHA_PARA_FK
     FOREIGN KEY (Numero_Registro_Imobiliario)
     REFERENCES HOTEL (Numero_Registro_Imobiliario)
     ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE EXECUTIVO ADD CONSTRAINT FKTRABALHA_NA_FK
     FOREIGN KEY (Registro_da_rede)
     REFERENCES REDE_DE_HOTELARIA (Registro_da_rede)
     ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE TEMATICA ADD CONSTRAINT FKVARIA_FK
     FOREIGN KEY (Numero_Registro_Imobiliario)
     REFERENCES HOTEL (Numero_Registro_Imobiliario)
     ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE GERENTE ADD CONSTRAINT FKFUN_GER_FK
     FOREIGN KEY (CPF)
     REFERENCES FUNCIONARIO (CPF)
     ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE GERENTE ADD CONSTRAINT FKGERENCIA_FK
     FOREIGN KEY (Numero_Registro_Imobiliario)
     REFERENCES HOTEL (Numero_Registro_Imobiliario)
     ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE HOTEL ADD CONSTRAINT FKADMINISTRA_FK
     FOREIGN KEY (Registro_da_rede)
     REFERENCES REDE_DE_HOTELARIA (Registro_da_rede)
     ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE ITEM ADD CONSTRAINT FKDISPONIBILIZA_FK
     FOREIGN KEY (Numero_do_Quarto)
     REFERENCES ACOMODACAO (Numero_do_Quarto)
     ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE LOBBY ADD CONSTRAINT FKPOSSUI_FK
     FOREIGN KEY (Numero_Registro_Imobiliario)
     REFERENCES HOTEL (Numero_Registro_Imobiliario)
     ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE BENEFICIO ADD CONSTRAINT FKRECEBE
     FOREIGN KEY (CPF)
     REFERENCES FUNCIONARIO (CPF)
     ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE ESTOQUE ADD CONSTRAINT FKABASTECE_FK
     FOREIGN KEY (Numero_Registro_Imobiliario)
     REFERENCES HOTEL (Numero_Registro_Imobiliario)
     ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE ACOMODACAO ADD CONSTRAINT FKMANTEM_FK
     FOREIGN KEY (Numero_Registro_Imobiliario)
     REFERENCES HOTEL (Numero_Registro_Imobiliario)
     ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE CONTRATA ADD CONSTRAINT FKCON_SER
     FOREIGN KEY (Nome_Empresa, Servico_Prestado)
     REFERENCES SERVICOS_TERCEIRIZADOS (Nome_Empresa, Servico_Prestado)
     ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE CONTRATA ADD CONSTRAINT FKCON_HOT_FK
     FOREIGN KEY (Numero_Registro_Imobiliario)
     REFERENCES HOTEL (Numero_Registro_Imobiliario)
     ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE RESERVA ADD CONSTRAINT FKRES_CLI_FK
     FOREIGN KEY (CPF)
     REFERENCES CLIENTE (CPF)
     ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE RESERVA ADD CONSTRAINT FKRES_ACO_FK
     FOREIGN KEY (Numero_do_Quarto)
     REFERENCES ACOMODACAO (Numero_do_Quarto)
     ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE SETORES ADD CONSTRAINT FKHOT_SET
     FOREIGN KEY (Numero_Registro_Imobiliario)
     REFERENCES HOTEL (Numero_Registro_Imobiliario)
     ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE UTILIZA ADD CONSTRAINT FKUTI_EST_FK
     FOREIGN KEY (ID)
     REFERENCES ESTACIONAMENTO (ID)
     ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE UTILIZA ADD CONSTRAINT FKUTI_CLI_FK
     FOREIGN KEY (CPF)
     REFERENCES CLIENTE (CPF)
     ON DELETE CASCADE ON UPDATE CASCADE;
     
alter table UTILIZA
DROP CONSTRAINT FKUTI_CLI_FK;     
     
alter table CAMPANHAS_MARKETING add constraint FKREALIZA_FK
     foreign key (Registro_da_rede)
     references REDE_DE_HOTELARIA (Registro_da_rede)
     ON DELETE CASCADE ON UPDATE CASCADE;
     
alter table DEPENDENTES add constraint FKDEPENDEM
     foreign key (CPF)
     references FUNCIONARIO (CPF)
     ON DELETE CASCADE ON UPDATE CASCADE;

alter table LISTA_DE_OCORRENCIAS add constraint FKREGISTRA_FK
     foreign key (Registro_da_rede)
     references REDE_DE_HOTELARIA (Registro_da_rede)
     ON DELETE CASCADE ON UPDATE CASCADE;

alter table PATROCINAM add constraint FKPAT_PAT_FK
     foreign key (CNPJ)
     references PATROCINADORES (CNPJ)
     ON DELETE CASCADE ON UPDATE CASCADE;

alter table PATROCINAM add constraint FKPAT_HOT
     foreign key (Numero_Registro_Imobiliario)
     references HOTEL (Numero_Registro_Imobiliario)
     ON DELETE CASCADE ON UPDATE CASCADE;
     
alter table TEM add constraint FKTEM_RED
     foreign key (Registro_da_rede)
     references REDE_DE_HOTELARIA (Registro_da_rede)
     ON DELETE CASCADE ON UPDATE CASCADE;

alter table TEM add constraint FKTEM_INV_FK
     foreign key (CPF)
     references INVESTIDORES (CPF)
     ON DELETE CASCADE ON UPDATE CASCADE;

CREATE UNIQUE INDEX ID_CLIENTE_IND
     ON CLIENTE (CPF);

CREATE UNIQUE INDEX ID_DEPENDENCIA_IND
     ON DEPENDENCIA (Nome);

CREATE INDEX FKCONTA_COM_IND
     ON DEPENDENCIA (Numero_Registro_Imobiliario);

CREATE UNIQUE INDEX ID_ESTACIONAMENTO_IND
     ON ESTACIONAMENTO (ID);

CREATE INDEX FKOFERECE_IND
     ON ESTACIONAMENTO (Numero_Registro_Imobiliario);

CREATE UNIQUE INDEX ID_FUNCIONARIO_IND
     ON FUNCIONARIO (CPF);

CREATE INDEX FKTRABALHA_PARA_IND
     ON FUNCIONARIO (Numero_Registro_Imobiliario);

CREATE UNIQUE INDEX ID_EXECUTIVO_IND
     ON EXECUTIVO (CPF);

CREATE INDEX FKTRABALHA_NA_IND
     ON EXECUTIVO (Registro_da_rede);

CREATE UNIQUE INDEX ID_TEMATICA_IND
     ON TEMATICA (Nome);

CREATE INDEX FKVARIA_IND
     ON TEMATICA (Numero_Registro_Imobiliario);

CREATE UNIQUE INDEX FKFUN_GER_IND
     ON GERENTE (CPF);

CREATE UNIQUE INDEX FKGERENCIA_IND
     ON GERENTE (Numero_Registro_Imobiliario);

CREATE UNIQUE INDEX ID_HOTEL_IND
     ON HOTEL (Numero_Registro_Imobiliario);

CREATE INDEX FKADMINISTRA_IND
     ON HOTEL (Registro_da_rede);

CREATE UNIQUE INDEX ID_ITEM_IND
     ON ITEM (Nome);

CREATE INDEX FKDISPONIBILIZA_IND
     ON ITEM (Numero_do_Quarto);

CREATE UNIQUE INDEX ID_LOBBY_IND
     ON LOBBY (ID);

CREATE INDEX FKPOSSUI_IND
     ON LOBBY (Numero_Registro_Imobiliario);

CREATE UNIQUE INDEX ID_BENEFICIO_IND
     ON BENEFICIO (CPF, Nome);

CREATE UNIQUE INDEX ID_ESTOQUE_IND
     ON ESTOQUE (Nome);

CREATE INDEX FKABASTECE_IND
     ON ESTOQUE (Numero_Registro_Imobiliario);

CREATE UNIQUE INDEX ID_ACOMODACAO_IND
     ON ACOMODACAO (Numero_do_Quarto);

CREATE INDEX FKMANTEM_IND
     ON ACOMODACAO (Numero_Registro_Imobiliario);

CREATE UNIQUE INDEX ID_CONTRATA_IND
     ON CONTRATA (Nome_Empresa, Servico_Prestado, Numero_Registro_Imobiliario);

CREATE INDEX FKCON_HOT_IND
     ON CONTRATA (Numero_Registro_Imobiliario);

CREATE UNIQUE INDEX ID_SERVICOS_TERCEIRIZADOS_IND
     ON SERVICOS_TERCEIRIZADOS (Nome_Empresa, Servico_Prestado);

CREATE UNIQUE INDEX ID_REDE_DE_HOTELARIA_IND
     ON REDE_DE_HOTELARIA (Registro_da_rede);

CREATE UNIQUE INDEX ID_RESERVA_IND
     ON RESERVA (ID_da_Reserva);

CREATE INDEX FKRES_CLI_IND
     ON RESERVA (CPF);

CREATE UNIQUE INDEX FKRES_ACO_IND
     ON RESERVA (Numero_do_Quarto);

CREATE UNIQUE INDEX ID_SETORES_IND
     ON SETORES (Numero_Registro_Imobiliario, Setores);

CREATE UNIQUE INDEX ID_UTILIZA_IND
     ON UTILIZA (Placa_Carro);

CREATE INDEX FKUTI_EST_IND
     ON UTILIZA (ID);

CREATE UNIQUE INDEX FKUTI_CLI_IND
     ON UTILIZA (CPF);
     
create unique index ID_CAMPANHAS_MARKETING_IND
     on CAMPANHAS_MARKETING (Nome);

create index FKREALIZA_IND
     on CAMPANHAS_MARKETING (Registro_da_rede);
     
create unique index ID_DEPENDENTES_IND
     on DEPENDENTES (CPF, Nome);

create unique index ID_INVESTIDORES_IND
     on INVESTIDORES (CPF);

create unique index ID_LISTA_DE_OCORRENCIAS_IND
     on LISTA_DE_OCORRENCIAS (Numero_do_processo);

create index FKREGISTRA_IND
     on LISTA_DE_OCORRENCIAS (Registro_da_rede);

create unique index ID_PATROCINADORES_IND
     on PATROCINADORES (CNPJ);

create unique index ID_PATROCINAM_IND
     on PATROCINAM (Numero_Registro_Imobiliario, CNPJ);

create index FKPAT_PAT_IND
     on PATROCINAM (CNPJ);
     
create unique index ID_TEM_IND
     on TEM (Registro_da_rede, CPF);

create index FKTEM_INV_IND
     on TEM (CPF);

INSERT INTO REDE_DE_HOTELARIA
VALUES ('11111', '2003-01-12', 'Avenida 12', '111', 'Jardim Padroeira', '11111111',
 'SP', 'Osasco', 'Hoteis Gold', '11111111111111', '1134563456', 'hoteisgold@hotmail.com');

INSERT INTO CAMPANHAS_MARKETING
VALUES ('Diversão', '2021-01-12', 'TV', '30000', '11111');
INSERT INTO CAMPANHAS_MARKETING
VALUES ('Inovação', '2008-01-12', 'TV', '20000', '11111');
INSERT INTO CAMPANHAS_MARKETING
VALUES ('Família', '2019-05-11', 'Internet', '25000', '11111');
INSERT INTO CAMPANHAS_MARKETING
VALUES ('Sensações', '2020-06-19', 'Rádio', '10000', '11111');
INSERT INTO CAMPANHAS_MARKETING
VALUES ('Experiências', '2017-07-17', 'TV', '35000', '11111');
INSERT INTO CAMPANHAS_MARKETING
VALUES ('Romântico', '2021-01-12', 'Internet', '20000', '11111');

INSERT INTO INVESTIDORES
VALUES ('Elon Musk', '98989898989', '2', '2020-03-23');
INSERT INTO INVESTIDORES
VALUES ('Bill Gates', '12121212121', '1', '2009-03-14');
INSERT INTO INVESTIDORES
VALUES ('Jeff Bezos', '44444555555', '1', '2018-06-12');
INSERT INTO INVESTIDORES
VALUES ('Vince McMahon', '55555666666', '2', '2011-05-09');
INSERT INTO INVESTIDORES
VALUES ('Monark', '10000000000', '1', '2022-02-13');

INSERT INTO TEM
VALUES ('98989898989', '11111');
INSERT INTO TEM
VALUES ('12121212121', '11111');
INSERT INTO TEM
VALUES ('10000000000', '11111');
INSERT INTO TEM
VALUES ('55555666666', '11111');
INSERT INTO TEM
VALUES ('44444555555', '11111');

INSERT INTO EXECUTIVO
VALUES ('55555555555', 'Alexa', 'Bliss', 'Presidente', '10000000', '11111');
INSERT INTO EXECUTIVO
VALUES ('11122233344', 'Bray', 'Wyatt', 'Diretor', '250000', '11111');
INSERT INTO EXECUTIVO
VALUES ('44433322211', 'Liv', 'Morgan', 'Diretor', '175000', '11111');
INSERT INTO EXECUTIVO
VALUES ('14141414141', 'Randy', 'Orton', 'Vice-Presidente', '800000', '11111');
INSERT INTO EXECUTIVO
VALUES ('11111444444', 'Bobby', 'Orton', 'Diretor', '1500000', '11111');
INSERT INTO EXECUTIVO
VALUES ('66666666666', 'Brock', 'Lesnar', 'Vice-Presidente', '600000', '11111');
INSERT INTO EXECUTIVO
VALUES ('21212121212', 'Bobby', 'Lashley', 'Diretor', '200000', '11111');
INSERT INTO EXECUTIVO
VALUES ('19161916000', 'Finn', 'Balor', 'Diretor', '200000', '11111');
INSERT INTO EXECUTIVO
VALUES ('99900099900', 'Roman', 'Reigns', 'Vice-Presidente', '700000', '11111');
 
INSERT INTO HOTEL
VALUES ('111111', 'The Witcher', '50000', 'Resort', 'Avenida Glória', 'Vila Histórica', '3',
 'Osasco', '13333333', 'SP', '11111');
INSERT INTO HOTEL
VALUES ('222222', 'GOW', '20000', 'Pousada', 'Rua dos Vencidos', 'Jardim dos Superados', '2',
 'Rio de Janeiro', '22222222', 'RJ', '11111');
INSERT INTO HOTEL
VALUES ('333333', 'Elden', '25000', 'Tradicional', 'Rua Goty', 'Jardim Vitória', '2022',
 'Porto Alegre', '33333333', 'RS', '11111');
INSERT INTO HOTEL
VALUES ('444444', 'Crash', '20000', 'Pousada', 'Rua dos Clássicos', 'Vila das Memórias', '1234',
 'Bertioga', '44444444', 'SP', '11111');
INSERT INTO HOTEL
VALUES ('555555', 'Kombat', '30000', 'Tradicional', 'Avenida Escorpião', 'Jardim do Gelo', '12',
 'Osasco', '55555555', 'SP', '11111');

INSERT INTO SERVICOS_TERCEIRIZADOS
VALUES ('Alpha Soluções', 'Segurança', '2020-04-10', '30000');
INSERT INTO SERVICOS_TERCEIRIZADOS
VALUES ('Alpha Soluções', 'Limpeza', '2020-04-10', '15000');
INSERT INTO SERVICOS_TERCEIRIZADOS
VALUES ('Zap Serviços', 'Segurança', '2015-02-17', '40000');
INSERT INTO SERVICOS_TERCEIRIZADOS
VALUES ('Zap Serviços', 'Limpeza', '2015-02-17', '20000');
INSERT INTO SERVICOS_TERCEIRIZADOS
VALUES ('Max Segurança', 'Segurança', '2017-10-10', '50000');
INSERT INTO SERVICOS_TERCEIRIZADOS
VALUES ('Top Limpeza', 'Limpeza', '2014-08-21', '25000');

INSERT INTO CONTRATA
VALUES ('111111', 'Max Segurança', 'Segurança');
INSERT INTO CONTRATA
VALUES ('111111', 'Top Limpeza', 'Limpeza');
INSERT INTO CONTRATA
VALUES ('222222', 'Zap Serviços', 'Segurança');
INSERT INTO CONTRATA
VALUES ('333333', 'Alpha Soluções', 'Segurança');
INSERT INTO CONTRATA
VALUES ('333333', 'Alpha Soluções', 'Limpeza');
INSERT INTO CONTRATA
VALUES ('444444', 'Zap Serviços', 'Limpeza');
INSERT INTO CONTRATA
VALUES ('555555', 'Max Segurança', 'Segurança');

INSERT INTO PATROCINADORES
VALUES ('Real Móveis', '5 anos', '2020-04-01', '12345123451234');
INSERT INTO PATROCINADORES
VALUES ('Hyper Tintas', 'Renovável Anual', '2021-10-12', '11112222333344');
INSERT INTO PATROCINADORES
VALUES ('Ultra Lâmpadas', 'Renovável Anual', '2020-01-20', '66667777888899');
INSERT INTO PATROCINADORES
VALUES ('Pop Bebidas', '2 anos', '2020-08-01', '33333666669999');
INSERT INTO PATROCINADORES
VALUES ('Intra Net', 'Renovável Anual', '2020-09-11', '10001000100010');

INSERT INTO PATROCINAM
VALUES ('111111', '10001000100010');
INSERT INTO PATROCINAM
VALUES ('111111', '66667777888899');
INSERT INTO PATROCINAM
VALUES ('111111', '11112222333344');
INSERT INTO PATROCINAM
VALUES ('222222', '33333666669999');
INSERT INTO PATROCINAM
VALUES ('333333', '11112222333344');
INSERT INTO PATROCINAM
VALUES ('444444', '12345123451234');
INSERT INTO PATROCINAM
VALUES ('444444', '11112222333344');

INSERT INTO LISTA_DE_OCORRENCIAS
VALUES ('Civil', 'Proc_A', '112233', '1', '2006-07-04', '0', '11111');
INSERT INTO LISTA_DE_OCORRENCIAS
VALUES ('Criminal', 'Proc_B', '332211', '1', '2001-05-24', '0', '11111');
INSERT INTO LISTA_DE_OCORRENCIAS
VALUES ('Civil', 'Proc_C', '111000', '0', '2013-10-27', '50000', '11111');
INSERT INTO LISTA_DE_OCORRENCIAS
VALUES ('Civil', 'Proc_D', '909090', '0', '2019-11-20', '200000', '11111');
INSERT INTO LISTA_DE_OCORRENCIAS
VALUES ('Civil', 'Proc_E', '777123', '1', '2022-01-30', '0', '11111');

INSERT INTO ESTOQUE
VALUES ('Pão', 'Pão A', '2023-02-01', '10000', '1', '111111');
INSERT INTO ESTOQUE
VALUES ('Leite', 'Leite A', '2023-03-21', '1000', '5', '111111');
INSERT INTO ESTOQUE
VALUES ('Bolo', 'Bolo A', '2023-01-06', '500', '10', '111111');
INSERT INTO ESTOQUE
VALUES ('Fruta', 'Maçã', '2023-02-13', '1000', '1', '111111');
INSERT INTO ESTOQUE
VALUES ('Pão', 'Pão B', '2023-02-10', '12000', '1', '222222');
INSERT INTO ESTOQUE
VALUES ('Leite', 'Leite B', '2023-03-10', '800', '6', '222222');
INSERT INTO ESTOQUE
VALUES ('Bolo', 'Bolo B', '2023-01-10', '300', '15', '222222');
INSERT INTO ESTOQUE
VALUES ('Fruta', 'Banana', '2023-02-03', '1500', '1', '222222');
INSERT INTO ESTOQUE
VALUES ('Pão', 'Pão C', '2023-01-25', '7000', '2', '333333');
INSERT INTO ESTOQUE
VALUES ('Leite', 'Leite C', '2023-02-17', '1250', '4', '333333');
INSERT INTO ESTOQUE
VALUES ('Bolo', 'Bolo C', '2023-01-09', '600', '10', '333333');
INSERT INTO ESTOQUE
VALUES ('Fruta', 'Pêra', '2023-01-28', '800', '2', '333333');
INSERT INTO ESTOQUE
VALUES ('Pão', 'Pão D', '2023-02-01', '10000', '1', '444444');
INSERT INTO ESTOQUE
VALUES ('Leite', 'Leite D', '2023-03-03', '1500', '5', '444444');
INSERT INTO ESTOQUE
VALUES ('Bolo', 'Bolo D', '2023-01-14', '150', '20', '444444');
INSERT INTO ESTOQUE
VALUES ('Fruta', 'Mamão', '2023-02-05', '500', '4', '444444');
INSERT INTO ESTOQUE
VALUES ('Pão', 'Pão E', '2023-01-27', '15000', '1', '555555');
INSERT INTO ESTOQUE
VALUES ('Leite', 'Leite E', '2023-02-28', '900', '6', '555555');
INSERT INTO ESTOQUE
VALUES ('Bolo', 'Bolo E', '2023-01-11', '300', '15', '555555');
INSERT INTO ESTOQUE
VALUES ('Fruta', 'Manga', '2023-02-01', '600', '5', '555555');

INSERT INTO FUNCIONARIO
VALUES ('91111111111', 'Ric', 'Flair', 'CLT', '2010-06-12', 'Gerente', '15000', '111111');
INSERT INTO FUNCIONARIO
VALUES ('92222222222', 'Charlotte', 'Flair', 'CLT', '2014-02-18', 'Camareiro', '4500', '111111');
INSERT INTO FUNCIONARIO
VALUES ('93333333333', 'Sami', 'Zayn', 'Estágio', '2022-06-21', 'Recepcionista', '2500', '111111');
INSERT INTO FUNCIONARIO
VALUES ('94444444444', 'Kevin', 'Owens', 'CLT', '2015-10-03', 'Chef', '7000', '111111');
INSERT INTO FUNCIONARIO
VALUES ('81111111111', 'Rhea', 'Ripley', 'CLT', '2017-10-20', 'Gerente', '12000', '222222');
INSERT INTO FUNCIONARIO
VALUES ('82222222222', 'Dominik', 'Mysterio', 'Estágio', '2022-07-11', 'Camareiro', '2500', '222222');
INSERT INTO FUNCIONARIO
VALUES ('83333333333', 'Jey', 'Uso', 'CLT', '2016-02-02', 'Recepcionista', '7000', '222222');
INSERT INTO FUNCIONARIO
VALUES ('84444444444', 'Jimmy', 'Uso', 'CLT', '2016-02-02', 'Chef', '7000', '222222');
INSERT INTO FUNCIONARIO
VALUES ('71111111111', 'Rey', 'Mysterio', 'CLT', '2008-05-25', 'Gerente', '12000', '333333');
INSERT INTO FUNCIONARIO
VALUES ('72222222222', 'Matt', 'Hardy', 'CLT', '2014-02-18', 'Camareiro', '4000', '333333');
INSERT INTO FUNCIONARIO
VALUES ('73333333333', 'Xavier', 'Wooods', 'Estágio', '2022-06-21', 'Recepcionista', '2500', '333333');
INSERT INTO FUNCIONARIO
VALUES ('74444444444', 'Kofi', 'Kingston', 'CLT', '2015-10-03', 'Chef', '7000', '333333');
INSERT INTO FUNCIONARIO
VALUES ('61111111111', 'Drew', 'McIntyre', 'CLT', '2018-12-07', 'Gerente', '15000', '444444');
INSERT INTO FUNCIONARIO
VALUES ('62222222222', 'Jeff', 'Hardy', 'CLT', '2013-05-01', 'Camareiro', '4000', '444444');
INSERT INTO FUNCIONARIO
VALUES ('63333333333', 'Matt', 'Riddle', 'CLT', '2019-02-22', 'Recepcionista', '7500', '444444');
INSERT INTO FUNCIONARIO
VALUES ('64444444444', 'Chad', 'Gable', 'CLT', '2014-09-11', 'Chef', '6000', '444444');
INSERT INTO FUNCIONARIO
VALUES ('51111111111', 'Seth', 'Rollins', 'CLT', '2012-07-06', 'Gerente', '14000', '555555');
INSERT INTO FUNCIONARIO
VALUES ('52222222222', 'Becky', 'Lynch', 'CLT', '2017-02-18', 'Camareiro', '4500', '555555');
INSERT INTO FUNCIONARIO
VALUES ('53333333333', 'Austin', 'Theory', 'Estágio', '2021-12-01', 'Recepcionista', '2500', '555555');
INSERT INTO FUNCIONARIO
VALUES ('54444444444', 'Dwayne', 'Johnson', 'CLT', '2014-04-28', 'Chef', '8000', '555555');

INSERT INTO GERENTE
VALUES ('91111111111', '111111', '2010-06-12');
INSERT INTO GERENTE
VALUES ('81111111111', '222222', '2017-10-20');
INSERT INTO GERENTE
VALUES ('71111111111', '333333', '2008-05-25');
INSERT INTO GERENTE
VALUES ('61111111111', '444444', '2018-12-07');
INSERT INTO GERENTE
VALUES ('51111111111', '555555', '2012-07-06');

INSERT INTO DEPENDENTES
VALUES ('72222222222', 'Maxwell', 'Hardy', 'Filho', '2012-04-14');
INSERT INTO DEPENDENTES
VALUES ('72222222222', 'Bartholomew', 'Hardy', 'Filho', '2014-02-20');
INSERT INTO DEPENDENTES
VALUES ('52222222222', 'Roux', 'Lynch', 'Filho', '2020-11-23');
INSERT INTO DEPENDENTES
VALUES ('54444444444', 'Simone', 'Johnson', 'Filho', '2006-08-29');
INSERT INTO DEPENDENTES
VALUES ('64444444444', 'Franklin', 'Moore', 'Enteado', '2016-11-03');
INSERT INTO DEPENDENTES
VALUES ('71111111111', 'Aalyah', 'Mysterio', 'Filho', '2008-01-24');

INSERT INTO BENEFICIO
VALUES ('91111111111', 'Empresarial', 'Férias', 'Dias de Folga', '2022-12-01', '2023-01-01', '0');
INSERT INTO BENEFICIO
VALUES ('61111111111', 'Empresarial', 'Férias', 'Dias de Folga', '2022-12-15', '2023-01-31', '0');
INSERT INTO BENEFICIO
VALUES ('92222222222', 'Governamental', 'Seguro Desemprego', 'Depósito', '2014-02-18', NULL, '450');
INSERT INTO BENEFICIO
VALUES ('74444444444', 'Governamental', 'Seguro Desemprego', 'Depósito', '2015-10-03', NULL, '700');
INSERT INTO BENEFICIO
VALUES ('63333333333', 'Empresarial', 'Plano de Saúde', 'Convênio', '2019-02-22', NULL, '2500');
INSERT INTO BENEFICIO
VALUES ('81111111111', 'Empresarial', 'Plano de Saúde', 'Convênio', '2017-10-20', NULL, '2500');
INSERT INTO BENEFICIO
VALUES ('91111111111', 'Empresarial', 'Plano de Saúde', 'Convênio', '2022-12-01', NULL, '2500');

INSERT INTO DEPENDENCIA
VALUES ('Cassino', '1', 'Gwent', '800', '400', '0', '15000', '111111');
INSERT INTO DEPENDENCIA
VALUES ('Eventos', '1', 'Chamaleon', '300', '0', '0', '10000', '111111');
INSERT INTO DEPENDENCIA
VALUES ('Piscina', '1', 'Pontar', '0', '0', '0', '6000', '111111');
INSERT INTO DEPENDENCIA
VALUES ('Eventos', '0', 'Asgard', '300', '150', '0', '5000', '222222');
INSERT INTO DEPENDENCIA
VALUES ('Piscina', '0', 'Olympus', '0', '0', '0', '2500', '222222');
INSERT INTO DEPENDENCIA
VALUES ('Eventos', '1', 'Radagon Hall', '400', '150', '0', '8000', '333333');
INSERT INTO DEPENDENCIA
VALUES ('Piscina', '0', 'Azula', '0', '0', '0', '5000', '333333');
INSERT INTO DEPENDENCIA
VALUES ('Eventos', '1', 'Island', '500', '0', '0', '7000', '444444');
INSERT INTO DEPENDENCIA
VALUES ('Piscina', '1', 'Wumpa', '0', '0', '0', '3000', '444444');
INSERT INTO DEPENDENCIA
VALUES ('Eventos', '0', 'The Pit', '450', '200', '0', '8500', '555555');
INSERT INTO DEPENDENCIA
VALUES ('Piscina', '1', 'Edenia', '0', '0', '0', '5000', '555555');

INSERT INTO TEMATICA
VALUES ('Natal', '2022-11-28', '2023-01-06', '12000', '111111');
INSERT INTO TEMATICA
VALUES ('Dia dos Namorados', '2023-05-025', '2023-06-20', '3000', '111111');
INSERT INTO TEMATICA
VALUES ('Páscoa', '2023-03-20', '2023-04-20', '8000', '333333');
INSERT INTO TEMATICA
VALUES ('Dia das Crianças', '2023-09-27', '2023-10-22', '6000', '444444');
INSERT INTO TEMATICA
VALUES ('Carnaval', '2023-02-10', '2023-03-10', '5000', '555555');
INSERT INTO TEMATICA
VALUES ('Festa Junina', '2023-06-08', '2023-07-18', '7500', '222222');

INSERT INTO ACOMODACAO
VALUES ('101', '2', '2', '1', '1', '80000', '111111');
INSERT INTO ACOMODACAO
VALUES ('102', '4', '2', '1', '0', '5000', '111111');
INSERT INTO ACOMODACAO
VALUES ('103', '1', '1', '1', '0', '1000', '111111');
INSERT INTO ACOMODACAO
VALUES ('201', '2', '1', '1', '1', '20000', '222222');
INSERT INTO ACOMODACAO
VALUES ('202', '4', '1', '1', '0', '2500', '222222');
INSERT INTO ACOMODACAO
VALUES ('203', '6', '2', '0', '0', '6000', '222222');
INSERT INTO ACOMODACAO
VALUES ('301', '1', '1', '1', '1', '20000', '333333');
INSERT INTO ACOMODACAO
VALUES ('302', '3', '1', '0', '0', '3500', '333333');
INSERT INTO ACOMODACAO
VALUES ('303', '5', '2', '1', '0', '5000', '333333');
INSERT INTO ACOMODACAO
VALUES ('401', '5', '2', '1', '1', '40000', '444444');
INSERT INTO ACOMODACAO
VALUES ('402', '4', '1', '1', '0', '6000', '444444');
INSERT INTO ACOMODACAO
VALUES ('403', '3', '1', '1', '0', '5000', '444444');
INSERT INTO ACOMODACAO
VALUES ('501', '1', '1', '0', '1', '20000', '555555');
INSERT INTO ACOMODACAO
VALUES ('502', '2', '1', '1', '0', '4000', '555555');
INSERT INTO ACOMODACAO
VALUES ('503', '6', '2', '1', '0', '7500', '555555');

INSERT INTO ITEM
VALUES ('Sabonete A', 'Sabonete', '10', '40', '101');
INSERT INTO ITEM
VALUES ('Shampoo A', 'Shampoo', '2', '100', '101');
INSERT INTO ITEM
VALUES ('Sabonete B', 'Sabonete', '10', '8', '201');
INSERT INTO ITEM
VALUES ('Shampoo B', 'Shampoo', '3', '20', '201');
INSERT INTO ITEM
VALUES ('Sabonete C', 'Sabonete', '5', '15', '301');
INSERT INTO ITEM
VALUES ('Shampoo C', 'Shampoo', '1', '30', '301');
INSERT INTO ITEM
VALUES ('Sabonete D', 'Sabonete', '20', '15', '401');
INSERT INTO ITEM
VALUES ('Shampoo D', 'Shampoo', '5', '35', '401');
INSERT INTO ITEM
VALUES ('Sabonete E', 'Sabonete', '7', '20', '501');
INSERT INTO ITEM
VALUES ('Shampoo E', 'Shampoo', '2', '30', '501');

INSERT INTO CLIENTE
VALUES ('99999999999', 'Sterling', 'Archer', '2', '2', 2*2*3000, 'M');
INSERT INTO CLIENTE
VALUES ('70707070707', 'Malory', 'Archer', '1', '1', 1*1*3000, 'F');
INSERT INTO CLIENTE
VALUES ('42424242424', 'Cheryl', 'Tunt', '4', '0', 4*0*3000, 'F');
INSERT INTO CLIENTE
VALUES ('66611166611', 'Davy', 'Jones', '2', '1', 2*1*3000, 'M');
INSERT INTO CLIENTE
VALUES ('88877788877', 'John', 'Cross', '4', '0', 4*0*3000, 'M');
INSERT INTO CLIENTE
VALUES ('81220220000', 'Bill', 'Clinton', '1', '1', 1*1*3000, 'M');
INSERT INTO CLIENTE
VALUES ('17171717171', 'John', 'Cena', '5', '1', 5*1*3000, 'M');
INSERT INTO CLIENTE
VALUES ('14032003000', 'Raissa', 'Estelari', '5', '2', 5*2*3000, 'F');
INSERT INTO CLIENTE
VALUES ('28282828282', 'Cher', 'Horowitz', '4', '0', 4*0*3000, 'F');
INSERT INTO CLIENTE
VALUES ('39393939393', 'Howl', 'Pendragon', '3', '0', 3*0*3000, 'M');
INSERT INTO CLIENTE
VALUES ('40040040040', 'Bill', 'Goldberg', '2', '1', 2*1*3000, 'M');
INSERT INTO CLIENTE
VALUES ('44414441444', 'Damian', 'Priest', '6', '1', 6*1*3000, 'M');

INSERT INTO RESERVA
VALUES ('9101', '101', '2020-12-31', '2021-01-15', '2021-01-31', 'Cheque', '99999999999');
INSERT INTO RESERVA
VALUES ('9102', '102', '2020-12-31', '2021-01-15', '2021-01-31', 'Débito', '70707070707');
INSERT INTO RESERVA
VALUES ('9103', '103', '2020-12-31', '2021-01-15', '2021-01-31', 'Crédito', '42424242424');
INSERT INTO RESERVA
VALUES ('9201', '201', '2020-02-14', '2020-07-01', '2020-07-25', 'Crédito', '66611166611');
INSERT INTO RESERVA
VALUES ('9202', '202', '2020-02-14', '2020-07-01', '2020-07-25', 'Crédito', '88877788877');
INSERT INTO RESERVA
VALUES ('9301', '301', '2021-11-19', '2022-02-14', '2022-03-10', 'Cheque', '81220220000');
INSERT INTO RESERVA
VALUES ('9303', '303', '2021-12-14', '2022-04-01', '2020-04-27', 'Débito', '17171717171');
INSERT INTO RESERVA
VALUES ('9401', '401', '2021-10-12', '2022-03-01', '2022-03-30', 'Débito', '14032003000');
INSERT INTO RESERVA
VALUES ('9402', '402', '2021-10-12', '2022-03-01', '2022-03-30', 'Crédito', '28282828282');
INSERT INTO RESERVA
VALUES ('9403', '403', '2021-10-12', '2022-03-01', '2022-03-30', 'Crédito', '39393939393');
INSERT INTO RESERVA
VALUES ('9502', '502', '2020-08-10', '2020-12-01', '2020-12-15', 'Cheque', '40040040040');
INSERT INTO RESERVA
VALUES ('9503', '503', '2020-07-05', '2020-12-01', '2022-12-15', 'Crédito', '44414441444');

INSERT INTO ESTACIONAMENTO
VALUES ('1', '1000', '1', '300', '15000', '111111');
INSERT INTO ESTACIONAMENTO
VALUES ('2', '300', '0', '80', '8000', '222222');
INSERT INTO ESTACIONAMENTO
VALUES ('3', '600', '1', '200', '10000', '333333');
INSERT INTO ESTACIONAMENTO
VALUES ('4', '500', '1', '150', '10000', '444444');
INSERT INTO ESTACIONAMENTO
VALUES ('5', '400', '0', '150', '9000', '555555');

INSERT INTO UTILIZA
VALUES ('AAA1234', '99999999999', 'La Ferrari', 'Vermelho', '1');
INSERT INTO UTILIZA
VALUES ('BBB1234', '66611166611', 'Tucson', 'Prata', '2');
INSERT INTO UTILIZA
VALUES ('CCC1234', '81220220000', 'Hummer', 'Preto', '3');
INSERT INTO UTILIZA
VALUES ('DDD1234', '14032003000', 'Lamborghini Aventador', 'Laranja', '4');
INSERT INTO UTILIZA
VALUES ('EEE1234', '40040040040', 'Brasília', 'Amarelo', '5');

INSERT INTO SETORES
VALUES ('111111', 'Família');
INSERT INTO SETORES
VALUES ('111111', 'Trabalho');
INSERT INTO SETORES
VALUES ('111111', 'Pets');
INSERT INTO SETORES
VALUES ('111111', 'Adultos');
INSERT INTO SETORES
VALUES ('222222', 'Família');
INSERT INTO SETORES
VALUES ('222222', 'Pets');
INSERT INTO SETORES
VALUES ('333333', 'Pets');
INSERT INTO SETORES
VALUES ('333333', 'Adultos');
INSERT INTO SETORES
VALUES ('333333', 'Trabalho');
INSERT INTO SETORES
VALUES ('444444', 'Pets');
INSERT INTO SETORES
VALUES ('444444', 'Família');
INSERT INTO SETORES
VALUES ('555555', 'Trabalho');
INSERT INTO SETORES
VALUES ('555555', 'Adultos');

INSERT INTO LOBBY
VALUES ('1001', 'Alimentício', '100000', 'Bienal', '2015-03-29', '111111');
INSERT INTO LOBBY
VALUES ('1002', 'Entretenimento', '80000', 'Quinquenal', '2018-11-14', '111111');
INSERT INTO LOBBY
VALUES ('1003', 'Spa', '60000', 'Anual', '2017-07-03', '111111');
INSERT INTO LOBBY
VALUES ('3001', 'Entretenimento', '60000', 'Bienal', '2021-02-11', '333333');
INSERT INTO LOBBY
VALUES ('4001', 'Alimentício', '50000', 'Quinquenal', '2012-04-19', '444444');
INSERT INTO LOBBY
VALUES ('5001', 'Alimentício', '75000', 'Bienal', '2014-12-02', '555555');

alter table PATROCINADORES
on delete cascade;
