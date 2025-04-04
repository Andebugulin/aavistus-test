*** Settings ***
Documentation     Test multi-client functionality
Resource          resources/common.resource
Resource          resources/pages/home_page.resource
Resource          resources/pages/project_page.resource
Resource          resources/pages/session_page.resource

Suite Setup       Setup Multi Client Test
Suite Teardown    Close All Browsers
Test Setup        Prepare Multi Client

*** Keywords ***
Setup Multi Client Test
    Login Once
    Launch Second Client

Prepare Multi Client
    Switch To Client    1
    Prepare Test
    Switch To Client    2
    Prepare Test
    Switch To Client    1

*** Test Cases ***
Test Feed Updates Between Clients
    [Documentation]    Test that when one client adds a comment, another client sees the update
    # Client 1 opens a session
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
    
    # Client 1 posts a comment
    Switch To Client    1
    ${timestamp}=    Get Time    epoch
    Add Comment    Test comment from client 1 ${timestamp}
    
    # Client 2 should see updates automatically
    Switch To Client    2
    # Verify the comment is visible (would need specific locator for the new comment)
    # This would depend on how comments appear and if there's any update mechanism
    Sleep    5  # Allowing time for updates to appear
    Page Should Contain    Test comment from client 1 ${timestamp}