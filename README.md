<div align="center">

# Automação de Testes - BookStore API
### Desafio Técnico | Karate DSL

![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white)
![Karate](https://img.shields.io/badge/Karate-DSL-ff5c5c?style=for-the-badge)
![Maven](https://img.shields.io/badge/maven-%23C71A36.svg?style=for-the-badge&logo=apachemaven&logoColor=white)
![Status](https://img.shields.io/badge/Status-Concluído-success?style=for-the-badge)

</div>

---

## Sobre o Projeto
Este projeto consiste na criação de uma suíte de testes automatizados para a API **BookStore (DemoQA)**. O objetivo foi validar fluxos críticos de autenticação e gerenciamento de livros, garantindo a qualidade e integridade dos dados.

A estrutura foi pensada para ser escalável, utilizando **reaproveitamento de código** e execução dinâmica de dados.

---

## Funcionalidades e Diferenciais
O projeto atende a todos os requisitos obrigatórios e diferenciais propostos:

- [x] **Autenticação Robusta:** Geração de Token único (`callonce`) e injeção automática no header.
- [x] **Fluxo End-to-End:** Criação, consulta e validação de livros com captura dinâmica de ISBN.
- [x] **Limpeza de Dados:** Cenários que garantem a integridade do teste (Delete antes do Post).
- [x] **Cobertura de Falhas:** Testes negativos utilizando *Scenario Outline*.
- [x] **Diferencial:** Validação de contrato (Schema Validation).
- [x] **Diferencial:** Cobertura de múltiplos endpoints GET.

---

## Tecnologias Utilizadas

| Tecnologia | Função |
| :--- | :--- |
| **Java 17** | Linguagem base do projeto |
| **Karate DSL** | Framework de testes e asserções |
| **Maven** | Gerenciador de dependências e execução |
| **JUnit 5** | Motor de execução dos testes |

---

## Pré-requisitos

Antes de começar, você vai precisar ter instalado em sua máquina:
* [Java JDK 11+](https://www.oracle.com/java/technologies/downloads/)
* [Maven](https://maven.apache.org/download.cgi)
* IDE de sua preferência (VS Code, IntelliJ, Eclipse)


