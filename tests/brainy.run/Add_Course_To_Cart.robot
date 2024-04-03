*** Settings ***
Resource         brainy.resource
Test Setup       web.Precondition: Open Browser And Maximize    site_url=https://brainy.run/courses/robotframework-mobile/    browser=chrome
Test Teardown    web.Postcondition: Close Browser
Test Timeout     1m


*** Test Cases ***
Add Course To Cart
    [Documentation]    Добавить курс в корзину

    Log In

    Wait Until Element Is Visible    //button[@name="add-to-cart"]
    ${is_user_authorized}=    
    ...    Run Keyword And Return Status     
    ...    Wait Until Element Is Visible    
    ...    css:div.tutor-header-profile-name    timeout=3s

    IF  not ${is_user_authorized}    Log In

    Wait Until Element Is Visible    //button[@name="add-to-cart"]
    Click Element    //button[@name="add-to-cart"]

    Wait Until Element Is Visible    //a[contains(text(), "Просмотреть корзину")]


*** Keywords ***
Log In
    [Documentation]    Авторизоваться в аккаунт

    Go To    url=https://brainy.run/my-account/

    Wait Until Element Is Visible    //input[@type="text"]

    Input Text    locator=//input[@type="text"]            text=%{LOGIN}
    Input Password    locator=//input[@type="password"]    password=%{PASSWORD}

    Click Button    //button[@type="submit"]

    Go To    url=https://brainy.run/courses/robotframework-mobile/
    