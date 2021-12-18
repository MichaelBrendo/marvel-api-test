*Settings*
Documentation    Test Suite: Should register characters in Marvel API

Resource    ${EXECDIR}/resources/base.robot
Library     ${EXECDIR}/resources/factories/MarvelCharacters.py

Suite Setup    Super Setup    santos.michaelbrendo@gmail.com

*Test Cases*
Should register characters

    &{character}    Factory Thanos         
    ${response}     POST New Characters    ${character}

    Status Should Be    200    ${response}

Should not register a character with the same name.
    [Tags]    dup

    &{character}           Factory Deadpool
    POST New Characters    ${character}

    ${response}    POST New Characters    ${character}

    Status Should Be    409                            ${response}
    Should Be Equal     Character already exists :(    ${response.json()}[error]