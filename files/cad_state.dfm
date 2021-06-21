inherited CadState: TCadState
  ClientHeight = 121
  ClientWidth = 567
  Caption = 'Cadastros de Estados'
  ExplicitWidth = 583
  ExplicitHeight = 180
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 57
    Width = 567
    ExplicitTop = 49
    ExplicitWidth = 567
    inherited SB_Save: TUniSpeedButton
      ExplicitTop = 5
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 567
    Height = 57
    ExplicitWidth = 567
    ExplicitHeight = 49
    object L_Descricao: TUniLabel
      Left = 259
      Top = 1
      Width = 100
      Height = 14
      Hint = ''
      Caption = 'Descri'#231#227'o do Estado'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 5
    end
    object L_Codigo: TUniLabel
      Left = 164
      Top = 2
      Width = 33
      Height = 14
      Hint = ''
      Caption = 'C'#243'digo'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 6
    end
    object E_Description: TUniEdit
      Left = 259
      Top = 17
      Width = 303
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 3
    end
    object E_ID: TUniEdit
      Left = 165
      Top = 17
      Width = 46
      Hint = ''
      Text = ''
      TabOrder = 1
    end
    object ctn_country: TUniContainerPanel
      Left = 0
      Top = 3
      Width = 163
      Height = 38
      Hint = ''
      ParentColor = False
      TabOrder = 0
    end
    object L_Sigla: TUniLabel
      Left = 213
      Top = 1
      Width = 23
      Height = 14
      Hint = ''
      Caption = 'Sigla'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 7
    end
    object E_sigla: TUniEdit
      Left = 212
      Top = 17
      Width = 46
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 2
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 40
    Top = 40
  end
end
