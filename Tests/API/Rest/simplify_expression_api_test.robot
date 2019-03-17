*** Settings ***
Documentation     End to End test suite for 'simply expression' operation of newton-api
...
...               == Test case and keyword guideline ==
...
...               Test cases:
...               - Test case are written in gherkin format
...
...               Keywods:
...               - Suite keywords will be accessed only within the suite
...               - Each keyword is an implementation of gherkin statement
...
...               Required/preconditions:
...               - Suite setup and tear down
Metadata          author: Raj Navakoti
Library           RequestsLibrary
Library           collections
Resource          ../../../Resources/API/Rest/api_collection.robot
Suite Setup       Set Up - Suite
Suite Teardown    Tear Down - Suite


*** Variables ***
${url}    https://newton.now.sh


*** Test Cases ***
Scenario: Verify the response of Simplify API when user provided valid expression
    [Tags]    Rest_API    Positive_Scenario    Smoke
    Given I have provided a expression "2^2+2*2"
    Then I see the status of the response as "200"
    And I see the Expression value from the respose as "2^2+2*2"
    And I see the Operation value from the respose as "simplify"
    And I see the Result value from the response as "8"

Scenario: Verify the response of Simplify API when user provided expression with all numeric values
    [Tags]    Rest_API    Positive_Scenario
    Given I have provided a expression "10-10+1.1"
    Then I see the status of the response as "200"
    And I see the Expression value from the respose as "10-10+1.1"
    And I see the Operation value from the respose as "simplify"
    And I see the Result value from the response as "1.1"

Scenario: Verify user providing an empty expression should retrun 404 error
    [Tags]    Rest_API    Negative_Scenario    Sanity
    Given I have provided a expression ""
    Then I see the status of the response as "404"


*** Keywords ***
Set Up - Suite
    [Documentation]  Create a session for api requests throughout the test suite
    ...
    create session    Simplify_session    ${url}    verify=True

I have provided a expression "${expression}"
    [Documentation]  Makes a get request with the provided expression
    ...
    ${status}    ${content}    ${response_params}    Make Get Request To Simply Api And Retrun Response    Simplify_session    ${expression}
    Set Test Variable    ${status}
    Set Test Variable    ${content}
    Set Test Variable    ${response_params}
    Log    \nstatu:${status} content:${content}

I see the status of the response as "${expected_status}"
    [Documentation]  Asserts whether actual response status matches with the expected status
    ...
    Should Be Equal As Integers    ${expected_status}    ${status}    msg=response status is not 200

I see the Operation value from the respose as "${operation}"
    [Documentation]  Asserts the response of opration value matches with the provided operation
    ...
    Should Be Equal    ${response_params['operation']}    ${operation}    msg=Incorrect operation in response

I see the Expression value from the respose as "${expression}"
    [Documentation]  Asserts the response of expression value matches with the provided expression
    ...
    Log    ${response_params['expression']}
    Should Be Equal    ${response_params['expression']}    ${expression}    msg=Incorrect expression in response

I see the Result value from the response as "${result}"
    [Documentation]  Asserts the response of result is as expected
    ...
    Should Be Equal As Numbers    ${response_params['result']}    ${result}    msg=Incorrect result in response

Tear Down - Suite
    [Documentation]  Deletes all api session created in this test suite
    ...
    delete all sessions