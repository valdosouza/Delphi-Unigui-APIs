inherited TasOrderBudgetItemPiRt: TTasOrderBudgetItemPiRt
  ClientHeight = 223
  ClientWidth = 739
  Caption = 'TasOrderBudgetItemPiRt'
  ExplicitWidth = 755
  ExplicitHeight = 282
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 159
    Width = 739
    ExplicitTop = 159
    ExplicitWidth = 739
    inherited SB_Insert: TUniSpeedButton
      Left = 191
      Visible = False
      ExplicitLeft = 286
    end
    inherited SB_Change: TUniSpeedButton
      Left = 470
      Visible = False
      ExplicitLeft = 470
    end
    inherited SB_Delete: TUniSpeedButton
      Left = 282
      Visible = False
      ExplicitLeft = 377
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
      Left = 375
      Visible = False
      ExplicitLeft = 375
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 739
    Height = 159
    ExplicitWidth = 739
    ExplicitHeight = 159
    object Ctn_Broadcaster: TUniContainerPanel
      Left = 6
      Top = 8
      Width = 365
      Height = 38
      Hint = ''
      RTL = True
      ParentRTL = False
      ParentColor = False
      TabOrder = 1
    end
    object Ctn_Med_Pos_Prog: TUniContainerPanel
      Left = 373
      Top = 8
      Width = 361
      Height = 38
      Hint = ''
      ParentColor = False
      TabOrder = 2
    end
    object UniGroupBox1: TUniGroupBox
      Left = 6
      Top = 92
      Width = 419
      Height = 61
      Hint = ''
      Visible = False
      Caption = ''
      TabOrder = 3
      object UniEdit9: TUniEdit
        Left = 5
        Top = 26
        Width = 100
        Hint = ''
        Text = ''
        TabOrder = 1
      end
      object UniLabel11: TUniLabel
        Left = 5
        Top = 11
        Width = 61
        Height = 13
        Hint = ''
        Caption = 'Tabela Bruto'
        TabOrder = 2
      end
      object UniEdit10: TUniEdit
        Left = 107
        Top = 26
        Width = 100
        Hint = ''
        Text = ''
        TabOrder = 3
      end
      object UniLabel12: TUniLabel
        Left = 107
        Top = 11
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'Desconto'
        TabOrder = 4
      end
      object UniEdit11: TUniEdit
        Left = 209
        Top = 26
        Width = 100
        Hint = ''
        Text = ''
        TabOrder = 5
      end
      object UniLabel13: TUniLabel
        Left = 209
        Top = 11
        Width = 90
        Height = 13
        Hint = ''
        Caption = 'Unit'#225'rio Negociado'
        TabOrder = 6
      end
      object UniEdit12: TUniEdit
        Left = 311
        Top = 26
        Width = 100
        Hint = ''
        Text = ''
        TabOrder = 7
      end
      object UniLabel14: TUniLabel
        Left = 311
        Top = 11
        Width = 51
        Height = 13
        Hint = ''
        Caption = 'Valor Total'
        TabOrder = 8
      end
    end
  end
  object UniLabel6: TUniLabel [2]
    Left = 6
    Top = 49
    Width = 89
    Height = 13
    Hint = ''
    Caption = 'Selecione o Tempo'
    TabOrder = 2
  end
  object Cb_tm_duration: TUniComboBox [3]
    Left = 6
    Top = 64
    Width = 108
    Hint = ''
    Style = csDropDownList
    Text = 'SPOT 15'#39
    Items.Strings = (
      'SPOT 15'#39
      'SPOT 30'#39
      'SPOT 45'#39
      'SPOT 60'#39)
    ItemIndex = 0
    TabOrder = 3
    IconItems = <>
  end
  object UniLabel5: TUniLabel [4]
    Left = 117
    Top = 49
    Width = 61
    Height = 13
    Hint = ''
    Caption = 'Testemunhal'
    TabOrder = 4
  end
  object Cb_testimonial: TUniComboBox [5]
    Left = 117
    Top = 64
    Width = 108
    Hint = ''
    Style = csDropDownList
    Text = 'SIM'
    Items.Strings = (
      'SIM'
      'N'#195'O')
    ItemIndex = 0
    TabOrder = 5
    IconItems = <>
  end
  object UniLabel1: TUniLabel [6]
    Left = 228
    Top = 49
    Width = 66
    Height = 13
    Hint = ''
    Caption = '%Testmunhal'
    TabOrder = 6
  end
  object E_increase_testemonial: TUniEdit [7]
    Left = 228
    Top = 64
    Width = 76
    Hint = ''
    Text = ''
    TabOrder = 7
  end
  inherited MenuTask: TUniMainMenu
    Left = 440
    Top = 56
  end
end
