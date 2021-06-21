inherited CadBrand: TCadBrand
  ClientHeight = 136
  ClientWidth = 571
  Caption = 'Cadastro de Marcas'
  ExplicitWidth = 587
  ExplicitHeight = 195
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 72
    Width = 571
    ExplicitTop = 72
    ExplicitWidth = 571
  end
  inherited pnl_fundo: TUniPanel
    Width = 571
    Height = 72
    ExplicitWidth = 571
    ExplicitHeight = 72
    object L_Codigo: TUniLabel
      Left = 3
      Top = 6
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
    object L_NameCompany: TUniLabel
      Left = 62
      Top = 6
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
    object E_Description: TUniEdit
      Left = 62
      Top = 21
      Width = 500
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 1
    end
    object E_ID: TUniEdit
      Left = 3
      Top = 21
      Width = 56
      Hint = ''
      Text = ''
      TabOrder = 0
      ReadOnly = True
    end
  end
  object chbx_cad_active: TUniCheckBox [2]
    Left = 4
    Top = 45
    Width = 136
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Cadastro Ativo'
    TabOrder = 2
  end
  inherited MenuTask: TUniMainMenu
    Left = 472
    Top = 48
  end
end
