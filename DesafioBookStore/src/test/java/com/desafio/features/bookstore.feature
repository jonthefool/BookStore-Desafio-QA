Feature: Testes da BookStore

  Background:
    * url 'https://bookstore.demoqa.com'
    * def auth = callonce read('auth.feature')
    * def token = auth.token
    * def userId = auth.userId

    * print 'Token Autenticação:', token
    * print 'UserID:', userId

    * configure headers = { Authorization: '#("Bearer " + token)' }

    * def bookSchema = { isbn: '#string', title: '#string', subTitle: '##string', author: '#string', publish_date: '#present', publisher: '#string', pages: '#number', description: '#string', website: '#string' }

  Scenario: Listar Catálogo e Validar Schema (GET)
    Given path '/BookStore/v1/Books'
    When method GET
    Then status 200
    And match each response.books == bookSchema

  @smoke
  Scenario: Fluxo End-to-End de Livro
    Given path '/BookStore/v1/Books'
    When method GET
    Then status 200
    * def isbn1 = response.books[0].isbn
    * def isbn2 = response.books[1].isbn

    Given path '/BookStore/v1/Books'
    And param UserId = userId
    When method DELETE
    Then status 204

    Given path '/BookStore/v1/Books'
    And request { userId: '#(userId)', collectionOfIsbns: [ { isbn: '#(isbn1)' } ] }
    When method POST
    Then status 201
    And match response.books[0].isbn == isbn1

    Given path '/BookStore/v1/Book'
    And param ISBN = isbn1
    When method GET
    Then status 200
    And match response.isbn == isbn1

    Given path '/BookStore/v1/Books/' + isbn1
    And request { userId: '#(userId)', isbn: '#(isbn2)' }
    When method PUT
    Then status 200
    And match response.books[0].isbn == isbn2

  Scenario Outline: Testes de Falha (Data Driven)
    Given path '<endpoint>'
    And if ('<payload>' != 'null') karate.set('request', <payload>)
    And param ISBN = '<paramIsbn>'
    When method <metodo>
    Then status <statusEsperado>

    Examples:
      | endpoint              | metodo | payload                                                        | paramIsbn | statusEsperado |
      | /BookStore/v1/Books   | POST   | { userId: '#(userId)', collectionOfIsbns: [{ isbn: '9999' }] } | null      | 400            |
      | /BookStore/v1/Book    | GET    | null                                                           | 12345     | 400            |
      | /BookStore/v1/Books/0 | PUT    | { userId: '#(userId)', isbn: '9999' }                          | null      | 400            |


  Scenario: Deletar Usuário (Limpeza Final)
    Given path '/Account/v1/User/' + userId
    When method DELETE

    Then status 204
