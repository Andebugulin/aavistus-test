*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CREATE_PROJECT_BUTTON}    xpath=//*[@id="content-container"]/div[4]/div/div/button
${PROJECT_NAME_FIELD}       id=name
${PROJECT_DESC_FIELD}       xpath=//*[@id="description"]/fieldset/div/div
${CREATE_BUTTON}            css=button.MuiButton-root:nth-child(2)

*** Keywords ***
Verify Space Page Loaded
    Wait Until Element Is Visible    ${CREATE_PROJECT_BUTTON}

Create New Project
    [Arguments]    ${name}    ${description}
    Wait Until Element Is Visible    ${CREATE_PROJECT_BUTTON}
    Click Button    ${CREATE_PROJECT_BUTTON}
    Input Text    ${PROJECT_NAME_FIELD}    ${name}
    Input Text    ${PROJECT_DESC_FIELD}    ${description}
    Click Button    ${CREATE_BUTTON}
    Sleep    2  # Wait for project creation to complete