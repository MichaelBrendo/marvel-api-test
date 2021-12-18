*Settings*
Documentation    Suite de teste: devo buscar um personagem cadastrado

Resource    ${EXECDIR}/resources/base.robot
Library     ${EXECDIR}/resources/factories/MarvelCharacters.py

Suite Setup    Super Setup    santos.michaelbrendo@live.com

*Test Cases*
Deve buscar um personagem pelo Id

    ${personagem}      Factory Spider Man
    ${spiderman}       POST New Characters    ${personagem}
    ${spiderman_id}    Set Variable           ${spiderman.json()}[_id]

    ${response}    GET Character By Id    ${spiderman_id}

    Status Should Be    200    ${response}

    Should Be Equal        ${spiderman.json()}[name]       ${personagem}[name]
    Should Be Equal        ${spiderman.json()}[age]        ${personagem}[age]
    Should Be Equal        ${spiderman.json()}[aliases]    ${personagem}[aliases]
    Should Be Equal        ${spiderman.json()}[team]       ${personagem}[team]
    Should Be Equal        ${spiderman.json()}[active]     ${personagem}[active]
    Should Not Be Empty    ${spiderman.json()}[owner]  

Não deve retornar o personagem pelo Id

    ${personagem_id}        Get Unique Id

    ${response}     GET Character By Id  ${personagem_id}

    Status Should Be    404         ${response}