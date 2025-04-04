*** Settings ***
Documentation     Test login functionality
Resource          resources/common.resource
Resource          resources/pages/landing_page.resource
Resource          resources/pages/login_modal.resource
Resource          resources/pages/home_page.resource

Suite Setup       Open Browser With Custom Profile
Suite Teardown    Close All Browsers

*** Test Cases ***
User Can Login
    [Documentation]    Verify a user can login successfully
    Open Landing Page
    Click Sign In Button
    Login With Credentials    ${EMAIL}    ${PASSWORD}
    Verify Home Page Loaded