inherited SeaPaymentType: TSeaPaymentType
  ClientWidth = 384
  Caption = 'Pesquisa Modos de Pagamento'
  ExplicitWidth = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Top = 73
    Width = 384
    Height = 399
    ExplicitTop = 73
    ExplicitWidth = 384
    ExplicitHeight = 399
    inherited Grd_Search: TUniDBGrid
      Width = 380
      Height = 395
      Columns = <>
    end
  end
  inherited Pnl_Parametros: TUniPanel
    Width = 384
    Height = 73
    ExplicitWidth = 384
    ExplicitHeight = 73
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 384
    ExplicitWidth = 384
  end
  object L_Codigo: TUniLabel [3]
    Left = 3
    Top = 6
    Width = 33
    Height = 14
    Hint = ''
    Caption = 'C'#243'digo'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Name = 'Arial'
    TabOrder = 3
  end
  object L_NameCompany: TUniLabel [4]
    Left = 62
    Top = 6
    Width = 49
    Height = 14
    Hint = ''
    Caption = 'Descri'#231#227'o'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Name = 'Arial'
    TabOrder = 4
  end
  object E_Codigo: TUniEdit [5]
    Left = 3
    Top = 21
    Width = 56
    Hint = ''
    Text = ''
    TabOrder = 5
    ReadOnly = True
  end
  object E_Description: TUniEdit [6]
    Left = 62
    Top = 21
    Width = 311
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    ParentFont = False
    TabOrder = 6
  end
  object chbx_cadAtivo: TUniCheckBox [7]
    Left = 4
    Top = 45
    Width = 136
    Height = 17
    Hint = ''
    Caption = 'Cadastro Ativo'
    TabOrder = 7
  end
end
