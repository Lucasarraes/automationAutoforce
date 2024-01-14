*** Settings ***

Library     Browser   
...         timeout=0:00:20
...         enable_presenter_mode=${True}     

*** Variables ***

${BROWSER}        chromium
${HEADLESS}       ${false} 
${SITE}           https://testes.autoforce.com.br/dealer-bmw-desafio/ 

*** Keywords ***
Abrir o Navegador 
    New Browser   browser=${BROWSER}    headless=${HEADLESS}
    New Context    ignoreHTTPSErrors=${True}   
    New Page       url=${SITE}           
    

Listar opções ao clicar no botão Telefone
#    Wait For Elements State    css=div.header__phones-container button.button--primary     visible    timeout=5s
    Click       css=div.header__phones-container button.button--primary 
    Click       css=div#header-card-phones > div:nth-child(2)
    Get Text    css=div#phone-content-1 > ul > li:nth-child(3) > a > span > span        contains         (11) 00000-0000   

Listar opções ao clicar no botão WhatsApp
    Click        css=body > div > div > header > div.container > div.header-desktop.d-none.d-md-block > div > div.header__navbar-item.header__phones > div:nth-child(3) > button
    Click        css=div#header-card-whatsapp
    Get Text     css=div#wpp-content-0 > ul > li > a > span        contains         +55 (84) 99999-9999 

Exibir endereço e horário de funcionamento
    Click        css=footer > div > div.footer-land__units.footer-land__units--desktop.d-none.d-md-block > div > div > div.row.footer-land-units__content-row.active > div:nth-child(1) > h2:nth-child(1)
    Get Text     css=footer > div > div.footer-land__units.footer-land__units--desktop.d-none.d-md-block > div > div > div.row.footer-land-units__content-row.active > div:nth-child(1) > h2:nth-child(1)        contains          ENDEREÇO:  

    Click        css=footer > div > div.footer-land__units.footer-land__units--desktop.d-none.d-md-block > div > div > div.row.footer-land-units__content-row.active > div:nth-child(2) > h2:nth-child(1)
    Get Text     css=footer > div > div.footer-land__units.footer-land__units--desktop.d-none.d-md-block > div > div > div.row.footer-land-units__content-row.active > div:nth-child(2) > h2:nth-child(1)        contains           HORÁRIOS DE FUNCIONAMENTO:   

Exibir os dados institucionais da matriz
    Click        css=footer > div > div.footer-land__info > div > div:nth-child(1) > div:nth-child(1) > strong
    Get Text     css=footer > div > div.footer-land__info > div > div:nth-child(1) > div:nth-child(1) > strong        contains          CNPJ:

    Click        css=footer > div > div.footer-land__info > div > div:nth-child(1) > div:nth-child(2) > strong
    Get Text     css=footer > div > div.footer-land__info > div > div:nth-child(1) > div:nth-child(2) > strong       contains          Razão Social:

    Click        css=footer > div > div.footer-land__info > div > div:nth-child(2) > div > strong
    Get Text     css=footer > div > div.footer-land__info > div > div:nth-child(2) > div > strong       contains          Endereço Matriz:

Clicar no botão "Saiba mais" de um card de oferta
    Click        css=body > div > div > section.section-component.list-vehicles-land > div > div > div:nth-child(1) > a > div > button
    Get Text     css=form#conversion-from-new-model > header > div > h2       contains          Estou Interessado

#robot tests/dealer.robot
