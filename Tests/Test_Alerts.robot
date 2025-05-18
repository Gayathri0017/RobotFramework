*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Test Cases ***
checking alerts
    Open the Browser with url
    check simple alert
    check confirmation alert
    check promt alert
*** Keywords ***
Open the Browser with url
    Open Browser    url=https://demo.automationtesting.in/Alerts.html    browser=chrome
    Maximize Browser Window
    Set Browser Implicit Wait    5
check simple alert
    Click Element    xpath=//ul[@class='nav nav-tabs nav-stacked']/li/a[1]
    Click Button    xpath=//div[@id='OKTab']/button
    Sleep    2s
    Alert Should Be Present    I am an alert box!
check confirmation alert
    Click Element    xpath=//ul[@class='nav nav-tabs nav-stacked']/li[2]/a 
    Click Button    //button[@class='btn btn-primary']
    Sleep    2s
    Alert Should Be Present    Press a Button !    DISMISS
    Page Should Contain    You Pressed Cancel
check promt alert
    Click Element    xpath=//ul[@class='nav nav-tabs nav-stacked']/li[3]/a 
    Click Button    //button[@class='btn btn-info']
    Sleep    2s
    Input Text Into Alert    Gayathri
    Sleep    2s
    Page Should Contain    Gayathri

    

    
