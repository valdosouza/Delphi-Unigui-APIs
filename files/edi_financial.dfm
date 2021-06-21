inherited EdiFinancial: TEdiFinancial
  ClientHeight = 222
  ClientWidth = 523
  Caption = 'Cadastro no Financeiro'
  Layout = 'fit'
  ExplicitWidth = 539
  ExplicitHeight = 281
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 154
    Width = 523
    Height = 68
    TabOrder = 2
    ExplicitTop = 154
    ExplicitWidth = 523
    ExplicitHeight = 68
    inherited SB_Insert: TUniSpeedButton
      Left = 221
      Width = 47
      Height = 58
      Visible = False
      ExplicitLeft = 221
      ExplicitWidth = 47
      ExplicitHeight = 58
    end
    inherited SB_Change: TUniSpeedButton
      Left = 268
      Width = 47
      Height = 58
      Visible = False
      ExplicitLeft = 268
      ExplicitWidth = 47
      ExplicitHeight = 58
    end
    inherited SB_Delete: TUniSpeedButton
      Left = 315
      Width = 49
      Height = 58
      Visible = False
      ExplicitLeft = 315
      ExplicitWidth = 49
      ExplicitHeight = 58
    end
    inherited SB_Save: TUniSpeedButton
      Left = 2
      Height = 58
      ExplicitLeft = 2
      ExplicitHeight = 58
    end
    inherited SB_Cancel: TUniSpeedButton
      Left = 95
      Height = 58
      ExplicitLeft = 95
      ExplicitHeight = 58
    end
    inherited Sb_Close: TUniSpeedButton
      Left = 188
      Width = 30
      Height = 58
      Visible = False
      ExplicitLeft = 188
      ExplicitWidth = 30
      ExplicitHeight = 58
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 523
    Height = 89
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 523
    ExplicitHeight = 89
    object UniLabel2: TUniLabel
      Left = 5
      Top = 4
      Width = 81
      Height = 13
      Hint = ''
      Caption = 'Data Vencimento'
      TabOrder = 6
    end
    object Dtp_Expiration: TUniDateTimePicker
      Left = 4
      Top = 20
      Width = 105
      Hint = ''
      DateTime = 42979.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 0
    end
    object E_Nr_Doc: TUniEdit
      Left = 111
      Top = 20
      Width = 133
      Hint = ''
      Text = ''
      TabOrder = 1
    end
    object UniLabel1: TUniLabel
      Left = 113
      Top = 4
      Width = 89
      Height = 13
      Hint = ''
      Caption = 'N'#250'mero Financeiro'
      TabOrder = 7
    end
    object Lb_VL_Doc: TUniLabel
      Left = 248
      Top = 4
      Width = 96
      Height = 13
      Hint = ''
      Caption = 'Valor do Documento'
      TabOrder = 8
    end
    object E_VL_Doc: TUniNumberEdit
      Left = 246
      Top = 20
      Width = 121
      Hint = ''
      Alignment = taRightJustify
      TabOrder = 2
      DecimalSeparator = ','
      OnExit = E_VL_DocExit
    end
    object Ctn_PaymentType: TUniContainerPanel
      Left = 3
      Top = 47
      Width = 512
      Height = 37
      Hint = ''
      ParentColor = False
      TabOrder = 4
    end
    object UniLabel5: TUniLabel
      Left = 371
      Top = 4
      Width = 112
      Height = 13
      Hint = ''
      Caption = 'Situa'#231#227'o do documento'
      TabOrder = 9
    end
    object cb_Situation: TUniComboBox
      Left = 370
      Top = 20
      Width = 145
      Hint = ''
      Style = csDropDownList
      Text = 'Em aberto'
      Items.Strings = (
        'Em aberto'
        'Baixado')
      ItemIndex = 0
      TabOrder = 3
      IconItems = <>
      OnExit = cb_SituationExit
    end
  end
  object UniGroupBox1: TUniGroupBox [2]
    Left = 0
    Top = 89
    Width = 523
    Height = 65
    Hint = ''
    Caption = 'Informa'#231#245'es de Baixa'
    Align = alClient
    TabOrder = 1
    object E_Vl_Late: TUniNumberEdit
      Left = 77
      Top = 30
      Width = 67
      Hint = ''
      Alignment = taRightJustify
      TabOrder = 1
      DecimalSeparator = ','
      OnExit = E_Vl_LateExit
    end
    object UniLabel4: TUniLabel
      Left = 78
      Top = 14
      Width = 51
      Height = 13
      Hint = ''
      Caption = 'Valor Mora'
      TabOrder = 7
    end
    object UniLabel6: TUniLabel
      Left = 149
      Top = 14
      Width = 51
      Height = 13
      Hint = ''
      Caption = 'Aliq. Desc.'
      TabOrder = 8
    end
    object E_Aliq_Desc: TUniNumberEdit
      Left = 148
      Top = 30
      Width = 67
      Hint = ''
      Alignment = taRightJustify
      TabOrder = 2
      DecimalSeparator = ','
      OnExit = E_Aliq_DescExit
    end
    object UniLabel7: TUniLabel
      Left = 315
      Top = 14
      Width = 51
      Height = 13
      Hint = ''
      Caption = 'Valor Pago'
      TabOrder = 9
    end
    object E_Vl_Paid: TUniNumberEdit
      Left = 313
      Top = 30
      Width = 89
      Hint = ''
      Alignment = taRightJustify
      TabOrder = 4
      DecimalSeparator = ','
    end
    object UniLabel8: TUniLabel
      Left = 409
      Top = 14
      Width = 80
      Height = 13
      Hint = ''
      Caption = 'Data Pagamento'
      TabOrder = 10
    end
    object Dtp_Paid: TUniDateTimePicker
      Left = 408
      Top = 30
      Width = 109
      Hint = ''
      DateTime = 42979.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 5
    end
    object E_VL_Total: TUniNumberEdit
      Left = 219
      Top = 30
      Width = 89
      Hint = ''
      Alignment = taRightJustify
      TabOrder = 3
      ReadOnly = True
      DecimalSeparator = ','
    end
    object UniLabel9: TUniLabel
      Left = 220
      Top = 14
      Width = 51
      Height = 13
      Hint = ''
      Caption = 'Valor Total'
      TabOrder = 11
    end
    object UniLabel3: TUniLabel
      Left = 8
      Top = 14
      Width = 53
      Height = 13
      Hint = ''
      Caption = 'Valor Juros'
      TabOrder = 12
    end
    object E_Vl_Interest: TUniNumberEdit
      Left = 7
      Top = 30
      Width = 64
      Hint = ''
      Alignment = taRightJustify
      TabOrder = 0
      DecimalSeparator = ','
      OnExit = E_Vl_InterestExit
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 368
    Top = 200
  end
end
