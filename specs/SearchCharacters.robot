*Settings*
Documentation    Test suite: Should look for a registered character

Resource    ${EXECDIR}/resources/base.robot
Library     ${EXECDIR}/resources/factories/MarvelCharacters.py

Suite Setup    Super Setup    santos.michaelbrendo@live.com

*Test Cases*
Should search a character by id

    &{character}      Factory Spider Man
    ${spiderman}       POST New Characters    ${character}
    ${spiderman_id}    Set Variable           ${spiderman.json()}[_id]

    ${response}    GET Character By Id    ${spiderman_id}

    Status Should Be    200    ${response}

    Should Be Equal        ${spiderman.json()}[name]       ${character}[name]
    Should Be Equal        ${spiderman.json()}[age]        ${character}[age]
    Should Be Equal        ${spiderman.json()}[aliases]    ${character}[aliases]
    Should Be Equal        ${spiderman.json()}[team]       ${character}[team]
    Should Be Equal        ${spiderman.json()}[active]     ${character}[active]
    Should Not Be Empty    ${spiderman.json()}[owner]  

Should not return character by id

    ${character_id}        Get Unique Id

    ${response}     GET Character By Id  ${character_id}

    Status Should Be    404         ${response}