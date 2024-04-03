*** Settings ***
Documentation       This is a basic login to OrangeHRM assert the page and then logout and assert the home page
Resource        ../../Resource/Web/Common.robot
Resource        ../../Resource/Web/OrangeHRM.robot
Library         SeleniumLibrary


Suite Setup      Common.Begin Web Test   ${Browser}
Suite Teardown   Common.End Web Test

*** Variables ***
${Browser}  Chrome
${URL}      https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

*** Test Cases ***
Login to OrangeHRM
    [Documentation]     Login Page- Authenticate Successfull
    [Tags]   Test Case 1
#    TODO change to use Gherkin method after all complete
    Log    'Start Login to the Orange HRM Portal'
    OrangeHRM.Load Page                     ${URL}
    OrangeHRM.Verify Home Page
    Common.Capture Screenshot               Home Page
    OrangeHRM.Login into Admin Portal       Admin     admin123
    OrangeHRM.Verify Admin Portal Page      Dashboard
    Common.Capture Screenshot               Admin Portal Page

Feature: Login to OrangeHRM
    As a user of the OrangeHRM Portal,
    I want to authenticate successfully,
    So that I can access the Admin Portal.

  Scenario: Authenticate successfully and access the Admin Portal
    Given the user is on the OrangeHRM login page
    When the user logs in with username "Admin" and password "admin123"
    Then they should be redirected to the Admin Dashboard page



Update User Profile DOB
    [Documentation]     My Info -  User should be able to go to My Info page and verify and update their Date of Birth field.
#    Steps:
# 1. Fromtheadmin panel, click on the My Info at the sidebar menu.
# 2. Verify the My Info page is fully loaded.
# 3. Verify “Date of Birth” field is filled in.
# 4. Update the Date of Birth to any date.
# 5. Click on the “Save” button.
#Scenario: User verifies My Info page and proceeds to save changes
#    Given the user is at the login page of the Admin Dashboard
#    When they click on "My Info" in the side bar
#    Then they should verify the My Info page
#    And they should verify that the Date of Birth (DOB) field is filled
#    And they should proceed to save the changes


    [Tags]   Test Case 2
    OrangeHRM.Update Profile DOB    'NEW DOB '

    assert the update

Logout OrangeHRM Portal
    [Documentation]     Logout
    [Tags]   Test Case 3
    OrangeHRM.Logout Admn Portal
    OrangeHRM.Verify Home Page
    Common.Capture Screenshot               Successful Logout

