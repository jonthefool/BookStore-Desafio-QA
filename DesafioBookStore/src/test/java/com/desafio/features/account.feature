Feature: Gestão de Contas

  Background:
    * url baseUrl

  Scenario: Criar e Deletar Usuário (Ciclo Completo)
    * def newUserName = faker.name().username() + faker.number().digits(4)
    * def password = 'Password@123'

    Given path '/Account/v1/User'
    And request { userName: '#(newUserName)', password: '#(password)' }
    When method POST
    Then status 201
    * def userId = response.userID

    Given path '/Account/v1/GenerateToken'
    And request { userName: '#(newUserName)', password: '#(password)' }
    When method POST
    Then status 200
    * def token = response.token

    Given path '/Account/v1/User/' + userId
    And header Authorization = 'Bearer ' + token
    When method DELETE
    Then status 204