CREATE TABLE clientes (
    codigocliente  INTEGER NOT NULL,
    nomecliente    VARCHAR(25),
    cep            VARCHAR(10),
    logradouro     VARCHAR(100),
    complemento    VARCHAR(15),
    bairro         VARCHAR(15),
    cidade         VARCHAR(25),
    uf             CHAR(2),
    codigoibge     INTEGER
);

ALTER TABLE clientes ADD CONSTRAINT clientes_pk PRIMARY KEY ( codigocliente );

CREATE TABLE itemspedido (
    codigoproduto  INTEGER NOT NULL,
    quantidade     INTEGER,
    valorunitario  REAL,
    totalitem      REAL,
    codigopedido   INTEGER NOT NULL
);

ALTER TABLE itemspedido ADD CONSTRAINT itemspedido_pk PRIMARY KEY ( codigoproduto,
                                                                    codigopedido );

CREATE TABLE pedidos (
    codigopedido   INTEGER NOT NULL,
    referencia     VARCHAR(25),
    numeropedido   VARCHAR(15),
    dataemissao    DATE,
    codigocliente  INTEGER NOT NULL,
    tipooperacao   INTEGER,
    totalpedido    REAL
);


ALTER TABLE pedidos ADD CONSTRAINT pedidos_pk PRIMARY KEY ( codigopedido );

CREATE TABLE produtos (
    codigoproduto  INTEGER NOT NULL,
    descricao      VARCHAR(250)
);

ALTER TABLE produtos ADD CONSTRAINT produtos_pk PRIMARY KEY ( codigoproduto );

ALTER TABLE itemspedido
    ADD CONSTRAINT itemspedido_pedidos_fk FOREIGN KEY ( codigopedido )
        REFERENCES pedidos ( codigopedido );

ALTER TABLE itemspedido
    ADD CONSTRAINT itemspedido_produtos_fk FOREIGN KEY ( codigoproduto )
        REFERENCES produtos ( codigoproduto );

ALTER TABLE pedidos
    ADD CONSTRAINT pedidos_clientes_fk FOREIGN KEY ( codigocliente )
        REFERENCES clientes ( codigocliente );