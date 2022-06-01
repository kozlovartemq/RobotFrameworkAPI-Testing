*** Settings ***
Documentation    Tast cases of API testing robotframework.org site
Resource         ../Resources/keywords.resource
Suite Setup      Connect to API Documentation

*** Test Cases ***

Get API Documentation Page
    [Documentation]     This test case verifies the ability to open the API Documentation Page
    [Tags]              GET    APIDocumentation

    Verify that API Documentation Page opens
