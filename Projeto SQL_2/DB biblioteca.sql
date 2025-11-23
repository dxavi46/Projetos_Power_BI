-- =============================
-- CRIAÇÃO DO BANCO DE DADOS
-- =============================
CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

-- =============================
-- TABELA: MEMBROS
-- =============================
CREATE TABLE membros (
    id_membro INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    data_cadastro DATE DEFAULT (CURDATE())
);

-- =============================
-- TABELA: LIVROS
-- =============================
CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    autor VARCHAR(150) NOT NULL,
    ano_publicacao INT,
    genero VARCHAR(80),
    isbn VARCHAR(30) UNIQUE
);

-- =============================
-- TABELA: ACERVO
-- Cada livro pode ter várias cópias
-- =============================
CREATE TABLE acervo (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_livro INT NOT NULL,
    codigo_barras VARCHAR(40) UNIQUE NOT NULL,
    status ENUM('disponivel','emprestado','danificado') DEFAULT 'disponivel',
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);

-- =============================
-- TABELA: EMPRÉSTIMOS
-- =============================
CREATE TABLE emprestimos (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_membro INT NOT NULL,
    id_item INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao_prevista DATE NOT NULL,
    data_devolucao_real DATE,
    FOREIGN KEY (id_membro) REFERENCES membros(id_membro),
    FOREIGN KEY (id_item) REFERENCES acervo(id_item)
);

-- =============================
-- INSERÇÃO DE MEMBROS (10)
-- =============================
INSERT INTO membros (nome, email, telefone) VALUES
('Ana Souza', 'ana.souza@email.com', '11995551234'),
('Carlos Pereira', 'carlos.p@email.com', '11972224567'),
('Marina Lopes', 'marina.l@gmail.com', '11986667890'),
('Rafael Silva', 'rafael.silva@outlook.com', '11991110000'),
('Julia Andrade', 'julia.andrade@yahoo.com', '11940028922'),
('Pedro Alves', 'pedro.alves@gmail.com', '11998887766'),
('Fernanda Castro', 'fernanda.castro@uol.com', '11993334455'),
('Lucas Martins', 'lucas.martins@gmail.com', '11997776655'),
('Beatriz Ramos', 'beatriz.ramos@email.com', '11991112222'),
('João Carvalho', 'joao.carvalho@gmail.com', '11992223344');

-- =============================
-- INSERÇÃO DE LIVROS (20)
-- =============================
INSERT INTO livros (titulo, autor, ano_publicacao, genero, isbn) VALUES
('Dom Casmurro', 'Machado de Assis', 1899, 'Romance', 'ISBN001'),
('Capitães da Areia', 'Jorge Amado', 1937, 'Drama', 'ISBN002'),
('O Hobbit', 'J.R.R. Tolkien', 1937, 'Fantasia', 'ISBN003'),
('1984', 'George Orwell', 1949, 'Ficção', 'ISBN004'),
('Admirável Mundo Novo', 'Aldous Huxley', 1932, 'Ficção', 'ISBN005'),
('O Pequeno Príncipe', 'Saint-Exupéry', 1943, 'Infantil', 'ISBN006'),
('A Revolução dos Bichos', 'George Orwell', 1945, 'Fábula', 'ISBN007'),
('Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 1997, 'Fantasia', 'ISBN008'),
('O Nome do Vento', 'Patrick Rothfuss', 2007, 'Fantasia', 'ISBN009'),
('O Senhor dos Anéis', 'J.R.R. Tolkien', 1954, 'Fantasia', 'ISBN010'),
('Crime e Castigo', 'Dostoiévski', 1866, 'Romance', 'ISBN011'),
('Orgulho e Preconceito', 'Jane Austen', 1813, 'Romance', 'ISBN012'),
('Coraline', 'Neil Gaiman', 2002, 'Fantasia', 'ISBN013'),
('Duna', 'Frank Herbert', 1965, 'Sci-Fi', 'ISBN014'),
('It - A Coisa', 'Stephen King', 1986, 'Terror', 'ISBN015'),
('Drácula', 'Bram Stoker', 1897, 'Terror', 'ISBN016'),
('O Iluminado', 'Stephen King', 1977, 'Terror', 'ISBN017'),
('Sapiens', 'Yuval Noah Harari', 2011, 'História', 'ISBN018'),
('Mindset', 'Carol Dweck', 2006, 'Autoajuda', 'ISBN019'),
('A Arte da Guerra', 'Sun Tzu', -500, 'Estratégia', 'ISBN020');

-- =============================
-- INSERÇÃO NO ACERVO (cópias)
-- =============================
INSERT INTO acervo (id_livro, codigo_barras) VALUES
(1,'C001'),(1,'C002'),
(2,'C003'),(3,'C004'),
(4,'C005'),(5,'C006'),
(6,'C007'),(7,'C008'),
(8,'C009'),(9,'C010'),
(10,'C011'),(11,'C012'),
(12,'C013'),(13,'C014'),
(14,'C015'),(15,'C016'),
(16,'C017'),(17,'C018'),
(18,'C019'),(19,'C020');

-- =============================
-- EMPRÉSTIMOS (exemplos)
-- =============================
INSERT INTO emprestimos (id_membro, id_item, data_emprestimo, data_devolucao_prevista) VALUES
(1, 1, '2025-01-10', '2025-01-20'),
(2, 3, '2025-01-15', '2025-01-25'),
(3, 5, '2025-01-18', '2025-01-28'),
(4, 7, '2025-01-20', '2025-01-30');

select * from membros;
select * from livros;
select * from acervo;


-- QUERIES
-- recuperação simples-SELECT
SELECT nome, email FROM membros;

SELECT titulo, autor FROM livros;

-- filtros-WHERE
SELECT * FROM livros
WHERE genero = 'Fantasia';

SELECT * FROM membros
WHERE nome LIKE '%a%';

-- atibutos derivados
-- quantos dias o membro está com o livro?
SELECT 
    id_emprestimo,
    id_membro,
    DATEDIFF(CURRENT_DATE, data_emprestimo) AS dias_desde_emprestimo
FROM emprestimos;

-- ordenação-ORDER BY
SELECT titulo, ano_publicacao
FROM livros
ORDER BY ano_publicacao DESC;

-- filtro por grupos-HAVING
-- autores com mais de um livro publicado
SELECT autor, COUNT(*) AS total_livros
FROM livros
GROUP BY autor
HAVING COUNT(*) > 1;

-- relacionamentos completos
-- Listar empréstimos com nome do membro e título do livro
SELECT 
    e.id_emprestimo,
    m.nome AS membro,
    l.titulo AS livro,
    e.data_emprestimo,
    e.data_devolucao_prevista
FROM emprestimos e
JOIN membros m ON e.id_membro = m.id_membro
JOIN acervo a ON e.id_item = a.id_item
JOIN livros l ON a.id_livro = l.id_livro;





