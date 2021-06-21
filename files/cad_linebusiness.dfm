inherited CadLinebusiness: TCadLinebusiness
  ClientHeight = 136
  ClientWidth = 567
  Caption = 'Cadastro de Ramos de Atividade'
  ExplicitWidth = 583
  ExplicitHeight = 195
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 72
    Width = 567
    ExplicitTop = 61
    ExplicitWidth = 567
  end
  inherited pnl_fundo: TUniPanel
    Width = 567
    Height = 72
    ExplicitWidth = 567
    ExplicitHeight = 61
    object L_descricao: TUniLabel
      Left = 51
      Top = 2
      Width = 156
      Height = 14
      Hint = ''
      Caption = 'Descri'#231#227'o do Ramo de Atividade'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 4
    end
    object L_Codigo: TUniLabel
      Left = 3
      Top = 2
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
    object E_Description: TUniEdit
      Left = 51
      Top = 17
      Width = 511
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 1
    end
    object E_ID: TUniEdit
      Left = 3
      Top = 17
      Width = 46
      Hint = ''
      Text = ''
      TabOrder = 0
      TabStop = False
      ReadOnly = True
    end
    object chbx_cad_active: TUniCheckBox
      Left = 3
      Top = 42
      Width = 136
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Cadastro Ativo'
      TabOrder = 3
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 40
    Top = 80
  end
end
