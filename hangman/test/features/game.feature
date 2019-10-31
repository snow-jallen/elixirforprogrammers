Feature: play game

Scenario: Play a game
    Given I have a new game with the word gadget
    When I guess g
    Then the number of turns left is 7