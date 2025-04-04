*** Settings ***
Documentation     Test space functionality
Resource          resources/common.resource
Resource          resources/pages/home_page.resource
Resource          resources/pages/space_page.resource

Suite Setup       Login Once
Suite Teardown    Close All Browsers
Test Setup        Prepare Test

*** Variables ***
${CREATE_SPACE_BUTTON}    xpath=//*[@id="__next"]/div/main/div[2]/div/div/div[2]/div/button
${SPACE_NAME_FIELD}       id=name
${SPACE_DESC_FIELD}       xpath=//*[@id="description"]/fieldset/div/div
${CREATE_SPACE_SUBMIT}    css=button.MuiButton-root:nth-child(2)
${SPACE_LIST}             xpath=//*[@id="__next"]/div/main/div[2]/div/div

*** Keywords ***
Create New Space
    [Arguments]    ${name}    ${description}
    Wait Until Element Is Visible    ${CREATE_SPACE_BUTTON}     timeout=5
    Click Button    ${CREATE_SPACE_BUTTON}
    Wait Until Element Is Visible    ${SPACE_NAME_FIELD}    timeout=5
    Input Text    ${SPACE_NAME_FIELD}    ${name}
    Input Text    ${SPACE_DESC_FIELD}    ${description}
    Click Button    ${CREATE_SPACE_SUBMIT}
    Sleep    2  # Wait for space creation to complete

*** Test Cases ***
View Spaces On Home Page
    [Documentation]    Verify that spaces are displayed on the home page
    Verify Home Page Loaded
    # Verify spaces section exists
    Wait Until Element Is Visible    ${SPACE_LIST}      timeout=5
    Element Should Be Visible    ${FIRST_SPACE}
    
# Create New Space
#     [Documentation]    Verify that a user can create a new space
#     Verify Home Page Loaded
#     ${timestamp}=    Get Time    epoch
#     Create New Space    Test Space ${timestamp}    Test space description
#     # Verify the new space appears in the list
#     Wait Until Page Contains    Test Space ${timestamp}       timeout=5
    
# Navigate To Space And Back
#     [Documentation]    Verify navigation between spaces and home
#     Verify Home Page Loaded
#     Open First Space
#     Verify Space Page Loaded
#     # Navigate back to home
#     Go To    ${URL}
#     Verify Home Page Loaded