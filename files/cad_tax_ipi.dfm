inherited cadTaxIpi: TcadTaxIpi
  ClientHeight = 126
  ClientWidth = 567
  Caption = 'Cadastro de Situa'#231#227'o Tributaria Ipi'
  ExplicitWidth = 583
  ExplicitHeight = 185
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 62
    Width = 567
    ExplicitTop = 48
    ExplicitWidth = 567
    inherited SB_Save: TUniSpeedButton
      ExplicitTop = 5
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 567
    Height = 62
    ExplicitWidth = 567
    ExplicitHeight = 48
    object E_Group: TUniEdit
      Left = 6
      Top = 21
      Width = 56
      Hint = ''
      Text = ''
      TabOrder = 0
      ReadOnly = True
    end
    object L_NameCompany: TUniLabel
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
      TabOrder = 3
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
    TabOrder = 2
  end
  inherited MenuTask: TUniMainMenu
    Top = 88
  end
end
