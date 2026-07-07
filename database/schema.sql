PRAGMA foreign_keys = ON;

-- Criado primeiro pois não depende de nenhuma outra tabela
CREATE TABLE IF NOT EXISTS log_system (
    id_log          INTEGER PRIMARY KEY AUTOINCREMENT,
    user            TEXT NOT NULL DEFAULT 'atendente',
    action          TEXT NOT NULL,
    affected_table  TEXT NOT NULL,
    register_id     INTEGER,
    details         TEXT,
    created_date    TEXT NOT NULL DEFAULT (datetime('now', 'localtime'))
);

-- Clientes
CREATE TABLE IF NOT EXISTS customers (
    id_customer     INTEGER PRIMARY KEY AUTOINCREMENT,
    name            TEXT NOT NULL,
    is_active       INTEGER NOT NULL DEFAULT 1
);

-- Categorias de produtos
CREATE TABLE IF NOT EXISTS category (
    id_category     INTEGER PRIMARY KEY AUTOINCREMENT,
    name            TEXT NOT NULL
);

-- Produtos
CREATE TABLE IF NOT EXISTS products (
    id_product      INTEGER PRIMARY KEY AUTOINCREMENT,
    name            TEXT NOT NULL,
    unit_price      REAL NOT NULL CHECK(unit_price > 0),
    is_active INTEGER NOT NULL DEFAULT 1,
    category_id     INTEGER NOT NULL,
    CONSTRAINT fk_product_category
        FOREIGN KEY (category_id)
        REFERENCES category(id_category)
        ON DELETE RESTRICT
);

-- Marcações (pedidos/fiado)
CREATE TABLE IF NOT EXISTS orders (
    id_order        INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id     INTEGER NOT NULL,
    product_id      INTEGER NOT NULL,
    quantity        INTEGER NOT NULL CHECK(quantity > 0),
    created_date    TEXT NOT NULL DEFAULT (datetime('now')),
    is_credit       INTEGER NOT NULL DEFAULT 0,
    payment_status  TEXT NOT NULL DEFAULT 'PENDENTE'
                    CHECK(payment_status IN ('PENDENTE', 'PARCIALMENTE PAGO', 'PAGO')),
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(id_customer)
        ON DELETE RESTRICT,
        
    CONSTRAINT fk_orders_product
        FOREIGN KEY (product_id)
        REFERENCES products(id_product)
        ON DELETE RESTRICT
);

-- Pagamentos vinculados a marcações
CREATE TABLE IF NOT EXISTS payments (
    id_payment      INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id        INTEGER NOT NULL,
    amount          REAL NOT NULL CHECK(amount > 0),
    paid_date       TEXT NOT NULL DEFAULT (datetime('now')),
    CONSTRAINT fk_payments_orders
        FOREIGN KEY (order_id)
        REFERENCES orders(id_order)
)