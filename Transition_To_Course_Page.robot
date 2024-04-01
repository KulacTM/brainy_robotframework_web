*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${SITE_URL}    https://brainy.run
${BROWSER}     chrome
${TO_COURSE_LANDING_BTN}    (//a[@class="elementor-button elementor-button-link elementor-size-lg"])[1]
${TO_COURSE_BTN}            //span[text()="Перейти к курсу"]
${TO_CART_BTN}              //span[@class="btn-icon tutor-icon-cart-filled"]


*** Test Cases ***
Transition To Course Page
    Open Browser    url=${SITE_URL}    browser=${BROWSER}
    Maximize Browser Window

    Wait Until Element Is Visible    locator=${TO_COURSE_LANDING_BTN}    timeout=10s
    Click Element                    locator=${TO_COURSE_LANDING_BTN}

    Wait Until Element Is Visible    locator=${TO_COURSE_BTN}      timeout=10s
    Click Element                    locator=${TO_COURSE_BTN}  

    Wait Until Page Contains Element    ${TO_CART_BTN}

    Close Browser