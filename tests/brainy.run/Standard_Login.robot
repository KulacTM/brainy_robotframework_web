*** Settings ***
Resource         brainy.resource
Test Setup       web.Precondition: Open Browser And Maximize    site_url=https://brainy.run/my-account/    browser=chrome
Test Teardown    web.Postcondition: Close Browser
Test Timeout     1m


*** Variables ***
${LOGIN}        demo@brainy.run
${PASSWORD}     eMS&K86bL4XR


*** Test Cases ***
Standard Login
    [Documentation]    Стандартная авторизация с валидным логином и паролем

    Wait Until Element Is Visible    //input[@type="text"]

    Input Text    locator=//input[@type="text"]            text=${LOGIN}
    Input Password    locator=//input[@type="password"]    password=${PASSWORD}

    Click Button    //button[@type="submit"]

    Wait Until Element Is Visible    css:div.woocommerce-MyAccount-content