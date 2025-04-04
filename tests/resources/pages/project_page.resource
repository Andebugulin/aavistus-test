*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${FIRST_SESSION}    xpath=//*[@id="content-container"]/div[2]/div/div/div/div/div/div
${CREATE_SESSION_BUTTON}    xpath=//*[@id="content-container"]/div[4]/div/div/button

*** Keywords ***
Verify Project Page Loaded
    Wait Until Element Is Visible    ${FIRST_SESSION}
    Sleep    1

Open First Session
    Wait Until Element Is Visible    ${FIRST_SESSION}
    Click Element    ${FIRST_SESSION}
    Sleep    2