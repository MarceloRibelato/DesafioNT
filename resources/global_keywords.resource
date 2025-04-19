*** Settings ***
Library     SeleniumLibrary
Library    OperatingSystem
Library    BuiltIn


*** Variables ***
${BROWSER}                  Chrome
${URL}                      https://blog.agibank.com.br/

*** Keywords ***
#### TEARDOWN
Fechar Navegador
    Close Browser

Abrir Navegador

    ${chrome options} =     Evaluate    selenium.webdriver.ChromeOptions()
    ...                     modules=selenium, selenium.webdriver
   # Call Method    ${chrome_options}   add_argument    --headless
    Call Method    ${chrome_options}   add_argument    --no-sandbox
    Call Method    ${chrome_options}   add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}   add_argument    --ignore-certificate-errors
    Call Method    ${chrome_options}   add_argument    --disable-gpu
    ${var}=     Call Method     ${chrome_options}    to_capabilities
    Create Webdriver  driver_name=${BROWSER}   alias=Google   options=${chrome_options}
    Go To    ${URL}
    Maximize Browser Window
    Set Selenium Timeout    30s
    Set Selenium Speed    1s
    
Type text in Selection
    [Arguments]    ${text}
    Sleep    2
    Press Keys    NONE    ${text}
    Press Keys    NONE    ENTER
