*** Settings ***
Resource         ../web.resource
Test Setup       web.Precondition: Open Browser And Maximize    site_url=https://habr.com    browser=chrome
Test Teardown    web.Postcondition: Close Browser
Test Timeout     1m


*** Test Cases ***
For Cycle
    [Documentation]    Прокликать все компании из блока "Лучшие блоги"

    @{rating_companies}=    Get WebElements    css:span.tm-companies-rating__name

    FOR  ${company}  IN  @{rating_companies}
        ${rating_company_name}=    Get Text    ${company}
        Click Link    locator=${company}    modifier=COMMAND

        Switch Window    NEW

        Wait Until Element Is Visible        css:a.tm-company-card__name
        ${blog_company_name}=    Get Text    css:a.tm-company-card__name

        Should Be Equal    ${rating_company_name}   ${blog_company_name}

        Switch Window    MAIN
    END
    