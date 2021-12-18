*Settings*
Documentation    Ações da rota /characters

*Keywords*
POST New Characters
    [Arguments]    ${payload}

    ${response}    POST
    ...            ${API_URI}/characters
    ...            json=${payload}
    ...            headers=${HEADERS}
    ...            expected_status=any

    [Return]    ${response}

GET Character By Id
    [Arguments]    ${characters_id}

    ${response}    GET
    ...            ${API_URI}/characters/${characters_id}
    ...            headers=${HEADERS}
    ...            expected_status=any

    [Return]    ${response}

DELETE Character By Id
    [Arguments]    ${characters_id}

    ${response}    DELETE
    ...            ${API_URI}/characters/${characters_id}
    ...            headers=${HEADERS}
    ...            expected_status=any

    [Return]    ${response}

