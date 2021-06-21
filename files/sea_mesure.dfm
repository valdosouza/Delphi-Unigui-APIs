inherited SeaMeasure: TSeaMeasure
  ClientWidth = 591
  Caption = 'Pesquisa de Medidas'
  ExplicitWidth = 607
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Top = 73
    Width = 591
    Height = 399
    ExplicitTop = 73
    ExplicitWidth = 591
    ExplicitHeight = 399
    inherited Grd_Search: TUniDBGrid
      Width = 587
      Height = 395
      Columns = <>
    end
  end
  inherited Pnl_Parametros: TUniPanel
    Width = 591
    Height = 73
    ExplicitWidth = 591
    ExplicitHeight = 73
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 591
    ExplicitWidth = 591
  end
  object L_Codigo: TUniLabel [3]
    Left = 8
    Top = 8
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
    Left = 67
    Top = 8
    Width = 27
    Height = 14
    Hint = ''
    Caption = 'Nome'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Name = 'Arial'
    TabOrder = 4
  end
  object E_Description: TUniEdit [5]
    Left = 67
    Top = 23
    Width = 435
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    ParentFont = False
    TabOrder = 5
  end
  object E_Codigo: TUniEdit [6]
    Left = 8
    Top = 23
    Width = 56
    Hint = ''
    Text = ''
    TabOrder = 6
    ReadOnly = True
  end
  object chbx_cadAtivo: TUniCheckBox [7]
    Left = 9
    Top = 47
    Width = 136
    Height = 17
    Hint = ''
    Caption = 'Cadastro Ativo'
    TabOrder = 7
  end
  object UniLabel1: TUniLabel [8]
    Left = 508
    Top = 8
    Width = 57
    Height = 14
    Hint = ''
    Caption = 'Abreviatura'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Name = 'Arial'
    TabOrder = 8
  end
  object E_Abbreviation: TUniEdit [9]
    Left = 508
    Top = 23
    Width = 63
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    TabOrder = 9
  end
end
