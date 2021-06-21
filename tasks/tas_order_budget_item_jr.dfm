inherited TasOrderBudgetItemJr: TTasOrderBudgetItemJr
  ClientHeight = 225
  ClientWidth = 741
  Caption = 'TasOrderBudgetItemJr'
  ExplicitWidth = 757
  ExplicitHeight = 284
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 161
    Width = 741
    ExplicitTop = 161
    ExplicitWidth = 741
  end
  inherited pnl_fundo: TUniPanel
    Width = 741
    Height = 161
    ExplicitWidth = 741
    ExplicitHeight = 161
    object Ctn_Broadcaster: TUniContainerPanel
      Left = 6
      Top = 9
      Width = 365
      Height = 38
      Hint = ''
      RTL = True
      ParentRTL = False
      ParentColor = False
      TabOrder = 1
    end
    object Ctn_Med_Pos_Prog: TUniContainerPanel
      Left = 374
      Top = 9
      Width = 361
      Height = 38
      Hint = ''
      RTL = True
      ParentRTL = False
      ParentColor = False
      TabOrder = 2
    end
    object UniComboBox1: TUniComboBox
      Left = 6
      Top = 69
      Width = 72
      Hint = ''
      Text = ''
      Items.Strings = (
        'UTIL'
        'DOM')
      ItemIndex = 0
      TabOrder = 3
      ForceSelection = False
    end
    object UniLabel1: TUniLabel
      Left = 6
      Top = 53
      Width = 72
      Height = 13
      Hint = ''
      Caption = 'Selecione o Dia'
      TabOrder = 4
    end
    object UniComboBox2: TUniComboBox
      Left = 80
      Top = 69
      Width = 88
      Hint = ''
      Text = ''
      Items.Strings = (
        'COR'
        'P&B')
      ItemIndex = 0
      TabOrder = 5
      ForceSelection = False
    end
    object UniLabel2: TUniLabel
      Left = 80
      Top = 53
      Width = 88
      Height = 13
      Hint = ''
      Caption = 'Tipo de Impress'#227'o'
      TabOrder = 6
    end
    object UniEdit1: TUniEdit
      Left = 507
      Top = 69
      Width = 41
      Hint = ''
      Text = ''
      TabOrder = 7
    end
    object UniEdit2: TUniEdit
      Left = 674
      Top = 69
      Width = 61
      Hint = ''
      Text = ''
      TabOrder = 8
    end
    object UniEdit3: TUniEdit
      Left = 593
      Top = 69
      Width = 79
      Hint = ''
      Text = ''
      TabOrder = 9
    end
    object UniEdit4: TUniEdit
      Left = 550
      Top = 69
      Width = 41
      Hint = ''
      Text = ''
      TabOrder = 10
    end
    object UniLabel3: TUniLabel
      Left = 507
      Top = 53
      Width = 33
      Height = 13
      Hint = ''
      Caption = 'Coluna'
      TabOrder = 11
    end
    object UniLabel4: TUniLabel
      Left = 550
      Top = 53
      Width = 29
      Height = 13
      Hint = ''
      Caption = 'Altura'
      TabOrder = 12
    end
    object UniLabel5: TUniLabel
      Left = 170
      Top = 53
      Width = 64
      Height = 13
      Hint = ''
      Caption = '% Impress'#227'o'
      TabOrder = 13
    end
    object UniLabel6: TUniLabel
      Left = 593
      Top = 53
      Width = 66
      Height = 13
      Hint = ''
      Caption = 'Total CM/COL'
      TabOrder = 14
    end
    object UniLabel7: TUniLabel
      Left = 674
      Top = 53
      Width = 47
      Height = 13
      Hint = ''
      Caption = 'Inser'#231#245'es'
      TabOrder = 15
    end
    object UniEdit5: TUniEdit
      Left = 170
      Top = 69
      Width = 64
      Hint = ''
      Text = ''
      TabOrder = 16
    end
    object UniEdit6: TUniEdit
      Left = 236
      Top = 69
      Width = 88
      Hint = ''
      Text = ''
      TabOrder = 17
    end
    object UniEdit7: TUniEdit
      Left = 408
      Top = 69
      Width = 97
      Hint = ''
      Text = ''
      TabOrder = 18
    end
    object UniEdit8: TUniEdit
      Left = 326
      Top = 69
      Width = 80
      Hint = ''
      Text = ''
      TabOrder = 19
    end
    object UniLabel8: TUniLabel
      Left = 236
      Top = 53
      Width = 74
      Height = 13
      Hint = ''
      Caption = 'Valor da Tabela'
      TabOrder = 20
    end
    object UniLabel9: TUniLabel
      Left = 326
      Top = 53
      Width = 45
      Height = 13
      Hint = ''
      Caption = 'Desconto'
      TabOrder = 21
    end
    object UniLabel10: TUniLabel
      Left = 408
      Top = 53
      Width = 77
      Height = 13
      Hint = ''
      Caption = 'Valor Negociado'
      TabOrder = 22
    end
    object UniGroupBox1: TUniGroupBox
      Left = 6
      Top = 95
      Width = 419
      Height = 58
      Hint = ''
      Caption = ''
      TabOrder = 23
      object UniEdit9: TUniEdit
        Left = 5
        Top = 20
        Width = 100
        Hint = ''
        Text = ''
        TabOrder = 1
      end
      object UniLabel11: TUniLabel
        Left = 5
        Top = 5
        Width = 61
        Height = 13
        Hint = ''
        Caption = 'Tabela Bruto'
        TabOrder = 2
      end
      object UniEdit10: TUniEdit
        Left = 107
        Top = 20
        Width = 100
        Hint = ''
        Text = ''
        TabOrder = 3
      end
      object UniLabel12: TUniLabel
        Left = 107
        Top = 5
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'Desconto'
        TabOrder = 4
      end
      object UniEdit11: TUniEdit
        Left = 209
        Top = 20
        Width = 100
        Hint = ''
        Text = ''
        TabOrder = 5
      end
      object UniLabel13: TUniLabel
        Left = 209
        Top = 5
        Width = 90
        Height = 13
        Hint = ''
        Caption = 'Unit'#225'rio Negociado'
        TabOrder = 6
      end
      object UniEdit12: TUniEdit
        Left = 311
        Top = 20
        Width = 100
        Hint = ''
        Text = ''
        TabOrder = 7
      end
      object UniLabel14: TUniLabel
        Left = 311
        Top = 5
        Width = 51
        Height = 13
        Hint = ''
        Caption = 'Valor Total'
        TabOrder = 8
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 48
    Top = 240
  end
end
