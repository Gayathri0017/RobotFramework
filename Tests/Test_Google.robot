*** Settings ***
Library    SeleniumLibrary
*** Test Cases ***
Search selenium in google - valid
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --user-data-dir\=C:\\Users\\public\\AppData\\Local\\Google\\Chrome\\User Data
    Call Method    ${chrome_options}    add_argument    --profile-directory\=Default
    Open Browser    https://www.google.com    chrome    options=${chrome_options}
    Maximize Browser Window
    Input Text    name=q    selenium
    Press Keys    name=q    ENTER
    Page Should Contain    selenium
    Close Browser
    
Search Robot in google - valid
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --user-data-dir\=C:\\Users\\public\\AppData\\Local\\Google\\Chrome\\User Data
    Call Method    ${chrome_options}    add_argument    --profile-directory\=Default
    Open Browser    https://www.google.com    chrome    options=${chrome_options} 
    Maximize Browser Window
    Input Text    name=q    Robot
    Press Keys    name=q    ENTER
    Page Should Contain    Robot
    Close Browser
