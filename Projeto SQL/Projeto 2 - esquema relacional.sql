-- Banco de Dados para E‑commerce de Livros (MySQL 8.x)
-- Arquivo: ecommerce_livros_mysql.sql

-- === CONFIGURAÇÕES INICIAIS ===
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- === FUNÇÃO PARA GERAR UUID NO MYSQL ===
-- MySQL já possui UUID() nativo.

-- === TABELAS PRINCIPAIS ===

-- Clientes
-- Agora com distinção PF/PJ
CREATE TABLE customers (
  customer_id CHAR(36) PRIMARY KEY DEFAULT (UUID()()),
  customer_type ENUM('PF','PJ') NOT NULL DEFAULT 'PF', -- nova coluna
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  company_name VARCHAR(255), -- para PJ
  cnpj VARCHAR(20), -- somente PJ
  cpf VARCHAR(20),  -- somente PF
  email VARCHAR(255) UNIQUE NOT NULL,
  phone VARCHAR(30),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  customer_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  phone VARCHAR(30),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Endereços
CREATE TABLE addresses (
  address_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
  customer_id CHAR(36),
  label VARCHAR(50),
  street VARCHAR(255) NOT NULL,
  number VARCHAR(30),
  complement VARCHAR(255),
  district VARCHAR(100),
  city VARCHAR(100) NOT NULL,
  state VARCHAR(100) NOT NULL,
  country VARCHAR(100) DEFAULT 'Brasil',
  postal_code VARCHAR(20),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

-- Fornecedores
CREATE TABLE suppliers (
  supplier_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
  company_name VARCHAR(255) NOT NULL,
  contact_name VARCHAR(255),
  email VARCHAR(255),
  phone VARCHAR(50),
  address TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Categorias
CREATE TABLE categories (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  description TEXT
);

-- Produtos (livros)
CREATE TABLE books (
  book_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
  sku VARCHAR(50) UNIQUE NOT NULL,
  title VARCHAR(500) NOT NULL,
  subtitle VARCHAR(500),
  author VARCHAR(255),
  publisher VARCHAR(255),
  publication_date DATE,
  isbn VARCHAR(20) UNIQUE,
  pages INT,
  weight_grams INT,
  dimensions VARCHAR(100),
  price DECIMAL(10,2) NOT NULL,
  cost_price DECIMAL(10,2) DEFAULT 0,
  category_id INT,
  supplier_id CHAR(36),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (category_id) REFERENCES categories(category_id),
  FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- Estoque
CREATE TABLE inventory (
  inventory_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
  book_id CHAR(36),
  location_code VARCHAR(50) DEFAULT 'main_warehouse',
  quantity INT NOT NULL DEFAULT 0,
  reserved INT NOT NULL DEFAULT 0,
  min_level INT DEFAULT 0,
  max_level INT DEFAULT 0,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE
);

-- Movimentações de estoque
CREATE TABLE inventory_movements (
  movement_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
  book_id CHAR(36),
  inventory_id CHAR(36),
  change_qty INT NOT NULL,
  reason VARCHAR(100) NOT NULL,
  reference_id CHAR(36),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (book_id) REFERENCES books(book_id),
  FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id)
);

-- Pedidos
CREATE TABLE orders (
  order_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
  customer_id CHAR(36),
  shipping_address_id CHAR(36),
  billing_address_id CHAR(36),
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(30) DEFAULT 'pending',
  subtotal DECIMAL(12,2) DEFAULT 0,
  shipping_cost DECIMAL(10,2) DEFAULT 0,
  taxes DECIMAL(10,2) DEFAULT 0,
  discount DECIMAL(10,2) DEFAULT 0,
  total DECIMAL(12,2) DEFAULT 0,
  currency VARCHAR(10) DEFAULT 'BRL',
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE SET NULL,
  FOREIGN KEY (shipping_address_id) REFERENCES addresses(address_id) ON DELETE SET NULL,
  FOREIGN KEY (billing_address_id) REFERENCES addresses(address_id) ON DELETE SET NULL
);

-- Itens do pedido
CREATE TABLE order_items (
  order_item_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
  order_id CHAR(36),
  book_id CHAR(36),
  sku VARCHAR(50),
  quantity INT NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,
  line_total DECIMAL(12,2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
  FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Pagamentos
CREATE TABLE payments (
  payment_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
  order_id CHAR(36),
  amount DECIMAL(12,2) NOT NULL,
  method VARCHAR(50) NOT NULL,
  provider_transaction_id VARCHAR(255),
  status VARCHAR(30) DEFAULT 'pending',
  paid_at TIMESTAMP NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
);

-- Transportadoras
CREATE TABLE shippers (
  shipper_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
  name VARCHAR(255) NOT NULL,
  website VARCHAR(255),
  phone VARCHAR(50)
);

-- Remessas
CREATE TABLE shipments (
  shipment_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
  order_id CHAR(36),
  shipper_id CHAR(36),
  tracking_number VARCHAR(255),
  shipped_date TIMESTAMP NULL,
  delivery_date TIMESTAMP NULL,
  cost DECIMAL(10,2) DEFAULT 0,
  status VARCHAR(30) DEFAULT 'pending',
  FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
  FOREIGN KEY (shipper_id) REFERENCES shippers(shipper_id)
);

-- Pedidos de compra
CREATE TABLE purchase_orders (
  po_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
  supplier_id CHAR(36),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  expected_arrival TIMESTAMP NULL,
  status VARCHAR(30) DEFAULT 'open',
  total_amount DECIMAL(12,2) DEFAULT 0,
  FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

CREATE TABLE purchase_order_items (
  poi_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
  po_id CHAR(36),
  book_id CHAR(36),
  quantity INT NOT NULL,
  unit_cost DECIMAL(10,2) NOT NULL,
  line_total DECIMAL(12,2) NOT NULL,
  FOREIGN KEY (po_id) REFERENCES purchase_orders(po_id) ON DELETE CASCADE,
  FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Logs
CREATE TABLE audit_logs (
  log_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
  entity VARCHAR(100),
  entity_id CHAR(36),
  action VARCHAR(50),
  payload JSON,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- === ÍNDICES ===
CREATE INDEX idx_books_sku ON books(sku);
CREATE INDEX idx_books_title ON books(title);
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_payments_order ON payments(order_id);

-- === TRIGGERS ADAPTADOS PARA MYSQL ===
-- MySQL não permite SELECT FOR UPDATE em triggers antes do update final.
-- Será necessário aplicar lógica via procedures em vez de triggers automáticos.
-- Posso gerar procedures se desejar.

-- === PROCEDURES PARA ESTOQUE (MYSQL) ===

-- Procedure: reservar estoque ao adicionar item ao pedido
DELIMITER $$
CREATE PROCEDURE reserve_stock(IN p_book_id CHAR(36), IN p_quantity INT, IN p_order_id CHAR(36))
BEGIN
  DECLARE v_inventory_id CHAR(36);
  DECLARE v_qty INT;
  DECLARE v_reserved INT;

  SELECT inventory_id, quantity, reserved INTO v_inventory_id, v_qty, v_reserved
  FROM inventory WHERE book_id = p_book_id LIMIT 1 FOR UPDATE;

  IF v_qty - v_reserved < p_quantity THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Estoque insuficiente';
  END IF;

  UPDATE inventory
    SET reserved = reserved + p_quantity,
        last_updated = CURRENT_TIMESTAMP
    WHERE inventory_id = v_inventory_id;

  INSERT INTO inventory_movements(movement_id, book_id, inventory_id, change_qty, reason, reference_id)
  VALUES(UUID(), p_book_id, v_inventory_id, -p_quantity, 'order_reserved', p_order_id);
END$$
DELIMITER ;

-- Procedure: descontar estoque após pagamento capturado
DELIMITER $$
CREATE PROCEDURE capture_payment_stock(IN p_order_id CHAR(36))
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE v_book CHAR(36);
  DECLARE v_qty INT;
  DECLARE v_inv CHAR(36);
  DECLARE cur CURSOR FOR
    SELECT book_id, quantity FROM order_items WHERE order_id = p_order_id;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO v_book, v_qty;
    IF done = 1 THEN LEAVE read_loop; END IF;

    SELECT inventory_id INTO v_inv FROM inventory WHERE book_id = v_book LIMIT 1 FOR UPDATE;

    UPDATE inventory
      SET quantity = quantity - v_qty,
          reserved = GREATEST(reserved - v_qty, 0),
          last_updated = CURRENT_TIMESTAMP
      WHERE inventory_id = v_inv;

    INSERT INTO inventory_movements(movement_id, book_id, inventory_id, change_qty, reason, reference_id)
    VALUES(UUID(), v_book, v_inv, -v_qty, 'order_sold', p_order_id);
  END LOOP;
  CLOSE cur;
END$$
DELIMITER ;

-- === TRIGGERS SIMPLES ===

-- Trigger audit para INSERT
DELIMITER $$
CREATE TRIGGER trg_audit_insert
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
  INSERT INTO audit_logs(log_id, entity, entity_id, action, payload)
  VALUES(UUID(), 'orders', NEW.order_id, 'INSERT', NULL);
END$$
DELIMITER ;

-- Trigger audit para UPDATE
DELIMITER $$
CREATE TRIGGER trg_audit_update
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
  INSERT INTO audit_logs(log_id, entity, entity_id, action, payload)
  VALUES(UUID(), 'orders', NEW.order_id, 'UPDATE', NULL);
END$$
DELIMITER ;

-- === SCRIPTS DE CARGA (EXEMPLOS) ===

INSERT INTO customers(customer_id, first_name, last_name, email, phone)
VALUES(UUID(), 'Diogo', 'Marques', 'diogo@example.com', '11999990000');

INSERT INTO categories(name, description)
VALUES
  ('Ficção', 'Livros de ficção'),
  ('Negócios', 'Gestão, finanças e startups'),
  ('Tecnologia', 'Programação e TI');

INSERT INTO suppliers(supplier_id, company_name, contact_name, email, phone)
VALUES(UUID(), 'Editora Exemplo', 'João Editor', 'contato@editora.com', '1133445566');

INSERT INTO books(book_id, sku, title, author, price, cost_price, category_id, supplier_id)
VALUES
  (UUID(), 'SKU001', 'O Poder do Hábito', 'Charles Duhigg', 59.90, 30.00, 2,
   (SELECT supplier_id FROM suppliers LIMIT 1)),
  (UUID(), 'SKU002', 'Clean Code', 'Robert Martin', 99.90, 45.00, 3,
   (SELECT supplier_id FROM suppliers LIMIT 1));

INSERT INTO inventory(inventory_id, book_id, quantity, reserved)
SELECT UUID(), book_id, 50, 0 FROM books;


