*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LANDING_URL}       https://aavistus.app/
${SIGN_IN_BUTTON}    xpath=//*[@id="action-area"]/div[3]/button[1]
${SIGN_UP_BUTTON}    xpath=//*[@id="action-area"]/div[3]/button[2]

*** Keywords ***
Open Landing Page
    Go To    ${LANDING_URL}
    Wait Until Page Contains Element    ${SIGN_IN_BUTTON}

Click Sign In Button
    Wait Until Element Is Visible    ${SIGN_IN_BUTTON}
    Click Button    ${SIGN_IN_BUTTON}

Click Sign Up Button
    Wait Until Element Is Visible    ${SIGN_UP_BUTTON}
    Click Button    ${SIGN_UP_BUTTON}