# Deriv Automation Assessment - Automation for Web and Websocket API Automation

## Introduction

This assessment on Web Automation is verify on the https://opensource-demo.orangehrmlive.com/ while the Websocket API 
Automation is mainly test on the this endpoint https://api.deriv.com/api-explorer#states_list. This automation test is 
using the Robot Framework.  

### Test Scenarios

#### Scenario 1: Web Automation

You will be writing scripts to test functionalities, output or certain conditions based on this website: https://opensource-demo.orangehrmlive.com/

    Test Case 1: Login Page- Authenticate Successfully
    Registered user should be able to successfully login into the admin panel.

    Test Case 2: My Info
    User should be able to go to My Info page and verify and update their Date of Birth field.

    Test Case 3: Logout
    User should be able to logout from the admin panel.

#### Scenario 3 : Websocket API Automation
    
    Test Case: WebSocket API Test for States List
    User should be able to call the states_list api call and verify the responses received are accurate.


### Requirements 

    1. Install Python & Pip
    2. Use PIP to Install Robot Framework
        - `pip install robotframework `
        - can refer to this doc for robotframework installation [https://docs.robotframework.org/docs/getting_started/testing#install-robot-framework]
    3. Use PIP to install SeleniumLibrary
        - `pip install robotframework-seleniumlibrary`
        - can refer to this doc for Selenium Library installation [https://docs.robotframework.org/docs/different_libraries/selenium] 
    4. Use PIP to install Request Library
        - `pip install robotframework-requests `
        - can refer to this doc for detail installation [https://docs.robotframework.org/docs/different_libraries/requests] 
    5. For Selenium Webdriver I am using Chrome, FireFox or Edge and with the latest version of SeleniumWebDriver 
       basically is able to support and no need special installation

## Automation Report

Automation report will be store as below.
Web Automation report :
//Results/WEB/report.html

API Automation report :
//Results/API/report.html