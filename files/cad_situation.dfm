inherited CadSituation: TCadSituation
  ClientHeight = 169
  ClientWidth = 567
  Caption = 'Cadastro de Situa'#231#227'o'
  ExplicitWidth = 583
  ExplicitHeight = 228
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 105
    Width = 567
    ExplicitTop = 86
    ExplicitWidth = 567
  end
  inherited pnl_fundo: TUniPanel
    Width = 567
    Height = 105
    ExplicitWidth = 567
    ExplicitHeight = 86
    object L_Codigo: TUniLabel
      Left = 6
      Top = 6
      Width = 33
      Height = 14
      Hint = ''
      Caption = 'C'#243'digo'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 5
    end
    object E_ID: TUniEdit
      Left = 6
      Top = 21
      Width = 56
      Hint = ''
      Text = ''
      TabOrder = 0
      ReadOnly = True
    end
    object E_Description: TUniEdit
      Left = 64
      Top = 21
      Width = 498
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 1
    end
    object chbx_cad_active: TUniCheckBox
      Left = 157
      Top = 64
      Width = 136
      Height = 17
      Hint = ''
      Caption = 'Cadastro Ativo'
      TabOrder = 3
    end
    object L_NameCompany: TUniLabel
      Left = 64
      Top = 6
      Width = 49
      Height = 14
      Hint = ''
      Caption = 'Descri'#231#227'o'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 6
    end
    object UniLabel1: TUniLabel
      Left = 6
      Top = 46
      Width = 34
      Height = 13
      Hint = ''
      Caption = 'Modulo'
      TabOrder = 7
    end
    object Cb_Modulo: TUniComboBox
      Left = 6
      Top = 59
      Width = 145
      Hint = ''
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        'CONSERTO'
        'ASSISTENCIA T'#201'CNICA'
        'ENTREGA DE PEDIDO'
        'EXTINTORES'
        'CHAMADOS')
      TabOrder = 2
      IconItems = <>
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 16
    Top = 376
  end
end
