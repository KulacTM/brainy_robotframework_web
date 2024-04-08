*** Settings ***
Resource         ../web.resource
Test Setup       web.Precondition: Open Browser And Maximize    site_url=https://habr.com/ru/news/805091/    browser=chrome
Test Teardown    web.Postcondition: Close Browser
Test Timeout     1m


*** Test Cases ***
While Cycle
    [Documentation]    Нажимать на стрелку вперед в блоке "Истории", пока она не пропадет

    Wait Until Page Contains Element    //h2[text()="Истории"]

    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight * 0.5);

    Wait Until Element Is Visible    css:button.swiper-button-next

    ${is_next_button_exists}=    Set Variable    ${True}

    WHILE  ${is_next_button_exists}
        Click Element    css:button.swiper-button-next
        ${is_next_button_exists}=    Run Keyword And Return Status   
        ...     Element Should Be Visible    
        ...     css:button.swiper-button-next
        Sleep    1s
    END
    