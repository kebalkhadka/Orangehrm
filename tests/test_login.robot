*** Settings ***

Library    SeleniumLibrary
Library    JSONLibrary
Resource    ../resources/pages/login_page.robot


*** Variables ***
${Data_File}    ${CURDIR}/../resources/data/data.json

*** Test Cases ***
Valid login test
    ${data}=    Load Json From File    ${Data_File}
    ${username}=    Set Variable    ${data['valid_login']['username']}
    ${password}=    Set Variable    ${data['valid_login']['password']}
    Open Login Page
    Login With Credentials    ${username}    ${password}
    Page Should Be Dashboard
    Close Browser