*Settings*
Documentation    Suite de teste cadastro de personagens

Resource    ${EXECDIR}/resources/base.robot
Library     ${EXECDIR}/resources/factories/Guardians.py

Suite Setup    Super Setup    santos.michaelbrendo@gmail.com

*Test Cases*
Deve cadastrar um personagem

    &{personagem}    Factory Thanos         
    ${response}      POST New Characters    ${personagem}

    Status Should Be    200    ${response}

Não deve cadastrar personagem com o mesmo nome
    [Tags]    dup

    ${personagem}          Factory Deadpool
    POST New Characters    ${personagem}

    ${response}    POST New Characters    ${personagem}

    Status Should Be    409                            ${response}
    Should Be Equal     Character already exists :(    ${response.json()}[error]