inherited CadExtTester: TCadExtTester
  ClientHeight = 132
  ClientWidth = 567
  Caption = 'Cadastro de Ensaiador'
  ExplicitWidth = 583
  ExplicitHeight = 191
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 68
    Width = 567
    ExplicitTop = 68
    ExplicitWidth = 567
  end
  inherited pnl_fundo: TUniPanel
    Width = 567
    Height = 68
    ExplicitWidth = 567
    ExplicitHeight = 68
    object UniLabel1: TUniLabel
      Left = 4
      Top = 5
      Width = 92
      Height = 13
      Hint = ''
      Caption = 'Nome do Ensaiador'
      TabOrder = 1
    end
    object E_name_company: TUniEdit
      Left = 4
      Top = 20
      Width = 558
      Hint = ''
      Text = ''
      TabOrder = 2
    end
    object chbx_cad_active: TUniCheckBox
      Left = 4
      Top = 45
      Width = 136
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Cadastro Ativo'
      TabOrder = 3
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 16
    Top = 64
  end
end
