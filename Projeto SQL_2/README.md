# 📚 Sistema de Gerenciamento de Biblioteca  
Projeto – Banco de Dados MySQL

Este repositório contém o projeto completo de um **banco de dados relacional para um sistema de biblioteca**, incluindo:

- Modelagem lógica das principais entidades  
- Script SQL completo para criação do banco  
- Inserção de dados iniciais (10 membros, 20 livros, acervo, empréstimos)  
- Exemplos de consultas SQL usando:  
  - SELECT  
  - WHERE  
  - ORDER BY  
  - HAVING  
  - JOINs  
  - Expressões derivadas  

O objetivo é fornecer uma base para estudos de SQL, consultas complexas, e boas práticas de modelagem de dados.

---

## 🗂️ Estrutura do Banco de Dados

### **Entidades principais:**

- **Membros** – usuários cadastrados na biblioteca  
- **Livros** – informações bibliográficas  
- **Acervo** – cópias físicas dos livros (códigos de barras)  
- **Empréstimos** – controle dos itens emprestados  

### **Relacionamentos:**

- Um **livro** possui várias **cópias (acervo)**  
- Um **membro** pode fazer vários **empréstimos**  
- Cada **empréstimo** refere-se a um item específico do acervo  

---

## 🛠️ Tecnologias Utilizadas

- **MySQL 8.x**  
- Scripts SQL padrão ANSI  
- Ferramentas recomendadas:  
  - MySQL Workbench  
  - DBeaver  
  - phpMyAdmin  

---

## 🧱 Estrutura dos Arquivos (sugerida)

```
📁 biblioteca-sql
 ├── README.md
 ├── sql/
 │   ├── create_tables.sql
 │   ├── insert_data.sql
 │   └── queries_examples.sql
 └── diagrams/
     ├── er_conceitual.png
     ├── er_logico.png
     └── er_fisico.png
```

---

## 🧩 Script SQL Completo

O projeto inclui:

### ✔️ Criação do banco de dados  
### ✔️ Tabelas normalizadas  
### ✔️ Chaves primárias e estrangeiras  
### ✔️ Inserts com dados de teste  
### ✔️ Exemplos de consultas para estudo

> O script está pronto para execução no MySQL sem modificações.

---

## 📥 Inserção de Dados (Mock Data)

O banco inclui:

- **10 membros** fictícios  
- **20 livros** de autores diversos  
- **20 itens de acervo** (1 cópia por livro)  
- **Empréstimos de exemplo**  

Esse conjunto facilita o uso das consultas SQL demonstradas no projeto.

---

## 🔍 Exemplos de Consultas SQL

A seguir, estão demonstrados os tipos de tarefas incluídas no projeto:

---

### **1. SELECT – Recuperação simples**

```sql
SELECT nome, email FROM membros;
```

---

### **2. WHERE – Filtros**

```sql
SELECT * FROM livros WHERE genero = 'Fantasia';
```

---

### **3. Expressões derivadas (atributos calculados)**

```sql
SELECT 
    id_emprestimo,
    DATEDIFF(CURRENT_DATE, data_emprestimo) AS dias_desde_emprestimo
FROM emprestimos;
```

---

### **4. ORDER BY – Ordenação**

```sql
SELECT titulo, ano_publicacao
FROM livros
ORDER BY ano_publicacao DESC;
```

---

### **5. HAVING – Filtro aplicado ao GROUP BY**

```sql
SELECT autor, COUNT(*) AS total_livros
FROM livros
GROUP BY autor
HAVING COUNT(*) > 1;
```

---

### **6. JOINs – Consulta Relacional Completa**

```sql
SELECT 
    e.id_emprestimo,
    m.nome AS membro,
    l.titulo AS livro,
    e.data_emprestimo
FROM emprestimos e
JOIN membros m ON e.id_membro = m.id_membro
JOIN acervo a ON e.id_item = a.id_item
JOIN livros l ON a.id_livro = l.id_livro;
```

---

## 📘 Diagramas ER

O repositório pode incluir:

- **Diagrama Conceitual (ER)**  
- **Diagrama Lógico**  
- **Diagrama Físico (MySQL Workbench)**  

Se desejar, posso gerar os diagramas em **PNG, SVG ou PDF**.

---

## 🎯 Objetivo Educacional

Este projeto foi desenvolvido para:

- Ajudar estudantes a entenderem **modelagem relacional**  
- Aplicar **consultas SQL básicas e avançadas**  
- Criar um sistema pequeno, porém realista, para estudos  

---

## 📄 Licença

Este projeto pode ser utilizado livremente para fins acadêmicos ou de estudo.
