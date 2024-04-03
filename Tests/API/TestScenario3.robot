*** Settings ***
Library     RequestsLibrary
Library     SeleniumLibrary

*** Variables ***
${WEBSOCKET_URL}        https://api.deriv.com
${ENDPOINT}             /api-explorer#states_list
${EXPECTED_PATTERN}     API Explorer | Deriv API

*** Test Cases ***
Test WebSocket States List
    [Documentation]    Test WebSocket API for States List
    Create Session      my_websocket_session    ${WEBSOCKET_URL}

    ${response} =   GET On Session     my_websocket_session    ${ENDPOINT}
    Validate Response    ${response}


*** Keywords ***
Validate Response
    [Arguments]    ${response}
    Log     ${response.status_code}
    Should Be Equal As Strings      ${response.status_code}     200
    ${response_content} =           Convert To String           ${response.content}
    Should Match Regexp             ${response_content}         ${EXPECTED_PATTERN}
