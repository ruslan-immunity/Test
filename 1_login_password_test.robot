*** Settings ***
Documentation  Health check class login-content
Library  Selenium2Library
Resource  _resource.robot
Test Teardown  Close All Browsers

*** Variables ***
${MAIL}  ruslan.immunity@gmail.com
${PASSW}  1234
${NAME}  Ruslan
*** Test Cases ***
User must sign in to check out
    [Documentation]  Validation consists of checking the username and password of the user
    [Tags]  Smoke
    Wait Until Page Contains Element  css=.box-m
    Click Link  Войти
    Wait Until Page Contains  Зарегистрированный клиент
    Input Text  email  ${MAIL}
    Input Password  password  ${PASSW}
    Click Element    css=input.button
    Element Should Be Visible  id=column-right
    Wait Until Page Contains  ${NAME}


