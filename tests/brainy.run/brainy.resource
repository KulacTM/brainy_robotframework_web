*** Settings ***
Documentation    Кейворды для сайта brainy.run
Resource         ../web.resource
Resource         ../../locators/brainy_lc.resource


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
