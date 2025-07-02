DROP DATABASE IF EXISTS trab2;

CREATE DATABASE trab2;

\connect trab2;

CREATE TABLE evento (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    data_inicio DATE,
    data_fim DATE,
    bairro TEXT,
    rua TEXT,
    cep CHARACTER(8),
    nro VARCHAR(6)
);

CREATE TABLE participante (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE inscricao (
    participante_id INTEGER REFERENCES participante (id) ON DELETE CASCADE,
    evento_id INTEGER REFERENCES evento (id) ON DELETE CASCADE,
    data DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (participante_id, evento_id)
);

CREATE TABLE palestra (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    evento_id INTEGER REFERENCES evento (id) ON DELETE CASCADE,
    data_hora TIMESTAMP
);

CREATE TABLE palestrante (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE palestra_palestrante (
    palestra_id INTEGER REFERENCES palestra (id) ON DELETE CASCADE,
    palestrante_id INTEGER REFERENCES palestrante (id) ON DELETE CASCADE,
    PRIMARY KEY (palestra_id, palestrante_id)
)