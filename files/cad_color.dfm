inherited CadColor: TCadColor
  ClientHeight = 141
  ClientWidth = 574
  Caption = 'Cadastro de Cores'
  ExplicitWidth = 590
  ExplicitHeight = 200
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 77
    Width = 574
    ExplicitTop = 66
    ExplicitWidth = 574
  end
  inherited pnl_fundo: TUniPanel
    Width = 574
    Height = 77
    ExplicitWidth = 574
    ExplicitHeight = 66
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
      TabOrder = 4
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
      TabOrder = 5
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
    object chbx_cad_active: TUniCheckBox
      Left = 4
      Top = 45
      Width = 136
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Cadastro Ativo'
      TabOrder = 2
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 24
  end
end
