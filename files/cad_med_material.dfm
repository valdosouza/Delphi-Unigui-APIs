inherited CadMedMaterial: TCadMedMaterial
  ClientHeight = 146
  ClientWidth = 567
  Caption = 'Cadastro de Material'
  ExplicitWidth = 583
  ExplicitHeight = 205
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 82
    Width = 567
    ExplicitTop = 67
    ExplicitWidth = 567
  end
  inherited pnl_fundo: TUniPanel
    Width = 567
    Height = 82
    ExplicitWidth = 567
    ExplicitHeight = 67
    object L_Codigo: TUniLabel
      Left = 6
      Top = 7
      Width = 33
      Height = 13
      Hint = ''
      Caption = 'Codigo'
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
    object L_Descricao: TUniLabel
      Left = 61
      Top = 7
      Width = 46
      Height = 13
      Hint = ''
      Caption = 'Descri'#231#227'o'
      TabOrder = 6
    end
    object E_Description: TUniEdit
      Left = 61
      Top = 21
      Width = 355
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 1
    end
    object chbx_cad_active: TUniCheckBox
      Left = 6
      Top = 46
      Width = 90
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Cadastro Ativo'
      TabOrder = 3
    end
    object Cb_destiny: TUniComboBox
      Left = 419
      Top = 21
      Width = 137
      Hint = ''
      ParentShowHint = False
      Style = csDropDownList
      Text = 'Jornais e Revistas'
      Items.Strings = (
        'Jornais e Revistas'
        'R'#225'dios e TV'#39's')
      ItemIndex = 0
      TabOrder = 2
      IconItems = <>
    end
    object UniLabel1: TUniLabel
      Left = 418
      Top = 7
      Width = 45
      Height = 13
      Hint = ''
      Caption = 'Aplica'#231#227'o'
      TabOrder = 7
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 584
    Top = 64
  end
end
