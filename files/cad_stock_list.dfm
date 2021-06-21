inherited CadStockList: TCadStockList
  ClientHeight = 142
  ClientWidth = 568
  Caption = 'Cadastro de lista de Estoque'
  ExplicitWidth = 584
  ExplicitHeight = 201
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 78
    Width = 568
    TabOrder = 2
    ExplicitTop = 67
    ExplicitWidth = 568
  end
  inherited pnl_fundo: TUniPanel
    Width = 568
    Height = 78
    TabOrder = 3
    ExplicitWidth = 568
    ExplicitHeight = 67
    object chbx_kind: TUniCheckBox
      Left = 7
      Top = 45
      Width = 136
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Estoque Principal'
      TabOrder = 1
    end
  end
  object L_Codigo: TUniLabel [2]
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
    TabOrder = 4
  end
  object L_NameCompany: TUniLabel [3]
    Left = 64
    Top = 6
    Width = 27
    Height = 14
    Hint = ''
    Caption = 'Nome'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Name = 'Arial'
    TabOrder = 5
  end
  object E_ID: TUniEdit [4]
    Left = 6
    Top = 21
    Width = 56
    Hint = ''
    Text = ''
    TabOrder = 0
    ReadOnly = True
  end
  object E_Description: TUniEdit [5]
    Left = 64
    Top = 21
    Width = 498
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    ParentFont = False
    TabOrder = 1
  end
  inherited MenuTask: TUniMainMenu
    Left = 176
  end
end
