*** Settings ***
Library    SeleniumLibrary
Test Setup       Precondition: Open Browser And Maximize
Test Teardown    Postcondition: Close Browser
Test Timeout    1m


*** Variables ***
${SITE_URL}    https://brainy.run
${BROWSER}     chrome
${TO_COURSE_LANDING_BTN}    (//a[@class="elementor-button elementor-button-link elementor-size-lg"])[1]
${TO_COURSE_BTN}            //span[text()="Перейти к курсу"]
${TO_CART_BTN}              //span[@class="btn-icon tutor-icon-cart-filled"]


*** Test Cases ***
Transition To Course Page

    Go To Course Landing
    Go To Course Page


*** Keywords ***
Go To Course Landing
    [Documentation]    Перейти на лендинг курса

    Wait Until Element Is Visible    locator=${TO_COURSE_LANDING_BTN}    timeout=10s
    Click Element                    locator=${TO_COURSE_LANDING_BTN}

Go To Course Page
    [Documentation]    Перейти на страницу курса

    Wait Until Element Is Visible    locator=${TO_COURSE_BTN}      timeout=10s
    Click Element                    locator=${TO_COURSE_BTN}  

    Wait Until Page Contains Element    ${TO_CART_BTN}

Precondition: Open Browser And Maximize
    [Documentation]    Предусловие: открыт браузер на весь экран

    Open Browser    url=${SITE_URL}    browser=${BROWSER}
    Maximize Browser Window

Postcondition: Close Browser
    [Documentation]    Постусловие: закрыть браузер

    Close Browser