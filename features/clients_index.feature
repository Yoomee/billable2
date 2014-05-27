Feature: Clients index

  Scenario: Viewing clients index
    Given there's a client named "epic co" and with description "Another client"
    When I am on the clients index page
    Then I should see the client named "epic co"