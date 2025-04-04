*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Process
Resource    ../../env_vars.resource
Library    ../../firefox_utils.py

*** Variables ***
${URL}           https://aavistus.app/
${BROWSER}       firefox
${HOME_ELEMENT}  xpath=//*[@id="__next"]/div/main/h4
${LOGGED_IN}     ${FALSE}

*** Keywords ***
Open Browser With Custom Profile
    ${profile}=    Create Profile
    Open Browser    ${URL}    ${BROWSER}    ff_profile_dir=${profile}
    Set Selenium Speed    0.5
    Maximize Browser Window

Login Once
    Open Browser With Custom Profile
    Click Button    xpath=//*[@id="action-area"]/div[3]/button[1]    # sign in button
    Input Text    id=email    ${EMAIL}
    Input Password    id=password    ${PASSWORD}
    # login button after password and email
    Click Button    xpath=//*[@id="__next"]/div[2]/div/div/div/div/div/button[2]    # login button
    # Verify login was successful
    Wait Until Element Is Visible    ${HOME_ELEMENT}
    Set Suite Variable    ${LOGGED_IN}    ${TRUE}

Prepare Test
    # If browser is closed unexpectedly, relogin
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    tag:body
    Run Keyword If    not ${status}    Login Once
    
    # Ensure we're at the home page
    Go To    ${URL}
    Wait Until Element Is Visible    ${HOME_ELEMENT}

Launch Second Client
    [Arguments]    ${email}=${EMAIL_2}    ${password}=${PASSWORD_2}
    ${profile}=    Create Profile
    Open Browser    ${URL}    ${BROWSER}    alias=client2    ff_profile_dir=${profile}
    Set Selenium Speed    0.5
    Maximize Browser Window
    Switch Browser    client2
    Click Button    xpath=//*[@id="action-area"]/div[3]/button[1]    # sign in button
    Input Text    id=email    ${email}
    Input Password    id=password    ${password}
    # login button after password and email
    Click Button    xpath=//*[@id="__next"]/div[2]/div/div/div/div/div/button[2]    # login button
    # Verify login was successful
    Wait Until Element Is Visible    ${HOME_ELEMENT}
    Switch Browser    1

Switch To Client
    [Arguments]    ${client_number}
    Switch Browser    ${client_number}