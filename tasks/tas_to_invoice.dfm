inherited TasToInvoice: TTasToInvoice
  ClientHeight = 498
  ClientWidth = 781
  Caption = 'Nota Fiscal'
  ExplicitWidth = 797
  ExplicitHeight = 557
  PixelsPerInch = 96
  TextHeight = 13
  object UniPanel3: TUniPanel [0]
    Left = 0
    Top = 0
    Width = 781
    Height = 307
    Hint = ''
    Align = alClient
    TabOrder = 2
    Caption = ''
    object Grp_Parameters: TUniGroupBox
      Left = 534
      Top = 69
      Width = 246
      Height = 237
      Hint = ''
      Caption = 'Par'#226'metros'
      Align = alRight
      TabOrder = 1
      object chbx_get_NFe_authorization: TUniCheckBox
        Left = 7
        Top = 15
        Width = 230
        Height = 17
        Hint = ''
        Caption = 'Solicitar autoriza'#231#227'o NF-e'
        TabOrder = 1
      end
      object Chbx_Sum_ICMS_NF: TUniCheckBox
        Left = 7
        Top = 47
        Width = 230
        Height = 17
        Hint = ''
        Caption = 'Somar o ICMS ao Total da Nota'
        TabOrder = 2
      end
      object Chbx_Sum_IPI_ICMS: TUniCheckBox
        Left = 7
        Top = 66
        Width = 230
        Height = 17
        Hint = ''
        Caption = 'Somar o IPI na Base de ICMS'
        TabOrder = 3
      end
      object Chbx_Sum_IPI_ICMS_ST: TUniCheckBox
        Left = 7
        Top = 84
        Width = 230
        Height = 17
        Hint = ''
        Caption = 'Somar o IPI na Base de ICMS S.T.'
        TabOrder = 4
      end
      object Chbx_spread_ICMS: TUniCheckBox
        Left = 7
        Top = 103
        Width = 230
        Height = 17
        Hint = ''
        Caption = 'Distribuir o Valor do ICMS normal'
        TabOrder = 5
      end
      object Chbx_spread_ICMS_ST: TUniCheckBox
        Left = 7
        Top = 122
        Width = 230
        Height = 17
        Hint = ''
        Caption = 'Distribuir o Valor do ICMS S.T.'
        TabOrder = 6
      end
      object Chbx_spread_IPI: TUniCheckBox
        Left = 7
        Top = 141
        Width = 230
        Height = 17
        Hint = ''
        Caption = 'Distribuir o Valor do IPI'
        TabOrder = 7
      end
      object Chbx_UpdateStock: TUniCheckBox
        Left = 7
        Top = 159
        Width = 230
        Height = 17
        Hint = ''
        Caption = 'N'#227'o atualizar estoque'
        TabOrder = 8
      end
      object Chbx_Mva_Original: TUniCheckBox
        Left = 7
        Top = 178
        Width = 230
        Height = 17
        Hint = ''
        Caption = 'Usar o M.V.A Original'
        TabOrder = 9
      end
      object Chbx_SumFreight: TUniCheckBox
        Left = 7
        Top = 196
        Width = 230
        Height = 17
        Hint = ''
        Caption = 'Somar o Frete ao Total da Nota'
        TabOrder = 10
      end
      object chbx_NF_byHand: TUniCheckBox
        Left = 7
        Top = 31
        Width = 230
        Height = 17
        Hint = ''
        Caption = 'Informar N'#250'mero da Nota Manualmente'
        TabOrder = 11
        OnClick = chbx_NF_byHandClick
      end
    end
    object UniPanel5: TUniPanel
      Left = 1
      Top = 69
      Width = 533
      Height = 237
      Hint = ''
      Align = alClient
      TabOrder = 3
      BorderStyle = ubsFrameLowered
      Caption = ''
      DesignSize = (
        533
        237)
      object O: TUniLabel
        Left = 3
        Top = 138
        Width = 99
        Height = 13
        Hint = ''
        Caption = 'Observa'#231#227'o da Nota'
        TabOrder = 1
      end
      object M_Observation: TUniMemo
        Left = 2
        Top = 153
        Width = 522
        Height = 78
        Hint = ''
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 2
      end
      object Grp_Info_Carrier: TUniGroupBox
        Left = 2
        Top = 40
        Width = 529
        Height = 98
        Hint = ''
        Caption = 'Informa'#231#245'es sobre Transporte'
        Align = alTop
        TabOrder = 3
        object Ctn_Carrier: TUniContainerPanel
          Left = 2
          Top = 15
          Width = 525
          Height = 38
          Hint = ''
          ParentColor = False
          Align = alTop
          TabOrder = 1
        end
        object Ctn_Freight_Mode: TUniContainerPanel
          Left = 2
          Top = 53
          Width = 525
          Height = 38
          Hint = ''
          ParentColor = False
          Align = alTop
          TabOrder = 2
        end
      end
      object Ctn_Cfop: TUniContainerPanel
        Left = 2
        Top = 2
        Width = 529
        Height = 38
        Hint = ''
        ParentColor = False
        Align = alTop
        TabOrder = 4
      end
    end
    object UniPanel4: TUniPanel
      Left = 1
      Top = 1
      Width = 779
      Height = 68
      Hint = ''
      Align = alTop
      TabOrder = 2
      BorderStyle = ubsFrameLowered
      Caption = ''
      object Grp_Dates: TUniGroupBox
        Left = 2
        Top = 2
        Width = 226
        Height = 64
        Hint = ''
        Caption = 'Datas'
        Align = alLeft
        TabOrder = 0
        object Dtp_Emission: TUniDateTimePicker
          Left = 4
          Top = 32
          Width = 103
          Hint = ''
          DateTime = 42926.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 1
        end
        object Dtp_Exit: TUniDateTimePicker
          Left = 118
          Top = 32
          Width = 103
          Hint = ''
          DateTime = 42926.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 2
        end
        object Cb_Exit: TUniCheckBox
          Left = 121
          Top = 14
          Width = 57
          Height = 17
          Hint = ''
          Checked = True
          Caption = 'Sa'#237'da'
          TabOrder = 3
        end
        object UniLabel3: TUniLabel
          Left = 7
          Top = 18
          Width = 38
          Height = 13
          Hint = ''
          Caption = 'Emiss'#227'o'
          TabOrder = 4
        end
      end
      object RG_Direction_Types: TUniRadioGroup
        Left = 228
        Top = 2
        Width = 140
        Height = 64
        Hint = ''
        Items.Strings = (
          'Sa'#237'da'
          'Entrada')
        ItemIndex = 0
        Align = alLeft
        Caption = 'Sentido da Opera'#231#227'o'
        TabOrder = 1
      end
      object Grp_NF_ByHand: TUniGroupBox
        Left = 368
        Top = 2
        Width = 141
        Height = 64
        Hint = ''
        Visible = False
        Caption = 'N'#250'mero da Nota'
        Align = alLeft
        TabOrder = 3
        object E_Nr_Nfe_Manual: TUniEdit
          Left = 7
          Top = 34
          Width = 115
          Hint = ''
          Text = ''
          TabOrder = 1
        end
        object UniLabel5: TUniLabel
          Left = 8
          Top = 17
          Width = 102
          Height = 14
          Hint = ''
          Caption = 'Informe manualmente'
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          TabOrder = 2
        end
      end
    end
  end
  object pnl_Botao: TUniPanel [1]
    Left = 0
    Top = 431
    Width = 781
    Height = 67
    Hint = ''
    Align = alBottom
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    Caption = ''
    DesignSize = (
      781
      67)
    object Sb_Confirm: TUniSpeedButton
      Left = 580
      Top = 3
      Width = 97
      Height = 58
      Hint = ''
      Caption = 'Confirmar'
      Anchors = [akRight, akBottom]
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 1
      OnClick = Sb_ConfirmClick
    end
    object Sb_Abort: TUniSpeedButton
      Left = 678
      Top = 3
      Width = 97
      Height = 58
      Hint = ''
      Caption = 'Cancela'
      Anchors = [akRight, akBottom]
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 2
      OnClick = Sb_AbortClick
    end
    object UniRadioGroup1: TUniRadioGroup
      Left = 88
      Top = -288
      Width = 185
      Height = 105
      Hint = ''
      Caption = 'UniRadioGroup1'
      TabOrder = 3
    end
    object UniDateTimePicker2: TUniDateTimePicker
      Left = 616
      Top = -280
      Width = 120
      Hint = ''
      DateTime = 42926.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 4
    end
    object UniRadioGroup3: TUniRadioGroup
      Left = 192
      Top = -280
      Width = 185
      Height = 105
      Hint = ''
      Caption = 'UniRadioGroup3'
      TabOrder = 5
    end
    object UniRadioButton1: TUniRadioButton
      Left = 120
      Top = -288
      Width = 113
      Height = 17
      Hint = ''
      Caption = 'UniRadioButton1'
      TabOrder = 6
    end
    object UniLabel1: TUniLabel
      Left = 432
      Top = -280
      Width = 46
      Height = 13
      Hint = ''
      Caption = 'UniLabel1'
      TabOrder = 7
    end
  end
  object UniPanel1: TUniPanel [2]
    Left = 0
    Top = 307
    Width = 781
    Height = 124
    Hint = ''
    Align = alBottom
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    Caption = ''
    object pg_Total: TUniPageControl
      Left = 2
      Top = 2
      Width = 777
      Height = 120
      Hint = ''
      ActivePage = tbs_Totais
      Align = alClient
      TabOrder = 1
      object tbs_Totais: TUniTabSheet
        Hint = ''
        Caption = 'Totais da Nota'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object UniPanel6: TUniPanel
          Left = 0
          Top = 0
          Width = 769
          Height = 92
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object UniLabel23: TUniLabel
            Left = 5
            Top = 4
            Width = 120
            Height = 14
            Hint = ''
            Caption = 'Base do C'#225'lculo do ICMS'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 11
          end
          object E_BC_ICMS: TUniFormattedNumberEdit
            Left = 4
            Top = 20
            Width = 154
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            TabOrder = 0
            EmptyText = '0,00'
            DecimalUseOSDefault = True
          end
          object UniLabel28: TUniLabel
            Left = 4
            Top = 45
            Width = 68
            Height = 14
            Hint = ''
            Caption = 'Valor do Frete'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 12
          end
          object E_Vl_freight: TUniFormattedNumberEdit
            Left = 4
            Top = 60
            Width = 126
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            TabOrder = 5
            EmptyText = '0,00'
            DecimalUseOSDefault = True
          end
          object E_Vl_Assurance: TUniFormattedNumberEdit
            Left = 131
            Top = 60
            Width = 126
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            TabOrder = 6
            EmptyText = '0,00'
            DecimalUseOSDefault = True
          end
          object E_VL_ICMS: TUniFormattedNumberEdit
            Left = 160
            Top = 20
            Width = 154
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            TabOrder = 1
            EmptyText = '0,00'
            DecimalUseOSDefault = True
          end
          object UniLabel24: TUniLabel
            Left = 162
            Top = 4
            Width = 52
            Height = 14
            Hint = ''
            Caption = 'Valor ICMS'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 13
          end
          object UniLabel25: TUniLabel
            Left = 317
            Top = 4
            Width = 124
            Height = 14
            Hint = ''
            Caption = 'Base Calculo ICMS Subst.'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 14
          end
          object UniLabel26: TUniLabel
            Left = 462
            Top = 4
            Width = 114
            Height = 14
            Hint = ''
            Caption = 'Valor ICMS Substitui'#231#227'o'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 15
          end
          object UniLabel27: TUniLabel
            Left = 620
            Top = 4
            Width = 117
            Height = 14
            Hint = ''
            Caption = 'Valor Total dos Produtos'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 16
          end
          object E_Vl_Product: TUniFormattedNumberEdit
            Left = 618
            Top = 20
            Width = 146
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            Font.Color = clGreen
            Font.Style = [fsBold]
            TabOrder = 4
            Color = clBlack
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object E_VL_ICMS_ST: TUniFormattedNumberEdit
            Left = 461
            Top = 20
            Width = 154
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            TabOrder = 3
            EmptyText = '0,00'
            DecimalUseOSDefault = True
          end
          object E_BC_ICMS_ST: TUniFormattedNumberEdit
            Left = 315
            Top = 20
            Width = 145
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            TabOrder = 2
            EmptyText = '0,00'
            DecimalUseOSDefault = True
          end
          object E_VL_Expenses: TUniFormattedNumberEdit
            Left = 258
            Top = 60
            Width = 117
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            TabOrder = 7
            EmptyText = '0,00'
            DecimalUseOSDefault = True
          end
          object UniLabel30: TUniLabel
            Left = 259
            Top = 45
            Width = 85
            Height = 14
            Hint = ''
            Caption = 'Outras Despesas'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 17
          end
          object UniLabel31: TUniLabel
            Left = 378
            Top = 45
            Width = 53
            Height = 14
            Hint = ''
            Caption = 'Valor da IPI'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 18
          end
          object E_VL_IPI: TUniFormattedNumberEdit
            Left = 376
            Top = 60
            Width = 126
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            TabOrder = 8
            EmptyText = '0,00'
            DecimalUseOSDefault = True
          end
          object UniLabel29: TUniLabel
            Left = 133
            Top = 45
            Width = 78
            Height = 14
            Hint = ''
            Caption = 'Valor do Seguro'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 20
          end
          object UniLabel33: TUniLabel
            Left = 621
            Top = 45
            Width = 90
            Height = 14
            Hint = ''
            Caption = 'Valor Total da Nota'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 19
          end
          object E_Vl_Invoice: TUniFormattedNumberEdit
            Left = 618
            Top = 60
            Width = 146
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            Font.Color = clGreen
            Font.Style = [fsBold]
            TabOrder = 10
            Color = clBlack
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object E_VL_Desconto: TUniFormattedNumberEdit
            Left = 504
            Top = 60
            Width = 112
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            Font.Color = clWhite
            Font.Style = [fsBold]
            TabOrder = 21
            Color = clRed
            EmptyText = '0,00'
            DecimalUseOSDefault = True
          end
          object UniLabel4: TUniLabel
            Left = 505
            Top = 45
            Width = 74
            Height = 14
            Hint = ''
            Caption = 'Valor Desconto'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 22
          end
        end
      end
      object tbs_Shipping: TUniTabSheet
        Hint = ''
        Caption = 'Dados para a Remessa'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object UniPanel7: TUniPanel
          Left = 0
          Top = 0
          Width = 769
          Height = 92
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object UniLabel20: TUniLabel
            Left = 6
            Top = 4
            Width = 55
            Height = 14
            Hint = ''
            Caption = 'Quantidade'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 10
          end
          object E_Shp_Qtde: TUniFormattedNumberEdit
            Left = 5
            Top = 19
            Width = 80
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            TabOrder = 0
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel35: TUniLabel
            Left = 89
            Top = 4
            Width = 38
            Height = 14
            Hint = ''
            Caption = 'Esp'#233'cie'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 11
          end
          object E_Shp_Kind: TUniFormattedNumberEdit
            Left = 86
            Top = 19
            Width = 148
            Hint = ''
            ParentFont = False
            TabOrder = 1
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel36: TUniLabel
            Left = 237
            Top = 4
            Width = 30
            Height = 14
            Hint = ''
            Caption = 'Marca'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 12
          end
          object E_Shp_Brand: TUniFormattedNumberEdit
            Left = 234
            Top = 19
            Width = 170
            Hint = ''
            ParentFont = False
            TabOrder = 2
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel37: TUniLabel
            Left = 405
            Top = 4
            Width = 37
            Height = 14
            Hint = ''
            Caption = 'N'#250'mero'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 13
          end
          object E_Shp_Number: TUniFormattedNumberEdit
            Left = 405
            Top = 19
            Width = 104
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            TabOrder = 3
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel38: TUniLabel
            Left = 511
            Top = 4
            Width = 53
            Height = 14
            Hint = ''
            Caption = 'Peso Bruto'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 14
          end
          object E_Shp_Gross_Weight: TUniFormattedNumberEdit
            Left = 511
            Top = 19
            Width = 125
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            TabOrder = 4
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel39: TUniLabel
            Left = 639
            Top = 4
            Width = 61
            Height = 14
            Hint = ''
            Caption = 'Peso L'#237'quido'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 15
          end
          object E_Shp_Net_Weight: TUniFormattedNumberEdit
            Left = 642
            Top = 17
            Width = 125
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            TabOrder = 5
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object E_Car_Plaque: TUniLabel
            Left = 6
            Top = 44
            Width = 26
            Height = 14
            Hint = ''
            Caption = 'Placa'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 16
          end
          object UniEdit2: TUniFormattedNumberEdit
            Left = 5
            Top = 59
            Width = 80
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            TabOrder = 6
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel6: TUniLabel
            Left = 198
            Top = 44
            Width = 27
            Height = 14
            Hint = ''
            Caption = 'RNTC'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 17
          end
          object E_Car_rntc: TUniFormattedNumberEdit
            Left = 195
            Top = 59
            Width = 209
            Hint = ''
            ParentFont = False
            TabOrder = 8
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object Ctn_State: TUniContainerPanel
            Left = 89
            Top = 44
            Width = 104
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 7
          end
        end
      end
      object tbs_other: TUniTabSheet
        Hint = ''
        Caption = 'Outros Par'#226'metros'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object UniPanel2: TUniPanel
          Left = 0
          Top = 0
          Width = 769
          Height = 92
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          DesignSize = (
            769
            92)
          object Grp_Ctrl_docs: TUniGroupBox
            Left = 3
            Top = 4
            Width = 280
            Height = 62
            Hint = ''
            Caption = 'Controle do Retorno das Notas Fiscais'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            object chbx_ctrl_Doc_Return: TUniCheckBox
              Left = 5
              Top = 17
              Width = 196
              Height = 17
              Hint = ''
              Caption = 'Controlar o retorno deste documento'
              TabOrder = 1
            end
            object chbx_discharge_doc: TUniCheckBox
              Left = 5
              Top = 36
              Width = 198
              Height = 17
              Hint = ''
              Caption = 'Baixar o retorno deste documento'
              TabOrder = 2
            end
          end
          object Grp_Ctrl_docs_kind: TUniRadioGroup
            Left = 286
            Top = 3
            Width = 192
            Height = 62
            Hint = ''
            Items.Strings = (
              'Pedido'
              'Nota Fiscal')
            ItemIndex = 0
            Anchors = [akTop, akRight]
            Caption = 'Tipo de Controle'
            TabOrder = 2
          end
          object UniLabel2: TUniLabel
            Left = 376
            Top = 23
            Width = 37
            Height = 14
            Hint = ''
            Caption = 'N'#250'mero'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 3
          end
          object E_Nr_Doc_Return: TUniFormattedNumberEdit
            Left = 375
            Top = 38
            Width = 91
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            Anchors = [akTop, akRight]
            TabOrder = 4
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object Chbx_create_bills_pay: TUniCheckBox
            Left = 428
            Top = 7
            Width = 177
            Height = 17
            Hint = ''
            Caption = 'Gerar cr'#233'dito no Contas '#224' Pagar'
            TabOrder = 5
          end
          object Chbx_create_bills_receive: TUniCheckBox
            Left = 428
            Top = 24
            Width = 184
            Height = 17
            Hint = ''
            Caption = 'Gerar cr'#233'dito no Contas '#224' Receber'
            TabOrder = 6
          end
          object Chbx_Ctrl_returns: TUniCheckBox
            Left = 428
            Top = 41
            Width = 203
            Height = 17
            Hint = ''
            Caption = 'Controle de devolu'#231#227'o de Mercadoria'
            TabOrder = 7
          end
        end
      end
    end
  end
end
