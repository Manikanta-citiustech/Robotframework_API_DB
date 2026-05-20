
*** Settings ***
Resource    ../resources/keywords.robot
Resource    ../resources/variables.robot

*** Test Cases ***
TC01 - Get Users API Test
    Create API Session
    ${response}=    Get Users List

    Validate Status Code    ${response}    200
    Validate Response Contains Users    ${response}
    Validate First User Name    ${response}