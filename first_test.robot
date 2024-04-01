*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
First Test
    Open Browser    url=https://ya.ru/    browser=safari
    Sleep    time_=5s
    Close Browser