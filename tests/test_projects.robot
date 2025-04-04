*** Settings ***
Documentation     Test project management functionality
Resource          resources/common.resource
Resource          resources/pages/home_page.resource
Resource          resources/pages/space_page.resource
Resource          resources/pages/project_page.resource
Resource          resources/pages/session_page.resource

Suite Setup       Login Once
Suite Teardown    Close All Browsers
Test Setup        Prepare Test

*** Test Cases ***
Create New Project
    [Documentation]    Verify a user can create a new project
    Open First Space
    Verify Space Page Loaded
    Create New Project    test project    test description
    # Verify project was created successfully
    Go To    ${URL}
    Wait Until Element Is Visible    ${HOME_ELEMENT}

Open Existing Session
    [Documentation]    Verify a user can open an existing session
    Open Second Project
    Verify Project Page Loaded
    Open First Session
    Verify Session Page Loaded
    View Previous Comments