## **📊 Projeto: Análise e Engenharia de Dados sobre Feminicídio no Brasil**



**🎯 Objetivo do Projeto**

---

Este projeto foi desenvolvido como um desafio acadêmico na **PUC Minas**, visando aplicar técnicas avançadas de **Engenharia de Dados** para estruturar, limpar e analisar dados sensíveis sobre o feminicídio no Brasil.

###### 

O foco central não foi apenas a visualização, mas a criação de uma **pipeline de dados resiliente**, capaz de processar grandes volumes de informações brutas (arquivos .csv e .parquet) e transformá-las em um modelo multidimensional (Star Schema) pronto para análise de BI.

#### 

**🚀 Arquitetura e Fluxo de Dados**

---

Implementamos um fluxo robusto baseado em **ELT (Extract, Load, Transform):**



**Ingestão (Extract \& Load):** Desenvolvemos uma aplicação em C# que automatiza a descompactação de pacotes de dados e realiza a carga massiva no PostgreSQL utilizando o comando COPY. Isso garante que a ingestão seja performática, mesmo com arquivos volumosos.



**Tratamento (Transform):** No banco de dados, aplicamos camadas de limpeza rigorosas:



**Normalização:** Conversão de tipos de dados inconsistentes (datas/horas "sujas").



**Integridade Referencial:** Criação de chaves estrangeiras e tabelas dimensionais para garantir que não haja perda de dados em filtros no Power BI.



**Otimização:** Criação de índices estratégicos para reduzir o tempo de resposta das consultas analíticas.



**Visualização (BI):** Dashboards interativos que cruzam dados demográficos e geográficos para identificar padrões sociais.



**🛠️ Stack Tecnológica**

---

**Linguagem de Backend:** C# (.NET Core)



**Banco de Dados:** PostgreSQL



**Modelagem:** Star Schema (Fatos e Dimensões)



**Visualização:** Power BI Desktop



**Bibliotecas \& Drivers:** Npgsql (PostgreSQL), CsvHelper (Data Mapping), ParquetSharp (Análise de arquivos colunares).

#### 

**📂 Estrutura do Repositório**

---

```text

├── dashboards/          # Arquivos .pbix e documentação visual

├── database/            # Scripts SQL para criação de tabelas e transformações (ELT)

├── docs/                # Relatórios técnicos e metodológicos

├── src/                 # Código-fonte da aplicação de ingestão em C#

└── README.md            

```

**🧠 Desafios Técnicos Resolvidos**

---

**Data Cleaning:** Implementação de lógica SQL com CASE WHEN e COALESCE para tratar registros nulos ou formatados incorretamente em colunas críticas (ex: Horário do óbito).



**Performance:** Substituição de INSERT simples pelo comando COPY do PostgreSQL, reduzindo drasticamente o tempo de carga de dados.



**Modelagem Dimensional:** Conversão de uma tabela de fatos única em um esquema Star, facilitando análises temporais e geográficas.



**👥 Equipe de Desenvolvimento**

---

**Projeto realizado pelo grupo:**



* Alexandre Machado Ferreira e Silva



* Guilherme Henrique Souza



* Marcus de Oliveira dos Santos



* Pedro Henrique Levinski Filo



* Sara Belintani



* Thiago Ximenes Naves



* Orientação: Prof. Gleisson Albergaria Amaral | PUC Minas



