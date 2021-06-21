inherited BaseRegistry1: TBaseRegistry1
  ClientHeight = 127
  ClientWidth = 605
  Caption = 'BaseRegistry1'
  ExplicitWidth = 621
  ExplicitHeight = 186
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniSimplePanel
    Top = 63
    Width = 605
    ExplicitTop = 63
    ExplicitWidth = 605
  end
  inherited pnl_fundo: TUniSimplePanel
    Width = 605
    Height = 63
    ExplicitWidth = 605
    ExplicitHeight = 63
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
    object E_ID: TUniEdit
      Left = 3
      Top = 21
      Width = 56
      Hint = ''
      Text = ''
      TabOrder = 2
      ReadOnly = True
    end
    object chbx_cad_active: TUniCheckBox
      Left = 4
      Top = 45
      Width = 136
      Height = 17
      Hint = ''
      Caption = 'Cadastro Ativo'
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
      TabOrder = 5
    end
  end
end
