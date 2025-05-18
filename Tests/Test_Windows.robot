*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser
*** Test Cases ***
verify the windows
    open the browser with url
    select the button to swtich to child window
    verify the child window is opened
    verify the user is switched back to parent window

*** Keywords ***
open the browser with url
    Open Browser    url=https://demo.automationtesting.in/Windows.html    browser=chrome
    Maximize Browser Window
    Set Browser Implicit Wait    5

select the button to swtich to child window
    Click Element    xpath=//ul[@class='nav nav-tabs nav-stacked']/li[2]/a
    Click Button    css:.btn-primary 
    ${childs}    Get Window Handles
    ${count}    Get Length    ${childs}
    Log To Console    ${count} 
    FOR    ${child}    IN    ${childs}
        Log To Console    ${child}
        ${title}    Get Title
        Log To Console    ${title}

    END
    
verify the child window is opened
    Switch Window    NEW
    Page Should Contain    Selenium automates browsers
    Sleep    5s
verify the user is switched back to parent window
    Switch Window    MAIN
    Page Should Contain    Automation Demo Site
    Sleep    5s



    

