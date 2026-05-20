*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource    ../resources/variables.robot

*** Keywords ***
Create API Session
    Create Session    mysession    ${BASE_URL}


Get Users List
    ${response}=    GET On Session    mysession    /users   expected_status=200
    RETURN    ${response}

Validate Status Code
    [Arguments]    ${response}    ${expected}
    Should Be Equal As Integers    ${response.status_code}    ${expected}

Validate Response Contains Users
    [Arguments]    ${response}
    ${json}=    Set Variable    ${response.json()}
    Should Not Be Empty    ${json}

Validate First User Name
    [Arguments]    ${response}
    ${json}=    Set Variable    ${response.json()}
    ${first}=    Get From List    ${json}    0
    ${name}=    Get From Dictionary    ${first}    name
    Log    First User: ${name}