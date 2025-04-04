*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SIGNUP_URL}       https://aavistus.app/sign-up?plan=
${TERMS_CHECKBOX}   id=acceptTerms
${DISPLAY_NAME_FIELD}   id=displayName
${EMAIL_FIELD}      id=email
${PASSWORD_FIELD}   id=password
${PASSWORD_AGAIN_FIELD}   id=password2
${SIGNUP_BUTTON}    xpath=//*[@id="__next"]/div[2]/div/div/div/div/div/div[8]/button

*** Keywords ***
Navigate To Signup Page
    Go To    ${SIGNUP_URL}
    Wait Until Element Is Visible    ${EMAIL_FIELD}  timeout=5

Register New Account
    [Arguments]    ${display_name}  ${email}    ${password}
    Wait Until Element Is Visible    ${EMAIL_FIELD}  timeout=5
    Input Text    ${DISPLAY_NAME_FIELD}    ${display_name}
    Input Text    ${EMAIL_FIELD}    ${email}
    Input Password    ${PASSWORD_FIELD}    ${password}
    Input Password    ${PASSWORD_AGAIN_FIELD}    ${password}
    Select Checkbox    ${TERMS_CHECKBOX}
    Click Button    ${SIGNUP_BUTTON}

Return To Landing Page
    Go To    https://aavistus.app/