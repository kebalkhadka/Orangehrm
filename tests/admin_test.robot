*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary
Resource    ../resources/keywords/global_keywords.robot
Resource    ../resources/pages/login_page.robot
Resource    ../resources/pages/admin_page.robot
Library    Collections

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
    #loop through employee dictionary
    ${employee_keys}=    Get Dictionary Keys    ${data['add_employee']}
    
    FOR    ${emp_key}    IN     @{employee_keys}
        Log    Adding Employee:${emp_key}

        ${emp}=    Get From Dictionary    ${data['add_employee']}    ${emp_key}
        ${f_name}=    Set Variable    ${emp['first_name']}
        ${l_name}=    Set Variable    ${emp['last_name']}
        ${eid}=    Set Variable    ${emp['employee_id']}
        
        Input Firstname    ${f_name}
        Input Lastname    ${l_name}
        Input EmployeeId    ${eid}

        Click Save
        Log    Employee ${f_name} ${l_name} saved successfully
    END
    

