-- Arquitetura ScanBase-DB
-- Versão 1.0

CREATE TABLE sites_config (
    id SERIAL PRIMARY KEY,
    dominio VARCHAR(255) UNIQUE NOT NULL,
    metodo VARCHAR(50) NOT NULL,
    configuracao JSONB NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    url TEXT NOT NULL,
    site_id INTEGER NOT NULL REFERENCES sites_config(id)
);

CREATE TABLE historico_precos (
    id BIGSERIAL PRIMARY KEY,
    produto_id INTEGER NOT NULL REFERENCES produtos(id),
    preco DECIMAL(10,2) NOT NULL,
    data_extracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);