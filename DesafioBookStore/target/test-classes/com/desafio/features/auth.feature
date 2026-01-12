@ignore
Feature: Autenticação e Geração de Token

  Background:
    * url 'https://bookstore.demoqa.com'

  Scenario: Criar Usuário e Gerar Token
    # 1. Gerar nome de usuário aleatório para não dar conflito
    * def randomString = function(s){ return s + Math.floor(Math.random() * 100000) }
    * def username = randomString('user_')
    * def password = 'Password@123'
    # (A senha precisa ter 1 maiúscula, 1 caractere especial e numero)

    # 2. Criar o Usuário (Account/v1/User)
    Given path '/Account/v1/User'
    And request { userName: '#(username)', password: '#(password)' }
    When method POST
    Then status 201
    * def userId = response.userID

    # 3. Gerar o Token (Account/v1/GenerateToken)
    Given path '/Account/v1/GenerateToken'
    And request { userName: '#(username)', password: '#(password)' }
    When method POST
    Then status 200
    # O token vem dentro do campo "token"
    * def token = response.token

    # Valida que o token não é nulo
    And match token == '#present'
    And match response.status == 'Success'

    # 4. Retornar as variáveis para quem chamou (o bookstore.feature)
    * def result = { token: token, userId: userId, username: username }