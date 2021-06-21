inherited CadMedPosProg: TCadMedPosProg
  ClientHeight = 143
  ClientWidth = 566
  Caption = 'Cadastro de Posi'#231#227'o Programa'#231#227'o de Pe'#231'as'
  ExplicitWidth = 582
  ExplicitHeight = 202
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 79
    Width = 566
    ExplicitTop = 66
    ExplicitWidth = 566
    object UniLabel1: TUniLabel
      Left = 528
      Top = -96
      Width = 46
      Height = 13
      Hint = ''
      Caption = 'UniLabel1'
      TabOrder = 7
    end
    object UniLabel2: TUniLabel
      Left = 464
      Top = -112
      Width = 46
      Height = 13
      Hint = ''
      Caption = 'UniLabel2'
      TabOrder = 8
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 566
    Height = 79
    ExplicitWidth = 566
    ExplicitHeight = 66
    object L_Codigo: TUniLabel
      Left = 6
      Top = 7
      Width = 33
      Height = 13
      Hint = ''
      Caption = 'Codigo'
      TabOrder = 3
    end
    object L_Descricao: TUniLabel
      Left = 61
      Top = 7
      Width = 46
      Height = 13
      Hint = ''
      Caption = 'Descri'#231#227'o'
      TabOrder = 4
    end
    object UniLabel5: TUniLabel
      Left = 395
      Top = 92
      Width = 3
      Height = 13
      Hint = ''
      Caption = ''
      TabOrder = 5
    end
    object E_ID: TUniEdit
      Left = 6
      Top = 21
      Width = 53
      Hint = ''
      Text = ''
      TabOrder = 0
      ReadOnly = True
    end
    object E_Description: TUniEdit
      Left = 61
      Top = 21
      Width = 501
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 1
    end
  end
  object chbx_cad_active: TUniCheckBox [2]
    Left = 6
    Top = 46
    Width = 90
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Cadastro Ativo'
    TabOrder = 2
  end
  inherited MenuTask: TUniMainMenu
    Left = 0
    Top = 112
  end
end
