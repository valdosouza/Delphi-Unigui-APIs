inherited TasFinancialBillsGeneral: TTasFinancialBillsGeneral
  ClientHeight = 691
  ClientWidth = 1088
  Caption = 'Contas Geral '
  ActiveControl = Cb_BankSlipSendNumber
  ExplicitWidth = 1104
  ExplicitHeight = 750
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grp_search_parameter: TUniGroupBox
    Width = 1082
    Height = 310
    ExplicitWidth = 1082
    ExplicitHeight = 310
    inherited pnl_search_row_1: TUniPanel
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 1072
      Height = 111
      Align = alTop
      ExplicitLeft = 5
      ExplicitTop = 18
      ExplicitWidth = 1072
      ExplicitHeight = 111
      inherited pnl_search_row_1_1: TUniPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 1066
        Height = 70
        Caption = ''
        ExplicitLeft = 3
        ExplicitWidth = 1072
        ExplicitHeight = 70
        inherited Rg_tipo_data: TUniRadioGroup
          Height = 64
        end
        inherited pnl_date_periodo: TUniPanel
          Width = 235
          Height = 70
          ExplicitWidth = 235
          inherited pnl_date_periodo_1: TUniPanel
            Width = 235
            ExplicitWidth = 235
            inherited UniLabel1: TUniLabel
              Width = 90
              ExplicitWidth = 90
            end
            inherited UniLabel2: TUniLabel
              Left = 120
              Width = 112
              ExplicitLeft = 120
              ExplicitWidth = 112
            end
          end
          inherited pnl_date_periodo_2: TUniPanel
            Width = 235
            Height = 51
            ExplicitWidth = 235
            inherited DTP_Date_Initial: TUniDateTimePicker
              Width = 111
              Height = 45
              ExplicitWidth = 111
            end
            inherited DTP_Date_End: TUniDateTimePicker
              Left = 120
              Width = 112
              Height = 45
              ExplicitLeft = 120
              ExplicitWidth = 112
            end
          end
        end
        inherited E_Nr_Ordem: TUniEdit
          Left = 539
          Width = 126
          Height = 64
          ExplicitLeft = 539
          ExplicitWidth = 126
        end
        inherited E_Nr_Invoice: TUniEdit
          Left = 671
          Width = 130
          Height = 64
          ExplicitLeft = 671
          ExplicitWidth = 130
        end
      end
    end
    object pnl_search_general_row_2: TUniPanel
      Left = 2
      Top = 238
      Width = 1078
      Height = 70
      Hint = ''
      Visible = False
      Align = alBottom
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = ''
      ExplicitTop = 91
      object Ctn_entity: TUniContainerPanel
        AlignWithMargins = True
        Left = 3
        Top = 0
        Width = 454
        Height = 70
        Hint = ''
        Margins.Top = 0
        Margins.Bottom = 0
        ParentColor = False
        Align = alLeft
        TabOrder = 1
        ExplicitHeight = 60
      end
      object Ctn_PaymentType: TUniContainerPanel
        AlignWithMargins = True
        Left = 463
        Top = 0
        Width = 353
        Height = 70
        Hint = ''
        Margins.Top = 0
        Margins.Bottom = 0
        ParentColor = False
        Align = alLeft
        TabOrder = 2
        ExplicitHeight = 60
      end
      object Cb_Situacao: TUniComboBox
        AlignWithMargins = True
        Left = 822
        Top = 3
        Width = 253
        Height = 64
        Hint = ''
        Style = csDropDownList
        Text = 'Normais'
        Items.Strings = (
          'Normais'
          'Destinadas'
          'Baixadas'
          'Inativas'
          'Todas')
        ItemIndex = 0
        Align = alClient
        TabOrder = 3
        FieldLabel = 'Situa'#231#227'o do Documento'
        FieldLabelAlign = laTop
        IconItems = <>
        ExplicitHeight = 54
      end
    end
  end
  inherited pg_Principal: TUniPageControl
    Top = 316
    Width = 1088
    Height = 375
    ExplicitTop = 156
    ExplicitWidth = 1088
    ExplicitHeight = 535
    inherited tbs_valores: TUniTabSheet
      ExplicitWidth = 1080
      ExplicitHeight = 385
      inherited pnl_valores: TUniPanel
        Width = 1080
        Height = 238
        ExplicitWidth = 1080
        ExplicitHeight = 276
        inherited dbg_valores: TUniDBGrid
          Width = 1076
          Height = 234
        end
      end
      inherited UniGroupBox3: TUniGroupBox
        Top = 241
        Width = 1070
        ExplicitTop = 279
        ExplicitWidth = 1070
        inherited UniLabel14: TUniLabel
          Left = 834
          ExplicitLeft = 834
        end
        inherited E_VL_Selecionado: TUniLabel
          Left = 951
          ExplicitLeft = 951
        end
      end
      inherited pnl_botao_Valores: TUniPanel
        Top = 283
        Width = 1080
        ExplicitTop = 321
        ExplicitWidth = 1080
      end
    end
    object tbs_selecionados: TUniTabSheet
      Hint = ''
      Caption = 'Selecionados para Baixar'
      ExplicitHeight = 385
      object pnl_selecionados: TUniPanel
        Left = 0
        Top = 0
        Width = 1080
        Height = 347
        Hint = ''
        Align = alClient
        TabOrder = 0
        BorderStyle = ubsFrameLowered
        Caption = ''
        ExplicitHeight = 385
        object DbgSeattled: TUniDBGrid
          Left = 2
          Top = 2
          Width = 1076
          Height = 219
          Hint = ''
          DataSource = ds_search
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgCheckSelect, dgConfirmDelete, dgMultiSelect]
          LoadMask.Message = 'Loading data...'
          Align = alClient
          TabOrder = 1
          OnCellClick = dbg_SearchCellClick
        end
        object UniPanel1: TUniPanel
          Left = 2
          Top = 281
          Width = 1076
          Height = 64
          Hint = ''
          Align = alBottom
          TabOrder = 2
          BorderStyle = ubsFrameLowered
          Caption = ''
          ExplicitTop = 319
          object Sb_Close_settled: TUniSpeedButton
            AlignWithMargins = True
            Left = 95
            Top = 5
            Width = 91
            Height = 54
            Hint = ''
            Margins.Left = 0
            Margins.Right = 0
            Caption = 'Sair'
            Align = alLeft
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            ParentColor = False
            Color = clWindow
            IconAlign = iaTop
            TabOrder = 1
            OnClick = Sb_Close_ValoresClick
          end
          object Sb_settled_general: TUniSpeedButton
            AlignWithMargins = True
            Left = 2
            Top = 5
            Width = 93
            Height = 54
            Hint = ''
            Margins.Left = 0
            Margins.Right = 0
            Caption = 'Baixar'
            Align = alLeft
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            ParentColor = False
            Color = clWindow
            IconAlign = iaTop
            TabOrder = 2
            OnClick = Sb_SearchClick
          end
        end
        object UniPanel2: TUniPanel
          Left = 2
          Top = 221
          Width = 1076
          Height = 60
          Hint = ''
          Align = alBottom
          TabOrder = 3
          Caption = ''
          ExplicitTop = 259
          object Ctn_PaymentTypeSettled: TUniContainerPanel
            AlignWithMargins = True
            Left = 4
            Top = 1
            Width = 353
            Height = 58
            Hint = ''
            Margins.Top = 0
            Margins.Bottom = 0
            ParentColor = False
            Align = alLeft
            TabOrder = 1
          end
          object E_VL_Interest: TUniEdit
            AlignWithMargins = True
            Left = 363
            Top = 4
            Width = 85
            Height = 52
            Hint = ''
            Alignment = taRightJustify
            Text = '0,00'
            Align = alLeft
            TabOrder = 2
            FieldLabel = 'Juros'
            FieldLabelAlign = laTop
          end
          object E_Fine: TUniEdit
            AlignWithMargins = True
            Left = 454
            Top = 4
            Width = 85
            Height = 52
            Hint = ''
            Alignment = taRightJustify
            Text = '0,00'
            Align = alLeft
            TabOrder = 3
            FieldLabel = 'Multa/Mora'
            FieldLabelAlign = laTop
          end
          object E_Valor_Total: TUniEdit
            AlignWithMargins = True
            Left = 636
            Top = 4
            Width = 100
            Height = 52
            Hint = ''
            Alignment = taRightJustify
            Text = '0,00'
            Align = alLeft
            TabOrder = 4
            FieldLabel = 'Valor Total'
            FieldLabelAlign = laTop
          end
          object E_Disccount: TUniEdit
            AlignWithMargins = True
            Left = 545
            Top = 4
            Width = 85
            Height = 52
            Hint = ''
            Alignment = taRightJustify
            Text = '0,00'
            Align = alLeft
            TabOrder = 5
            FieldLabel = 'Desconto'
            FieldLabelAlign = laTop
          end
          object Dtp_Payment: TUniDateTimePicker
            AlignWithMargins = True
            Left = 742
            Top = 4
            Width = 112
            Height = 52
            Hint = ''
            DateTime = 42979.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            Align = alLeft
            TabOrder = 6
            FieldLabel = 'Data Pagamento'
            FieldLabelAlign = laTop
          end
          object E_VL_Payment: TUniEdit
            AlignWithMargins = True
            Left = 860
            Top = 4
            Width = 100
            Height = 52
            Hint = ''
            Alignment = taRightJustify
            Text = '0,00'
            Align = alLeft
            TabOrder = 7
            FieldLabel = 'Valor Pagamento'
            FieldLabelAlign = laTop
          end
          object E_SeattledPartial: TUniEdit
            AlignWithMargins = True
            Left = 966
            Top = 4
            Width = 106
            Height = 52
            Hint = ''
            Alignment = taRightJustify
            Text = '0,00'
            Align = alClient
            TabOrder = 8
            FieldLabel = 'Saldo Parcial'
            FieldLabelAlign = laTop
          end
        end
      end
    end
    object tb_bank_slip: TUniTabSheet
      Hint = ''
      Caption = 'Controle de Boletos'
      ExplicitHeight = 385
      object UniPanel3: TUniPanel
        Left = 0
        Top = 283
        Width = 1080
        Height = 64
        Hint = ''
        Align = alBottom
        TabOrder = 0
        BorderStyle = ubsFrameLowered
        Caption = ''
        ExplicitTop = 321
        object Sb_BankSlipClose: TUniSpeedButton
          AlignWithMargins = True
          Left = 749
          Top = 5
          Width = 91
          Height = 54
          Hint = ''
          Margins.Left = 0
          Margins.Right = 0
          Caption = 'Sair'
          Align = alLeft
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          IconAlign = iaTop
          TabOrder = 1
          OnClick = Sb_Close_ValoresClick
        end
        object Sb_BankSlipSettled: TUniSpeedButton
          AlignWithMargins = True
          Left = 656
          Top = 5
          Width = 93
          Height = 54
          Hint = ''
          Margins.Left = 0
          Margins.Right = 0
          Caption = 'Baixar'
          Align = alLeft
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          IconAlign = iaTop
          TabOrder = 2
          OnClick = Sb_SearchClick
        end
        object Sb_BankSlipPrint: TUniSpeedButton
          AlignWithMargins = True
          Left = 563
          Top = 5
          Width = 93
          Height = 54
          Hint = ''
          Margins.Left = 0
          Margins.Right = 0
          Caption = 'Imprimir'
          Align = alLeft
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          IconAlign = iaTop
          TabOrder = 3
          OnClick = Sb_SearchClick
        end
        object Sb_BankSlipEmail: TUniSpeedButton
          AlignWithMargins = True
          Left = 470
          Top = 5
          Width = 93
          Height = 54
          Hint = ''
          Margins.Left = 0
          Margins.Right = 0
          Caption = 'e-mail'
          Align = alLeft
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          IconAlign = iaTop
          TabOrder = 4
          OnClick = Sb_SearchClick
        end
        object Sb_BankSlipSearch: TUniSpeedButton
          AlignWithMargins = True
          Left = 377
          Top = 5
          Width = 93
          Height = 54
          Hint = ''
          Margins.Left = 0
          Margins.Right = 0
          Caption = 'Buscar'
          Align = alLeft
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          IconAlign = iaTop
          TabOrder = 5
          OnClick = Sb_SearchClick
        end
        object Sb_BankSlipDelete: TUniSpeedButton
          AlignWithMargins = True
          Left = 284
          Top = 5
          Width = 93
          Height = 54
          Hint = ''
          Margins.Left = 0
          Margins.Right = 0
          Caption = 'Excluir'
          Align = alLeft
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          IconAlign = iaTop
          TabOrder = 6
          OnClick = Sb_SearchClick
        end
        object Sb_BankSlipReceive: TUniSpeedButton
          AlignWithMargins = True
          Left = 191
          Top = 5
          Width = 93
          Height = 54
          Hint = ''
          Margins.Left = 0
          Margins.Right = 0
          Caption = 'Retorno'
          Align = alLeft
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          IconAlign = iaTop
          TabOrder = 7
          OnClick = Sb_SearchClick
        end
        object Sb_BankSlipSend: TUniSpeedButton
          AlignWithMargins = True
          Left = 98
          Top = 5
          Width = 93
          Height = 54
          Hint = ''
          Margins.Left = 0
          Margins.Right = 0
          Caption = 'Remessa'
          Align = alLeft
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          IconAlign = iaTop
          TabOrder = 8
          OnClick = Sb_SearchClick
        end
        object Sb_BankSlipDueDate: TUniSpeedButton
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 93
          Height = 54
          Hint = ''
          Margins.Right = 0
          Caption = 'Vencimento'
          Align = alLeft
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          IconAlign = iaTop
          TabOrder = 9
          OnClick = Sb_SearchClick
        end
      end
      object UniGroupBox1: TUniGroupBox
        AlignWithMargins = True
        Left = 5
        Top = 241
        Width = 1070
        Height = 39
        Hint = ''
        Margins.Left = 5
        Margins.Right = 5
        Caption = 'Totalizador'
        Align = alBottom
        TabOrder = 1
        ExplicitTop = 279
        object UniLabel3: TUniLabel
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 54
          Height = 16
          Hint = ''
          AutoSize = False
          Caption = 'Valor Total '
          Align = alLeft
          TabOrder = 1
        end
        object UniLabel4: TUniLabel
          AlignWithMargins = True
          Left = 65
          Top = 18
          Width = 100
          Height = 16
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = '480,00'
          Align = alLeft
          TabOrder = 2
        end
        object UniLabel5: TUniLabel
          AlignWithMargins = True
          Left = 834
          Top = 18
          Width = 111
          Height = 16
          Hint = ''
          Visible = False
          AutoSize = False
          Caption = 'Valor Total Selecionado'
          Align = alRight
          TabOrder = 3
        end
        object UniLabel7: TUniLabel
          AlignWithMargins = True
          Left = 951
          Top = 18
          Width = 114
          Height = 16
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = '5,06'
          Align = alRight
          TabOrder = 4
        end
      end
      object DbgBankSlip: TUniDBGrid
        Left = 0
        Top = 60
        Width = 1080
        Height = 178
        Hint = ''
        DataSource = ds_search
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgCheckSelect, dgConfirmDelete, dgMultiSelect]
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 2
        OnCellClick = dbg_SearchCellClick
      end
      object UniPanel4: TUniPanel
        Left = 0
        Top = 0
        Width = 1080
        Height = 60
        Hint = ''
        Align = alTop
        TabOrder = 3
        BorderStyle = ubsFrameLowered
        Caption = ''
        object UniEdit1: TUniEdit
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 148
          Height = 50
          Hint = ''
          Text = ''
          Align = alLeft
          TabOrder = 1
          FieldLabel = 'N'#186' Pedido'
          FieldLabelAlign = laTop
        end
        object Cb_BankSlipSendStatus: TUniComboBox
          AlignWithMargins = True
          Left = 518
          Top = 5
          Width = 259
          Height = 50
          Hint = ''
          Style = csDropDownList
          Text = 'Normais'
          Items.Strings = (
            'Normais'
            'Destinadas'
            'Baixadas'
            'Inativas'
            'Todas')
          ItemIndex = 0
          Align = alLeft
          TabOrder = 2
          FieldLabel = 'Situa'#231#227'o da Remessa'
          FieldLabelAlign = laTop
          IconItems = <>
        end
        object Ctn_carteiraCobranca: TUniContainerPanel
          AlignWithMargins = True
          Left = 159
          Top = 2
          Width = 353
          Height = 56
          Hint = ''
          Margins.Top = 0
          Margins.Bottom = 0
          ParentColor = False
          Align = alLeft
          TabOrder = 3
        end
        object Cb_BankSlipSendNumber: TUniComboBox
          AlignWithMargins = True
          Left = 783
          Top = 5
          Width = 114
          Height = 50
          Hint = ''
          Style = csDropDownList
          Text = 'Normais'
          Items.Strings = (
            'Normais'
            'Destinadas'
            'Baixadas'
            'Inativas'
            'Todas')
          ItemIndex = 0
          Align = alLeft
          TabOrder = 4
          FieldLabel = 'N'#186' da Remessa'
          FieldLabelAlign = laTop
          IconItems = <>
        end
      end
    end
    object tbs_checks: TUniTabSheet
      Hint = ''
      Caption = 'Controle de Cheques'
      ExplicitHeight = 385
    end
    object UniTabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'Controle de Cart'#245'es'
      ExplicitHeight = 385
    end
    object tbs_Sb_settled: TUniTabSheet
      Hint = ''
      Caption = 'Documentos Baixaods'
      ExplicitHeight = 385
      object UniDBGrid1: TUniDBGrid
        Left = 0
        Top = 0
        Width = 1080
        Height = 238
        Hint = ''
        DataSource = ds_search
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgCheckSelect, dgConfirmDelete, dgMultiSelect]
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        OnCellClick = dbg_SearchCellClick
      end
      object UniGroupBox2: TUniGroupBox
        AlignWithMargins = True
        Left = 5
        Top = 241
        Width = 1070
        Height = 39
        Hint = ''
        Margins.Left = 5
        Margins.Right = 5
        Caption = 'Totalizador'
        Align = alBottom
        TabOrder = 1
        ExplicitTop = 279
        object UniLabel8: TUniLabel
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 54
          Height = 16
          Hint = ''
          AutoSize = False
          Caption = 'Valor Total '
          Align = alLeft
          TabOrder = 1
        end
        object UniLabel9: TUniLabel
          AlignWithMargins = True
          Left = 65
          Top = 18
          Width = 100
          Height = 16
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = '480,00'
          Align = alLeft
          TabOrder = 2
        end
        object UniLabel10: TUniLabel
          AlignWithMargins = True
          Left = 834
          Top = 18
          Width = 111
          Height = 16
          Hint = ''
          Visible = False
          AutoSize = False
          Caption = 'Valor Total Selecionado'
          Align = alRight
          TabOrder = 3
        end
        object UniLabel11: TUniLabel
          AlignWithMargins = True
          Left = 951
          Top = 18
          Width = 114
          Height = 16
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = '5,06'
          Align = alRight
          TabOrder = 4
        end
      end
      object UniPanel5: TUniPanel
        Left = 0
        Top = 283
        Width = 1080
        Height = 64
        Hint = ''
        Align = alBottom
        TabOrder = 2
        BorderStyle = ubsFrameLowered
        Caption = ''
        ExplicitTop = 321
        object UniSpeedButton1: TUniSpeedButton
          AlignWithMargins = True
          Left = 95
          Top = 5
          Width = 91
          Height = 54
          Hint = ''
          Margins.Left = 0
          Margins.Right = 0
          Caption = 'Sair'
          Align = alLeft
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          IconAlign = iaTop
          TabOrder = 1
          OnClick = Sb_Close_ValoresClick
        end
        object UniSpeedButton9: TUniSpeedButton
          AlignWithMargins = True
          Left = 2
          Top = 5
          Width = 93
          Height = 54
          Hint = ''
          Margins.Left = 0
          Margins.Right = 0
          Caption = 'Estorno'
          Align = alLeft
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          IconAlign = iaTop
          TabOrder = 2
          OnClick = Sb_SearchClick
        end
      end
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 200
    Top = 80
  end
  inherited ds_msg: TDataSource
    Left = 112
    Top = 96
  end
  inherited MenuTask: TUniMainMenu
    Top = 96
  end
  inherited cds_search: TClientDataSet
    Left = 152
    Top = 282
    object cds_searchtb_order_id: TIntegerField
      FieldName = 'tb_order_id'
      Origin = 'tb_order_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cds_searchinv_number: TStringField
      DisplayLabel = 'Nota Fiscal'
      DisplayWidth = 13
      FieldName = 'inv_number'
      Origin = '`number`'
      ProviderFlags = []
      ReadOnly = True
    end
    object cds_searchmodel: TStringField
      FieldName = 'model'
      Origin = 'model'
      ProviderFlags = []
      ReadOnly = True
      Visible = False
      Size = 2
    end
    object cds_searchors_number: TIntegerField
      DisplayLabel = 'Pedido'
      DisplayWidth = 10
      FieldName = 'ors_number'
      Origin = '`number`'
      ProviderFlags = []
      ReadOnly = True
    end
    object cds_searchfnb_number: TStringField
      DisplayLabel = 'Duplicata'
      DisplayWidth = 20
      FieldName = 'fnb_number'
      Origin = '`number`'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object cds_searchdt_expiration: TDateField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 14
      FieldName = 'dt_expiration'
      Origin = 'dt_expiration'
    end
    object cds_searchparcel: TIntegerField
      FieldName = 'parcel'
      Origin = 'parcel'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cds_searchtb_customer_id: TIntegerField
      FieldName = 'tb_customer_id'
      Origin = 'tb_customer_id'
      ProviderFlags = []
      ReadOnly = True
      Visible = False
    end
    object cds_searchtag_value: TBCDField
      DisplayLabel = 'Valor Parcela'
      DisplayWidth = 11
      FieldName = 'tag_value'
      Origin = 'tag_value'
      DisplayFormat = '0.00'
      Precision = 10
      Size = 2
    end
    object cds_searchpaid_value: TBCDField
      DisplayLabel = 'Valor Pago'
      DisplayWidth = 11
      FieldName = 'paid_value'
      Origin = 'paid_value'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 10
      Size = 2
    end
    object cds_searchdt_payment: TDateField
      DisplayLabel = 'Data Pagto'
      DisplayWidth = 14
      FieldName = 'dt_payment'
      Origin = 'dt_payment'
      ProviderFlags = []
      ReadOnly = True
    end
    object cds_searchnick_trade: TStringField
      DisplayLabel = 'Apelido/Fantasia'
      DisplayWidth = 45
      FieldName = 'nick_trade'
      Origin = 'nick_trade'
      ProviderFlags = []
      ReadOnly = True
      Visible = False
      Size = 100
    end
    object cds_searchname_company: TStringField
      DisplayLabel = 'Nome/Raz'#227'o Social'
      DisplayWidth = 45
      FieldName = 'name_company'
      Origin = 'name_company'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchsettled: TStringField
      DisplayWidth = 5
      FieldName = 'settled'
      Origin = 'settled'
      ProviderFlags = []
      ReadOnly = True
      Visible = False
      Size = 1
    end
    object cds_searchsituation: TStringField
      DisplayWidth = 6
      FieldName = 'situation'
      Origin = 'situation'
      ProviderFlags = []
      ReadOnly = True
      Visible = False
      Size = 1
    end
    object cds_searchsettled_code: TIntegerField
      DisplayWidth = 10
      FieldName = 'settled_code'
      Origin = 'settled_code'
      ProviderFlags = []
      ReadOnly = True
      Visible = False
    end
    object cds_searchtb_payment_types_id: TIntegerField
      DisplayWidth = 17
      FieldName = 'tb_payment_types_id'
      Origin = 'tb_payment_types_id'
      Required = True
      Visible = False
    end
    object cds_searchid: TIntegerField
      DisplayWidth = 10
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = []
      ReadOnly = True
      Visible = False
    end
    object cds_searchkind: TStringField
      DisplayWidth = 3
      FieldName = 'kind'
      Origin = 'kind'
      ProviderFlags = []
      ReadOnly = True
      Visible = False
      Size = 2
    end
    object cds_searchoperation: TStringField
      DisplayWidth = 7
      FieldName = 'operation'
      Origin = 'operation'
      ProviderFlags = []
      ReadOnly = True
      Visible = False
      Size = 1
    end
    object cds_searchstage: TStringField
      DisplayWidth = 4
      FieldName = 'stage'
      Origin = 'stage'
      ProviderFlags = []
      ReadOnly = True
      Visible = False
      Size = 1
    end
    object cds_searchtb_institution_id: TIntegerField
      DisplayWidth = 12
      FieldName = 'tb_institution_id'
      Origin = 'tb_institution_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cds_searchfpl_id: TIntegerField
      FieldName = 'fpl_id'
      Origin = 'id'
      ProviderFlags = []
      ReadOnly = True
      Visible = False
    end
    object cds_searchfpl_description: TStringField
      DisplayLabel = 'Conta Gerencial'
      DisplayWidth = 100
      FieldName = 'fpl_description'
      Origin = 'description'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  inherited ds_search: TDataSource
    Top = 338
  end
  inherited DSP: TDataSetProvider
    Left = 152
    Top = 240
  end
end
