*** Settings ***
Documentation   This is a basic login to OrangeHRM assert the page and then logout and assert the home page
Resource        ../../Resource/Web/Common.robot
Resource        ../../Resource/Web/OrangeHRM_Keywords.resource
Library         SeleniumLibrary
Library         DateTime


Suite Setup      Common.Initial setup for web test   ${Browser}
Suite Teardown   Common.End of Web Test

*** Variables ***
${Browser}      Chrome
${URL}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${UserName}     Admin
${Password}     admin123
${New_DOB}      2024-31-01


*** Test Cases ***
Login to OrangeHRM
    [Documentation]     Login Page- Authenticate Successfull
    [Tags]   Test Case 1
    Given Users at the OrangeHRM Login Page at this "${URL}"
    When User login to OrangeHRM Admin Portal with Username "${UserName}" and Password "${Password}"
    Then After login verify the Admin page is load completed

Update User Profile DOB
    [Documentation]     My Info -  User should be able to go to My Info page and verify and update their Date of Birth field.
    [Tags]   Test Case 2 - update profile
    Given user at the Dashbord Page
    When user click on My info Page
    Then verify the DOB field is filled
    Then update DOB to new DOB value "${New_DOB}"
    Then Verify updated DOB with new DOB "${New_DOB}"
#    Click admin sidebar "My Info"
#    Vefiry My Info Page have "Personal Details"
#    Verify the DOB field is filled If not then fill in "1999-04-01"
#    Save the updated DOB
#    Verify updated DOB

Logout OrangeHRM Portal
    [Documentation]     Logout from OrangeHRM
    [Tags]   Test Case 3
    Given User at My Info Page
    When User proceed to logout
    then Vefiy user is successful log out back to Login page

