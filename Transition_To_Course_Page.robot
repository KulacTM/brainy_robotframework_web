*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Transition To Course Page
    Open Browser    url=https://brainy.run    browser=chrome
    Maximize Browser Window

    Wait Until Element Is Visible    locator=(//a[@class="elementor-button elementor-button-link elementor-size-lg"])[1]    timeout=10s
    Click Element    locator=(//a[@class="elementor-button elementor-button-link elementor-size-lg"])[1]

    Wait Until Element Is Visible    locator=//span[text()="Перейти к курсу"]    timeout=10s
    Click Element    locator=//span[text()="Перейти к курсу"]

    Wait Until Page Contains Element    //span[@class="btn-icon tutor-icon-cart-filled"]

    Close Browser