*** Settings ***
Library    SeleniumLibrary
*** Test Cases ***
select an option of radio button
    open the browser
    select options from 3 radio buttons
    verify that the radio buuton is selected
*** Keywords ***
open the browser
    Open Browser    url=https://demo.automationtesting.in/Register.html    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    5

select options from 3 radio buttons
    Page Should Contain Radio Button    name:radiooptions
    Page Should Not Contain Radio Button    id=checkbox1
    Select Radio Button    radiooptions    Male
    
verify that the radio buuton is selected
    Radio Button Should Be Set To    radiooptions    Male     



