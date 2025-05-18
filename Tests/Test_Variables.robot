# *** Settings ***
# Library    SeleniumLibrary

# *** Variables ***
# ${un}    Admin
# ${pw}    admin123
# ${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
# ${logintxt}    xpath=//h5
# # ${btn}    xpath=//button[@class='oxd-button oxd-button--medium oxd-button--main orangehrm-login-button']
# ${dash}    xpath=//h6[text()='Dashboard']

# *** Test Cases ***
# Validate Elements on Login Page
#     Open the browser with url
#     Element Should Be Visible    ${logintxt}
#     Close Browser

# Validate Successful Login
#     Open the browser with url
#     Fill the login form 
#     Verify the dashboard page is visible
#     Close Browser

# *** Keywords ***
# Open the browser with url
#     Open Browser    ${url}    chrome
#     Set Selenium Timeout    10s

# Fill the login form
#     Input Text    xpath://input[@name='username']    ${un}
#     Input Text    xpath://input[@name='password']    ${pw}
#     Click Button    xpath://button[@type='submit']

# Verify the dashboard page is visible
#     Element Should Be Visible    ${dash}
*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    Resource.robot

# *** Variables ***
# ${valid_username}    Admin
# ${valid_password}    admin123

*** Test Cases ***
Validate elements on Login Page
    [Tags]    Smoke
    Open the browser with url
    Set Selenium Implicit Wait    10s
    Fill the login form
    Verify dashboard page opened
    verify the items in Dashboard
    Close Browser
validate Unsucessful login
    Open the browser with url
    Set Selenium Implicit Wait    10s
    Fill the login form with Invalid Details
    Close Browser

*** Keywords ***
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

Fill the login form with Invalid Details
    Input Text    xpath://input[@name='username']    ${invalid_username}
    Input Text    xpath://input[@name='password']    ${invalid_password}
    Click Button    xpath://button[@type='submit']
    Page Should Contain    Invalid credentials
    
    

