*** Settings ***
Library    SeleniumLibrary
*** Test Cases ***
select an option of ChcekBox
    open the browser
    Verify the page contains a Chcekbox
    Select the checkbox options cricket and Hockey
    Unselect the checkbox option Hockey
    verify the chcekbox Cricket is selected
    verify the chcekbox Hokey is not selected
    Close Browser
*** Keywords ***
open the browser
    Open Browser    url=https://demo.automationtesting.in/Register.html    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    5
Verify the page contains a Chcekbox
    Page Should Contain Checkbox    id=checkbox1
    Page Should Not Contain Checkbox    name=radiooptions
Select the checkbox options cricket and Hockey
    Select Checkbox    id=checkbox1
    Select Checkbox    id=checkbox3

Unselect the checkbox option Hockey
    Unselect Checkbox    id=checkbox3

verify the chcekbox Cricket is selected
    Checkbox Should Be Selected    id=checkbox1

verify the chcekbox Hokey is not selected
    Checkbox Should Not Be Selected    id=checkbox3



