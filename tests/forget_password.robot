*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary    
Resource    ../resources/pages/forget_password.robot

*** Variables ***
${Data_File}    ${CURDIR}/../resources/data/data.json

*** Test Cases ***

Forget Password Test
    ${data}=    Load Json From File    ${Data_File}
    FOR    ${key}    IN    @{data['forgot_password'].keys()}
        ${user}=    Set Variable    ${data['forgot_password']['${key}']}
        Open Forgot Password Page
        Input Forget Password UserName    ${user['username']}
        Click Reset Password Button
        ${msg}=    Get Forgot Password Message
        Should Contain    ${msg}    ${user['expected_message']}
        Close Browser
    END
