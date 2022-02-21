Feature: Post API Demo

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read("response1.json")

  # Simple Post request
  Scenario: Post Demo 1
    Given url 'https://reqres.in/api/users'
    And request {"name": "morpheus","job": "leader"}
    When method POST
    Then status 201
    And print response

  # Post with Background:
  Scenario: Post Demo 2
    Given path '/users'
    And request {"name": "morpheus","job": "leader"}
    When method POST
    Then status 201
    And print response

    # Post with Assertions:
  Scenario: Post Demo 3
    Given path '/users'
    And request {"name": "morpheus","job": "leader"}
    When method POST
    Then status 201
    And match response == {"name": "morpheus","job": "leader","id": "#string","createdAt": "#ignore"}
    And print response

    # Post with read resp from file:
  Scenario: Post Demo 4
    Given path '/users'
    And request {"name": "morpheus","job": "leader"}
    When method POST
    Then status 201
    And match response == expectedOutput
    And print response

    # Post with read request body from file:
  Scenario: Post Demo 5
    Given path '/users'
    And def projectPath = karate.properties['user.dir']
    And print projectPath
    And def filePath = 'request1.json'
    And print filePath
    And def requestBody = read(filePath)
    And request requestBody
    When method POST
    Then status 201
    And match $ == expectedOutput
    And print response

    # Post with read request body from file:
  Scenario: Post Demo 6
    Given path '/users'
    And def requestBody = read("request1.json")
    And set requestBody.job = 'leader'
    And request requestBody
    When method POST
    Then status 201
    And match $ == expectedOutput
    And print response