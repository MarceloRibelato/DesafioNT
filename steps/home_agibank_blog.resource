*** Settings ***
Resource    ../resources/base.resource

*** Keywords ***
Dado que estou o blog do Agibank
    Title Should Be    ${home.agibank_blog_title}

E clico na lupa de busca
    Wait Until Page Contains    Código 1929 INSS: entenda o que é e como pagar
    Wait Until Element Is Visible    ${MENU_SUAS_FINANCAS}
    Click Element    ${MENU_SUAS_FINANCAS}
    Sleep    2
    Wait Until Element Is Enabled    ${ICON_LUPA}
    Click Element    ${ICON_LUPA}

Quando efetuo a busca por 
    [Arguments]    ${VALOR}
    Type Text In Selection    ${VALOR}

Então deve ser exibida a mensagem
    [Arguments]    ${TEXTO}
    Sleep    5
    Page Should Contain Element    //*[contains(normalize-space(.), '${TEXTO}')]
    Capture Page Screenshot

Então não deve ser exibida a mensagem completa
    [Arguments]    ${TEXTO}
    Sleep    5
    Page Should Not Contain Element    //*[contains(normalize-space(.), '${TEXTO}')]
    Capture Page Screenshot