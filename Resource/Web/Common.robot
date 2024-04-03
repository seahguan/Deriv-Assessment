*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem



*** Variables ***
${OUTPUT_DIR}       ../../Results/


*** Keywords ***
Begin Web Test
    [Documentation]     Begin Web test by Open & Maximize Browser screen
    [Arguments]     ${BROWSER}
    Open Browser    about:blank    ${BROWSER}
    Maximize Browser Window

End Web Test
    [Documentation]     End and Close the Browser
    Close Browser

Capture Screenshot
    [Documentation]    Capture a screenshot and save it to the output directory
    [Arguments]    ${description}
    ${screenshot_path}=    Set Variable    ${output_dir}/screenshot_${description}.png
    Capture Page Screenshot    ${screenshot_path}
    Log    Saved screenshot: ${screenshot_path}