*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${valid_username}    Admin
${valid_password}    admin123
${invalid_username}    aaa
${invalid_password}    admin123

*** Keywords ***
Open the browser with url
    Open Browser    ${url}    chrome
    Maximize Browser Window