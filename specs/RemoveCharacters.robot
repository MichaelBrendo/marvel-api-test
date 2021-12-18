*Settings*
Documentation    Suite de teste: exclusão de personagem cadastrado

Resource    ${EXECDIR}/resources/base.robot
Library     ${EXECDIR}/resources/factories/MarvelCharacters.py

Suite Setup    Super Setup    santos.michaelbrendo@msn.com

*Test Cases*
Deve remover um personagem pelo Id

    ${personagem}    Factory Iron Man
    ${ironman}       POST New Characters    ${personagem}
    ${ironman_id}    Set Variable           ${ironman.json()}[_id]

    ${response}    DELETE Character By Id    ${ironman_id}

    Status Should Be    204    ${response}

    ${response2}    GET Character By Id  ${ironman_id}

    Status Should Be    404     ${response2}

Não deve encontrar o personagem removidow

    ${personagem_id}    Get Unique Id

    ${response}    DELETE Character By Id    ${personagem_id}

    Status Should Be    404    ${response}