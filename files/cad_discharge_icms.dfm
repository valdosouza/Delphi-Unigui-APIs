inherited CadDischargeIcms: TCadDischargeIcms
  ClientHeight = 124
  ClientWidth = 567
  Caption = 'Cadastro Desonera'#231#227'o Icms'
  ExplicitWidth = 583
  ExplicitHeight = 183
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 60
    Width = 567
    ExplicitTop = 49
    ExplicitWidth = 567
    inherited SB_Save: TUniSpeedButton
      ExplicitTop = 5
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 567
    Height = 60
    ExplicitWidth = 567
    ExplicitHeight = 49
    object E_Group: TUniEdit
      Left = 5
      Top = 21
      Width = 73
      Hint = ''
      Text = ''
      TabOrder = 1
      ReadOnly = True
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
      TabOrder = 2
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
      TabOrder = 4
    end
  end
  inherited MenuTask: TUniMainMenu
    Top = 56
  end
end
