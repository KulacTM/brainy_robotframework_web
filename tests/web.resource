*** Settings ***
Documentation    Общие кейворды для всех тестов
Library          SeleniumLibrary


*** Keywords ***
Precondition: Open Browser And Maximize
    [Documentation]    Предусловие: открыт браузер на весь экран
    [Arguments]    ${site_url}    ${browser}

    Open Browser    url=${site_url}    browser=${browser}
    Maximize Browser Window

Postcondition: Close Browser
    [Documentation]    Постусловие: закрыть браузер

    Close Browser