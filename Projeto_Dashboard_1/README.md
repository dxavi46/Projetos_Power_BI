# 📊 Dashboard de Vendas -- Livraria

Este repositório contém o arquivo **Projeto_Dashboard_1.xlsx**, que
reúne a base de dados, cálculos automatizados e um dashboard interativo
para análise de desempenho das vendas da livraria.

O objetivo deste documento é explicar **a estrutura**, **os dados**,
**os cálculos** e **os indicadores exibidos no dashboard**.

------------------------------------------------------------------------

## 📁 Estrutura do Arquivo

O arquivo é composto por **4 abas principais**:

### **1. Assets**

Recursos visuais utilizados no dashboard (ícones, fundos etc).

### **2. Banco de Dados**

Base de vendas detalhada contendo: - Data da venda\
- Mês/ano agrupado\
- Título do livro\
- Autor\
- Nome do cliente\
- Quantidade vendida\
- Valor unitário\
- Valor total da venda\
- Forma de pagamento

### **3. Cálculos**

Área de tabelas dinâmicas e métricas intermediárias que alimentam o
dashboard, como: - Total de vendas por forma de pagamento\
- Total vendido por mês\
- Soma geral de faturamento

### **4. Dashboard_Vendas_Livraria**

Interface final do dashboard, onde os indicadores e visualizações são
exibidos ao usuário.

------------------------------------------------------------------------

## 📈 Indicadores do Dashboard

O dashboard apresenta uma visão clara e resumida da performance da
livraria, incluindo:

### 🔹 **1. Demonstrativo Geral de Vendas**

Inclui: - Total vendido no período\
- Quantidade total de itens vendidos\
- Valor médio dos pedidos\
- Ticket médio por cliente

### 🔹 **2. Vendas por Período (Mês/Ano)**

Baseado no campo **Data da Venda_mes_ano**, o dashboard permite: -
Comparar meses diferentes\
- Observar evolução de faturamento\
- Analisar sazonalidade

### 🔹 **3. Análise de Formas de Pagamento**

A partir das tabelas da aba **Cálculos**, o dashboard apresenta: - Total
por cartão de crédito\
- Total por Pix\
- Total por dinheiro\
- Participação percentual de cada método

### 🔹 **4. Desempenho por Livro e Autor**

Com base no Banco de Dados, permite analisar: - Livros mais vendidos\
- Autores com maior faturamento gerado\
- Quantidades e valores totais por título

### 🔹 **5. Detalhamento de Cada Venda**

O usuário consegue explorar: - Cliente\
- Livro comprado\
- Quantidade\
- Preço unitário\
- Data\
- Forma de pagamento

------------------------------------------------------------------------

## 🧮 Base de Dados e Cálculos

### **Banco de Dados**

A estrutura segue o padrão tabular:

  Campo                   Descrição
  ----------------------- -----------------------------------
  Data da Venda           Data individual da compra
  Data da Venda_mes_ano   Agrupamento para análises mensais
  Título do Livro         Livro vendido
  Autor                   Autor do livro
  Nome do Cliente         Cliente comprador
  Quantidade              Nº de exemplares vendidos
  Preço Unitário          Valor por unidade
  Valor Total             Quantidade × Preço Unitário
  Pagamento               Forma de pagamento

### **Cálculos**

A aba de cálculos utiliza tabelas dinâmicas e agregações para alimentar
o dashboard com: - Soma de valores totais\
- Totais por forma de pagamento\
- Totais por período\
- Indicadores financeiros

Esses dados são atualizados automaticamente conforme a base recebe novos
registros.

------------------------------------------------------------------------

## 📊 Visualização e Usabilidade

O dashboard foi criado com foco em: - Leitura rápida e clara\
- Indicadores essenciais em destaque\
- Seções organizadas e intuitivas\
- Cores, ícones e layouts uniformes

A aba **Dashboard_Vendas_Livraria** apresenta o painel consolidado com
todos os insights importantes, ideal para tomada de decisão.

------------------------------------------------------------------------

## ✔️ Como atualizar o Dashboard

1.  Vá até a aba **Banco de Dados**\
2.  Insira novas linhas com vendas adicionais\
3.  Atualize as tabelas dinâmicas na aba **Cálculos**\
4.  O dashboard será automaticamente atualizado
