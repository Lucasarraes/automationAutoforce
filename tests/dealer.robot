*** Settings ***

Resource     ../resources/dealer.resource

*** Test Cases ***
Cenarios de testes
    Abrir o Navegador
#Cabeçalho
    Listar opções ao clicar no botão Telefone
    Listar opções ao clicar no botão WhatsApp
#Rodape
    Exibir endereço e horário de funcionamento
    Exibir os dados institucionais da matriz
#Pagina principal
    Clicar no botão "Saiba mais" de um card de oferta


    Sleep    3s


#robot tests/dealer.robot
