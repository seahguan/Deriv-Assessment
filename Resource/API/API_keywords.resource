*** Settings ***
Library     RequestsLibrary
Library     SeleniumLibrary

*** Keywords ***
The WebSocket session is created with URL "${url}"
    Create Session    my_websocket_session    ${url}

The GET request is sent to "${endpoint}"
    ${response} =   GET On Session     my_websocket_session    ${endpoint}
    Set Test Variable    ${response}

The response from the WebSocket API should be validated to "${expected_pattern}"
    Should Be Equal As Strings      ${response.status_code}     200
    ${response_content} =           Convert To String           ${response.content}
    Should Match Regexp             ${response_content}         ${expected_pattern}


