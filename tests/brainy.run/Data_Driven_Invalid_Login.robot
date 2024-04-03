*** Settings ***
Resource         brainy.resource
Test Setup       web.Precondition: Open Browser And Maximize    site_url=https://brainy.run/my-account/    browser=chrome
Test Teardown    web.Postcondition: Close Browser
Test Timeout     1m


*** Variables ***
${VALID_LOGIN}        demo@brainy.run
${VALID_PASSWORD}     eMS&K86bL4XR


*** Test Cases ***
Standard Data Driven Invalid Login
    [Documentation]    Стандартная авторизация с невалидными данными
    [Template]    Invalid Login

    # 1. Валидный логин и невалидный пароль
    ${VALID_LOGIN}    invalid_password
    # 2. Невалидный логин и валидный пароль
    invalid_login    ${VALID_PASSWORD}
    # 3. И невалидный логин и невалидный пароль
    invalid_login    invalid_password


*** Keywords ***
Invalid Login
    [Documentation]    Авторизация с невалидными данными
    [Arguments]    ${login}    ${password}

    Wait Until Element Is Visible    //input[@type="text"]

    Input Text    locator=//input[@type="text"]            text=${login}
    Input Password    locator=//input[@type="password"]    password=${password}

    Click Button    //button[@type="submit"]

    Wait Until Element Is Visible    //ul[@class='woocommerce-error' and @role='alert']

    Sleep    1s