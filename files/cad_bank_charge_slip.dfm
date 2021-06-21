inherited CadBankChargeSlip: TCadBankChargeSlip
  ClientHeight = 599
  ClientWidth = 604
  Caption = 'Cadastro de Boleto de Cobran'#231'a'
  ExplicitWidth = 620
  ExplicitHeight = 658
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 535
    Width = 604
    ExplicitTop = 535
    ExplicitWidth = 604
    inherited SB_Change: TUniSpeedButton
      ExplicitTop = 5
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 604
    Height = 535
    ExplicitWidth = 604
    ExplicitHeight = 535
    object pnl_row_01: TUniPanel
      Left = 2
      Top = 2
      Width = 600
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsNone
      Caption = ''
      object Ctn_Bank_Account: TUniContainerPanel
        Left = 1
        Top = 1
        Width = 598
        Height = 50
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 1
      end
    end
    object pnl_row_02: TUniPanel
      Left = 2
      Top = 54
      Width = 600
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = ''
      object Ctn_Bank_Charge_Ticket: TUniContainerPanel
        Left = 1
        Top = 1
        Width = 304
        Height = 50
        Hint = ''
        ParentColor = False
        Align = alLeft
        TabOrder = 1
      end
      object Ctn_Bank_Charge_Kind: TUniContainerPanel
        Left = 305
        Top = 1
        Width = 294
        Height = 50
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 2
      end
    end
    object pnl_row_03: TUniPanel
      Left = 2
      Top = 106
      Width = 600
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 3
      BorderStyle = ubsNone
      Caption = ''
      object Rg_Accept: TUniRadioGroup
        Left = 0
        Top = 0
        Width = 145
        Height = 52
        Hint = ''
        Items.Strings = (
          'SIM'
          'N'#195'O')
        Align = alLeft
        Caption = 'Aceita'
        TabOrder = 1
        Columns = 2
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitHeight = 50
      end
      object E_Agreement: TUniEdit
        AlignWithMargins = True
        Left = 148
        Top = 3
        Width = 135
        Height = 46
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 2
        FieldLabel = 'C'#243'd.Cedente/Conv'#234'nio'
        FieldLabelAlign = laTop
        ExplicitLeft = 149
        ExplicitTop = 4
        ExplicitHeight = 44
      end
      object E_Transmission_Code: TUniEdit
        AlignWithMargins = True
        Left = 289
        Top = 3
        Width = 121
        Height = 46
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 3
        FieldLabel = 'C'#243'digo Transmiss'#227'o'
        FieldLabelAlign = laTop
        ExplicitLeft = 290
        ExplicitTop = 4
        ExplicitHeight = 44
      end
      object E_Variacao: TUniEdit
        AlignWithMargins = True
        Left = 416
        Top = 3
        Width = 142
        Height = 46
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 4
        FieldLabel = 'Varia'#231#227'o da Carteira'
        FieldLabelAlign = laTop
        ExplicitLeft = 417
        ExplicitTop = 4
        ExplicitHeight = 44
      end
    end
    object pnl_row_04: TUniPanel
      Left = 2
      Top = 158
      Width = 600
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 4
      BorderStyle = ubsNone
      Caption = ''
      object Cb_Layout_Shipping: TUniComboBox
        Left = 0
        Top = 0
        Width = 120
        Height = 52
        Hint = ''
        Text = 'Cb_Layout_Shipping'
        Items.Strings = (
          'c240'
          'c400')
        ItemIndex = 0
        Align = alLeft
        TabOrder = 1
        FieldLabel = 'Layout Remessa'
        FieldLabelAlign = laTop
        IconItems = <>
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitHeight = 50
      end
      object Cb_protest: TUniComboBox
        AlignWithMargins = True
        Left = 123
        Top = 3
        Width = 134
        Height = 46
        Hint = ''
        Text = 'Cb_protest'
        Items.Strings = (
          '0 -  Sem instru'#231#227'o'
          '1 - Protestar (Dias Corridos)'
          '2 - Protestar (Dias '#218'teis)'
          '3 - N'#227'o protestar')
        ItemIndex = 0
        Align = alLeft
        TabOrder = 2
        FieldLabel = 'Protestar T'#237'tulo'
        FieldLabelAlign = laTop
        IconItems = <>
        ExplicitLeft = 124
        ExplicitTop = 4
        ExplicitHeight = 44
      end
      object E_Day_Protest: TUniEdit
        AlignWithMargins = True
        Left = 263
        Top = 3
        Width = 62
        Height = 46
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 3
        FieldLabel = 'Nr Dias'
        FieldLabelAlign = laTop
        ExplicitLeft = 264
        ExplicitTop = 4
        ExplicitHeight = 44
      end
      object Cb_Layout: TUniComboBox
        AlignWithMargins = True
        Left = 331
        Top = 3
        Width = 140
        Height = 46
        Hint = ''
        Text = 'Cb_Layout'
        Align = alLeft
        TabOrder = 4
        FieldLabel = 'Modelo do Boleto'
        FieldLabelAlign = laTop
        IconItems = <>
        ExplicitLeft = 332
        ExplicitTop = 4
        ExplicitHeight = 44
      end
      object E_Benefic_Post: TUniEdit
        AlignWithMargins = True
        Left = 477
        Top = 3
        Width = 119
        Height = 46
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 5
        FieldLabel = 'Posto Benefici'#225'rio'
        FieldLabelAlign = laTop
        ExplicitLeft = 478
        ExplicitTop = 4
        ExplicitHeight = 44
      end
    end
    object pnl_row_05: TUniPanel
      Left = 2
      Top = 210
      Width = 600
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 5
      BorderStyle = ubsNone
      Caption = ''
      object E_Aliq_Interest: TUniEdit
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 79
        Height = 44
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 1
        FieldLabel = 'Juros/M'#234's(%)'
        FieldLabelAlign = laTop
      end
      object E_Aliq_Late: TUniEdit
        AlignWithMargins = True
        Left = 89
        Top = 4
        Width = 74
        Height = 44
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 2
        FieldLabel = 'Mora/Dia(%)'
        FieldLabelAlign = laTop
      end
      object E_Value_Late_Min: TUniEdit
        AlignWithMargins = True
        Left = 169
        Top = 4
        Width = 78
        Height = 44
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 3
        FieldLabel = 'Mora M'#237'nima'
        FieldLabelAlign = laTop
      end
      object E_Aliq_Discount: TUniEdit
        AlignWithMargins = True
        Left = 253
        Top = 4
        Width = 94
        Height = 44
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 4
        FieldLabel = 'Desconto(%)'
        FieldLabelAlign = laTop
      end
      object E_Value_Fine: TUniEdit
        AlignWithMargins = True
        Left = 353
        Top = 4
        Width = 100
        Height = 44
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 5
        FieldLabel = 'Valor Multa'
        FieldLabelAlign = laTop
      end
      object E_Values_Rate: TUniEdit
        AlignWithMargins = True
        Left = 459
        Top = 4
        Width = 121
        Height = 44
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 6
        FieldLabel = 'Valor Tarifa'
        FieldLabelAlign = laTop
      end
    end
    object pnl_row_06: TUniPanel
      Left = 2
      Top = 262
      Width = 600
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 6
      BorderStyle = ubsNone
      Caption = ''
      object E_Payment_Local: TUniEdit
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 592
        Height = 44
        Hint = ''
        Text = ''
        Align = alClient
        TabOrder = 1
        FieldLabel = 'Local para Pagamento'
        FieldLabelAlign = laTop
      end
    end
    object pnl_row_07: TUniPanel
      Left = 2
      Top = 314
      Width = 600
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 7
      BorderStyle = ubsNone
      Caption = ''
      object E_Instruction_1: TUniEdit
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 592
        Height = 44
        Hint = ''
        Text = ''
        Align = alClient
        TabOrder = 1
        FieldLabel = 'Instru'#231#227'o para Pagmento 1 - Remessa Registrada'
        FieldLabelAlign = laTop
      end
    end
    object pnl_row_08: TUniPanel
      Left = 2
      Top = 366
      Width = 600
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 8
      BorderStyle = ubsNone
      Caption = ''
      object E_Instruction_2: TUniEdit
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 592
        Height = 44
        Hint = ''
        Text = ''
        Align = alClient
        TabOrder = 1
        FieldLabel = 'Instru'#231#227'o para Pagmento 2 - Remessa Registrada'
        FieldLabelAlign = laTop
      end
    end
    object pnl_row_09: TUniPanel
      Left = 2
      Top = 418
      Width = 600
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 9
      BorderStyle = ubsNone
      Caption = ''
      object M_Instruction: TUniMemo
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 594
        Height = 46
        Hint = ''
        Lines.Strings = (
          'M_Instruction')
        Align = alClient
        TabOrder = 1
        FieldLabel = 'Instru'#231#227'o Adicional'
        FieldLabelAlign = laTop
      end
    end
    object pnl_row_10: TUniPanel
      Left = 2
      Top = 470
      Width = 600
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 10
      BorderStyle = ubsNone
      Caption = ''
      object E_Path_Files: TUniEdit
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 561
        Height = 44
        Hint = ''
        Text = ''
        Align = alClient
        TabOrder = 1
        FieldLabel = 'Local de armazenamento arquivos de Remessa/Retorno'
        FieldLabelAlign = laTop
      end
      object UniButton1: TUniButton
        AlignWithMargins = True
        Left = 571
        Top = 23
        Width = 25
        Height = 25
        Hint = ''
        Margins.Top = 22
        Caption = '...'
        Align = alRight
        TabOrder = 2
        ExplicitLeft = 563
      end
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 416
    Top = 472
  end
  inherited ds_msg: TDataSource
    Left = 416
    Top = 528
  end
  inherited MenuTask: TUniMainMenu
    Left = 480
  end
end
