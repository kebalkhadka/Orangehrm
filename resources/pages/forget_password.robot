*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${FORGET_LINK}        xpath=//p[@class="oxd-text oxd-text--p orangehrm-login-forgot-header"]
${RESET_USERNAME}    xpath=//input[@placeholder="Username"]
${RESET_BUTTON}    xpath=//button[@type="submit"]
${RESET_MESSAGE}        xpath=//p[contains(@class,"oxd-text--p")]


*** Keywords ***

Open Forgot Password Page
    Open Browser    https://opensource-demo.orangehrmlive.com/    chrome
    Maximize Browser Window
    Wait Until Element Is Visible        ${FORGET_LINK}    15s
    Click Element        ${FORGET_LINK}



Input Forget Password UserName
    [Arguments]    ${username}
    Wait Until Element Is Visible        ${RESET_USERNAME}    10
    Input Text    ${RESET_USERNAME}    ${username}

Click Reset Password Button
    Wait Until Element Is Visible    ${RESET_BUTTON}    10s
    Click Button    ${RESET_BUTTON}

Get Forgot Password Message
    ${MSG_FP}    Set Variable        ${RESET_MESSAGE}
    Wait Until Element Is Visible    ${MSG_FP}    10s
    ${msg}=    Get Text    ${MSG_FP}
    RETURN    ${msg}




