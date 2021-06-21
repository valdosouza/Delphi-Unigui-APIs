inherited CadTaxIcmsSN: TCadTaxIcmsSN
  ClientHeight = 115
  ClientWidth = 567
  Caption = 'Situa'#231#227'o Tribut'#225'ria - Icms Simples Nacional'
  ExplicitWidth = 583
  ExplicitHeight = 174
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 51
    Width = 567
    ExplicitTop = 51
    ExplicitWidth = 567
  end
  inherited pnl_fundo: TUniPanel
    Width = 567
    Height = 51
    ExplicitWidth = 567
    ExplicitHeight = 51
    object L_Codigo: TUniLabel
      Left = 7
      Top = 4
      Width = 33
      Height = 14
      Hint = ''
      Caption = 'C'#243'digo'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 1
    end
    object E_Codigo: TUniEdit
      Left = 7
      Top = 19
      Width = 71
      Hint = ''
      Text = ''
      TabOrder = 2
    end
    object L_NameCompany: TUniLabel
      Left = 81
      Top = 4
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
      Left = 81
      Top = 19
      Width = 481
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 4
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 0
    Top = 136
  end
end
