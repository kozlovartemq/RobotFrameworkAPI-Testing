*** Settings ***
Documentation    Tast cases of API testing robotframework.org site
Resource         ../Resources/keywords.resource
Suite Setup      Connect to base URL

*** Test Cases ***

Get Home Page
    [Documentation]     This test case verifies the ability to open the HomePage
    [Tags]              GET    HomePage

    Verify that HomePage opens

Get Documentation Page
    [Documentation]     This test case verifies the ability to open the Documentation page
    [Tags]              GET    DocumentationPage

    Verify that DocumentationPage opens

Get resources of documentation Page
    [Documentation]     This test case verifies that robotframework/resources/docs.js loads correctly in the Documentation page.
    ...                 This file allows a user interact with 'View' and 'Download' buttons.
    [Tags]              GET    DocumentationPage

    Verify that resources of documentation loads correctly