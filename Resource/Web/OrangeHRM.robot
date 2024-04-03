*** Settings ***
Resource    PO/OrangeHRMHomePage.robot
Library     Collections


*** Variables ***
${Index} =  0
${ELEMENT_LOCATION} =  //*[@cel_widget_id='MAIN-SEARCH_RESULTS']

*** Keywords ***
Load Page
    [Arguments]     ${URL}
    OrangeHRMHomePage.Load    ${URL}

Verify Home Page  # name may need to improve to Gherkin method
    OrangeHRMHomePage.Verify Home Page Is Loaded

Login into Admin Portal
    [Arguments]     ${USERNAME}     ${PASSWORD}
    OrangeHRMHomePage.Login into Admin Portal    ${USERNAME}     ${PASSWORD}

Verify Admin Portal Page
    [Arguments]     ${PageText}
    OrangeHRMHomePage.Verify Admin Page Is Loaded     ${PageText}

Logout Admn Portal
    OrangeHRMHomePage.Click Profile Icon
    OrangeHRMHomePage.Click Logout button