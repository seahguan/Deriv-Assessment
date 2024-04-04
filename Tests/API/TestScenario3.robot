*** Settings ***

Resource    ../../Resource/API/API_keywords.resource

*** Variables ***
${WEBSOCKET_URL}        https://api.deriv.com
${ENDPOINT}             /api-explorer#states_list
${INVALID_ENDPOINT}     /api-explorer#stat
${EXPECTED_PATTERN}     API Explorer | Deriv API

*** Test Cases ***
Feature: Test WebSocket States List
    [Documentation]    As a user of the WebSocket API for States List, I want to validate the response from the WebSocket API.
    Given The WebSocket session is created with URL "${WEBSOCKET_URL}"
    When The GET request is sent to "${ENDPOINT}"
    Then The response from the WebSocket API should be validated to "${EXPECTED_PATTERN}"


