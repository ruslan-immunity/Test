*** Settings ***
Documentation  Testing the search.
Resource  _resource.robot
Test Setup  Prepare Test Environment
Test Teardown  Close All Browsers

*** Variables ***
${MAIL}  ruslan.immunity@gmail.com
${PASSW}  1234
${NAME}  Ruslan
${Product1}  волейбол
${Product2}  ракетка
${Product3}  дартс
${Image}    css=#image
${H1}   css=#content-wide > div.product-info > div.right > h1
${Price}    css=#content-wide > div.product-info > div.right > div.price
${Search}   css=#search > div
${Button_search}   css=#button-search
${Description}   css=#tab-description
${Sub_category}   css=#sub_category
*** Test Cases ***
User must sign in to check out
    [Documentation]  Testing the search:
    ...  1) Log in to personal account;
    ...  2) Сheck the main search;
    ...  3) Check the search by categories.
    [Tags]  Smoke
    Wait Until Page Contains Element   css=.box-m
    Click Link   css=#welcome > a:nth-child(1)
    Wait Until Page Contains   Зарегистрированный клиент
    Input Text  email  ${MAIL}
    Input Password  password  ${PASSW}
    Click Element   css=input.button
    Element Should Be Visible   id=column-right
    Wait Until Page Contains   ${NAME}
    Input Text  filter_name  ${Product1}
    Click Element   ${Search}
    Click Element   css=#content > div.product-list > div:nth-child(1) > div.left > div.name > a
    Element Should Be Visible   ${Image}
    Wait Until Page Contains Element   ${H1}
    Wait Until Page Contains Element   ${Description}
    Wait Until Page Contains Element   ${Price}
    Click Element   css=#container > div.breadcrumb > a:nth-child(2)
    Click Element   css=#content > div.product-list > div:nth-child(2) > div.left > div.name > a
    Element Should Be Visible   ${Image}
    Wait Until Page Contains Element   ${H1}
    Wait Until Page Contains Element   ${Description}
    Wait Until Page Contains Element   ${Price}
    Input Text  filter_name  ${Product2}
    Click Element   ${Search}
    Click Element   css=#content > div.content > p > select > option:nth-child(3)
    Click Element   ${Sub_category}
    Click Element   ${Button_search}
    Click Element   css=#content > div.product-list > div:nth-child(1) > div.left > div.name > a
    Element Should Be Visible   ${Image}
    Wait Until Page Contains Element   ${H1}
    Wait Until Page Contains Element   ${Description}
    Wait Until Page Contains Element   ${Price}
    Click Element   css=#container > div.breadcrumb > a:nth-child(3)
    Click Element   css=#content > div.product-list > div:nth-child(9) > div.left > div.name > a
    Element Should Be Visible   ${Image}
    Wait Until Page Contains Element   ${H1}
    Wait Until Page Contains Element   ${Description}
    Wait Until Page Contains Element   ${Price}
    Input Text  filter_name  ${Product3}
    Click Element   ${Search}
    Click Element   css=#content > div.content > p > select > option:nth-child(13)
    Click Element   ${Sub_category}
    Click Element   ${Button_search}
    Click Element   css=#content > div.product-list > div:nth-child(1) > div.left > div.name > a
    Element Should Be Visible   ${Image}
    Wait Until Page Contains Element   ${H1}
    Wait Until Page Contains Element   ${Description}
    Wait Until Page Contains Element   ${Price}
    Click Element   css=#container > div.breadcrumb > a:nth-child(2)
    Click Element   css=#content > div.product-list > div:nth-child(2) > div.left > div.name > a
    Element Should Be Visible   ${Image}
    Wait Until Page Contains Element   ${H1}
    Wait Until Page Contains Element   ${Description}
    Wait Until Page Contains Element   ${Price}

    Sleep  3 sec

