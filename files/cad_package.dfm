inherited CadPackage: TCadPackage
  ClientHeight = 140
  ClientWidth = 567
  Caption = 'Cadastro de Embalagem'
  ExplicitWidth = 583
  ExplicitHeight = 199
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 76
    Width = 567
    ExplicitTop = 65
    ExplicitWidth = 567
  end
  inherited pnl_fundo: TUniPanel
    Width = 567
    Height = 76
    ExplicitWidth = 567
    ExplicitHeight = 65
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
      TabOrder = 5
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
      TabOrder = 6
    end
    object E_Description: TUniEdit
      Left = 64
      Top = 21
      Width = 430
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 1
    end
    object E_ID: TUniEdit
      Left = 6
      Top = 21
      Width = 56
      Hint = ''
      Text = ''
      TabOrder = 0
      ReadOnly = True
    end
    object chbx_cad_active: TUniCheckBox
      Left = 6
      Top = 44
      Width = 136
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Cadastro Ativo'
      TabOrder = 3
    end
    object UniLabel1: TUniLabel
      Left = 496
      Top = 6
      Width = 57
      Height = 14
      Hint = ''
      Caption = 'Abreviatura'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 7
    end
    object E_Abbreviation: TUniEdit
      Left = 496
      Top = 21
      Width = 66
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 2
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 24
    Top = 80
  end
end
