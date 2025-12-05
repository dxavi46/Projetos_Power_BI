# Projeto 1 - Análise de Dados (Power BI)

## 📄 Visão Geral

O arquivo **`Projeto1_Power BI.pbix`** é o formato nativo e consolidado do **Microsoft Power BI Desktop**. Ele armazena o projeto completo de Business Intelligence, incluindo a totalidade dos dados importados, o modelo de dados, todas as fórmulas de cálculo e o design do relatório visual.

O principal objetivo deste projeto é transformar dados brutos em insights de negócios acionáveis por meio de visualizações interativas e um modelo de dados robusto.

---

## 🛠️ Ferramentas de Desenvolvimento

| Ferramenta | Descrição e Finalidade Principal |
| :--- | :--- |
| **Microsoft Power BI Desktop** | O ambiente principal de desenvolvimento. Usado para modelagem de dados, criação de métricas, e design e construção de relatórios interativos. |
| **Power Query Editor** | Ambiente integrado dentro do Power BI Desktop para a **conexão** e **transformação (ETL)** dos dados. É onde a limpeza, filtragem, união e estruturação inicial dos dados são realizadas. |

---

## 🧩 Recursos e Linguagens Chave

O projeto utiliza diferentes componentes para construir o modelo de dados e o relatório final.

### 1. Recursos de Dados e Transformação

* **Fontes de Dados:** Os dados brutos foram importados de fontes externas (como bancos de dados, arquivos Excel/CSV, ou serviços Web) e são armazenados de forma compactada dentro do arquivo `.pbix`.
* **Linguagem M (Power Query Formula Language):** Utilizada no **Power Query Editor** para escrever o código de transformação de dados (ETL). Esta linguagem garante que os dados estejam limpos e estruturados antes de serem carregados no modelo.

### 2. Modelo e Métricas

* **Modelo de Dados:** A estrutura de tabelas e relacionamentos otimizada para desempenho e análise. Isso inclui a definição de conexões entre tabelas de fatos e dimensões.
* **Linguagem DAX (Data Analysis Expressions):** É a linguagem de fórmula analítica utilizada para:
    * Criar **Medidas (Measures)**, que são as fórmulas dinâmicas para KPIs e agregações (ex: Faturamento Total, Média de Vendas).
    * Criar **Colunas Calculadas** para adicionar atributos derivados ao modelo.

### 3. Visualização e Relatório

* **Layout do Relatório:** As diversas páginas e elementos visuais que compõem a interface interativa do projeto.
* **Visuais Padrão e Personalizados:** O projeto utiliza a biblioteca padrão de gráficos e tabelas do Power BI. O projeto pode incluir visuais personalizados para atender a necessidades específicas de apresentação.

---

## 🚀 Como Executar o Projeto

1.  **Abrir:** O arquivo deve ser aberto usando o **Microsoft Power BI Desktop**.
2.  **Explorar:** Navegue pelas abas do relatório para consumir os insights visuais.
