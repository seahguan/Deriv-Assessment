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
    Element Should Be Enabled   name=username
    Element Should Be Enabled   name=password
    Input Text                  name=username       ${USERNAME}
    Input Text                  name=password       ${PASSWORD}
    Wait Until Element Is Enabled    xpath=//button[text()=' Login ']    timeout=10s    error=Login button not found
    press keys                       xpath=//button[text()=' Login ']  ENTER

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

Click admin sidebar "${link_text}"
    Click Element    xpath=//*[text()='${link_text}']
    
Vefiry My Info Page have "${header}"
    Wait Until Element Is Visible           xpath=//h6[text()='Personal Details']
    ${element_text}=    Get Text            xpath=//h6[text()='Personal Details']
    Should Contain      ${element_text}     Personal Details

Verify the DOB field is filled OR NOT
    Wait Until Element Is Visible       xpath=//*[text()='Date of Birth']/parent::div/parent::div//input     timeout=15s
    ${field_value}=    Get Value        xpath=//*[text()='Date of Birth']/parent::div/parent::div//input

    Run Keyword If    '${field_value}' == ''    Log    Date of Birth field is empty
    ...    ELSE    Log     Date of Birth field is already filled

Fill in NEW DOB "${New_DOB}"
    Wait Until Element Is Visible   xpath=//*[text()='Date of Birth']/parent::div/parent::div//input
    Wait MY INFO page load complete
    Set Focus To Element            xpath=//*[text()='Date of Birth']/parent::div/parent::div//input
    Press Keys                      xpath=//*[text()='Date of Birth']/parent::div/parent::div//input    CTRL+a    BACKSPACE
    Input Text                      xpath=//*[text()='Date of Birth']/parent::div/parent::div//input     ${New_DOB}

Save the updated DOB
    Wait Until Element Is Enabled   xpath=//p[text()=' * Required']/parent::div/button[text()=' Save ']
    Click Element                   xpath=//p[text()=' * Required']/parent::div/button[text()=' Save ']

Verify updated DOB with new DOB "${New_DOB}"
   Wait Until Element Is Visible    xpath=//*[text()='Admin']
   Click Element                    xpath=//*[text()='Admin']
   Wait Until Element Is Visible    xpath=//*[text()='My Info']
   Click Element                    xpath=//*[text()='My Info']
   Wait MY INFO page load complete
   Wait Until Element Is Visible        xpath=//*[text()='Date of Birth']/parent::div/parent::div//input
   Wait Until Page Contains Element     xpath=//*[text()='Date of Birth']/parent::div/parent::div//input    timeout=15s
   ${field_value}=    Get Value         xpath=//*[text()='Date of Birth']/parent::div/parent::div//input
   Should Contain     ${field_value}    ${New_DOB}

Wait MY INFO page load complete
    Wait Until Page Contains Element    xpath=//*[text()='Date of Birth']    timeout=15s
    ${label_text}=    Get Text    xpath=//*[text()='Date of Birth']
    Should Be Equal As Strings    ${label_text}    Date of Birth
    Sleep    1s