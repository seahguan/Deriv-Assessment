*** Settings ***
Library     RequestsLibrary
Library     SeleniumLibrary
Resource    Common.robot
Resource    PO/OrangeHRMHomePage.robot


*** Keywords ***
Logout Admn Portal
    OrangeHRMHomePage.Click Profile Icon
    OrangeHRMHomePage.Click Logout button

Users at the OrangeHRM Login Page at this "${URL}"
    OrangeHRMHomePage.Load                          ${URL}
    OrangeHRMHomePage.Verify Home Page Is Loaded
    Common.Capture Full Page Screenshot             Home Page

User login to OrangeHRM Admin Portal with Username "${UserName}" and Password "${Password}"
    OrangeHRMHomePage.Login into Admin Portal   ${UserName}     ${Password}

After login verify the Admin page is load completed
    OrangeHRMHomePage.Verify Admin Page Is Loaded      Dashboard
    Common.Capture Full Page Screenshot                 Dashboard Page

User at My Info page
    OrangeHRMHomePage.Verify Admin Page Is Loaded   Dashboard
    Common.Capture Screenshot               My Info Page

User proceed to logout
    OrangeHRMHomePage.Click Profile Icon
    OrangeHRMHomePage.Click Logout button
    OrangeHRMHomePage.Verify Home Page Is Loaded
    Common.Capture Screenshot               Successful Logout

Vefiy user is successful log out back to Login page
    OrangeHRMHomePage.Verify Home Page Is Loaded

user at the Dashbord Page
    OrangeHRMHomePage.Verify Admin Page Is Loaded   Dashboard

user click on My info Page
    OrangeHRMHomePage.Click admin sidebar "My Info"
    OrangeHRMHomePage.Vefiry My Info Page have "Personal Details"

verify the DOB field is filled
    OrangeHRMHomePage.Verify the DOB field is filled OR NOT

update DOB to new DOB value "${New_DOB}"
    OrangeHRMHomePage.Fill in NEW DOB "${New_DOB}"
    OrangeHRMHomePage.Save the updated DOB

verify update DOB with value "${New_DOB}"
    OrangeHRMHomePage.Verify updated DOB with new DOB "${New_DOB}"