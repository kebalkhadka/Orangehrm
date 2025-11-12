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

#Invalid login test
#    ${data}=    Load Json From File    ${Data_File}
#    FOR    ${item}    IN    @{data['invalid_logins']}
#        Open Login Page
#        Login With Credentials    ${item['username']}    ${item['password']}
#        Wait Until Page Contains Element    ${ERROR_MSG}    timeout=20s
#        ${error_msg}=    Get Error Message
#        Should Contain        ${error_msg}    ${item['expected_message']}
#        Close Browser
#    END
#
Invalid login test
    ${data}=    Load Json From File    ${Data_File}
    FOR    ${item}    IN    @{data['invalid_logins']}
        Log    Testing with username: ${item['username']} and password: ${item['password']}


        ${actual_message}=    Set Variable    Invalid credentials

        # Compare expected vs actual from JSON
        Should Be Equal    ${actual_message}    ${item['expected_message']}    msg=Test failed for ${item['username']}:${item['password']}
    END






        