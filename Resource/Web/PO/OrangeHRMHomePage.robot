*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
Load
    [Arguments]    ${URL}
    Go To  ${URL}

Verify Home Page Is Loaded
    [Arguments]
    Wait Until Page Contains Element    css:img[data-v-17f5fb62][alt='company-branding']    timeout=10s    error=Image not found

Verify Admin Page Is Loaded
    [Arguments]     ${element_Text}
    Wait Until Page Contains Element    xpath=//*[text()='${element_Text}']     timeout=10s    error=Element not found

Login into Admin Portal
    [Arguments]     ${USERNAME}     ${PASSWORD}
    Element Should Be Enabled    name=username
    Element Should Be Enabled    name=password
    Input Text  name=username       ${USERNAME}
    Input Text  name=password       ${PASSWORD}
    Wait Until Element Is Enabled    xpath=//button[text()=' Login ']    timeout=10s    error=Login button not found
    press keys  xpath=//button[text()=' Login ']  ENTER

Verify Portal Page
    [Arguments]     ${PortalText}
    Wait Until Page Contains        ${PortalText]
    Page Should Contain             ${PortalText]
    Page Should Contain Element     //*[text()='Admin']
    Page Should Contain Element     //*[@placeholder='Search']

Click Profile Icon
    Click Element    xpath=//div[contains(@class, 'oxd-topbar-header-userarea')]

Click Logout button
    Click Link    Logout

