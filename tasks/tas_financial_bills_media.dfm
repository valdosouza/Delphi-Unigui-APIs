inherited TasFinancialBillsMedia: TTasFinancialBillsMedia
  ClientWidth = 944
  Caption = 'Contas '#224' Receber'
  ExplicitWidth = 960
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grp_search_parameter: TUniGroupBox
    Width = 938
    Height = 188
    ExplicitWidth = 938
    ExplicitHeight = 188
    inherited pnl_search_row_1: TUniPanel
      Width = 934
      Height = 171
      ExplicitWidth = 934
      ExplicitHeight = 171
      inherited pnl_search_row_1_1: TUniPanel
        Width = 934
        ExplicitTop = 0
        ExplicitWidth = 934
        inherited Rg_tipo_data: TUniRadioGroup
          Width = 269
          OnClick = Rg_tipo_dataClick
          ExplicitWidth = 269
          ExplicitHeight = 50
        end
        inherited pnl_date_periodo: TUniPanel
          Left = 275
          ExplicitLeft = 275
          inherited pnl_date_periodo_1: TUniPanel
            inherited UniLabel1: TUniLabel
              Caption = 'Data Inicial'
            end
          end
          inherited pnl_date_periodo_2: TUniPanel
            inherited DTP_Date_Initial: TUniDateTimePicker
              OnExit = DTP_Date_InitialExit
            end
            inherited DTP_Date_End: TUniDateTimePicker
              OnExit = DTP_Date_EndExit
            end
          end
        end
        inherited E_Nr_Ordem: TUniEdit
          Left = 534
          Width = 86
          ExplicitLeft = 534
          ExplicitWidth = 86
        end
        inherited E_Nr_Invoice: TUniEdit
          Left = 626
          ExplicitLeft = 626
        end
        object Rg_situacao_documento: TUniRadioGroup
          AlignWithMargins = True
          Left = 737
          Top = 3
          Width = 194
          Height = 50
          Hint = ''
          Items.Strings = (
            'Aberto'
            'Fechado'
            'Todos')
          ItemIndex = 0
          Align = alClient
          Caption = 'Situa'#231'ao do Documento'
          TabOrder = 5
          Columns = 3
        end
      end
      object pnl_search_media_row_1: TUniPanel
        Left = 0
        Top = 56
        Width = 934
        Height = 57
        Hint = ''
        Align = alTop
        TabOrder = 2
        BorderStyle = ubsNone
        Caption = ''
        object Ctn_advertiser: TUniContainerPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 441
          Height = 51
          Hint = ''
          ParentColor = False
          Align = alLeft
          TabOrder = 1
        end
        object Ctn_broadcaster: TUniContainerPanel
          AlignWithMargins = True
          Left = 450
          Top = 3
          Width = 481
          Height = 51
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 2
        end
      end
      object UniPanel1: TUniPanel
        Left = 0
        Top = 113
        Width = 934
        Height = 57
        Hint = ''
        Align = alTop
        TabOrder = 3
        BorderStyle = ubsNone
        Caption = ''
        object Ctn_agency: TUniContainerPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 441
          Height = 51
          Hint = ''
          ParentColor = False
          Align = alLeft
          TabOrder = 1
        end
      end
    end
  end
  inherited pg_Principal: TUniPageControl
    Top = 194
    Width = 944
    Height = 367
    ExplicitTop = 194
    ExplicitWidth = 944
    ExplicitHeight = 367
    inherited tbs_valores: TUniTabSheet
      ExplicitWidth = 936
      ExplicitHeight = 339
      inherited pnl_valores: TUniPanel
        Width = 936
        Height = 230
        ExplicitWidth = 936
        ExplicitHeight = 230
        inherited dbg_valores: TUniDBGrid
          Width = 932
          Height = 226
          Options = [dgTitles, dgIndicator, dgColLines, dgRowSelect, dgCheckSelect, dgCheckSelectCheckOnly, dgMultiSelect, dgAutoRefreshRow, dgDontShowSelected]
          LoadMask.Message = 'Carregando'
          OnSelectionChange = dbg_SearchSelectionChange
          Columns = <
            item
              FieldName = 'nr_original'
              Title.Caption = 'P.I. Original'
              Width = 105
              ReadOnly = True
            end
            item
              FieldName = 'nr_internal'
              Title.Caption = 'P.I. Interna'
              Width = 95
              ReadOnly = True
            end
            item
              FieldName = 'dt_original'
              Title.Caption = 'Data Lan'#231'amento'
              Width = 113
              ReadOnly = True
            end
            item
              FieldName = 'parcel'
              Title.Caption = 'Parcela'
              Width = 64
              ReadOnly = True
            end
            item
              FieldName = 'dt_expiration'
              Title.Caption = 'Data Vencimento'
              Width = 114
              ReadOnly = True
            end
            item
              FieldName = 'tag_value'
              Title.Caption = 'Valor '#224' Receber'
              Width = 107
              ReadOnly = True
            end
            item
              FieldName = 'dt_payment'
              Title.Caption = 'Data Pagamento'
              Width = 106
              ReadOnly = True
            end
            item
              FieldName = 'number'
              Title.Caption = 'Nota Fiscal'
              Width = 99
              ReadOnly = True
            end>
        end
      end
      inherited UniGroupBox3: TUniGroupBox
        Top = 233
        Width = 926
        ExplicitTop = 233
        ExplicitWidth = 926
        inherited UniLabel14: TUniLabel
          Left = 690
          ExplicitLeft = 690
        end
        inherited E_VL_Selecionado: TUniLabel
          Left = 807
          ExplicitLeft = 807
        end
      end
      inherited pnl_botao_Valores: TUniPanel
        Top = 275
        Width = 936
        ExplicitTop = 275
        ExplicitWidth = 936
        inherited Sb_Close_Valores: TUniSpeedButton
          Left = 644
          ExplicitLeft = 644
        end
        object Sb_reverse: TUniSpeedButton
          AlignWithMargins = True
          Left = 462
          Top = 5
          Width = 91
          Height = 54
          Hint = ''
          Margins.Left = 0
          Margins.Right = 0
          Caption = 'Extornar'
          Align = alLeft
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          IconAlign = iaTop
          TabOrder = 6
          OnClick = Sb_reverseClick
        end
        object Sb_Print: TUniSpeedButton
          AlignWithMargins = True
          Left = 553
          Top = 5
          Width = 91
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
          TabOrder = 7
          OnClick = Sb_PrintClick
        end
        object Sb_settled: TUniSpeedButton
          AlignWithMargins = True
          Left = 371
          Top = 5
          Width = 91
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
          TabOrder = 8
          OnClick = Sb_settledClick
        end
      end
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 32
    Top = 192
  end
  inherited ds_msg: TDataSource
    Left = 24
    Top = 240
  end
  inherited MenuTask: TUniMainMenu
    Top = 56
  end
  inherited cds_search: TClientDataSet
    Top = 266
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_searchnr_original: TStringField
      FieldName = 'nr_original'
      Size = 30
    end
    object cds_searchdt_original: TDateField
      FieldName = 'dt_original'
    end
    object cds_searchdt_expiration: TDateField
      FieldName = 'dt_expiration'
    end
    object cds_searchnr_internal: TIntegerField
      FieldName = 'nr_internal'
    end
    object cds_searchowner_value: TBCDField
      FieldName = 'owner_value'
      Precision = 10
      Size = 2
    end
    object cds_searchdt_internal: TDateField
      FieldName = 'dt_internal'
    end
    object cds_searchveiculo: TStringField
      FieldName = 'veiculo'
      ReadOnly = True
      Size = 100
    end
    object cds_searchanunciante: TStringField
      FieldName = 'anunciante'
      ReadOnly = True
      Size = 100
    end
    object cds_searchduplicata: TStringField
      FieldName = 'duplicata'
      ReadOnly = True
      Size = 60
    end
    object cds_searchpaid_value: TBCDField
      FieldName = 'paid_value'
      ReadOnly = True
      Precision = 10
      Size = 2
    end
    object cds_searchdt_payment: TDateField
      FieldName = 'dt_payment'
      ReadOnly = True
    end
    object cds_searchtag_value: TBCDField
      FieldName = 'tag_value'
      ReadOnly = True
      Precision = 10
      Size = 2
    end
    object cds_searchnumber: TStringField
      FieldName = 'number'
      ReadOnly = True
      Size = 10
    end
    object cds_searchparcel: TIntegerField
      FieldName = 'parcel'
      ReadOnly = True
    end
  end
  inherited ds_search: TDataSource
    Left = 168
    Top = 330
  end
end
