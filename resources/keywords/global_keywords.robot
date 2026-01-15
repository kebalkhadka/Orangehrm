*** Settings ***
Library    SeleniumLibrary
Library    String
Library    OperatingSystem
Library    BuiltIn

*** Keywords ***
Capture Screenshot And Close Browser
    [Documentation]    Capture screenshot if test failed, then close browser
    ${timestamp}=    Get Time    result_format=%Y%m%d_%H%M%S
    ${safe_name}=    Replace String    ${TEST NAME}    ${SPACE}    _
    ${screenshot_dir}=    Set Variable    results/screenshots
    # create folder if not exists
    Run Keyword Unless    Directory Should Exist    ${screenshot_dir}    Create Directory    ${screenshot_dir}
    # Capture screenshot if test failed
    Run Keyword If    '${TEST STATUS}'=='FAIL'    Capture Page Screenshot    ${screenshot_dir}/${safe_name}_${timestamp}.png
    # Close browser regardless of status
    Run Keyword And Ignore Error    Close Browser
