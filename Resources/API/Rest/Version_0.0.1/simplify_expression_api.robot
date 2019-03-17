*** Settings ***
Documentation     Api common Keywords for newton domain, simplify operation
...
...               == Common keyword guideline ==
...
...               Get common guideline:
...               - Api Get From <DOMAIN> Domain <OPERATION>
...               - Api simplify the given expression and return the result
...               - For more information https://github.com/aunyks/newton-api
...
...               Supports:
...               - Get
...
...               Request and Response Params:
...               - Resquest Params -> <expression>
...               - Response Params -> <expression>; <operation>; <result>
...               - Sample -> https://newton.now.sh/<operation>/<expression>
...               @Author: Raj Navakoti
Library           Collections


*** Variables ***
# ----------------------------------------------------------------------------------------------------------------------
${uri}                 /simplify
${response_json}       null


*** Keywords ***
# ----------------------------------------------------------------------------------------------------------------------
# Keywords To Make Get Request To newton Simplify expression Api
Make Get Request To Simply Api And Retrun Response
    [Documentation]  Create a get session to request simpilify the provided expression
    ...              | /simplify/<expression>
    ...
    ...              *Result:*
    ...              - response: json output -> expression; operation; result
    ...
    ...              *Example:*
    ...              | request : /simplify/2*3+25  -> response : {operation: simplify, expression: 2*3+25, result: 31}
    [Arguments]    ${session_name}    ${params}
    ${response}    get request    ${session_name}    ${uri}/${params}
    ${response_json}=    Run Keyword IF    ${response.status_code} == 200
    ...    Set Variable    ${response.json()}
    [return]    ${response.status_code}    ${response.content}    ${response_json}

# ----------------------------------------------------------------------------------------------------------------------
# Keywords For Reading Response Parameters
Read Response Paramters
    [Documentation]  Read json respose and returns response parameters as dictionary
    ...
    ...              *Result:*
    ...              - Dictonary of response parameters
    [Arguments]    ${response}
    ${response_content}    Set Variable    ${response.content}
    ${response_params}    Set Variable    ${response.json()}
    Log    \nresponse content:${response_content}   Response params:${response_params}
    [return]    ${response_params}