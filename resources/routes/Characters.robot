*Settings*
Documentation       Ações da rota /characters

*Keywords*
POST New Characters
    [Arguments]     ${payload}

    ${response}     POST
    ...             ${BASE_URI}/characters
    ...             json=${payload}
    ...             headers=${HEADERS}
    ...             expected_status=any

    [Return]        ${response}