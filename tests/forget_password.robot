*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary    
Resource    ../resources/pages/forget_password.robot
Resource    ../resources/keywords/global_keywords.robot
Library    Collections

*** Variables ***
${Data_File}    ${CURDIR}/../resources/data/data.json

*** Test Cases ***
Forget Password - Valid User
    [Tags]    smoke    ForgetPassword     positive
    [Teardown]    Capture Screenshot And Close Browser
    ${data}    Load Json From File    ${Data_File}
    ${valid}   Get From Dictionary    ${data['forgot_password']}    valid_user
    Open Forgot Password Page
    Input Forget Password UserName    ${valid['username']}
    Click Reset Password Button
    ${msg}=    Get Forgot Password Message
    Should Contain    ${msg}    ${valid['expected_message']}


Forget Password - Invalid User
    [Tags]    regression    ForgetPassword     negative
    [Teardown]    Capture Screenshot And Close Browser
    ${data}=    Load Json From File    ${Data_File}
    ${invalid}=    Get From Dictionary    ${data['forgot_password']}    invalid_user
    Open Forgot Password Page
    Input Forget Password UserName    ${invalid['username']}
    Click Reset Password Button
    ${msg}=    Get Forgot Password Message
    Should Contain    ${msg}    ${invalid['expected_message']}
