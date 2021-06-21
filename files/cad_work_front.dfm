inherited CadWorkFront: TCadWorkFront
  ClientHeight = 141
  ClientWidth = 569
  Caption = 'Cadastro de Frentes de Trabalho'
  ExplicitWidth = 585
  ExplicitHeight = 200
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 77
    Width = 569
    ExplicitTop = 72
    ExplicitWidth = 569
  end
  inherited pnl_fundo: TUniPanel
    Width = 569
    Height = 77
    ExplicitWidth = 569
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
      TabOrder = 1
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
      TabOrder = 2
    end
    object E_Description: TUniEdit
      Left = 62
      Top = 21
      Width = 500
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 3
    end
    object E_ID: TUniEdit
      Left = 3
      Top = 21
      Width = 56
      Hint = ''
      Text = ''
      TabOrder = 4
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
      TabOrder = 5
    end
  end
end
