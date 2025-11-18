*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary
Resource    ../resources/keywords/global_keywords.robot
Resource    ../resources/pages/login_page.robot
Resource    ../resources/pages/admin_page.robot

*** Variables ***

${file_path}    ${CURDIR}/../resources/data/data.json


*** Test Cases ***
Admin Panel Test
    [Teardown]    Capture Screenshot And Close Browser
    ${data}    Load Json From File    ${file_path}
    ${username}=    Set Variable    ${data['valid_login']['username']}
    ${password}=    Set Variable    ${data['valid_login']['password']}

    Open Login Page
    Login with credentials    ${username}    ${password}
    Page Should Be Dashboard

    Go To Admin Page
    Log    Admin page opened successfully



