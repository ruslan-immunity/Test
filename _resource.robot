*** Settings ***
Library  Selenium2Library

*** Variables ***
${BROWSER}          Chrome
${HOST}             http://napredele.com.ua/

*** Keywords ***
Prepare Test Environment
    Open Browser  ${HOST}  ${BROWSER}
    Maximize Browser Window