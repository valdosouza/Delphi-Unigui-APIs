inherited CadTaxIcmsNr: TCadTaxIcmsNr
  ClientHeight = 125
  ClientWidth = 569
  Caption = 'Situa'#231#227'o Tributaria do CMS'
  ExplicitWidth = 585
  ExplicitHeight = 184
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 61
    Width = 569
    ExplicitTop = 50
    ExplicitWidth = 569
    inherited SB_Save: TUniSpeedButton
      ExplicitTop = 5
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 569
    Height = 61
    ExplicitWidth = 569
    ExplicitHeight = 50
    object E_Group: TUniEdit
      Left = 5
      Top = 21
      Width = 73
      Hint = ''
      Text = ''
      TabOrder = 0
      ReadOnly = True
    end
    object L_NameCompany: TUniLabel
      Left = 80
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
      Left = 80
      Top = 21
      Width = 481
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 1
    end
    object L_Codigo: TUniLabel
      Left = 7
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
  end
  inherited MenuTask: TUniMainMenu
    Left = 16
    Top = 64
  end
end
