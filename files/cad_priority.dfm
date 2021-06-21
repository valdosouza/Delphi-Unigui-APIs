inherited CadPriority: TCadPriority
  Caption = 'Cadastro de Prioridades'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_fundo: TUniPanel
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
      TabOrder = 1
    end
    object E_ID: TUniEdit
      Left = 6
      Top = 21
      Width = 56
      Hint = ''
      Text = ''
      TabOrder = 2
      ReadOnly = True
    end
    object L_Description: TUniLabel
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
      TabOrder = 3
    end
    object E_Description: TUniEdit
      Left = 64
      Top = 21
      Width = 440
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 4
    end
  end
end
