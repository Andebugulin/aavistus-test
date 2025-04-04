*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${HOME_URL}         https://aavistus.app/
${HOME_TITLE}       xpath=//*[@id="__next"]/div/main/h4
${BURGER_MENU}      aria-label=menu
${PROFILE_MENU}     aria-label=account of current user
${FIRST_SPACE}      xpath=//*[@id="__next"]/div/main/div[2]/div/div/div[1]/div[2]
${FIRST_PROJECT}    xpath=//*[@id="__next"]/div/main/div[3]/div/div[1]/div[1]/div[2]
${SECOND_PROJECT}   xpath=//*[@id="__next"]/div/main/div[3]/div/div[2]/div[1]/div[2]

*** Keywords ***
Verify Home Page Loaded
    Wait Until Element Is Visible    ${HOME_TITLE}  timeout=5
    ${text}=    Get Text    ${HOME_TITLE}
    Should Be Equal    ${text}    Your spaces

Open Burger Menu
    Wait Until Element Is Visible    ${BURGER_MENU}   timeout=5
    Click Element    ${BURGER_MENU}

Open Profile Menu
    Wait Until Element Is Visible    ${PROFILE_MENU}    timeout=5
    Click Element    ${PROFILE_MENU}

Open First Space
    Wait Until Element Is Visible    ${FIRST_SPACE}   timeout=5
    Click Element    ${FIRST_SPACE}

Open First Project
    Wait Until Element Is Visible    ${FIRST_PROJECT}   timeout=5
    Click Element    ${FIRST_PROJECT}

Open Second Project
    Wait Until Element Is Visible    ${SECOND_PROJECT}  timeout=5
    Click Element    ${SECOND_PROJECT}