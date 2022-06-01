*** Settings ***
Documentation     This is a resource file, that can contain variables and keywords.
...               Keywords defined here can be used where this Keywords.resource in loaded.
Library           RequestsLibrary
Library           Collections

*** Variables ***

${BASE_ENDPOINT}        https://robotframework.org
${API_Documentation}    https://robot-framework.readthedocs.io/
&{headers}              User-Agent=Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36
...                     accept=text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9

*** Keywords ***

Connect to base URL
    Create Session         NewSession     ${BASE_ENDPOINT}     headers=${headers}

Connect to API Documentation
    Create Session         NewSession     ${API_Documentation}     headers=${headers}

Verify that HomePage opens
    ${status_code}=    get status code
    should be equal   ${status_code}   200

Verify that DocumentationPage opens
    ${response}=     get documentation page response
    ${status_code}=    get status code    ${response}
    should be equal   ${status_code}   200

Verify that resources of documentation loads correctly
    ${response}=     Get resources/docs.js file
    ${status_code}=    get status code    ${response}
    should be equal   ${status_code}   200

Verify that API Documentation Page opens
    ${status_code}=    get status code
    should be equal   ${status_code}   200


Get status code
    [Arguments]    ${response}=None
    IF  '${response}' == 'None'
        ${response}=   get on session   NewSession     /     headers=${headers}
    END

    ${response_code}=     convert to string     ${response.status_code}
    [Return]    ${response_code}

Get documentation page response
    ${response}=  GET ON SESSION         NewSession     robotframework     headers=${headers}
    [Return]    ${response}

Get resources/docs.js file
    ${response}=  GET ON SESSION         NewSession     robotframework/resources/docs.js     headers=${headers}
    [Return]    ${response}
