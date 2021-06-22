# Sistema ERP - Delphi-Unigui e APi's

Neste projeto você vai encontrar vários módulos todos eles interligados.
Está estruturado em várias camadas, seguindo a linha do MVC, porém com camadas especificas fortemente Baseada em POO

# Api Auth
  Como o próprio nome diz, essa Api faz a autenticação dos usuarios.
  
# Api Data
  Responsabel pela Transição de todos os dados do sistema.
  Também faz a ponte entre dados de um Sistema Desktop que está sendo migrado para a WEb
  
# Api Report
  Gera relatorios e disponibiliza link do PDF
  
# Api NFE
  Executa os processos da NFe na versão 3.0
  
# ERP em Unigui
  A partir da raiz do projeto, vai encontrar um sistema estruturado da seguinte forma
    Telas e heranças gráficas
    Camadas de Model/Controle compartilhada
    Vários Módulos em desenvolvimentos porém com arquitetura bem definidads
    
# Roteador de Dados
  É responsabel por ler o banco de dados Firebird e reecompacta-los para ser enviado para uma nova base de dados MySql
  
# Aplicativos Android

  Aplicativo de Venda Externa
      Integrado com sistema de Gestão Desktop (outro projeto) vai disponibilizar para vendedores externos os dados de Cliente e Produtos
      Após o pedido confecionado em OFFLINE, o vendedor poderá enviar os dados para o servidor.
      O Sistema de Gestão Dektop pode consultar os pedidos do servidor web e baixa-los para faturamento
      
      
    
