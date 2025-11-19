*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${pim}    xpath=//span[text()="PIM"]
${add}    xpath=//button[normalize-space(.)="Add"]
${f_name}    xpath=//input[@name="firstName"]
${l_name}    xpath=//input[@name="lastName"]
${eid}    xpath=//label[text()='Employee Id']/parent::div/following-sibling::div//input
${save}    xpath=//button[@type="submit"]
*** Keywords ***
Go To Admin Page
    Wait Until Page Contains Element    ${pim}    5s
    Click Element    ${pim}
    Wait Until Page Contains Element    ${add}    5s
    Click Button    ${add}
    Wait Until Element Is Visible   ${f_name}    5s
    
Input Firstname    [Arguments]    ${firstname}
    Input Text    ${f_name}    ${firstname}

Input Lastname    [Arguments]    ${lastname}
    Input Text    ${l_name}    ${lastname}

Input EmployeeId    [Arguments]    ${employee_id}
    Input Text    ${eid}    ${employee_id}

Click Save
    Click Button    ${save}
    


