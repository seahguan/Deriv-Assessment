*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem


*** Variables ***
${OUTPUT_DIR}       ../../Results/
${IMAGE_PATH}       ../../Results/WEB/Image/


*** Keywords ***
Initial setup for web test
    [Documentation]     Begin Web test by Open & Maximize Browser screen
    [Arguments]     ${BROWSER}
    Open Browser    about:blank    ${BROWSER}
    Maximize Browser Window
    Log    'Start Login to the Orange HRM Portal'

End of Web Test
    [Documentation]     End and Close the Browser
    Close Browser
    Log    'Exit from Orange HRM Portal'

Capture Screenshot
    [Documentation]    Capture a screenshot and save it to the output directory
    [Arguments]    ${description}
    ${screenshot_path}=    Set Variable    ${output_dir}/Image/screenshot_${description}.png
    Capture Page Screenshot    ${screenshot_path}
    Log    Saved screenshot: ${screenshot_path}

Capture Full Page Screenshot
    [Arguments]    ${file_path}
    ${total_height}=    Execute JavaScript    return document.body.scrollHeight
    ${viewport_height}=    Execute JavaScript    return window.innerHeight
    ${scroll_height}=    Evaluate    int(${total_height} / ${viewport_height})
    ${screenshot_height}=    Evaluate    "${viewport_height}"
    FOR    ${i}    IN RANGE   ${scroll_height}
        Scroll Window    0    ${screenshot_height}
        Capture Page Screenshot    ${file_path}${i}.png
    END

Scroll Window
    [Arguments]    ${x_offset}    ${y_offset}
    Execute JavaScript    window.scrollBy(${x_offset}, ${y_offset})