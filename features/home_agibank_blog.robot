*** Settings ***
Resource               ../resources/base.resource
Test Setup             Abrir navegador
Test Teardown          Fechar Navegador

*** Test Cases ***
CT-01 - Validar que ao efetuar a busca no blog agibank por um item que não existe a mesnagem de produto não localizado sera exibida
    Dado que estou o blog do Agibank
    E clico na lupa de busca
    Quando efetuo a busca por  ${home.busca_inexistente}
    Então deve ser exibida a mensagem  ${home.message_search_not_found}


CT-02 - Validar que ao efetuar a busca no blog agibank por Atividade Rural, sera exibido como declarar no IR 2025
    Dado que estou o blog do Agibank
    E clico na lupa de busca
    Quando efetuo a busca por  ${home.busca_atividade_rural}
    Então deve ser exibida a mensagem  ${home.message_declarar_ir_rural_2025}


CT-03 - Validar que ao efetuar a busca no blog agibank o campo de busca deve limitar a quantidade de caracteres (Testando limte de caractéres)
    Dado que estou o blog do Agibank
    E clico na lupa de busca
    Quando efetuo a busca por  ${home.busca_large_text}
    Então não deve ser exibida a mensagem completa  ${home.busca_large_text}