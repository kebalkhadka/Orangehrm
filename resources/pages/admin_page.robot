*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${admin}    xpath=//span[text()="Admin"]
${addNewUser}    xpath=//button[contains(@class,"oxd-button") and normalize-space(.)="Add"]


*** Keywords ***
Go To Admin Page
    Wait Until Page Contains Element    ${admin}    5s
    Click Element    ${admin}
    Wait Until Element Is Visible        ${addNewUser}    15s
    Click Element    ${addNewUser}