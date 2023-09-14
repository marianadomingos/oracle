-- Criando usuário cursoplsql
CREATE USER cursoplsql IDENTIFIED BY cursoplsql
                       DEFAULT tablespace users;

-- Concedendo privilégios
GRANT connect, resource TO cursoplsql;

-- Criando tabela SegMercado
CREATE TABLE SegMercado(ID NUMBER(5),Descricao VARCHAR2(100));

-- Adicionado Primary Key na tabela Segmercado
ALTER TABLE Segmercado ADD CONSTRAINT SegMercado_id_pk PRIMARY KEY(ID);

--------------- OTIMIZADO -----------
CREATE TABLE SEGMERCADO(
 ID NUMBER(5),
 DESCRICAO VARCHAR2(100),
 CONSTRAINT SEGMERCADO_ID_PK PRIMARY KEY (ID)
);

-------------------------------------

-- Criando tabela Cliente
CREATE TABLE Cliente
  ( ID NUMBER(5),
    Razao_Social VARCHAR2(100),
    CNPJ VARCHAR2(20),
    SegMercado_id NUMBER(5),
    Data_Inclusao DATE,
    Faturamento_Previsto NUMBER(10,2),
    Categoria VARCHAR2(20));

-- Adicionar PK na tabela Cliente
ALTER TABLE Cliente ADD CONSTRAINT Cliente_id_pk PRIMARY KEY(ID);

-- Adicionar FK na tabela Cliente
ALTER TABLE Cliente ADD CONSTRAINT Cliente_SegMercado_fk FOREIGN KEY(SegMercado_id) REFERENCES Segmercado(id) ;


---------- OTIMIZADO  ----------------
CREATE TABLE CLIENTE (
 ID NUMBER(5),
 SEGMERCADO_ID NUMBER(5),
 RAZAO_SOCIAL VARCHAR2(100),
 CNPJ VARCHAR2(100),
 DATA_INCLUSAO DATE,
 FATURAMENTO_PREVISTO NUMBER(10,2),
 CATEGORIA VARCHAR2(20),
 CONSTRAINT CLIENTE_ID_PK PRIMARY KEY (ID),
 CONSTRAINT CLIENTE_SEGMERCADO_FK FOREIGN KEY (SEGMERCADO_ID) REFERENCES SEGMERCADO (ID)
);
