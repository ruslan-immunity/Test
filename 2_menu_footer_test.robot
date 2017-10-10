*** Settings ***
Documentation  Checking links in header and footer
Resource  _resource.robot
Test Setup  Prepare Test Environment
Test Teardown  Close All Browsers

*** Variables ***
${LOGO1}   id=logo
${LOGO2}   http://napredele.com.ua/image/data/logo.jpg
${ABOUT}  http://napredele.com.ua/o-nas
${Wholesale}  http://napredele.com.ua/sporttovary-optom
${Shipping_Payment}  http://napredele.com.ua/dostavka-i-oplata
${Exchange_Return}  http://napredele.com.ua/obmen-vozvrat
${Contacts}  http://napredele.com.ua/kontakty
${MAIN}  http://napredele.com.ua/
${MAP_SITE}  Карта сайта
${Manufact}  Производители
${Сertificate}  Подарочные сертификаты
${Partner_program}  Партнёрская программа
${Stock}  Акции
*** Test Cases ***
User must sign in to check out
    [Documentation]  This quiz consists of:
    ...  -  1) check the links in the header;
    ...  - 2) check the links in the footer.
    [Tags]  Smoke
    Wait Until Page Contains Element  css=.box-m
    Click Link  ${MAIN}
    Wait Until Page Contains  Купить спорттовары в Украине
    Click Link  ${Shipping_Payment}
    Wait Until Page Contains  Доставка и оплата заказов по Украине:
    Click Element  ${LOGO1}
    Click Link  ${Exchange_Return}
    Wait Until Page Contains  14 дней
    Click Image  ${LOGO2}
    Click Link  ${ABOUT}
    Wait Until Page Contains  2010 года
    Click Element  ${LOGO1}
    Click Link  ${wholesale}
    Wait Until Page Contains  Оптовое предложение
    Click Image  ${LOGO2}
    Click Link  ${Contacts}
    Wait Until Page Contains  life:)
    Click Element  ${LOGO1}

    Click Link  ${MAP_SITE}
    Element Should Be Visible  css=.sitemap-info
    Click Image  ${LOGO2}
    Click Link  ${Manufact}
    Element Should Be Visible  css=.breadcrumb
    Click Element  ${LOGO1}
    Click Link  ${Сertificate}
    Wait Until Page Contains Element  css=.required
    Click Image  ${LOGO2}
    Click Link  ${Partner_program}
    Wait Until Page Contains Element  css=.login-content
    Click Element  ${LOGO1}
    Click Link  ${Stock}
    Wait Until Page Contains  Нет специальных предложений.
