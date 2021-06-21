inherited TasNf55: TTasNf55
  ClientHeight = 514
  ClientWidth = 719
  Caption = 'Nota Fiscal Eletr'#244'nica - Modelo 55'
  Position = poScreenCenter
  ExplicitWidth = 735
  ExplicitHeight = 573
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 450
    Width = 719
    ExplicitTop = 450
    ExplicitWidth = 719
    inherited SB_Insert: TUniSpeedButton
      Left = 473
      Visible = False
      ExplicitLeft = 473
    end
    inherited SB_Change: TUniSpeedButton
      Left = 100
      Visible = False
      ExplicitLeft = 100
      ExplicitTop = 5
    end
    inherited SB_Delete: TUniSpeedButton
      Left = 191
      Visible = False
      ExplicitLeft = 191
    end
    inherited SB_Save: TUniSpeedButton
      Left = 284
      Visible = False
      ExplicitLeft = 284
    end
    inherited SB_Cancel: TUniSpeedButton
      Left = 377
      Visible = False
      ExplicitLeft = 377
    end
    inherited Sb_Close: TUniSpeedButton
      Left = 2
      Margins.Right = 3
      ExplicitLeft = 2
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 719
    Height = 450
    ExplicitWidth = 719
    ExplicitHeight = 450
    object Pg_Principal: TUniPageControl
      Left = 2
      Top = 2
      Width = 715
      Height = 446
      Hint = ''
      ActivePage = tbs_dados
      Align = alClient
      TabOrder = 1
      OnChange = Pg_PrincipalChange
      object tbs_dados: TUniTabSheet
        Hint = ''
        Caption = 'Dados'
        Font.Color = clBlack
        ParentFont = False
        object pnl_dados_emitente: TUniPanel
          Left = 0
          Top = 167
          Width = 707
          Height = 55
          Hint = ''
          Align = alTop
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object E_ID: TUniEdit
            AlignWithMargins = True
            Left = 5
            Top = 5
            Width = 49
            Height = 45
            Hint = ''
            Text = ''
            Align = alLeft
            TabOrder = 0
            FieldLabel = 'C'#243'digo'
            FieldLabelAlign = laTop
          end
          object E_name_social: TUniEdit
            AlignWithMargins = True
            Left = 60
            Top = 5
            Width = 344
            Height = 45
            Hint = ''
            Text = ''
            Align = alLeft
            TabOrder = 1
            FieldLabel = 'Raz'#227'o Social'
            FieldLabelAlign = laTop
          end
          object E_Cnpj_Cpf: TUniEdit
            AlignWithMargins = True
            Left = 410
            Top = 5
            Width = 158
            Height = 45
            Hint = ''
            Text = ''
            Align = alLeft
            TabOrder = 2
            FieldLabel = 'C.N.P.J/C.P.F'
            FieldLabelAlign = laTop
          end
          object E_IE_RG: TUniEdit
            AlignWithMargins = True
            Left = 574
            Top = 5
            Width = 128
            Height = 45
            Hint = ''
            Text = ''
            Align = alClient
            TabOrder = 3
            FieldLabel = 'Insc. Estadual'
            FieldLabelAlign = laTop
          end
        end
        object pnl_dados_totalizador: TUniPanel
          Left = 0
          Top = 252
          Width = 707
          Height = 166
          Hint = ''
          Align = alClient
          TabOrder = 1
          BorderStyle = ubsFrameLowered
          Caption = ''
          object pnl_dados_totalizador_row_3: TUniPanel
            Left = 2
            Top = 106
            Width = 703
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 1
            BorderStyle = ubsNone
            Caption = ''
            object E_Amount: TUniEdit
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 68
              Height = 46
              Hint = ''
              Alignment = taRightJustify
              Text = ''
              Align = alLeft
              TabOrder = 1
              FieldLabel = 'Quantidade'
              FieldLabelAlign = laTop
            end
            object E_Kind: TUniEdit
              AlignWithMargins = True
              Left = 77
              Top = 3
              Width = 121
              Height = 46
              Hint = ''
              Text = ''
              Align = alLeft
              TabOrder = 2
              FieldLabel = 'Esp'#233'cie'
              FieldLabelAlign = laTop
            end
            object E_Brand: TUniEdit
              AlignWithMargins = True
              Left = 204
              Top = 3
              Width = 188
              Height = 46
              Hint = ''
              Text = ''
              Align = alLeft
              TabOrder = 3
              FieldLabel = 'Marca'
              FieldLabelAlign = laTop
            end
            object E_Number: TUniEdit
              AlignWithMargins = True
              Left = 398
              Top = 3
              Width = 91
              Height = 46
              Hint = ''
              Alignment = taRightJustify
              Text = ''
              Align = alLeft
              TabOrder = 4
              FieldLabel = 'N'#250'mero'
              FieldLabelAlign = laTop
            end
            object E_Gross_Weight: TUniEdit
              AlignWithMargins = True
              Left = 495
              Top = 3
              Width = 100
              Height = 46
              Hint = ''
              Alignment = taRightJustify
              Text = ''
              Align = alLeft
              TabOrder = 5
              FieldLabel = 'Peso Bruto'
              FieldLabelAlign = laTop
            end
            object E_Net_Weight: TUniEdit
              AlignWithMargins = True
              Left = 601
              Top = 3
              Width = 99
              Height = 46
              Hint = ''
              Alignment = taRightJustify
              Text = ''
              Align = alClient
              TabOrder = 6
              FieldLabel = 'Peso L'#237'quido'
              FieldLabelAlign = laTop
            end
          end
          object pnl_dados_totalizador_row_2: TUniPanel
            Left = 2
            Top = 54
            Width = 703
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 2
            BorderStyle = ubsNone
            Caption = ''
            object E_Vl_freight: TUniEdit
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 129
              Height = 46
              Hint = ''
              Alignment = taRightJustify
              Text = ''
              Align = alLeft
              TabOrder = 1
              FieldLabel = 'Valor do Frete'
              FieldLabelAlign = laTop
            end
            object E_Vl_Assurance: TUniEdit
              AlignWithMargins = True
              Left = 138
              Top = 3
              Width = 118
              Height = 46
              Hint = ''
              Alignment = taRightJustify
              Text = ''
              Align = alLeft
              TabOrder = 2
              FieldLabel = 'Valor do Seguro'
              FieldLabelAlign = laTop
            end
            object E_VL_Expenses: TUniEdit
              AlignWithMargins = True
              Left = 262
              Top = 3
              Width = 142
              Height = 46
              Hint = ''
              Alignment = taRightJustify
              Text = ''
              Align = alLeft
              TabOrder = 3
              FieldLabel = 'Outras Despesas'
              FieldLabelAlign = laTop
            end
            object E_VL_IPI: TUniEdit
              AlignWithMargins = True
              Left = 410
              Top = 3
              Width = 135
              Height = 46
              Hint = ''
              Alignment = taRightJustify
              Text = ''
              Align = alLeft
              TabOrder = 4
              FieldLabel = 'Valor do IPI'
              FieldLabelAlign = laTop
            end
            object E_Vl_Invoice: TUniEdit
              AlignWithMargins = True
              Left = 551
              Top = 3
              Width = 149
              Height = 46
              Hint = ''
              Alignment = taRightJustify
              Text = ''
              Align = alClient
              TabOrder = 5
              FieldLabel = 'Valor Total da Nota'
              FieldLabelAlign = laTop
            end
          end
          object pnl_dados_totalizador_row_1: TUniPanel
            Left = 2
            Top = 2
            Width = 703
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 3
            BorderStyle = ubsNone
            Caption = ''
            object E_BC_ICMS: TUniEdit
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 130
              Height = 46
              Hint = ''
              Alignment = taRightJustify
              Text = ''
              Align = alLeft
              TabOrder = 1
              FieldLabel = 'B. C'#225'lculo ICMS '
              FieldLabelAlign = laTop
            end
            object E_VL_ICMS: TUniEdit
              AlignWithMargins = True
              Left = 139
              Top = 3
              Width = 130
              Height = 46
              Hint = ''
              Alignment = taRightJustify
              Text = ''
              Align = alLeft
              TabOrder = 2
              FieldLabel = 'Valor do ICMS'
              FieldLabelAlign = laTop
            end
            object E_BC_ICMS_ST: TUniEdit
              AlignWithMargins = True
              Left = 275
              Top = 3
              Width = 130
              Height = 46
              Hint = ''
              Alignment = taRightJustify
              Text = ''
              Align = alLeft
              TabOrder = 3
              FieldLabel = 'B. C'#225'lculo ICMS S.T.'
              FieldLabelAlign = laTop
            end
            object E_VL_ICMS_ST: TUniEdit
              AlignWithMargins = True
              Left = 411
              Top = 3
              Width = 130
              Height = 46
              Hint = ''
              Alignment = taRightJustify
              Text = ''
              Align = alLeft
              TabOrder = 4
              FieldLabel = 'Valor do ICMS S.T.'
              FieldLabelAlign = laTop
            end
            object E_Vl_Product: TUniEdit
              AlignWithMargins = True
              Left = 547
              Top = 3
              Width = 153
              Height = 46
              Hint = ''
              Alignment = taRightJustify
              Text = ''
              Align = alClient
              TabOrder = 5
              FieldLabel = 'Valor do Produtos'
              FieldLabelAlign = laTop
            end
          end
        end
        object pnl_dados_nota: TUniPanel
          Left = 0
          Top = 30
          Width = 707
          Height = 107
          Hint = ''
          Align = alTop
          TabOrder = 2
          BorderStyle = ubsFrameLowered
          Caption = ''
          object pnl_dados_nota_row_1: TUniPanel
            Left = 2
            Top = 2
            Width = 703
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 1
            BorderStyle = ubsNone
            Caption = ''
            object Dtp_Emission: TUniDateTimePicker
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 130
              Height = 46
              Hint = ''
              DateTime = 42969.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              Align = alLeft
              TabOrder = 1
              FieldLabel = 'Data da Emiss'#227'o'
              FieldLabelAlign = laTop
            end
            object Dtp_Exit: TUniDateTimePicker
              AlignWithMargins = True
              Left = 139
              Top = 3
              Width = 130
              Height = 46
              Hint = ''
              DateTime = 42969.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              Align = alLeft
              TabOrder = 2
              FieldLabel = 'Data da Saida'
              FieldLabelAlign = laTop
            end
            object E_Order: TUniEdit
              AlignWithMargins = True
              Left = 275
              Top = 3
              Width = 130
              Height = 46
              Hint = ''
              Text = ''
              Align = alLeft
              TabOrder = 3
              FieldLabel = 'N'#250'mero Pedido'
              FieldLabelAlign = laTop
            end
            object E_Invoice: TUniEdit
              AlignWithMargins = True
              Left = 411
              Top = 3
              Width = 130
              Height = 46
              Hint = ''
              Text = ''
              Align = alLeft
              TabOrder = 4
              FieldLabel = 'Nota Fiscal N'#186
              FieldLabelAlign = laTop
            end
            object E_Total_Value: TUniEdit
              AlignWithMargins = True
              Left = 547
              Top = 3
              Width = 153
              Height = 46
              Hint = ''
              Alignment = taRightJustify
              Text = ''
              Align = alClient
              TabOrder = 5
              FieldLabel = 'Valor Total'
              FieldLabelAlign = laTop
            end
          end
          object pnl_dados_nota_row_2: TUniPanel
            Left = 2
            Top = 54
            Width = 703
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 2
            BorderStyle = ubsNone
            Caption = ''
            object E_Cfop: TUniEdit
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 117
              Height = 46
              Hint = ''
              Text = ''
              Align = alLeft
              TabOrder = 1
              FieldLabel = 'CFOP'
              FieldLabelAlign = laTop
            end
            object E_Des_Cfop: TUniEdit
              AlignWithMargins = True
              Left = 126
              Top = 3
              Width = 574
              Height = 46
              Hint = ''
              Text = ''
              Align = alClient
              TabOrder = 2
              FieldLabel = 'Natureza da Opera'#231#227'o'
              FieldLabelAlign = laTop
            end
          end
        end
        object Pnl_Tittle_issuer: TUniPanel
          AlignWithMargins = True
          Left = 3
          Top = 140
          Width = 701
          Height = 24
          Hint = ''
          Align = alTop
          ParentFont = False
          Font.Color = clNavy
          Font.Height = -13
          Font.Style = [fsBold]
          TabOrder = 3
          BorderStyle = ubsFrameRaised
          Alignment = taLeftJustify
          Caption = 'DADOS EMITENTE/DESTINAT'#193'RIO'
        end
        object Pnl_Tittle_dados_totalizer: TUniPanel
          AlignWithMargins = True
          Left = 3
          Top = 225
          Width = 701
          Height = 24
          Hint = ''
          Align = alTop
          ParentFont = False
          Font.Color = clNavy
          Font.Height = -13
          Font.Style = [fsBold]
          TabOrder = 4
          BorderStyle = ubsFrameRaised
          Alignment = taLeftJustify
          Caption = 'TOTALIZADORES'
        end
        object Pnl_Tittle_dados: TUniPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 701
          Height = 24
          Hint = ''
          Align = alTop
          ParentFont = False
          Font.Color = clNavy
          Font.Height = -13
          Font.Style = [fsBold]
          TabOrder = 5
          BorderStyle = ubsFrameRaised
          Alignment = taLeftJustify
          Caption = 'DADOS DA NOTA'
        end
      end
      object tbs_Items: TUniTabSheet
        Hint = ''
        Caption = 'Itens'
        object UniDBGrid1: TUniDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 701
          Height = 412
          Hint = ''
          DataSource = ds_search
          LoadMask.Message = 'Loading data...'
          Align = alClient
          TabOrder = 0
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 346
              ReadOnly = True
            end
            item
              FieldName = 'quantity'
              Title.Caption = 'Quantidade'
              Width = 70
            end
            item
              FieldName = 'unit_value'
              Title.Caption = 'valor Unid.'
              Width = 77
            end
            item
              FieldName = 'discount_value'
              Title.Caption = 'Valor disc.'
              Width = 70
            end
            item
              FieldName = '((oi.quantity*oi.unit_value)-oi.discount_value)'
              Title.Caption = 'Valor Total'
              Width = 67
              ReadOnly = True
            end>
        end
      end
      object tbs_obs: TUniTabSheet
        Hint = ''
        Caption = 'Observa'#231#227'o'
        object MM_Observacao: TUniMemo
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 701
          Height = 412
          Hint = ''
          Align = alClient
          TabOrder = 0
        end
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 64
    Top = 216
    inherited MnuTarefas: TUniMenuItem
      object CancelarNotaFiscal1: TUniMenuItem
        Caption = 'Opera'#231#245'es Nota Fiscal'
        OnClick = CancelarNotaFiscal1Click
      end
    end
  end
  object DSP: TDataSetProvider
    DataSet = UMM.Qr_Crud
    Left = 624
    Top = 16
  end
  object cds_search: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 624
    Top = 64
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchquantity: TBCDField
      FieldName = 'quantity'
      Origin = 'quantity'
      DisplayFormat = '0.####'
      Precision = 10
    end
    object cds_searchunit_value: TFMTBCDField
      FieldName = 'unit_value'
      Origin = 'unit_value'
      DisplayFormat = '0.00'
      Precision = 10
      Size = 6
    end
    object cds_searchdiscount_value: TFMTBCDField
      FieldName = 'discount_value'
      Origin = 'discount_value'
      DisplayFormat = '0.00'
      Precision = 10
      Size = 6
    end
    object cds_searchoiquantityoiunit_valueoidiscount_value: TFMTBCDField
      FieldName = '((oi.quantity*oi.unit_value)-oi.discount_value)'
      Origin = '`((oi.quantity*oi.unit_value)-oi.discount_value)`'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 21
      Size = 10
    end
  end
  object ds_search: TDataSource
    DataSet = cds_search
    Left = 624
    Top = 120
  end
end
