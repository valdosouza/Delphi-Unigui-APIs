inherited CadKind: TCadKind
  ClientHeight = 273
  Caption = 'Cadastro de Tipos'
  ExplicitHeight = 332
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 209
    ExplicitTop = 209
  end
  inherited pnl_fundo: TUniPanel
    Height = 209
    ExplicitHeight = 209
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
      TabOrder = 1
    end
    object E_ID: TUniEdit
      Left = 6
      Top = 21
      Width = 56
      Hint = ''
      Text = ''
      TabOrder = 2
      ReadOnly = True
    end
    object L_Description: TUniLabel
      Left = 64
      Top = 6
      Width = 49
      Height = 14
      Hint = ''
      Caption = 'Descri'#231#227'o'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 3
    end
    object E_Description: TUniEdit
      Left = 64
      Top = 21
      Width = 498
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 4
    end
    object M_Detail: TUniMemo
      Left = 6
      Top = 64
      Width = 556
      Height = 99
      Hint = ''
      RTL = True
      ParentRTL = False
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 5
    end
    object UniLabel2: TUniLabel
      Left = 10
      Top = 169
      Width = 28
      Height = 13
      Hint = ''
      Caption = 'Custo'
      TabOrder = 6
    end
    object Cb_Custo: TUniComboBox
      Left = 7
      Top = 182
      Width = 145
      Hint = ''
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        'Setes'
        'Cliente')
      TabOrder = 7
      IconItems = <>
    end
  end
  object UniLabel1: TUniLabel [2]
    Left = 6
    Top = 44
    Width = 36
    Height = 14
    Hint = ''
    Caption = 'Detalhe'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Name = 'Arial'
    TabOrder = 2
  end
  inherited cds_msg: TClientDataSet
    Left = 656
  end
  inherited ds_msg: TDataSource
    Left = 656
  end
  inherited MenuTask: TUniMainMenu
    Left = 656
  end
end
