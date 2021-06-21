inherited TasOrderBudgetItemPiJr: TTasOrderBudgetItemPiJr
  ClientHeight = 217
  ClientWidth = 728
  Caption = 'Itens do Or'#231'amento Jornal e Revista'
  ExplicitWidth = 744
  ExplicitHeight = 276
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 153
    Width = 728
    ExplicitTop = 153
    ExplicitWidth = 728
    inherited SB_Insert: TUniSpeedButton
      Left = 191
      Visible = False
      ExplicitLeft = 191
    end
    inherited SB_Change: TUniSpeedButton
      Left = 282
      Visible = False
      ExplicitLeft = 282
    end
    inherited SB_Delete: TUniSpeedButton
      Left = 373
      Visible = False
      ExplicitLeft = 373
    end
    inherited SB_Save: TUniSpeedButton
      Left = 2
      ExplicitLeft = 2
    end
    inherited SB_Cancel: TUniSpeedButton
      Left = 95
      ExplicitLeft = 95
    end
    inherited Sb_Close: TUniSpeedButton
      Visible = False
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 728
    Height = 153
    ExplicitWidth = 728
    ExplicitHeight = 153
    object Ctn_Brodcaster: TUniContainerPanel
      Left = 6
      Top = 5
      Width = 355
      Height = 39
      Hint = ''
      RTL = True
      ParentRTL = False
      ParentColor = False
      TabOrder = 1
    end
    object Ctn_Med_Pos_Prog: TUniContainerPanel
      Left = 364
      Top = 5
      Width = 355
      Height = 39
      Hint = ''
      RTL = True
      ParentRTL = False
      ParentColor = False
      TabOrder = 2
    end
    object UniLabel11: TUniLabel
      Left = 190
      Top = 45
      Width = 61
      Height = 13
      Hint = ''
      Caption = '%Impress'#227'o'
      TabOrder = 3
    end
    object E_impress: TUniEdit
      Left = 190
      Top = 61
      Width = 93
      Hint = ''
      Text = ''
      TabOrder = 4
    end
    object UniLabel5: TUniLabel
      Left = 92
      Top = 45
      Width = 88
      Height = 13
      Hint = ''
      Caption = 'Tipo de Impress'#227'o'
      TabOrder = 5
    end
    object Cb_Color: TUniComboBox
      Left = 92
      Top = 61
      Width = 95
      Hint = ''
      Style = csDropDownList
      Text = 'COR'
      Items.Strings = (
        'COR'
        'P&B')
      ItemIndex = 0
      TabOrder = 6
      IconItems = <>
    end
    object UniLabel6: TUniLabel
      Left = 6
      Top = 45
      Width = 72
      Height = 13
      Hint = ''
      Caption = 'Selecione o Dia'
      TabOrder = 7
    end
    object Cb_Day: TUniComboBox
      Left = 6
      Top = 61
      Width = 83
      Hint = ''
      Style = csDropDownList
      Text = 'UTIL'
      Items.Strings = (
        'UTIL'
        'DOM')
      ItemIndex = 0
      TabOrder = 8
      IconItems = <>
    end
    object l_table_value: TUniLabel
      Left = 285
      Top = 45
      Width = 74
      Height = 13
      Hint = ''
      Caption = 'Valor da Tabela'
      TabOrder = 9
    end
    object E_table_value: TUniEdit
      Left = 285
      Top = 61
      Width = 96
      Hint = ''
      Text = ''
      TabOrder = 10
    end
    object UniLabel8: TUniLabel
      Left = 383
      Top = 45
      Width = 77
      Height = 13
      Hint = ''
      Caption = 'Valor Negociado'
      TabOrder = 11
    end
    object E_Negotiaded: TUniEdit
      Left = 383
      Top = 61
      Width = 92
      Hint = ''
      Text = ''
      TabOrder = 12
    end
    object UniLabel15: TUniLabel
      Left = 477
      Top = 46
      Width = 33
      Height = 13
      Hint = ''
      Caption = 'Coluna'
      TabOrder = 13
    end
    object E_nr_column: TUniEdit
      Left = 477
      Top = 61
      Width = 49
      Hint = ''
      Text = ''
      TabOrder = 14
    end
    object UniLabel16: TUniLabel
      Left = 528
      Top = 46
      Width = 29
      Height = 13
      Hint = ''
      Caption = 'Altura'
      TabOrder = 15
    end
    object E_nr_height: TUniEdit
      Left = 528
      Top = 61
      Width = 49
      Hint = ''
      Text = ''
      TabOrder = 16
    end
    object UniLabel14: TUniLabel
      Left = 579
      Top = 46
      Width = 76
      Height = 13
      Hint = ''
      Caption = 'CM/COL Negoc.'
      TabOrder = 17
    end
    object E_unit_value: TUniEdit
      Left = 579
      Top = 61
      Width = 80
      Hint = ''
      Text = ''
      TabOrder = 18
    end
    object UniLabel18: TUniLabel
      Left = 661
      Top = 46
      Width = 47
      Height = 13
      Hint = ''
      Caption = 'Inser'#231#245'es'
      TabOrder = 19
    end
    object E_insertion: TUniEdit
      Left = 661
      Top = 61
      Width = 58
      Hint = ''
      Text = ''
      TabOrder = 20
    end
    object UniGroupBox2: TUniGroupBox
      Left = 312
      Top = 91
      Width = 407
      Height = 56
      Hint = ''
      Caption = ''
      TabOrder = 21
      object UniLabel2: TUniLabel
        Left = 3
        Top = 18
        Width = 61
        Height = 13
        Hint = ''
        Caption = 'Tabela Bruto'
        TabOrder = 1
      end
      object E_table_brut: TUniEdit
        Left = 5
        Top = 34
        Width = 95
        Hint = ''
        Text = ''
        TabOrder = 2
      end
      object E_Util_neg: TUniEdit
        Left = 201
        Top = 34
        Width = 95
        Hint = ''
        Text = ''
        TabOrder = 3
      end
      object UniLabel7: TUniLabel
        Left = 201
        Top = 18
        Width = 90
        Height = 13
        Hint = ''
        Caption = 'Unit'#225'rio Negociado'
        TabOrder = 4
      end
      object UniLabel3: TUniLabel
        Left = 299
        Top = 18
        Width = 51
        Height = 13
        Hint = ''
        Caption = 'Valor Total'
        TabOrder = 5
      end
      object E_vl_total: TUniEdit
        Left = 299
        Top = 34
        Width = 96
        Hint = ''
        Text = ''
        TabOrder = 6
      end
      object UniLabel1: TUniLabel
        Left = 106
        Top = 18
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'Desconto'
        TabOrder = 7
      end
      object E_aliq_desc: TUniEdit
        Left = 103
        Top = 34
        Width = 95
        Hint = ''
        Text = ''
        TabOrder = 8
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 640
    Top = 296
  end
end
