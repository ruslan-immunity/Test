*** Settings ***
Documentation  Negative test cases
Resource  _resource.robot
Test Setup  Prepare Test Environment
Test Teardown  Close All Browsers

*** Variables ***
${Checkout_email1}   12345.
${Checkout_email2}   google..@gmail.com
${Checkout_email3}   Гугл_Хром
${Checkout_email4}   %()*?:№!
${Checkout_email5}   ' sss '
${Checkout_password1}   @#$%
${Checkout_password2}   4321
${Checkout_password3}   Привет!
${Checkout_password4}   ruslyshnik@mail.ru
${Checkout_password5}   ' '
${Checkout_name1}   123456789qwertyuiopasdfg!@#$%^&*asdafdsfggfsvdbhfnjmynukuimunynnc dsfdsf
${Checkout_surname1}   33456789qwertyuiop asdfg!@#$%^&*asdafdsfggfsvdbhfnjmynukuimunynnc dsfdsf
${Checkout_address1}    %^
${Checkout_telephone1}   01
${Warning1}    css=#container > div.warning
${Button1}    css=#content > div.login-content > div.right > form > div > input.button

${Try email}    ruslan.immunity@gmail.com
${Try password}    1234
${Cart}    css=#header > div.links > a:nth-child(4)

*** Test Cases ***
User must sign in to check out
    [Documentation]  Negative test cases:
    ...  - 1) checking error handling login;
    ...  - 2) сhecking error handling cart;
    ...  - 3) test for empty cart.
    [Tags]  Smoke
    Wait Until Page Contains Element   css=.box-m
    Click Element  css=#welcome > a:nth-child(1)
    Element Should Be Visible   css=#content > div.login-content > div.right > form > div > p
    Input Text   email   ${Checkout_email1}
    Input Text   password   ${checkout_password1}
    Click Element   ${Button1}
    Wait Until Page Contains Element    ${Warning1}
    Input Text   email   ${Checkout_email2}
    Input Text   password   ${checkout_password2}
    Click Element   ${Button1}
    Wait Until Page Contains Element    ${Warning1}
    Input Text   email   ${Checkout_email3}
    Input Text   password   ${checkout_password3}
    Click Element   ${Button1}
    Wait Until Page Contains Element    ${Warning1}
    Input Text   email   ${Checkout_email4}
    Input Text   password   ${checkout_password4}
    Click Element   ${Button1}
    Wait Until Page Contains Element    ${Warning1}
    Input Text   email   ${Checkout_email5}
    Input Text   password   ${checkout_password5}
    Click Element   ${Button1}
    Wait Until Page Contains Element    ${Warning1}

    Click Element   css=#menu > ul > li:nth-child(1) > a
    Click Element   css=#content-main > div > div > div > div:nth-child(2) > div.image > a > img
    Click Element   css=#content > div.product-list > div:nth-child(1) > div.right > div.cart > input
    Click Element   ${Cart}
    Click Element   css=#content > div.buttons > div.right > a
    Wait Until Page Contains Element    css=#content > h1
    Element Should Be Visible   css=#checkout > div.checkout-content
    Input Text  firstname   ${Checkout_name1}
    Input Text  lastname    ${Checkout_surname1}
    Input Text  address_1   ${Checkout_address1}
    Input Text  email   ${checkout_email1}
    Input Text  telephone   ${checkout_telephone1}
    Click Element   css=#button-confirm > span
    Wait Until Page Contains Element    css=#checkout_form > div.left > table > tbody > tr:nth-child(1) > td:nth-child(2) > span
    Wait Until Page Contains Element    css=#checkout_form > div.left > table > tbody > tr:nth-child(2) > td:nth-child(2) > span
    Wait Until Page Contains Element    css=#checkout_form > div.left > table > tbody > tr:nth-child(3) > td:nth-child(2) > span
    Wait Until Page Contains Element    css=#checkout_form > div.left > table > tbody > tr:nth-child(4) > td:nth-child(2) > span
    Wait Until Page Contains Element    css=#checkout_form > div.left > table > tbody > tr:nth-child(5) > td:nth-child(2) > span
    Click Element   ${Cart}
    Click Element   css=#content > form > div > table > tbody > tr > td.quantity > a > img
    Wait Until Page Contains    Ваша корзина пуста!

