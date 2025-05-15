*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Login with valid username and password
    Open Browser    url=https://the-internet.herokuapp.com/login    browser=headlesschrome
    Input Text    id=username    tomsmith
    Input Text    id=password    SuperSecretPassword!
    Click Button    class:radius
    Element Should Contain    id=flash    You logged into a secure area!
    Click Link    Logout
    Close Browser
