*** Settings ***
Documentation  Ordering and removing items from the cart
Resource  _resource.robot
Test Setup  Prepare Test Environment
Test Teardown  Close All Browsers

*** Variables ***
${Check_search_page}   Критерии поиска:
${Selection_of_product1}   Роликовые коньки
${Selection_of_product2}   Гантели
${Title_of_the_product1}   -Роликовые коньки раздвижные детские N221B (р-р, S-29-32) (PL, PVC, колесо PU, алюм. рама, изменен. полож. колес, синий-голубой)
${Title_of_the_product2}   Гантели 13 кг, черные обрезиненные
${Element_of_the_product1}    css=#content > div.product-list > div:nth-child(1) > div.left > div.name > a
${Link_of_the_product2}   http://napredele.com.ua/tjazhelaja-atletika/ganteli/13-kg-prorezinenye.html
${Price_of_the_product1}   400 грн
${Price_of_the_product2}   935 грн
${Price_of_the_product2_x2}   1870 грн
${First_the_total_amount}   2270 грн
${Second_the_total_amount}   1335 грн
${Backet}   Корзина покупок
${Quantity_of_products1}   1
${Quantity_of_products2}   2
${Delete_Backet}   catalog/view/theme/default/image/remove.png
*** Test Cases ***
User must sign in to check out
    [Documentation]  This test consists of:
    ...  - 1) add items to the cart;
    ...  - 2) removing products from the shopping cart;
    ...  - 3) check availability of items in the cart.
    [Tags]  Smoke
    Wait Until Page Contains Element   css=.box-m
    Input Text   filter_name   ${Selection_of_product1}
    Click Element   css=.button-search
    Wait Until Page Contains    ${Check_search_page}
    Click Element   ${Element_of_the_product1}
    Element Should Be Visible   css=.image
    Wait Until Page Contains    ${Title_of_the_product1}
    Wait Until Page Contains Element    css=.tab-content
    Wait Until Page Contains    ${Price_of_the_product1}
    Click Element   css=.button
    Click Link   ${Backet}
    Wait Until Page Contains   Товаров: 1 (400 грн)
    ${Check_Price1}=   Get Text   css=tbody .price
    Should Be Equal   ${Check_Price1}   ${Price_of_the_product1}
    ${Check_Count1}=   Get Value   css=.quantity input[name="quantity[2119]"]
    Should Be Equal   ${Check_Count1}   ${Quantity_of_products1}
    Input Text   filter_name   ${Selection_of_product2}
    Click Element   css=.button-search
    Wait Until Page Contains   ${Check_search_page}
    Click Link   ${Link_of_the_product2}
    Element Should Be Visible   css=div.image
    Wait Until Page Contains   ${Title_of_the_product2}
    Wait Until Page Contains Element   css=.tab-content
    Wait Until Page Contains   ${Price_of_the_product2}
    Input Text   quantity   2
    Click Element   css=.button
    Click Link   ${Backet}
    Wait Until Page Contains   Товаров: 3 (2270 грн)
    Wait Until Page Contains Element   css=.cart-info table
    ${Check_Price2}=  Get Table Cell   css=.cart-info table  3  6
    Should Be Equal   ${Check_Price2}   ${Price_of_the_product2_x2}
    ${Check_Count2}=   Get Value   css=.quantity input[name="quantity[17]"]
    Should Be Equal   ${Check_Count2}   ${Quantity_of_products2}
    ${Check_Sum1}=   Get Table Cell   xpath=//div[@class='cart-total']/table[@id='total']  1  2
    Should Be Equal    ${Check_Sum1}   ${First_the_total_amount}
    Input Text   quantity[17]   1
    Click Image   catalog/view/theme/default/image/update.png
    Wait Until Page Contains   Товаров: 2 (1335 грн)
    Wait Until Page Contains Element   css=.cart-info table
    ${Check_Price2}=  Get Table Cell   css=.cart-info table  3  6
    Should Be Equal   ${Check_Price2}   ${price_of_the_product2}
    ${Check_Count2}=   Get Value   css=.quantity input[name="quantity[17]"]
    Should Be Equal   ${Check_Count2}   ${Quantity_of_products1}
    ${Check_Sum2}=   Get Table Cell   xpath=//div[@class='cart-total']/table[@id='total']  1  2
    Should Be Equal    ${Check_Sum2}   ${Second_the_total_amount}
    Click Image    ${Delete_Backet}
    Click Image    ${Delete_Backet}
    Sleep   5 sec

