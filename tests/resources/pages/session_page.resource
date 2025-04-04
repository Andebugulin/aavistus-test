*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ONE_COMMENT_BUTTON}    xpath=//*[@id="input-container"]/div/div[3]/div[1]
${WRITE_A_COMMENT_FIELD}    xpath=//*[@id="__next"]/main/div/div[3]/div/div[3]/div/div/div[1]/div[1]/p
${COMMENT_FIELD}        xpath=//*[@id="input-container"]/div/div[1]/div/div/div/p
${SEND_BUTTON}          xpath=//*[@id="__next"]/main/div/div[3]/div/div[3]/div/div/div[2]/div/div/div[2]/button

*** Keywords ***
Verify Session Page Loaded
    Wait Until Element Is Visible    ${ONE_COMMENT_BUTTON}  timeout=5

View Previous Comments
    Wait Until Element Is Visible    ${ONE_COMMENT_BUTTON}  timeout=5
    Click Element    ${ONE_COMMENT_BUTTON}
    Sleep    2

Add Comment
    [Arguments]    ${comment_text}
    Wait Until Element Is Visible    ${WRITE_A_COMMENT_FIELD}   timeout=5
    Click Element    ${WRITE_A_COMMENT_FIELD}
    Press Keys    ${WRITE_A_COMMENT_FIELD}    ${comment_text}
    Click Element    ${SEND_BUTTON}
    Sleep    1