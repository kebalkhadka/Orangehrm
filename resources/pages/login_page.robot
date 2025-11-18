*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/keywords/global_keywords.robot


*** Variables ***
${USERNAME_INPUT}    //input[contains(@class,'oxd-input')]
${PASSWORD_INPUT}    xpath=//input[@name="password"]
${LOGIN_BUTTON}      xpath=//button[@type="submit"]
${ERROR_MSG}         xpath=//div[contains(@class,'oxd-alert--error')]//p[contains(@class,'oxd-alert-content-text')]

*** Keywords ***
Open Login Page
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --disable-save-password-bubble
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --disable-infobars
    Open Browser    https://opensource-demo.orangehrmlive.com/    chrome    options=${options}
    Maximize Browser Window
    Wait Until Page Contains Element    ${USERNAME_INPUT}    15s
    Wait Until Element Is Visible    ${USERNAME_INPUT}    15s


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
    Sleep    1s
    Wait Until Element Is Visible    ${ERROR_MSG}    timeout=15s
    ${msg}=    Get Text    ${ERROR_MSG}
    RETURN    ${msg}

Page Should Be Dashboard
    Wait Until Element Is Visible    xpath=//h6[contains(@class,"oxd-topbar-header-breadcrumb-module")]
    ${title}=    Get Text    xpath=//h6[contains(@class,"oxd-topbar-header-breadcrumb-module")]
    Should Be Equal    ${title}    Dashboard


Verify Username Required
    Wait Until Element Is Visible    xpath=//input[@name="username"]/ancestor::div[contains(@class,'oxd-input-group')]//span[contains(@class,'oxd-input-field-error-message')]
    Element Text Should Be     xpath=//input[@name="username"]/ancestor::div[contains(@class,'oxd-input-group')]//span[contains(@class,'oxd-input-field-error-message')]     Required


Verify Password Required
    Wait Until Element Is Visible    xpath=//input[@name="password"]/ancestor::div[contains(@class,'oxd-input-group')]//span[contains(@class,'oxd-input-field-error-message')] 
    Element Text Should Be    xpath=//input[@name="password"]/ancestor::div[contains(@class,'oxd-input-group')]//span[contains(@class,'oxd-input-field-error-message')]    Required




    
    
        



