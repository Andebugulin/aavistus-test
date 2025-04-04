*** Settings ***
Documentation     Test session functionality
Resource          resources/common.resource
Resource          resources/pages/home_page.resource
Resource          resources/pages/project_page.resource
Resource          resources/pages/session_page.resource

Suite Setup       Login Once
Suite Teardown    Close All Browsers
Test Setup        Prepare Test

*** Variables ***
${SESSION_TEXT_AREA}    xpath=//*[@id="input-container"]/div/div[1]/div/div/div/p
${COMMENT_LIST}         xpath=//*[@id="__next"]/main/div/div[3]/div/div[1]

*** Test Cases ***
View Session Comments
    [Documentation]    Verify that a user can view comments in a session
    Open Second Project
    Verify Project Page Loaded
    Open First Session
    Verify Session Page Loaded
    View Previous Comments
    # Verify comments are visible
    Wait Until Element Is Visible    ${COMMENT_LIST}

Add New Comment To Session
    [Documentation]    Verify that a user can add a new comment to a session
    Open Second Project
    Verify Project Page Loaded
    Open First Session
    Verify Session Page Loaded
    View Previous Comments
    ${timestamp}=    Get Time    epoch
    Add Comment    Test comment ${timestamp}
    # Verify the comment is added
    Page Should Contain    Test comment ${timestamp}

Verify Comment Auto-Update
    [Documentation]    Verify that comments update automatically without refresh
    Launch Second Client
    
    # Client 1 opens a session
    Switch To Client    1
    Open Second Project
    Verify Project Page Loaded
    Open First Session
    Verify Session Page Loaded
    
    # Client 2 opens the same session
    Switch To Client    2
    Open First Project
    Verify Project Page Loaded
    Open First Session
    Verify Session Page Loaded
    
    # Client 1 adds a comment
    Switch To Client    1
    ${timestamp}=    Get Time    epoch
    Add Comment    Auto-update test ${timestamp}
    
    # Client 2 should see the comment appear without refreshing
    Switch To Client    2
    Wait Until Page Contains    Auto-update test ${timestamp}    timeout=10s