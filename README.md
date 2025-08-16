# UNS Training 🚀

Este repositório contém um ambiente completo para treinamento prático de **Unified Namespace (UNS)** aplicado em uma fábrica fictícia.  
O objetivo é facilitar o hands-on com dados industriais (OPC, banco de dados relacional e dashboards) utilizando **Docker** como plataforma de infraestrutura.

---

## 📂 Estrutura do repositório

- **docker-compose.yaml** → Define todo o stack necessário (banco de dados, grafana, etc.).
- **create_and_populate.sql** → Script SQL com criação e carga inicial de tabelas de ordens de produção e produção realizada.

---

## 🐳 Stack Docker

O `docker-compose.yaml` sobe os seguintes serviços:

- **PostgreSQL + TimescaleDB** → Base relacional para armazenar dados de ordens e produção.
- **Grafana** → Visualização de dashboards industriais e análises.
- *(outros serviços podem ser adicionados conforme a evolução do treinamento).*

---

## 🗄️ Estrutura das tabelas

Para simplificação, usamos apenas duas tabelas principais:

1. **Ordens de Produção**  
   Contém os pedidos planejados, com informações como código da ordem, produto, quantidade e período planejado.

2. **Produção Realizada**  
   Registra os eventos reais de produção, incluindo quantidade produzida, timestamps e possíveis desvios em relação ao planejado.

---

## ▶️ Como usar

1. **Clone este repositório**:
   ```bash
   git clone git@github.com:hafonseca/uns-training.git
   cd uns-training
   ```

2. **Suba os containers**:

   ```bash
   docker-compose up -d
   ```

3. **Carregue as tabelas no banco**:

   ```bash
   docker exec -i <nome_do_container_postgres> psql -U postgres -d postgres < create_and_populate.sql
   ```

4. **Acesse o Grafana**:

   * URL: [http://localhost:3000](http://localhost:3000)
   * Usuário: `admin`
   * Senha: `admin`

---

## 💡 Observação sobre Docker

O uso do **Docker** neste projeto facilita a reprodução do ambiente em qualquer máquina, garantindo consistência entre os setups.
Além disso, o mesmo conceito pode ser aplicado em **infraestrutura de dados industrial**, acelerando implantações, testes e padronização.

---

## 📜 Licença

Este projeto é aberto para uso livre em treinamentos e estudos.
