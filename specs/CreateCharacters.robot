*Settings*
Documentation    Suite de teste de cadastro de personagens

Resource    ${EXECDIR}/resources/base.robot
Library     ${EXECDIR}/resources/factories/Thanos.py

*Test Cases*
Deve cadastrar um personagem

    Set Client Key    santos.michaelbrendo@gmail.com

    &{personagem}    Factory Thanos         
    ${response}      POST New Characters    ${personagem}

    Status Should Be    200    ${response}

Não deve cadastrar personagem com o mesmo nome

    ${personagem}          Factory Thanos
    POST New Characters    ${personagem}

    ${response}    POST New Characters    ${personagem}

    Status Should Be    409                            ${response}
    Should Be Equal     Character already exists :(    ${response.json()}[error]