@ignore
Feature: Autenticação e Geração de Token

  Background:
    * url 'https://bookstore.demoqa.com'

  Scenario: Criar Usuário e Gerar Token
    * def randomString = function(s){ return s + Math.floor(Math.random() * 100000) }
    * def username = randomString('user_')
    * def password = 'Password@123'

    Given path '/Account/v1/User'
    And request { userName: '#(username)', password: '#(password)' }
    When method POST
    Then status 201
    * def userId = response.userID
    
    Given path '/Account/v1/GenerateToken'
    And request { userName: '#(username)', password: '#(password)' }
    When method POST
    Then status 200

    * def token = response.token

    And match token == '#present'
    And match response.status == 'Success'


    * def result = { token: token, userId: userId, username: username }
