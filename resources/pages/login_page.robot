*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${USERNAME_INPUT}    xpath=//input[@name="username"]
${PASSWORD_INPUT}    xpath=//input[@name="password"]
${LOGIN_BUTTON}      xpath=//button[@type="submit"]
${ERROR_MSG}         xpath=//p[contains(text(),"Invalid")]

*** Keywords ***
Open Login Page
    Open Browser    https://opensource-demo.orangehrmlive.com/    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${USERNAME_INPUT}


Input Username    [Arguments]    ${username}
    Input Text    ${USERNAME_INPUT}    ${username}

Input Password    [Arguments]    ${password}
    Input Text    ${PASSWORD_INPUT}    ${password}

Click Login
    Click Button    ${LOGIN_BUTTON}

Login with credentials    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Click Login

Get Error Message
    Wait Until Element Is Visible    xpath=//p[@class='oxd-text oxd-text--p oxd-alert-content-text']    timeout=10s
    ${msg}=    Get Text    xpath=//p[@class='oxd-text oxd-text--p oxd-alert-content-text']
    RETURN    ${msg}

Page Should Be Dashboard
    Wait Until Element Is Visible    xpath=//h6[contains(@class,"oxd-topbar-header-breadcrumb-module")]
    ${title}=    Get Text    xpath=//h6[contains(@class,"oxd-topbar-header-breadcrumb-module")]
    Should Be Equal    ${title}    Dashboard



