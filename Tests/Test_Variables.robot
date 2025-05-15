*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${valid_username}    Admin
${valid_password}    admin123
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

*** Test Cases ***
Validate elements on Login Page
    Open the browser with url
    Set Selenium Implicit Wait    10s
    Fill the login form
    Verify dashboard page opened
    verify the items in Dashboard

*** Keywords ***
Open the browser with url
    Open Browser    ${url}    chrome
    Maximize Browser Window

Fill the login form
    Input Text    xpath://input[@name='username']    ${valid_username}
    Input Text    xpath://input[@name='password']    ${valid_password}
    Click Button    xpath://button[@type='submit']
    # Element Should Contain    //p[@class='oxd-text oxd-text--p orangehrm-login-forgot-header']    Forgot your password? 

Verify dashboard page opened
    Element Should Contain    xpath://h6    Dashboard

verify the items in Dashboard
    @{expectedlist}=    Create List    Admin    PIM    Leave    Time    Recruitment    My Info    Performance    Dashboard    Directory    Maintenance    Claim    Buzz
    ${ele}=    Get WebElements    css:.oxd-main-menu-item
    @{act}=    Create List
    FOR    ${el}    IN    @{ele}
        LOG    ${el.text}
        Append To List    ${act}    ${el.text}  
    END
    Lists Should Be Equal    ${act}    ${expectedlist}
    
    

