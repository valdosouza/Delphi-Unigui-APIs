inherited TasVirtualShop: TTasVirtualShop
  ClientHeight = 374
  ClientWidth = 570
  Caption = 'Loja Virtual'
  ExplicitWidth = 586
  ExplicitHeight = 433
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 310
    Width = 570
    ExplicitTop = 310
    ExplicitWidth = 570
  end
  inherited pnl_fundo: TUniPanel
    Width = 570
    Height = 310
    ExplicitWidth = 570
    ExplicitHeight = 310
    object UniLabel1: TUniLabel
      Left = 4
      Top = 5
      Width = 90
      Height = 13
      Hint = ''
      Caption = 'Site na WEB(www)'
      TabOrder = 1
    end
    object E_domain: TUniEdit
      Left = 4
      Top = 20
      Width = 558
      Hint = ''
      Text = ''
      TabOrder = 2
    end
    object UniLabel2: TUniLabel
      Left = 4
      Top = 45
      Width = 62
      Height = 13
      Hint = ''
      Caption = 'T'#237'tulo do Site'
      TabOrder = 3
    end
    object E_Title: TUniEdit
      Left = 4
      Top = 60
      Width = 558
      Hint = ''
      Text = ''
      TabOrder = 4
    end
    object Ctn_Price_List: TUniContainerPanel
      Left = 4
      Top = 88
      Width = 558
      Height = 38
      Hint = ''
      ParentColor = False
      TabOrder = 5
    end
    object Ctn_Stock_List: TUniContainerPanel
      Left = 4
      Top = 129
      Width = 558
      Height = 38
      Hint = ''
      ParentColor = False
      TabOrder = 6
    end
    object UniLabel3: TUniLabel
      Left = 4
      Top = 169
      Width = 179
      Height = 13
      Hint = ''
      Caption = 'ID - Identificador do Google Analytics'
      TabOrder = 7
    end
    object E_google_analytics_id: TUniEdit
      Left = 4
      Top = 184
      Width = 558
      Hint = ''
      Text = ''
      TabOrder = 8
    end
    object UniLabel4: TUniLabel
      Left = 4
      Top = 208
      Width = 349
      Height = 13
      Hint = ''
      Caption = 
        'email para controlar o pagamento eletronico - BCash (www.chas.co' +
        'm.br)'
      TabOrder = 9
    end
    object UniEdit4: TUniEdit
      Left = 4
      Top = 223
      Width = 558
      Hint = ''
      Text = ''
      TabOrder = 10
    end
    object Cbx_Active: TUniCheckBox
      Left = 3
      Top = 251
      Width = 309
      Height = 17
      Hint = ''
      Caption = 'Ativar Conex'#227'o com a Internet - Com'#233'rcio Eletr'#244'nico'
      TabOrder = 11
    end
    object Cbx_Vitrine: TUniCheckBox
      Left = 4
      Top = 267
      Width = 463
      Height = 17
      Hint = ''
      Caption = 
        'Ativar apenas como uma vitrine para os produtos, mas sem efetuar' +
        ' venda pelo site'
      TabOrder = 12
    end
    object Cbx_dealer: TUniCheckBox
      Left = 4
      Top = 286
      Width = 421
      Height = 17
      Hint = ''
      Caption = 
        'Permiti a visualiza'#231#227'o de pre'#231'os e/ou compra apenas para revende' +
        'dores'
      TabOrder = 13
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 56
    Top = 440
  end
end
