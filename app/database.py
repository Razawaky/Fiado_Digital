import sqlite3
import os

# rotas, caminhos que nao vao mudar para nao dar erro "arq nao encontrado"
APP_DIR = os.path.dirname(os.path.abspath(__file__))
ROOT_DIR = os.path.dirname(APP_DIR)
DB_PATH = os.path.join(ROOT_DIR, "database", "sistema.db")
SCHEMA_PATH = os.path.join(ROOT_DIR, "database", "schema.sql")

def get_db_connection(): 
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
        #força o sqlite a respeitar as FK em toda conexao
    conn.execute("PRAGMA foreign_keys = ON;")
    return conn

def init_db():
    os.makedirs(os.path.dirname(DB_PATH), exist_ok=True)
    
    conn = get_db_connection()
    with open(SCHEMA_PATH, 'r', encoding='utf-8') as f:
        conn.executescript(f.read())
    conn.commit()
    conn.close()