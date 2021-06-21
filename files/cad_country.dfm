inherited CadCountry: TCadCountry
  ClientHeight = 120
  ClientWidth = 569
  Caption = 'Cadastro de Paises'
  ExplicitWidth = 585
  ExplicitHeight = 179
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 56
    Width = 569
    ExplicitTop = 45
    ExplicitWidth = 569
    inherited SB_Save: TUniSpeedButton
      ExplicitTop = 5
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 569
    Height = 56
    ExplicitWidth = 569
    ExplicitHeight = 45
    object L_Descricao: TUniLabel
      Left = 51
      Top = 1
      Width = 87
      Height = 14
      Hint = ''
      Caption = 'Descri'#231#227'o do Pa'#237's'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 3
    end
    object L_Codigo: TUniLabel
      Left = 3
      Top = 1
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
    object E_Description: TUniEdit
      Left = 51
      Top = 17
      Width = 511
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 1
    end
    object E_ID: TUniEdit
      Left = 3
      Top = 17
      Width = 46
      Hint = ''
      Text = ''
      TabOrder = 0
    end
  end
  inherited MenuTask: TUniMainMenu
    Top = 32
  end
end
