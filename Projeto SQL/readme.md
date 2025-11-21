# 📚 E-commerce de Livros — Banco de Dados (MySQL)

Modelo completo de banco de dados para um **e-commerce de livros**, implementado em **MySQL 8**. Inclui tabelas essenciais, procedures, triggers e dados de exemplo.

---

## 🚀 Funcionalidades Principais
- Clientes PF e PJ com validações distintas
- Produtos, categorias e fornecedores
- Controle de estoque com reserva e baixa
- Pedidos, itens, pagamentos e fretes
- Auditoria via triggers
- Scripts de carga (INSERTs iniciais)

---

## 🏗 Estrutura Inclui
- **customers** (PF/PJ)
- **products**, **categories**, **suppliers**
- **stock** e movimentações
- **orders**, **order_items**
- **payments**, **shipping**
- **audit_logs**

Tabelas com UUID, InnoDB, UTF8MB4 e relacionamentos completos.

---

## 🛠 Procedures
### Reserva de Estoque
Garante quantidade disponível antes de confirmar pedido.

### Baixa após Pagamento
Remove reserva e reduz estoque físico após aprovação.

---

## 🧩 Triggers
- Auditoria de alterações
- Registro automático de eventos de pedidos e pagamentos

---

## 📦 Dados de Exemplo
Inclui inserts para:
- Produtos
- Categorias
- Fornecedores
- Clientes PF/PJ
- Estoques iniciais

---

## 📈 Fluxo Resumido
1. Pedido criado → estoque reservado
2. Pagamento aprovado → baixa de estoque
3. Pedido atualizado → frete gerado

---

## 🔧 Possíveis Extensões
- Views de relatórios (vendas, estoque mínimo)
- Procedure de cancelamento com devolução
- Diagrama ERD
- API REST baseada no schema

---

## 📄 Licença
Uso livre para estudo ou projetos comerciais.

---

Quer que eu gere também o **diagrama ERD** ou uma **versão em inglês** para o GitHub?

