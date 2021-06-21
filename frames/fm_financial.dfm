inherited FmFinancial: TFmFinancial
  Width = 594
  Height = 259
  ExplicitWidth = 594
  ExplicitHeight = 259
  object dbg_Instalment: TUniDBGrid
    Left = 0
    Top = 0
    Width = 594
    Height = 209
    Hint = ''
    DataSource = ds_financial
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 0
    OnSetCellValue = dbg_InstalmentSetCellValue
    Columns = <
      item
        FieldName = 'dt_expiration'
        Title.Caption = 'Vencimento'
        Width = 136
        Editor = Dtp_Expiration
      end
      item
        FieldName = 'tb_payment_types_id'
        Title.Caption = 'Forma de Pagamento'
        Width = 280
        Visible = False
      end
      item
        FieldName = 'descPayment'
        Title.Caption = 'Forma de Pagamento'
        Width = 184
        Editor = Dblcb_Hdd_Payment_Type
      end
      item
        FieldName = 'tag_value'
        Title.Caption = 'Valor Parcela'
        Width = 142
        Editor = E_Vl_Parcela
      end>
  end
  object UniHiddenPanel1: TUniHiddenPanel
    Left = 264
    Top = 42
    Width = 313
    Height = 135
    Hint = ''
    Visible = True
    object Dtp_Expiration: TUniDateTimePicker
      Left = 16
      Top = 8
      Width = 120
      Hint = ''
      DateTime = 43014.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 1
    end
    object Dblcb_Hdd_Payment_Type: TUniDBLookupComboBox
      Left = 11
      Top = 36
      Width = 145
      Hint = ''
      ListFormat = '%s - %s'
      ListField = 'id;description'
      ListSource = ds_Payment
      KeyField = 'description'
      ListFieldIndex = 0
      TabOrder = 2
      Color = clWindow
      Style = csDropDown
    end
    object E_Vl_Parcela: TUniNumberEdit
      Left = 16
      Top = 64
      Width = 121
      Hint = ''
      TabOrder = 3
      DecimalSeparator = ','
    end
  end
  object pnl_Operacao: TUniPanel
    Left = 0
    Top = 209
    Width = 594
    Height = 50
    Hint = ''
    Align = alBottom
    TabOrder = 2
    BorderStyle = ubsFrameLowered
    Caption = ''
    DesignSize = (
      594
      50)
    object UniLabel11: TUniLabel
      Left = 534
      Top = 4
      Width = 50
      Height = 14
      Hint = ''
      Caption = 'Valor Total'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 1
    end
    object E_VL_Total: TUniFormattedNumberEdit
      Left = 482
      Top = 19
      Width = 106
      Hint = ''
      Alignment = taRightJustify
      ParentFont = False
      Font.Color = clLime
      Font.Style = [fsBold]
      Anchors = [akTop, akRight]
      TabOrder = 2
      Color = clBlack
      ReadOnly = True
      DecimalSeparator = ','
      ThousandSeparator = '.'
    end
    object E_VL_Doc: TUniLabel
      Left = 7
      Top = 5
      Width = 55
      Height = 13
      Hint = ''
      Caption = 'N'#176' Parcelas'
      TabOrder = 3
    end
    object E_Nr_Parcelas: TUniNumberEdit
      Left = 5
      Top = 19
      Width = 57
      Hint = ''
      Alignment = taRightJustify
      TabOrder = 4
      DecimalSeparator = ','
    end
    object Sb_Parcel: TUniButton
      Left = 68
      Top = 16
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'Parcelar'
      TabOrder = 5
      OnClick = Sb_ParcelClick
    end
    object Sb_Pay_Now: TUniButton
      Left = 143
      Top = 16
      Width = 75
      Height = 25
      Hint = ''
      Caption = #192' Vista'
      TabOrder = 6
      OnClick = Sb_Pay_NowClick
    end
    object chbx_Entrada: TUniCheckBox
      Left = 224
      Top = 6
      Width = 129
      Height = 17
      Hint = ''
      Caption = 'Com valor de entrada'
      TabOrder = 7
    end
  end
  object cds_financial: TClientDataSet
    Aggregates = <>
    Filtered = True
    PacketRecords = 0
    Params = <>
    AfterPost = cds_financialAfterPost
    Left = 80
    Top = 106
    object cds_financialdt_expiration: TDateField
      DisplayWidth = 22
      FieldName = 'dt_expiration'
    end
    object cds_financialtb_payment_types_id: TIntegerField
      DisplayWidth = 46
      FieldName = 'tb_payment_types_id'
    end
    object cds_financialtag_value: TFloatField
      DisplayWidth = 23
      FieldName = 'tag_value'
      DisplayFormat = '0.00'
    end
    object cds_financialdescPayment: TStringField
      FieldName = 'descPayment'
      Size = 30
    end
    object cds_financialparcel: TIntegerField
      FieldName = 'parcel'
    end
    object cds_financialterminal: TIntegerField
      FieldName = 'terminal'
    end
  end
  object ds_financial: TDataSource
    DataSet = cds_financial
    Left = 72
    Top = 162
  end
  object DSP_payment: TDataSetProvider
    DataSet = UMM.Qr_Crud
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 408
    Top = 64
  end
  object cds_Payment: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_payment'
    Left = 404
    Top = 121
    object cds_Paymentid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_Paymentdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 45
    end
  end
  object ds_Payment: TDataSource
    DataSet = cds_Payment
    Left = 400
    Top = 178
  end
end
