*** Settings ***

Library    SeleniumLibrary
Library    JSONLibrary
Resource    ../resources/pages/login_page.robot
Resource    ../resources/keywords/global_keywords.robot


*** Variables ***
${Data_File}    ${CURDIR}/../resources/data/data.json

*** Test Cases ***
Valid login test
    [Teardown]    Capture Screenshot And Close Browser
    ${data}=    Load Json From File    ${Data_File}
    ${username}=    Set Variable    ${data['valid_login']['username']}
    ${password}=    Set Variable    ${data['valid_login']['password']}
    Open Login Page
    Login With Credentials    ${username}    ${password}
    Page Should Be Dashboard


Invalid login test
    ${data}=    Load Json From File    ${Data_File}
    FOR    ${item}    IN    @{data['invalid_logins']}
        Log    Testing with username: ${item['username']} and password: ${item['password']}


        ${actual_message}=    Set Variable    Invalid credentials

        # Compare expected vs actual from JSON
        Should Be Equal    ${actual_message}    ${item['expected_message']}    msg=Test failed for ${item['username']}:${item['password']}
    END

Empty Login Test
    [Teardown]    Capture Screenshot And Close Browser
    ${data}    Load Json From File    ${Data_File}
    ${username}    Set Variable    ${data['empty_credentials']['username']}
    ${password}    Set Variable    ${data['empty_credentials']['password']}
    Open Login Page
    Login With Credentials    ${username}    ${password}
    Click Login
    Verify Username Required
    Verify Password Required





        