*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${BROWSER}    Chrome

*** Test Cases ***
Mobile Responsive Testing
    Open Browser    https://derivfe.github.io/qa-test/settings    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    xpath://*[contains(@class, 'settings-form')]
    ${form_visible}    Run Keyword And Return Status    Page Should Contain Element    xpath://*[contains(@class, 'settings-form')]
    Run Keyword Unless    ${form_visible}    Fail    Profile setting form not visible
    Run Keyword    Check Responsive Issues

*** Keywords ***
Check Responsive Issues
    ${viewport_width}    Execute JavaScript    return window.innerWidth
    ${viewport_height}    Execute JavaScript    return window.innerHeight
    Log    Current viewport width: ${viewport_width}, height: ${viewport_height}
    ${responsive_issues}    Run Keyword And Ignore Error    Get Responsive Issues
    Run Keyword Unless    ${responsive_issues} == ${EMPTY}    Fail    Responsive issues found: ${responsive_issues}

Get Responsive Issues
    ${style}    Get Element Attribute    xpath://*[@name='viewport']    content
    Run Keyword If    'width=device-width' not in ${style}    Append To List    ${responsive_issues}    'Viewport width not set to device-width'
    Run Keyword If    'initial-scale=1' not in ${style}    Append To List    ${responsive_issues}    'Initial scale not set to 1'
    [Return]    ${responsive_issues}
