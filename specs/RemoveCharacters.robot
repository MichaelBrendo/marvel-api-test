*Settings*
Documentation    Test Suite: Should deleting registered character

Resource    ${EXECDIR}/resources/base.robot
Library     ${EXECDIR}/resources/factories/MarvelCharacters.py

Suite Setup    Super Setup    santos.michaelbrendo@msn.com

*Test Cases*
Should remove a character by id

    &{character}     Factory Iron Man
    ${ironman}       POST New Characters    ${character}
    ${ironman_id}    Set Variable           ${ironman.json()}[_id]

    ${response}    DELETE Character By Id    ${ironman_id}

    Status Should Be    204    ${response}

    ${response2}    GET Character By Id    ${ironman_id}

    Status Should Be    404    ${response2}

Should not find the removed character

    ${character_id}    Get Unique Id

    ${response}    DELETE Character By Id    ${character_id}

    Status Should Be    404    ${response}