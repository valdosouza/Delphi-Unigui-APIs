inherited CadPaymentTypes: TCadPaymentTypes
  ClientHeight = 141
  ClientWidth = 568
  Caption = 'Cadastro de Formas de Pagamento'
  ExplicitWidth = 584
  ExplicitHeight = 200
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 77
    Width = 568
    ExplicitTop = 66
    ExplicitWidth = 568
  end
  inherited pnl_fundo: TUniPanel
    Width = 568
    Height = 77
    ExplicitWidth = 568
    ExplicitHeight = 66
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
      TabOrder = 4
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
      TabOrder = 5
    end
    object E_Description: TUniEdit
      Left = 64
      Top = 21
      Width = 498
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
    Top = 80
  end
end
