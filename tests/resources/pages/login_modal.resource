*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${EMAIL_FIELD}      id=email
${PASSWORD_FIELD}   id=password
${LOGIN_BUTTON}     xpath=//*[@id="__next"]/div[2]/div/div/div/div/div/button[2]

*** Keywords ***
Enter Credentials
    [Arguments]    ${email}    ${password}
    Wait Until Element Is Visible    ${EMAIL_FIELD}   timeout=5
    Input Text    ${EMAIL_FIELD}    ${email}
    Input Password    ${PASSWORD_FIELD}    ${password}

Click Login Button
    Wait Until Element Is Visible    ${LOGIN_BUTTON}    timeout=5
    Click Button    ${LOGIN_BUTTON}

Login With Credentials
    [Arguments]    ${email}    ${password}
    Enter Credentials    ${email}    ${password}
    Click Login Button