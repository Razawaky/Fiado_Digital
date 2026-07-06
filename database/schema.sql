-- Fiado Digital - Schema do Banco de Dados
-- SQLite

CREATE TABLE IF NOT EXISTS customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    is_active INTEGER NOT NULL DEFAULT 1
);