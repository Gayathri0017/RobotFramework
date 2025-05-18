*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Selecting the dropdwon items
    Open the Browser with url
    select the dropdown options API's by value
    select the dropdown options Microsoft excel by index
    select the dropdown options CSS by label
    Print the list Items

*** Keywords ***
Open the Browser with url
    Open Browser    url=https://demo.automationtesting.in/Register.html    browser=chrome
    Maximize Browser Window
    Set Browser Implicit Wait    5

select the dropdown options API's by value
    Select From List By Value    id=Skills    APIs

select the dropdown options Microsoft excel by index
    Select From List By Index    id=Skills    43

select the dropdown options CSS by label
    Select From List By Label    id=Skills    CSS

Print the list Items
    ${listItems}    Get List Items    id=Skills
    FOR    ${l}    IN    ${listItems}
        Log To Console    ${l}
    END
    


